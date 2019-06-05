//
//  TBCollectionHeadView.m
//  TinyBox
//
//  Created by shenqichen on 2019/5/31.
//  Copyright © 2019 shenqichen. All rights reserved.
//

#import "TBCollectionHeadView.h"

@interface TBCollectionHeadView ()

@property (nonatomic, retain) UILabel *titleLabel;
@property (nonatomic, retain) TBToolGroupModel *groupModel;

@end


@implementation TBCollectionHeadView

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        self.backgroundColor = [UIColor colorForHex:0x2D282A];
        [self initSubview];
    }
    
    return self;
}

- (void)initSubview {
    self.titleLabel = [UILabel new];
    self.titleLabel.tintColor = [UIColor blackColor];
    self.titleLabel.textAlignment = NSTextAlignmentLeft;
    self.titleLabel.font = [UIFont systemFontOfSize:16];
    self.titleLabel.textColor = KTBDefaultTextColor;
    self.titleLabel.backgroundColor = [UIColor clearColor];
    [self addSubview:self.titleLabel];
}

- (void)layoutSubviews {
    [super layoutSubviews];
    self.titleLabel.frame = CGRectMake(24, kCollectionHeadHeight-kCollectionHeadLabelHeight, kScreenWidth/2-24, kCollectionHeadLabelHeight);
    self.titleLabel.text = self.groupModel.groupTitle;
}

- (void)updateGroupModel:(TBToolGroupModel*)groupModel {
    if (self.groupModel == groupModel) {
        return;
    }
    
    self.groupModel = groupModel;
    [self setNeedsLayout];
    [self layoutIfNeeded];
}
                       
@end
