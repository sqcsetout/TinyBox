//
//  TBEncodeViewController.m
//  TinyBox
//
//  Created by shenqichen on 2019/5/31.
//  Copyright © 2019 shenqichen. All rights reserved.
//

#import "TBEncodeViewController.h"

@interface TBEncodeViewController ()

@property (nonatomic, retain) TBEncodeToolModel *toolModel;

@end

@implementation TBEncodeViewController

- (instancetype)initWithModel:(TBEncodeToolModel*)toolModel {
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