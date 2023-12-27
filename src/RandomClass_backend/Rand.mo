import Blob "mo:base/Blob";
import Nat8 "mo:base/Nat8";

module {
  public class Rand() = this {

    let raw_rand = (actor "aaaaa-aa" : actor { raw_rand : () -> async Blob }).raw_rand;
    var store : Nat = 0;
    var range : Nat = 255;
    var bias : Nat = 0;

    public func init() : async () {
      let blob = Blob.toArray(await raw_rand());
      for (i in blob.keys()) {
        store += (256 ** i * Nat8.toNat(blob[i]));
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

    //public func getStore() : Nat = store;

    public func next() : async Nat {
      if (store == 0) { await init() };
      let result = store % range + bias;
      store /= range;
      result;
    };
  };

};
