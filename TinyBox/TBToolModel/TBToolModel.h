//
//  TBToolModel.h
//  TinyBox
//
//  Created by shenqichen on 2019/6/3.
//  Copyright © 2019 shenqichen. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

typedef NS_ENUM(NSUInteger, TBToolType) {
    TBToolType_Default,
    TBToolType_Encode,
    TBToolType_Encrypt,
    TBToolType_Hash,
    TBToolType_Timestamp,
    TBToolType_Color,
};


typedef NS_ENUM(NSUInteger, TBEncodeType) {
    TBEncodeType_Base64,
    TBEncodeType_Url,
    TBEncodeType_Hex,
    TBEncodeType_Unicode,
};


typedef NS_ENUM(NSUInteger, TBEncryptType) {
    TBEncryptType_AES,
    TBEncryptType_DES,
    TBEncryptType_TripleDES,
};


typedef NS_ENUM(NSUInteger, TBHashType) {
    TBHashType_MD5,
    TBHashType_SHA1,
    TBHashType_SHA256,
};


@interface TBToolModel : NSObject

@property (nonatomic, retain) NSString *title;
@property (nonatomic, retain) NSString *brief;
@property (nonatomic, assign) TBToolType toolType;

@end


@interface TBEncodeToolModel : TBToolModel

@property (nonatomic, assign) TBEncodeType encodeType;

@end


@interface TBEncryptToolModel : TBToolModel

@property (nonatomic, assign) TBEncryptType encryptType;

@end


@interface TBHashToolModel : TBToolModel

@property (nonatomic, assign) TBHashType hashType;

@end


@interface TBToolGroupModel : NSObject

@property (nonatomic, retain) NSString *groupTitle;
@property (nonatomic, retain) NSArray <TBToolModel*> *toolList;

@end


NS_ASSUME_NONNULL_END
