//
//  TBEncryptViewController.m
//  TinyBox
//
//  Created by shenqichen on 2019/6/4.
//  Copyright © 2019 shenqichen. All rights reserved.
//

#import "TBEncryptViewController.h"

@interface TBEncryptViewController ()

@property (nonatomic, retain) TBEncryptToolModel *toolModel;

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
}

- (void)configTitleBar {
    self.titleBar = [[TBTitleBar alloc] initWithController:self];
    [self.view addSubview:self.titleBar];
    [self.titleBar setTitle:self.toolModel.title];
}

@end
