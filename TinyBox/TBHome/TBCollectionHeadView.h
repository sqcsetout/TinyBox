//
//  TBCollectionHeadView.h
//  TinyBox
//
//  Created by shenqichen on 2019/5/31.
//  Copyright © 2019 shenqichen. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TBToolModel.h"
#import "TBUtilty.h"

NS_ASSUME_NONNULL_BEGIN

#define kCollectionHeadHeight 30
#define kCollectionHeadLabelHeight 20

@interface TBCollectionHeadView : UICollectionReusableView

- (void)updateGroupModel:(TBToolGroupModel*)groupModel;

@end

NS_ASSUME_NONNULL_END
