//
//  TBBaseViewController.m
//  TinyBox
//
//  Created by shenqichen on 2019/5/30.
//  Copyright © 2019 shenqichen. All rights reserved.
//

#import "TBBaseViewController.h"

@interface TBBaseViewController ()

@end

@implementation TBBaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
}

- (void)viewWillLayoutSubviews {
    if (self.titleBar && self.titleBar.superview == self.view) {
        [self.view bringSubviewToFront:self.titleBar];
    }
}

@end
