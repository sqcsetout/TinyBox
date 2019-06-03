//
//  TBToolListCell.m
//  TinyBox
//
//  Created by shenqichen on 2019/5/30.
//  Copyright © 2019 shenqichen. All rights reserved.
//

#import "TBToolListCell.h"

@interface TBToolListCell ()

@property (nonatomic, retain) TBToolModel *toolModel;
@property (nonatomic, retain) UILabel *titleLabel;

@end


@implementation TBToolListCell

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        self.backgroundColor = [UIColor blueColor];
        self.clipsToBounds = YES;
        [self initSubview];
    }
    return self;
}

- (void)initSubview {
    self.titleLabel = [UILabel new];
    self.titleLabel.tintColor = [UIColor blackColor];
    self.titleLabel.textAlignment = NSTextAlignmentCenter;
    self.titleLabel.font = [UIFont systemFontOfSize:18];
    self.titleLabel.backgroundColor = [UIColor clearColor];
    [self addSubview:self.titleLabel];
}

- (void)layoutSubviews {
    [super layoutSubviews];
    self.titleLabel.frame = self.bounds;
    self.titleLabel.text = self.toolModel.title;
}

- (void)updateToolModel:(TBToolModel*)toolModel {
    if (self.toolModel == toolModel) {
        return;
    }
    
    self.toolModel = toolModel;
    [self setNeedsLayout];
    [self layoutIfNeeded];
}

@end
