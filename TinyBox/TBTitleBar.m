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

@property (nonatomic, strong) UILabel *titleLabel;
@property (nonatomic, strong) UIButton *backButton;
@property (nonatomic, strong) UIButton *moreButton;

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
    self.backgroundColor = [UIColor colorForHex:0x413C3B];
    [self addSubview:self.titleLabel];
    [self addSubview:self.backButton];
    [self addSubview:self.moreButton];
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
    self.titleLabel.frame = CGRectMake(65, self.frame.size.height-44, [UIScreen mainScreen].bounds.size.width-130, 44);
    self.backButton.frame = CGRectMake(0, self.frame.size.height-44, 44, 44);
    self.moreButton.frame = CGRectMake(self.frame.size.width-44, self.frame.size.height-44, 44, 44);
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

#pragma mark - Getter
- (UILabel *)titleLabel{
    if (!_titleLabel) {
        _titleLabel = [[UILabel alloc]initWithFrame:CGRectMake(65, self.frame.size.height-44, [UIScreen mainScreen].bounds.size.width-130, 44)];
        _titleLabel.font = [UIFont systemFontOfSize:18.f];
        _titleLabel.backgroundColor=[UIColor clearColor];
        _titleLabel.textColor = KTBDefaultTextColor;
        _titleLabel.textAlignment=NSTextAlignmentCenter;
        _titleLabel.text = @" ";
    }
    return _titleLabel;
}

- (UIButton *)backButton{
    if (!_backButton) {
        _backButton = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 44, 44)];
        [_backButton setImage:[UIImage imageNamed:@"icon_back"] forState:UIControlStateNormal];
        [_backButton addTarget:self action:@selector(backAtion) forControlEvents:UIControlEventTouchUpInside];
    }
    return _backButton;
}

- (UIButton *)moreButton{
    if (!_moreButton) {
        _moreButton = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 44, 44)];
        [_moreButton setImage:[UIImage imageNamed:@"icon_more"] forState:UIControlStateNormal];
        _moreButton.hidden = YES;
    }
    return _moreButton;
}

@end
