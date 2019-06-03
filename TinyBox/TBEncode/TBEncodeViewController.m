//
//  TBEncodeViewController.m
//  TinyBox
//
//  Created by shenqichen on 2019/5/31.
//  Copyright © 2019 shenqichen. All rights reserved.
//

#import "TBEncodeViewController.h"

@interface TBEncodeViewController ()

@end

@implementation TBEncodeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self configTitleBar];
    self.view.backgroundColor = [UIColor brownColor];
}

- (void)configTitleBar {
    self.titleBar = [[TBTitleBar alloc] initWithController:self];
    [self.view addSubview:self.titleBar];
    [self.titleBar setTitle:@"编解码"];
}


@end
