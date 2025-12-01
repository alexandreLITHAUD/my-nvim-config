## List of detected problems

### On NixOS

- [x] Mason package does not work due to the way NixOS handles dynamic libraries.
  - Workaround done by detecting NixOS though etc/os-release and disabling Mason in config if NixOS is detected. Then the lsp servers can be instialled globally through nixpkgs.

- [x] Tab does not work probably due to copilot extension conflicts. Needs investigation.

- [x] Random highlight coolor apprears on text probably due to gitsigns

### General

- [ ] leader z remove the tree if it is open, otherwise open the tree. Currently it always opens the tree.

- [ ] Correct shortcuts for file navigation in lsp definition to use leader instad of base shortcuts.

- [ ] Add shortcuts to :e# to switch between last two files.
