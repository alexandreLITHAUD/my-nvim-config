## List of detected problems

### On NixOS

- [/] Mason package does not work due to the way NixOS handles dynamic libraries. A workaround is to use `nix-shell` with the appropriate libraries or use a different package manager.
   - Workaround done by finding NixOs and disableing Mason in config if NixOS is detected. 

- [ ] Tab does not work probably due to copilot extension conflicts. Needs investigation.

- [ ] Random highlight coolor apprears on text probably due to gitsigns
