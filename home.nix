{ lib, pkgs, ... }:
{
  home = {
    packages = with pkgs; [
        # System utilities
        openssh # secure shell protocol
        which # locate executables
        git # version control system
        cacert # certificate authority certificates
        tzdata # time zone database
        hostname # set or print name of current host system
        dig # DNS lookup utility
        htop # interactive process viewer
        iotop # top-like utility for disk I/O
        ncdu # disk usage analyzer

        # File management and navigation
        yazi # terminal file manager
        broot # interactive tree view file manager
        tree # display directory contents in a tree-like format
        rclone # sync files and directories to cloud storage

        # Text processing and editing
        neovim # highly configurable text editor
        vim # text editor
        jq # command-line JSON processor

        # Shell and terminal enhancements
        zsh # extended Bourne shell
        starship # customizable prompt for any shell
        zellij # terminal multiplexer
        atuin # magical shell history
        fzf # command-line fuzzy finder
        bat # cat clone with syntax highlighting
        lsd # modern ls command
        thefuck # magnificent app which corrects your previous console command

        # Network utilities
        curl # transfer data using various protocols
        wget # retrieve files using HTTP, HTTPS, and FTP
        netcat-gnu # networking utility for reading/writing network connections
        twingate # access to asq resourcesc

        # Development tools
        act # Running github actions locally
        nix-direnv # direnv integration for Nix
        direnv # directory-based environment variable manager
        just # command runner for project-specific tasks
        rye # Python project management tool
        nodejs_22 # JavaScript runtime
        sqlite # SQL database engine
        git-filter-repo # Manage git (remove large files from history, etc..)

        # Text search and manipulation
        ripgrep # fast searching tool

        # Clipboard management
        xsel # X11 selection and clipboard manipulation

        # File compression
        unzip # extract compressed files

        # Navigation enhancement
        zoxide # smarter cd command

        # GitHub CLI
        gh # GitHub command-line tool

        # Multimedia
        ffmpeg # audio and video converter

        # Fonts
        nerdfonts # patched fonts for developers
    ];

    # This needs to actually be set to your username
    username = "jopejuca";
    homeDirectory = "/home/jopejuca";

    # You do not need to change this if you're reading this in the future.
    # Don't ever change this after the first build.  Don't ask questions.
    stateVersion = "24.05";
  };
  programs = {
    home-manager.enable = true;
  };
}