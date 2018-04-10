
#import <UIKit/UIKit.h>

@interface UIBarButtonItem (SOExtension)

+ (UIBarButtonItem *)itemWithImageName:(NSString *)imageName highImageName:(NSString *)highImageName target:(id)target action:(SEL)action;
@end
