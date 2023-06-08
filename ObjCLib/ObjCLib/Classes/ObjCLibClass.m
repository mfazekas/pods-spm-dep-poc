#import "ObjCLibClass.h"
@import CocoaLumberjack;

static const DDLogLevel ddLogLevel = DDLogLevelVerbose;

@implementation ObjCLibClass
+(void)hello {
  [DDLog addLogger:[DDOSLogger sharedInstance]];
  NSLog(@"ObjCLibClass::hello");
  DDLogError(@"Logging With CocoaLumberjack");
  
}
@end
