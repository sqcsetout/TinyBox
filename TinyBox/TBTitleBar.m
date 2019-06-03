//
//  TBTitleBar.m
//  TinyBox
//
//  Created by shenqichen on 2019/5/30.
//  Copyright © 2019 shenqichen. All rights reserved.
//

#import "TBTitleBar.h"
#import "TBUtilty.h"


@interface TBTitleBar ()

@property (nonatomic, copy) NSString *title;
@property (nonatomic, strong) UIImage *backBtnImage;

@property (nonatomic, assign) BOOL hideBackBtn;

@property (nonatomic, strong) UIView *bgView;
@property (nonatomic, strong) UILabel * titleLabel;
@property (nonatomic, strong) UIButton *backButton;
@property (nonatomic, strong) UIButton *shareButton;

@property (nonatomic, weak) UIViewController *controller;

@end


@implementation TBTitleBar

- (instancetype)initWithController:(UIViewController*)controller {
    self = [super initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, TBTitleBarHeight)];
    if (self) {
        self.controller = controller;
        [self initSubView];
    }
    
    return self;
}

- (void)initSubView {
    self.backgroundColor = [UIColor yellowColor];
    [self addSubview:self.titleLabel];
    [self addSubview:self.backButton];
    [self addSubview:self.shareButton];
}

- (void)safeAreaInsetsDidChange
{
    [super safeAreaInsetsDidChange];
    [self layoutSubviews];
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    self.frame = CGRectMake(0, 0, self.controller.view.bounds.size.width, TBTitleBarHeight);
    self.bgView.frame = CGRectMake(0,CGRectGetHeight(self.bounds)-0.5, CGRectGetWidth(self.bounds), 0.5);
    self.titleLabel.frame = CGRectMake(65, self.frame.size.height-43, [UIScreen mainScreen].bounds.size.width-130, 44);
    self.backButton.frame = CGRectMake(0, self.frame.size.height - 44, 44, 44);
    self.shareButton.frame = CGRectMake(self.frame.size.width - 44, self.frame.size.height - 44, 44, 44);
}

#pragma mark - Actions

- (void)backAtion {
    if (self.controller.navigationController && self.controller.navigationController.viewControllers.count > 1) {
        [self.controller.navigationController popViewControllerAnimated:YES];
    }else {
        [self.controller dismissViewControllerAnimated:YES completion:nil];
    }
}

#pragma mark - getter or setter
- (void)setTitle:(NSString *)title {
    _title = title;
    self.titleLabel.text = title;
}

- (void)setBackBtnImage:(UIImage *)backBtnImage {
    _backBtnImage = backBtnImage;
    [self.backButton setImage:_backBtnImage forState:UIControlStateNormal];
}

- (void)setHideBackBtn:(BOOL)hideBackBtn
{
    _hideBackBtn = hideBackBtn;
    self.backButton.hidden = _hideBackBtn;
}

- (void)showShareWithTarget:(nullable id)target action:(SEL)action
{
    self.shareButton.hidden = NO;
    [self.shareButton addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
}

#pragma mark - Getter
- (UIView *)bgView{
    if (!_bgView) {
        _bgView = [[UIView alloc] initWithFrame:CGRectMake(0,CGRectGetHeight(self.bounds)-0.5, CGRectGetWidth(self.bounds), 0.5)];
        _bgView.backgroundColor = [UIColor clearColor];
    }
    return _bgView;
}

- (UILabel *)titleLabel{
    if (!_titleLabel) {
        _titleLabel = [[UILabel alloc]initWithFrame:CGRectMake(65, self.frame.size.height-44, [UIScreen mainScreen].bounds.size.width-130, 44)];
        _titleLabel.font=[UIFont systemFontOfSize:18.f];
        _titleLabel.backgroundColor=[UIColor clearColor];
        _titleLabel.textColor = [UIColor blackColor];
        _titleLabel.textAlignment=NSTextAlignmentCenter;
        _titleLabel.text = @"标题";
    }
    return _titleLabel;
}

- (UIButton *)backButton{
    if (!_backButton) {
        /**
         * AaronLee 备注
         * 调整位置，防止bundle加载完成后rn的返回位置出现跳动
         **/
        _backButton = [[UIButton alloc] initWithFrame:CGRectMake(0, 20, 44, 44)];
        [_backButton setImage:[UIImage imageNamed:@"icon_arrow_left_gray"] forState:UIControlStateNormal];
        [_backButton addTarget:self action:@selector(backAtion) forControlEvents:UIControlEventTouchUpInside];
    }
    return _backButton;
}

- (UIButton *)shareButton{
    if (!_shareButton) {
        _shareButton = [[UIButton alloc] initWithFrame:CGRectMake(0, 20, 44, 44)];
        [_shareButton setImage:[UIImage imageNamed:@"detail_icon_share_gray"] forState:UIControlStateNormal];
        _shareButton.hidden = YES;
    }
    return _shareButton;
}

@end
