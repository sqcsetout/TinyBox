//
//  TBBaseViewController.h
//  TinyBox
//
//  Created by shenqichen on 2019/5/30.
//  Copyright © 2019 shenqichen. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TBTitleBar.h"

NS_ASSUME_NONNULL_BEGIN

@interface TBBaseViewController : UIViewController

@property (nonatomic, retain) TBTitleBar *titleBar;

@end

NS_ASSUME_NONNULL_END
