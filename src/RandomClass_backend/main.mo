import Rand "Rand";
import Array "mo:base/Array";
import Buffer "mo:base/Buffer";
import Prim "mo:⛔";


actor {

  let random = Rand.Rand();
  var numero: Rand.Number = #Nat8(0);

  public func setRange(a : Nat, b : Nat) : async () {
    random.setRange(a, b);
  };
  public func init() : async () {
    await random.init();
  };

  public func setNumero(): async (){
    numero := await random.randomTypeT(?"Nat8");
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

  public func randomTypeT(t: ?Text): async Rand.Number{
    await random.randomTypeT(t);
  };

  public func randPrincipal() : async Principal {
    await random.principal();
  };

};
