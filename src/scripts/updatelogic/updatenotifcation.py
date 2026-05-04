import subprocess
import json
import urllib.request
import notify2
from gi.repository import GLib


def get_hash_status():
    try:
        local = subprocess.check_output(['nixos-version', '--configuration-revision']).decode().strip()
        
        url = "https://api.github.com/repos/PatrickIndran/Vento/commits/main"
        req = urllib.request.Request(url, headers={'User-Agent': 'Vento'})
        
        with urllib.request.urlopen(req) as r:
            data = json.load(r)
            return local, data['sha'], data['commit']['message']
    except Exception as e:
        print(f"error checking status: {e}")
        return None, None, None

# --- Notfications ---

def on_click(notification, action_key, data=None):
    if action_key == "install_now":
        print("starting update process...")
        try:
            subprocess.run(["pkexec", "nix", "flake", "update", "--flake", "/etc/nixos"], check=True)
            
            
            success_n = notify2.Notification("Update Complete", "The system has been updated.")
            success_n.show()
        except subprocess.CalledProcessError:
            error_n = notify2.Notification("Update Failed", "Could not update the flake.")
            error_n.show()
    
    loop.quit()



def trigger_notification(message):
    notify2.init("Update Manager")
    n = notify2.Notification(
        "Update Available", 
        f"New commit: {message}\nDo you want to install it?", 
        "system-software-update"
    )
    n.add_action("install_now", "Install Now", on_click)
    n.show()
    loop.run()


loop = GLib.MainLoop()


local_sha, remote_sha, commit_msg = get_hash_status()

# --- Compair Both Hashs ---

if local_sha and remote_sha and local_sha != remote_sha:
    print("new hash from remote")
    trigger_notification(commit_msg)
else:
    print("hash is identical.")
