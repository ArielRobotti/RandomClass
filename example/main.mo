import Rand "../src/Rand";
import Array "mo:base/Array";
import Buffer "mo:base/Buffer";
import Char "mo:base/Char";


actor {

  let random = Rand.Rand();

  public func setRange(a : Nat, b : Nat) : async () {
    random.setRange(a, b);
  };

  public func randArray(n : Nat) : async [Nat] {
    await random.randArray(n);
  };

  public func next(): async Nat{
    await random.next();
  };
  
  public func randPrincipal() : async Principal {
    await random.principal();
  };

  public func randRange(a: Nat, b: Nat): async Nat{
    await random.randRange(a,b);
  };

  public func fromNat32(c: Nat32): async Text{
    Char.toText(Char.fromNat32(c));
  };

  public func randString(s: Nat): async Text{
    await random.randString(s);
  };

};
