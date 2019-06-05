//
//  TBEncryptHelper.h
//  TinyBox
//
//  Created by shenqichen on 2019/6/5.
//  Copyright © 2019 shenqichen. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface TBEncryptHelper : NSObject

+ (NSString*)encryptAES:(NSString*)originStr key:(NSString*)key;
+ (NSString*)decryptAES:(NSString*)originStr key:(NSString*)key;

+ (NSString*)encryptDES:(NSString*)originStr key:(NSString*)key;
+ (NSString*)decryptDES:(NSString*)originStr key:(NSString*)key;

+ (NSString*)encrypt3DES:(NSString*)originStr key:(NSString*)key;
+ (NSString*)decrypt3DES:(NSString*)originStr key:(NSString*)key;

+ (NSString*)encryptRC4:(NSString*)originStr key:(NSString*)key;
+ (NSString*)decryptRC4:(NSString*)originStr key:(NSString*)key;

@end

NS_ASSUME_NONNULL_END
