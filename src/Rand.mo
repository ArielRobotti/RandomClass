// import Blob "mo:base/Blob";
// import Nat8 "mo:base/Nat8";
import Buffer "mo:base/Buffer";
import Array "mo:base/Array";
import Prim "mo:⛔";

module {

  public class Rand() = this {
    
    let raw_rand = (actor "aaaaa-aa" : actor { raw_rand : () -> async Blob }).raw_rand;
    var store : Nat = 0;
    var range : Nat = 256;
    var bias : Nat = 0;

    func init() : async () {
      let blob = Prim.blobToArray(await raw_rand());
      for (i in blob.keys()) {
        store += (256 ** i * Prim.nat8ToNat(blob[i]));
      };
    };

    public func setRange(_min : Nat, _max : Nat) : () {
      if (_min <= _max) {
        range := _max - _min;
        bias := _min;
      } else {
        range := _min - _max;
        bias := _max;
      };
    };

    public func next() : async Nat {
      if (store == 0) { await init() };
      let result = store % range + bias;
      store /= range;
      result;
    };

    public func randArray(n : Nat) : async [Nat] {
      let tempBuffer = Buffer.fromArray<Nat>([]);
      var i = n;
      while (i > 0) {
        tempBuffer.add(await next());
        i -= 1;
      };
      Buffer.toArray(tempBuffer);
    };

    public func principal() : async Principal {
      let a = Prim.blobToArray(await raw_rand()); 
      let array = Array.subArray(a, 0, 28); 
      Prim.principalOfBlob(Prim.arrayToBlob(array));
    };
  };
};
