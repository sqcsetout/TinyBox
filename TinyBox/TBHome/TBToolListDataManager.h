//
//  TBToolListDataManager.h
//  TinyBox
//
//  Created by shenqichen on 2019/6/3.
//  Copyright © 2019 shenqichen. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TBToolModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface TBToolListDataManager : NSObject

+ (instancetype)shareInstance;
- (NSArray<TBToolGroupModel*>*)getToolGroups;

@end

NS_ASSUME_NONNULL_END
