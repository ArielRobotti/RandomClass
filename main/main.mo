import Rand "../src/Rand";
import Array "mo:base/Array";
import Buffer "mo:base/Buffer";
import Prim "mo:⛔";


actor {

  let random = Rand.Rand();

  public func setRange(a : Nat, b : Nat) : async () {
    random.setRange(a, b);
  };

  public func randomNats(n : Nat) : async [Nat] {
    let tempBuffer = Buffer.fromArray<Nat>([]);
    var i = n;
    while (i > 0) {
      tempBuffer.add(await random.next());
      i -= 1;
    };
    Buffer.toArray(tempBuffer);
  };

  public func next(): async Nat{
    await random.next();
  };
  
  public func randPrincipal() : async Principal {
    await random.principal();
  };

};
