import Rand "Rand";
actor {
  
  let random = Rand.Rand();
  
  public func setRange(a: Nat, b: Nat):async (){
    random.setRange(a, b);
  };
  public func init():async (){
    await random.init();
  };
  public query func getStore():async Nat{
    random.getStore();
  };


};