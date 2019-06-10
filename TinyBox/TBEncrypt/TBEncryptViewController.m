//
//  TBEncryptViewController.m
//  TinyBox
//
//  Created by shenqichen on 2019/6/4.
//  Copyright © 2019 shenqichen. All rights reserved.
//

#import "TBEncryptViewController.h"
#import "TBBottomBar.h"
#import "TBEncryptHelper.h"


@interface TBEncryptViewController () <TBBottomBarDelegate, UIScrollViewDelegate, UITextViewDelegate>

@property (nonatomic, retain) TBEncryptToolModel *toolModel;
@property (nonatomic, retain) TBBottomBar *bottomBar;

@property (nonatomic, retain) UIScrollView *scrollView;

@property (nonatomic, retain) UILabel *briefLabel;

@property (nonatomic, retain) UILabel *inputLabel;
@property (nonatomic, retain) UITextView *inputText;

@property (nonatomic, retain) UILabel *keyLabel;
@property (nonatomic, retain) UITextView *keyText;

@property (nonatomic, retain) UILabel *outputLabel;
@property (nonatomic, retain) UITextView *outputText;

@end


@implementation TBEncryptViewController


- (instancetype)initWithModel:(TBEncryptToolModel*)toolModel {
    if (self = [super init]) {
        self.toolModel = toolModel;
    }
    
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self configTitleBar];
    [self configBottomBar];
    [self initSubview];
}

- (void)configTitleBar {
    self.titleBar = [[TBTitleBar alloc] initWithController:self];
    [self.view addSubview:self.titleBar];
    [self.titleBar setTitle:self.toolModel.title];
}

- (void)configBottomBar {
    self.bottomBar = [[TBBottomBar alloc] initWithTitle:@"加密" delegate:self];
    [self.view addSubview:self.bottomBar];
}


- (void)initSubview {
    self.scrollView = [[UIScrollView alloc] initWithFrame:self.view.bounds];
    self.scrollView.contentSize = CGSizeMake(kScreenWidth, kScreenHeight*1.2);
    self.scrollView.backgroundColor = [UIColor clearColor];
    self.scrollView.delegate = self;
    [self.view addSubview:self.scrollView];
    UITapGestureRecognizer * tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(onTapScrollView)];
    [self.scrollView addGestureRecognizer:tapGesture];
    [tapGesture setNumberOfTapsRequired:1];

    CGFloat startY = TBTitleBarHeight + 10;
    self.briefLabel = [[UILabel alloc] initWithFrame:CGRectMake(kTBDefaultMargin+4, startY, kScreenWidth-2*kTBDefaultMargin, 60)];
    self.briefLabel.textColor = [UIColor colorForHex:0xEFEEB6];
    self.briefLabel.font = [UIFont systemFontOfSize:16];
    self.briefLabel.text = self.toolModel.brief;
    self.briefLabel.numberOfLines = 3;
    self.briefLabel.lineBreakMode = NSLineBreakByTruncatingTail;
    [self.scrollView addSubview:self.briefLabel];
    
    startY = self.briefLabel.frame.origin.y + self.briefLabel.frame.size.height + 10;
    self.inputLabel = [[UILabel alloc] initWithFrame:CGRectMake(kTBDefaultMargin+4, startY, kScreenWidth-2*kTBDefaultMargin, 30)];
    self.inputLabel.textColor = KTBDefaultTextColor;
    self.inputLabel.font = [UIFont systemFontOfSize:16];
    self.inputLabel.text = @"明文:";
    [self.scrollView addSubview:self.inputLabel];
    
    startY = self.inputLabel.frame.origin.y + self.inputLabel.frame.size.height + 6;
    self.inputText = [[UITextView alloc] initWithFrame:CGRectMake(kTBDefaultMargin, startY, kScreenWidth-2*kTBDefaultMargin, 80)];
    self.inputText.backgroundColor = kTBDefaultTextViewBgColor;
    self.inputText.textColor = KTBDefaultTextColor;
    self.inputText.font = [UIFont systemFontOfSize:14];
    [self.scrollView addSubview:self.inputText];
    
    startY = self.inputText.frame.origin.y + self.inputText.frame.size.height + 10;
    self.keyLabel = [[UILabel alloc] initWithFrame:CGRectMake(kTBDefaultMargin+4, startY, kScreenWidth-2*kTBDefaultMargin, 30)];
    self.keyLabel.textColor = KTBDefaultTextColor;
    self.keyLabel.font = [UIFont systemFontOfSize:16];
    self.keyLabel.text = @"密码:";
    [self.scrollView addSubview:self.keyLabel];
    
    startY = self.keyLabel.frame.origin.y + self.keyLabel.frame.size.height + 6;
    self.keyText = [[UITextView alloc] initWithFrame:CGRectMake(kTBDefaultMargin, startY, kScreenWidth-2*kTBDefaultMargin, 30)];
    self.keyText.backgroundColor = kTBDefaultTextViewBgColor;
    self.keyText.textColor = KTBDefaultTextColor;
    self.keyText.font = [UIFont systemFontOfSize:14];
    [self.scrollView addSubview:self.keyText];
    
    startY = self.keyText.frame.origin.y + self.keyText.frame.size.height + 10;
    self.outputLabel = [[UILabel alloc] initWithFrame:CGRectMake(kTBDefaultMargin+4, startY, kScreenWidth-2*kTBDefaultMargin, 30)];
    self.outputLabel.textColor = KTBDefaultTextColor;
    self.outputLabel.font = [UIFont systemFontOfSize:16];
    self.outputLabel.text = @"密文:";
    [self.scrollView addSubview:self.outputLabel];
    
    startY = self.outputLabel.frame.origin.y + self.outputLabel.frame.size.height + 6;
    self.outputText = [[UITextView alloc] initWithFrame:CGRectMake(kTBDefaultMargin, startY, kScreenWidth-2*kTBDefaultMargin, 80)];
    self.outputText.backgroundColor = kTBDefaultTextViewBgColor;
    self.outputText.textColor = KTBDefaultTextColor;
    self.outputText.font = [UIFont systemFontOfSize:14];
    [self.scrollView addSubview:self.outputText];
}


- (void)viewWillLayoutSubviews {
    [super viewWillLayoutSubviews];
    [self.view bringSubviewToFront:self.bottomBar];
}

- (void)onClickConvertBtn {
    NSString *originStr = self.inputText.text;
    NSString *keyStr = self.keyText.text;

    NSString *resultStr = nil;
    switch (self.toolModel.encryptType) {
        case TBEncryptType_AES: {
            resultStr = [TBEncryptHelper encryptAES:originStr key:keyStr];
        }
            break;
        case TBEncryptType_DES: {
            resultStr = [TBEncryptHelper encryptDES:originStr key:keyStr];
        }
            break;
        case TBEncryptType_TripleDES: {
            resultStr = [TBEncryptHelper encrypt3DES:originStr key:keyStr];
        }
            break;
        default:
            break;
    }
    
    self.outputText.text = resultStr;
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    [self.inputText resignFirstResponder];
    [self.keyText resignFirstResponder];
    [self.outputText resignFirstResponder];
}

- (void)onTapScrollView {
    [self.inputText resignFirstResponder];
    [self.keyText resignFirstResponder];
    [self.outputText resignFirstResponder];
}

@end
