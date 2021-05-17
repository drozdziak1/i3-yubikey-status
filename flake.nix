{
  description = "A very basic flake";

  outputs = { self, nixpkgs }:
    let
      system = "x86_64-linux";
      pkgs = import nixpkgs { inherit system; };
    in
      {

        packages."${system}".hello = nixpkgs.legacyPackages.x86_64-linux.hello;

        defaultPackage."${system}" = self.packages."${system}".hello;
        devShell."${system}" = pkgs.mkShell {
          buildInputs = with pkgs; [pkg-config libusb pcsclite];
        };

      };
}
