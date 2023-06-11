import CocoaLumberjackSwift
import Atomics

public class 
SwiftLibClass {
    public init() {}
    public func hello() {
      
      let counter = ManagedAtomic<Int>(0)
      
      counter.wrappingIncrement(ordering: .relaxed)
      DDLog.add(DDOSLogger.sharedInstance)
      print("SwiftLibClass::hello atomic value=\(counter.load(ordering: .relaxed))")
      DDLogError("Logging With CocoaLumberjack")
    }
}
