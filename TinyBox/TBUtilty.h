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

NS_ASSUME_NONNULL_BEGIN

#define kScreenWidth                        [UIScreen mainScreen].bounds.size.width
#define kScreenHeight                       [UIScreen mainScreen].bounds.size.height
#define TBTitleBarHeight ([TBUtilty getTitleBarHeight])

#define kTBStyleItemMarginVertical 10
#define kTBStyleItemMarginHorizontal 20


@interface TBUtilty : NSObject

+ (BOOL)isIphoneX;
+ (CGFloat)getTitleBarHeight;

@end

NS_ASSUME_NONNULL_END
