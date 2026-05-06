import requests
import subprocess
import gi
gi.require_version('Notify', '0.7')
from gi.repository import Notify, GLib

def rev_request():
    try:
        local = subprocess.check_output(
            ['nixos-version', '--configuration-revision']
        ).decode().strip()

        url = "https://api.github.com/repos/PatrickIndran/Vento/commits/main"
        response = requests.get(url, headers={'User-Agent': 'rev-request'}) 
        response.raise_for_status() 
        
        data = response.json()
        return local, data['sha'], data['commit']['message']
    except Exception:
        return None, None, None

def notfication():
    Notify.init("Vento")

    n = Notify.Notification.new(
      "Update Available!", 
      "There is a new update available.",
    )

    n.add_action("install", "Install Now", install_approved, None)

    n.show()

def rev_compare():
    local_rev, remote_rev, message = rev_request()

    if local_rev and remote_rev:
        if local_rev == remote_rev:
            print("matches remote origin")
        else:
            print(f"local-rev:{local_rev}")
            print(f"remote-rev:{remote_rev}")
            notfication()
    else:
        print("error: could not find any revision")

rev_compare()




def install_approved(notification, action, data):
    print("user pressed Install Now")
    loop.quit()

loop = GLib.MainLoop()
try:
    loop.run()
except KeyboardInterrupt:
    loop.quit()
