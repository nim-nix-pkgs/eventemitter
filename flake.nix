{
  description = ''event emitter for nim'';

  inputs.flakeNimbleLib.owner = "riinr";
  inputs.flakeNimbleLib.ref   = "master";
  inputs.flakeNimbleLib.repo  = "nim-flakes-lib";
  inputs.flakeNimbleLib.type  = "github";
  inputs.flakeNimbleLib.inputs.nixpkgs.follows = "nixpkgs";
  
  inputs."eventemitter-master".dir   = "master";
  inputs."eventemitter-master".owner = "nim-nix-pkgs";
  inputs."eventemitter-master".ref   = "master";
  inputs."eventemitter-master".repo  = "eventemitter";
  inputs."eventemitter-master".type  = "github";
  inputs."eventemitter-master".inputs.nixpkgs.follows = "nixpkgs";
  inputs."eventemitter-master".inputs.flakeNimbleLib.follows = "flakeNimbleLib";
  
  outputs = { self, nixpkgs, flakeNimbleLib, ...}@inputs:
  let 
    lib  = flakeNimbleLib.lib;
    args = ["self" "nixpkgs" "flakeNimbleLib"];
  in lib.mkProjectOutput {
    inherit self nixpkgs;
    meta = builtins.fromJSON (builtins.readFile ./meta.json);
    refs = builtins.removeAttrs inputs args;
  };
}