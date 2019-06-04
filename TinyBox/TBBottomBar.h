//
//  TBBottomBar.h
//  TinyBox
//
//  Created by shenqichen on 2019/6/4.
//  Copyright © 2019 shenqichen. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TBUtilty.h"

NS_ASSUME_NONNULL_BEGIN


@protocol TBBottomBarDelegate <NSObject>

- (void)onClickConvertBtn;

@end


@interface TBBottomBar : UIView

- (instancetype)initWithTitle:(NSString*)title delegate:(id<TBBottomBarDelegate>)delegate;
- (void)updateTitle:(NSString*)title;

@end

NS_ASSUME_NONNULL_END
