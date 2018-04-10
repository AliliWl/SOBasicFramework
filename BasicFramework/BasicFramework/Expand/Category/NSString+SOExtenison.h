
#import <Foundation/Foundation.h>

@interface NSString (SOExtenison)

- (CGSize)sizeWithFont:(UIFont *)font;
- (CGSize)sizeWithFont:(UIFont *)font andMaxW:(CGFloat)maxW;

+ (BOOL)isBlankString:(NSString *)string;

@end
