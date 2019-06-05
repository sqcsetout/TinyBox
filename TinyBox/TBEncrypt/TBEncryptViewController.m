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


@interface TBEncryptViewController () <TBBottomBarDelegate>

@property (nonatomic, retain) TBEncryptToolModel *toolModel;
@property (nonatomic, retain) TBBottomBar *bottomBar;

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
    self.bottomBar = [[TBBottomBar alloc] initWithTitle:@"加密(ECB,密钥长度128,Hex输出)" delegate:self];
    [self.view addSubview:self.bottomBar];
}


- (void)initSubview {
    CGFloat startY = TBTitleBarHeight + 20;
    self.inputLabel = [[UILabel alloc] initWithFrame:CGRectMake(kTBDefaultMargin, startY, kScreenWidth-2*kTBDefaultMargin, 40)];
    self.inputLabel.text = @"明文";
    [self.view addSubview:self.inputLabel];
    
    startY = self.inputLabel.frame.origin.y + self.inputLabel.frame.size.height + 20;
    self.inputText = [[UITextView alloc] initWithFrame:CGRectMake(kTBDefaultMargin, startY, kScreenWidth-2*kTBDefaultMargin, 100)];
    self.inputText.backgroundColor = [UIColor colorForHex:0xECECEC];
    [self.view addSubview:self.inputText];
    
    startY = self.inputText.frame.origin.y + self.inputText.frame.size.height + 20;
    self.keyLabel = [[UILabel alloc] initWithFrame:CGRectMake(kTBDefaultMargin, startY, kScreenWidth-2*kTBDefaultMargin, 40)];
    self.keyLabel.text = @"密码";
    [self.view addSubview:self.keyLabel];
    
    startY = self.keyLabel.frame.origin.y + self.keyLabel.frame.size.height + 20;
    self.keyText = [[UITextView alloc] initWithFrame:CGRectMake(kTBDefaultMargin, startY, kScreenWidth-2*kTBDefaultMargin, 40)];
    self.keyText.backgroundColor = [UIColor colorForHex:0xECECEC];
    [self.view addSubview:self.keyText];
    
    startY = self.keyText.frame.origin.y + self.keyText.frame.size.height + 20;
    self.outputLabel = [[UILabel alloc] initWithFrame:CGRectMake(kTBDefaultMargin, startY, kScreenWidth-2*kTBDefaultMargin, 40)];
    self.outputLabel.text = @"密文";
    [self.view addSubview:self.outputLabel];
    
    startY = self.outputLabel.frame.origin.y + self.outputLabel.frame.size.height + 20;
    self.outputText = [[UITextView alloc] initWithFrame:CGRectMake(kTBDefaultMargin, startY, kScreenWidth-2*kTBDefaultMargin, 100)];
    self.outputText.backgroundColor = [UIColor colorForHex:0xECECEC];
    [self.view addSubview:self.outputText];
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
//            resultStr = [TBHashHelper hashSHA1:originStr];
        }
            break;
        case TBEncryptType_TripleDES: {
//            resultStr = [TBHashHelper hashSHA256:originStr];
        }
            break;
        default:
            break;
    }
    
    self.outputText.text = resultStr;
}

@end
