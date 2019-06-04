//
//  TBHashViewController.m
//  TinyBox
//
//  Created by shenqichen on 2019/6/4.
//  Copyright © 2019 shenqichen. All rights reserved.
//

#import "TBHashViewController.h"

@interface TBHashViewController ()

@property (nonatomic, retain) TBHashToolModel *toolModel;

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
}

- (void)configTitleBar {
    self.titleBar = [[TBTitleBar alloc] initWithController:self];
    [self.view addSubview:self.titleBar];
    [self.titleBar setTitle:self.toolModel.title];
}

@end
