.PHONY: update
update:
	 NIXPKGS_ALLOW_UNFREE=1 home-manager switch --impure --flake .#jopejuca

.PHONY: clean
clean:
	nix-collect-garbage -d