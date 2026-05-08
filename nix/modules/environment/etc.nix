{ config, pkgs, ... }:
{

  # --- fastfetch ---
  environment.etc."xdg/fastfetch/config.jsonc".text = ''
    {
      "$schema": "https://github.com",
      "logo": {
       "source": "${../../../src/branding/icons/vento_logomart/vento_ascii.txt}",
        "type": "auto",
        "padding": {
          "top": 1,
          "left": 2
        }
      },
      "modules": [
        "title",
        "separator",
        "os",
        "host",
        "kernel",
        "uptime",
        "packages",
        "shell",
        "display",
        "cpu",
        "gpu",
        "memory",
        "break",
        "colors"
      ]
    }
  '';

}
