//
//  TBTitleBar.h
//  TinyBox
//
//  Created by shenqichen on 2019/5/30.
//  Copyright © 2019 shenqichen. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface TBTitleBar : UIView

@property (nonatomic, assign) BOOL hideBackBtn;

- (instancetype)initWithController:(UIViewController*)controller;
- (void)setTitle:(NSString *)title;

@end

NS_ASSUME_NONNULL_END
