//
//  TBToolListDataManager.m
//  TinyBox
//
//  Created by shenqichen on 2019/6/3.
//  Copyright © 2019 shenqichen. All rights reserved.
//

#import "TBToolListDataManager.h"

@interface TBToolListDataManager ()

@property (nonatomic, retain) TBToolGroupModel *encodeTools;
@property (nonatomic, retain) TBToolGroupModel *encryptTools;
@property (nonatomic, retain) TBToolGroupModel *hashTools;

@property (nonatomic, retain) NSArray <TBToolGroupModel*> *toolGroups;

@end


@implementation TBToolListDataManager

+ (instancetype)shareInstance {
    static dispatch_once_t onceToken;
    static TBToolListDataManager* instance;
    dispatch_once(&onceToken, ^{
        instance = [[TBToolListDataManager alloc] init];
        [instance generateToolList];
    });
    
    return instance;
}

- (void)generateToolList {
    self.toolGroups = [NSArray arrayWithObjects:self.encodeTools, self.encryptTools, self.hashTools, nil];
}

- (NSArray<TBToolGroupModel*>*)getToolGroups {
    return self.toolGroups;
}

- (TBToolGroupModel*)encodeTools {
    if (!_encodeTools) {
        TBEncodeToolModel *item0 = [TBEncodeToolModel new];
        item0.toolType = TBToolType_Encode;
        item0.title = @"Base64";
        item0.brief = @"Base64";
        item0.encodeType = TBEncodeType_Base64;

        TBEncodeToolModel *item1 = [TBEncodeToolModel new];
        item1.toolType = TBToolType_Encode;
        item1.title = @"Url";
        item1.brief = @"Url";
        item1.encodeType = TBEncodeType_Url;

        TBEncodeToolModel *item2 = [TBEncodeToolModel new];
        item2.toolType = TBToolType_Encode;
        item2.title = @"Hex";
        item2.brief = @"Hex";
        item2.encodeType = TBEncodeType_Hex;

        TBEncodeToolModel *item3 = [TBEncodeToolModel new];
        item3.toolType = TBToolType_Encode;
        item3.title = @"Unicode";
        item3.brief = @"Unicode";
        item3.encodeType = TBEncodeType_Unicode;

        TBEncodeToolModel *item4 = [TBEncodeToolModel new];
        item4.toolType = TBToolType_Encode;
        item4.title = @"UTF8";
        item4.brief = @"UTF8";
        item4.encodeType = TBEncodeType_UTF8;

        TBEncodeToolModel *item5 = [TBEncodeToolModel new];
        item5.toolType = TBToolType_Encode;
        item5.title = @"ASCII";
        item5.brief = @"ASCII";
        item5.encodeType = TBEncodeType_ASCII;

        _encodeTools = [TBToolGroupModel new];
        _encodeTools.groupTitle = @"编解码";
        _encodeTools.toolList = @[item0, item1, item2, item3, item4, item5];
    }
    
    return _encodeTools;
}

- (TBToolGroupModel*)encryptTools {
    if (!_encryptTools) {
        TBEncryptToolModel *item0 = [TBEncryptToolModel new];
        item0.toolType = TBToolType_Encrypt;
        item0.title = @"AES";
        item0.brief = @"AES";
        item0.encryptType = TBEncryptType_AES;
        
        TBEncryptToolModel *item1 = [TBEncryptToolModel new];
        item1.toolType = TBToolType_Encrypt;
        item1.title = @"DES";
        item1.brief = @"DES";
        item1.encryptType = TBEncryptType_DES;

        TBEncryptToolModel *item2 = [TBEncryptToolModel new];
        item2.toolType = TBToolType_Encrypt;
        item2.title = @"RC4";
        item2.brief = @"RC4";
        item2.encryptType = TBEncryptType_RC4;
        
        TBEncryptToolModel *item3 = [TBEncryptToolModel new];
        item3.toolType = TBToolType_Encrypt;
        item3.title = @"Rabbit";
        item3.brief = @"Rabbit";
        item3.encryptType = TBEncryptType_Rabbit;

        TBEncryptToolModel *item4 = [TBEncryptToolModel new];
        item4.toolType = TBToolType_Encrypt;
        item4.title = @"TripleDes";
        item4.brief = @"TripleDes";
        item4.encryptType = TBEncryptType_TripleDes;
        
        _encryptTools = [TBToolGroupModel new];
        _encryptTools.groupTitle = @"加解密";
        _encryptTools.toolList = @[item0, item1, item2, item3, item4];
    }
    
    return _encryptTools;
}


- (TBToolGroupModel*)hashTools {
    if (!_hashTools) {
        TBHashToolModel *item0 = [TBHashToolModel new];
        item0.toolType = TBToolType_Hash;
        item0.title = @"MD5";
        item0.brief = @"MD5";
        item0.hashType = TBHashType_MD5;

        TBHashToolModel *item1 = [TBHashToolModel new];
        item1.toolType = TBToolType_Hash;
        item1.title = @"SHA1";
        item1.brief = @"SHA1";
        item1.hashType = TBHashType_SHA1;

        TBHashToolModel *item2 = [TBHashToolModel new];
        item2.toolType = TBToolType_Hash;
        item2.title = @"SHA256";
        item2.brief = @"SHA256";
        item2.hashType = TBHashType_SHA256;

        _hashTools = [TBToolGroupModel new];
        _hashTools.groupTitle = @"哈希";
        _hashTools.toolList = @[item0, item1, item2];
    }
    
    return _hashTools;
}

@end
