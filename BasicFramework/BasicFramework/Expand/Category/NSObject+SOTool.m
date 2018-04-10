
#import "NSObject+SOTool.h"

@implementation NSObject (SOTool)
+ (UIViewController*)viewControllerWithviewObj:(UIView *)viewObj {
    
    for (UIView* next = [viewObj superview]; next; next =
         next.superview) {
        UIResponder* nextResponder = [next nextResponder];
        if ([nextResponder isKindOfClass:[UIViewController
                                          class]]) {
            return (UIViewController*)nextResponder;
        }
    }
    return nil;
}

@end
