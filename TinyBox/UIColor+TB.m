
#import "UIColor+TB.h"

@implementation UIColor (TB)
+ (UIColor *)colorForHex:(NSInteger)colorHex
{
    return [UIColor colorWithRed:((float)((colorHex & 0xFF0000) >> 16)) / 0xFF green:((float)((colorHex & 0xFF00) >> 8))  / 0xFF blue:((float)(colorHex & 0xFF)) / 0xFF alpha:1.0f];
}

+ (UIColor *)colorForHex:(NSInteger)colorHex alpha:(CGFloat)alpha
{
    return [UIColor colorWithRed:((float)((colorHex & 0xFF0000) >> 16)) / 0xFF green:((float)((colorHex & 0xFF00) >> 8))  / 0xFF blue:((float)(colorHex & 0xFF)) / 0xFF alpha:alpha];
}

@end
