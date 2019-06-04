//
//  TBUtilty.m
//  TinyBox
//
//  Created by shenqichen on 2019/5/30.
//  Copyright © 2019 shenqichen. All rights reserved.
//

#import "TBUtilty.h"


@implementation TBUtilty


+ (BOOL)isIphoneX {
    return (MAX([UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height) == 896.0) || (MAX([UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height) == 812.0);
}

+ (CGFloat)getTitleBarHeight {
    return [TBUtilty isIphoneX]? 88.0: 44.0;
}

+ (CGFloat)getBottomBarHeight {
    return [TBUtilty isIphoneX]? 74: 40;
}

@end
