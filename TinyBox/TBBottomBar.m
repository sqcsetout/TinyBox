//
//  TBBottomBar.m
//  TinyBox
//
//  Created by shenqichen on 2019/6/4.
//  Copyright © 2019 shenqichen. All rights reserved.
//

#import "TBBottomBar.h"

@interface TBBottomBar ()

@property (nonatomic, retain) UIButton *convertBtn;
@property (nonatomic, weak) id <TBBottomBarDelegate> delegate;

@end


@implementation TBBottomBar

- (instancetype)initWithTitle:(NSString*)title delegate:(id<TBBottomBarDelegate>)delegate {
    if (self = [super initWithFrame:CGRectMake(0, kScreenHeight-TBBottomBarHeight, kScreenWidth, TBBottomBarHeight)]) {
        self.convertBtn = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, 40)];
        [self addSubview:self.convertBtn];
        [self.convertBtn setTitle:title forState:UIControlStateNormal];
        self.convertBtn.backgroundColor = [UIColor colorForHex:0x690CFF];
        
        [self.convertBtn addTarget:self action:@selector(onClickConvertBtn) forControlEvents:UIControlEventTouchUpInside];

        self.delegate = delegate;
    }
    
    return self;
}

- (void)onClickConvertBtn {
    if ([self.delegate respondsToSelector:@selector(onClickConvertBtn)]) {
        [self.delegate onClickConvertBtn];
    }    
}

- (void)updateTitle:(NSString*)title {
    [self.convertBtn setTitle:title forState:UIControlStateNormal];
}

@end
