//
//  TBUtilty.h
//  TinyBox
//
//  Created by shenqichen on 2019/5/30.
//  Copyright © 2019 shenqichen. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "TBToolModel.h"
#import "UIColor+TB.h"


NS_ASSUME_NONNULL_BEGIN

#define kScreenWidth                        [UIScreen mainScreen].bounds.size.width
#define kScreenHeight                       [UIScreen mainScreen].bounds.size.height

#define TBTitleBarHeight ([TBUtilty getTitleBarHeight])
#define TBBottomBarHeight ([TBUtilty getBottomBarHeight])

#define kTBStyleItemMarginVertical 6
#define kTBStyleItemMarginHorizontal 0

#define kTBDefaultMargin 20
#define KTBDefaultTextColor ([UIColor colorForHex:0xE2EBCF])
#define kTBDefaultBgColor ([UIColor colorForHex:0x312D2E])
#define kTBDefaultTextViewBgColor ([UIColor colorForHex:0x403935])


@interface TBUtilty : NSObject

+ (BOOL)isIphoneX;
+ (CGFloat)getTitleBarHeight;
+ (CGFloat)getBottomBarHeight;

@end

NS_ASSUME_NONNULL_END
