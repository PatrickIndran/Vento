import subprocess
import json
import urllib.request
import notify2
from gi.repository import GLib


def get_vento_status():
    try:
        local = subprocess.check_output(
            ['nixos-version', '--configuration-revision']
        ).decode().strip()

        url = "https://api.github.com/repos/PatrickIndran/Vento/commits/main"
        req = urllib.request.Request(url, headers={'User-Agent': 'Vento'})

        with urllib.request.urlopen(req) as r:
            data = json.load(r)
            return local, data['sha'], data['commit']['message']
    except Exception:
        return None, None, None


def rebuild():
    process = subprocess.Popen(
        ["pkexec", "sh", "-c",
         "nix flake update --flake /etc/nixos && "
         "nixos-rebuild switch --flake /etc/nixos"],
        stdout=subprocess.PIPE,
        stderr=subprocess.STDOUT,
        bufsize=1,
        text=True
    )

    for line in process.stdout:
        print(line, end='', flush=True)

    process.wait()
    return process.returncode == 0


# --- Notifications ---

def on_click(notification, action_key, data=None):
    if action_key == "install_now":
        print("starting update process...")
        if rebuild():
            success_n = notify2.Notification(
                "Update Complete",
                "The system has been updated."
            )
            success_n.show()
        else:
            error_n = notify2.Notification(
                "Update Failed",
                "Could not update the system."
            )
            error_n.show()

    loop.quit()


def trigger_notification(message):
    notify2.init("Update Manager")
    n = notify2.Notification(
        "Update available",
        "Do you want to install it?",
        "System software update"
    )
    n.add_action("install_now", "Install Now", on_click)
    n.show()
    loop.run()


loop = GLib.MainLoop()

local_sha, remote_sha, commit_msg = get_vento_status()

# --- Compare Both Hashes ---

if local_sha and remote_sha and local_sha != remote_sha:
    print("new hash from remote")
    print(f"local:  {local_sha[:7]}")
    print(f"remote: {remote_sha[:7]}")
    trigger_notification(commit_msg)
else:
    print("hash is identical.")
