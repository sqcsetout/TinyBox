//
//  TBToolListCell.h
//  TinyBox
//
//  Created by shenqichen on 2019/5/30.
//  Copyright © 2019 shenqichen. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TBUtilty.h"

NS_ASSUME_NONNULL_BEGIN

@interface TBToolListCell : UICollectionViewCell

- (void)updateToolModel:(TBToolModel*)toolModel;

@end

NS_ASSUME_NONNULL_END
