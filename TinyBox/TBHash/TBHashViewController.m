//
//  TBHashViewController.m
//  TinyBox
//
//  Created by shenqichen on 2019/6/4.
//  Copyright © 2019 shenqichen. All rights reserved.
//

#import "TBHashViewController.h"
#import "TBBottomBar.h"
#import "TBHashHelper.h"


@interface TBHashViewController () <TBBottomBarDelegate>

@property (nonatomic, retain) TBHashToolModel *toolModel;
@property (nonatomic, retain) TBBottomBar *bottomBar;

@property (nonatomic, retain) UILabel *briefLabel;

@property (nonatomic, retain) UILabel *inputLabel;
@property (nonatomic, retain) UITextView *inputText;

@property (nonatomic, retain) UILabel *outputLabel;
@property (nonatomic, retain) UITextView *outputText;

@end

@implementation TBHashViewController

- (instancetype)initWithModel:(TBHashToolModel*)toolModel {
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
    self.bottomBar = [[TBBottomBar alloc] initWithTitle:@"编  码" delegate:self];
    [self.view addSubview:self.bottomBar];
}


- (void)initSubview {
    CGFloat startY = TBTitleBarHeight + 20;
    self.briefLabel = [[UILabel alloc] initWithFrame:CGRectMake(kTBDefaultMargin+4, startY, kScreenWidth-2*kTBDefaultMargin, 60)];
    self.briefLabel.textColor = [UIColor colorForHex:0xEFEEB6];
    self.briefLabel.font = [UIFont systemFontOfSize:16];
    self.briefLabel.text = self.toolModel.brief;
    self.briefLabel.numberOfLines = 3;
    self.briefLabel.lineBreakMode = NSLineBreakByTruncatingTail;
    [self.view addSubview:self.briefLabel];
    
    startY = self.briefLabel.frame.origin.y + self.briefLabel.frame.size.height + 20;
    self.inputLabel = [[UILabel alloc] initWithFrame:CGRectMake(kTBDefaultMargin+4, startY, kScreenWidth-2*kTBDefaultMargin, 40)];
    self.inputLabel.textColor = KTBDefaultTextColor;
    self.inputLabel.font = [UIFont systemFontOfSize:16];
    self.inputLabel.text = @"输入:";
    [self.view addSubview:self.inputLabel];
    
    startY = self.inputLabel.frame.origin.y + self.inputLabel.frame.size.height + 10;
    self.inputText = [[UITextView alloc] initWithFrame:CGRectMake(kTBDefaultMargin, startY, kScreenWidth-2*kTBDefaultMargin, 120)];
    self.inputText.backgroundColor = kTBDefaultTextViewBgColor;
    self.inputText.textColor = KTBDefaultTextColor;
    self.inputText.font = [UIFont systemFontOfSize:14];
    [self.view addSubview:self.inputText];
    
    startY = self.inputText.frame.origin.y + self.inputText.frame.size.height + 30;
    self.outputLabel = [[UILabel alloc] initWithFrame:CGRectMake(kTBDefaultMargin+4, startY, kScreenWidth-2*kTBDefaultMargin, 40)];
    self.outputLabel.textColor = KTBDefaultTextColor;
    self.outputLabel.font = [UIFont systemFontOfSize:16];
    self.outputLabel.text = @"结果:";
    [self.view addSubview:self.outputLabel];
    
    startY = self.outputLabel.frame.origin.y + self.outputLabel.frame.size.height + 10;
    self.outputText = [[UITextView alloc] initWithFrame:CGRectMake(kTBDefaultMargin, startY, kScreenWidth-2*kTBDefaultMargin, 120)];
    self.outputText.backgroundColor = kTBDefaultTextViewBgColor;
    self.outputText.textColor = KTBDefaultTextColor;
    self.outputText.font = [UIFont systemFontOfSize:14];
    [self.view addSubview:self.outputText];
}


- (void)viewWillLayoutSubviews {
    [super viewWillLayoutSubviews];
    [self.view bringSubviewToFront:self.bottomBar];
}

- (void)onClickConvertBtn {
    NSString *originStr = self.inputText.text;
    
    NSString *resultStr = nil;
    switch (self.toolModel.hashType) {
        case TBHashType_MD5: {
            resultStr = [TBHashHelper hashMD5:originStr];
        }
            break;
        case TBHashType_SHA1: {
            resultStr = [TBHashHelper hashSHA1:originStr];
        }
            break;
        case TBHashType_SHA256: {
            resultStr = [TBHashHelper hashSHA256:originStr];
        }
            break;
        default:
            break;
    }
    
    self.outputText.text = resultStr;
}

@end
