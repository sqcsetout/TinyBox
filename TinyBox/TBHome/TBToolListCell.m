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
        self.backgroundColor = [UIColor clearColor];
        self.clipsToBounds = YES;
        [self initSubview];
    }
    return self;
}

- (void)initSubview {
    self.titleLabel = [UILabel new];
    self.titleLabel.tintColor = [UIColor blackColor];
    self.titleLabel.textAlignment = NSTextAlignmentCenter;
    self.titleLabel.font = [UIFont systemFontOfSize:16];
    self.titleLabel.textColor = [UIColor colorForHex:0xE7CBBB];
    self.titleLabel.backgroundColor = [UIColor colorForHex:0x38312D];
    [self addSubview:self.titleLabel];
}

- (void)layoutSubviews {
    [super layoutSubviews];
    CGRect frame = CGRectMake(kTBDefaultMargin, 6, kScreenWidth-2*kTBDefaultMargin, self.frame.size.height-12);
    self.titleLabel.frame = frame;
    self.titleLabel.text = [NSString stringWithFormat:@"# %@",self.toolModel.title];
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
