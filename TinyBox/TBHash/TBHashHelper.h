//
//  TBHashHelper.h
//  TinyBox
//
//  Created by shenqichen on 2019/6/4.
//  Copyright © 2019 shenqichen. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface TBHashHelper : NSObject

+ (NSString*)hashMD5:(NSString*)originStr;
+ (NSString*)hashSHA1:(NSString*)originStr;
+ (NSString*)hashSHA256:(NSString*)originStr;

@end

NS_ASSUME_NONNULL_END
