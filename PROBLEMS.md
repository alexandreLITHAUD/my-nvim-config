## List of detected problems

### On NixOS

- [x] Mason package does not work due to the way NixOS handles dynamic libraries.

  - Workaround done by detecting NixOS though etc/os-release and disabling Mason in config if NixOS is detected. Then the lsp servers can be instialled globally through nixpkgs.

- [x] Tab does not work probably due to copilot extension conflicts. Needs investigation.

- [x] Random highlight coolor apprears on text probably due to gitsigns
