//
//  TBEncodeHelper.h
//  TinyBox
//
//  Created by shenqichen on 2019/6/4.
//  Copyright © 2019 shenqichen. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface TBEncodeHelper : NSObject

+ (NSString*)encodeBase64:(NSString*)originStr;
+ (NSString*)decodeBase64:(NSString*)originStr;

+ (NSString*)encodeUrl:(NSString*)originStr;
+ (NSString*)decodeUrl:(NSString*)originStr;

+ (NSString*)encodeHex:(NSString*)originStr;
+ (NSString*)decodeHex:(NSString*)originStr;

+ (NSString*)encodeUnicode:(NSString*)originStr;
+ (NSString*)decodeUnicode:(NSString*)originStr;

@end

NS_ASSUME_NONNULL_END
