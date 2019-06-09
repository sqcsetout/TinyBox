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
        item0.brief = @"Base64是网络上最常见的用于传输8Bit字节码的编码方式之一，是基于64个可打印字符来表示二进制数据的方法。";
        item0.encodeType = TBEncodeType_Base64;

        TBEncodeToolModel *item1 = [TBEncodeToolModel new];
        item1.toolType = TBToolType_Encode;
        item1.title = @"Url";
        item1.brief = @"UrlEncode是统一资源定位符(URL)的编码机制，可将中文或特殊字符进行转换，便于网络上识别处理。";
        item1.encodeType = TBEncodeType_Url;

        TBEncodeToolModel *item2 = [TBEncodeToolModel new];
        item2.toolType = TBToolType_Encode;
        item2.title = @"Hex";
        item2.brief = @"Hex编码就是把一个8位的字节数据用两个十六进制数展示出来，相对二进制而言，更加简单明了。";
        item2.encodeType = TBEncodeType_Hex;

        TBEncodeToolModel *item3 = [TBEncodeToolModel new];
        item3.toolType = TBToolType_Encode;
        item3.title = @"Unicode";
        item3.brief = @"Unicode编码采用双字节16位来进行编号，基本上包含了世界上所有的语言字符，它也就成为了全世界一种通用的编码。";
        item3.encodeType = TBEncodeType_Unicode;
        
        _encodeTools = [TBToolGroupModel new];
        _encodeTools.groupTitle = @"编码";
        _encodeTools.toolList = @[item0, item1, item2, item3];
    }
    
    return _encodeTools;
}

- (TBToolGroupModel*)encryptTools {
    if (!_encryptTools) {
        TBEncryptToolModel *item0 = [TBEncryptToolModel new];
        item0.toolType = TBToolType_Encrypt;
        item0.title = @"AES";
        item0.brief = @"AES是一种高级区块加密标准，已经被多方分析且广为全世界所使用。这里AES128使用ECB加密模式，PKCS7填充。";
        item0.encryptType = TBEncryptType_AES;
        
        TBEncryptToolModel *item1 = [TBEncryptToolModel new];
        item1.toolType = TBToolType_Encrypt;
        item1.title = @"DES";
        item1.brief = @"DES，数据加密标准，是一种使用密钥加密的块算法。这里的结果使用EBC加密模式，PKCS7填充。";
        item1.encryptType = TBEncryptType_DES;

        TBEncryptToolModel *item2 = [TBEncryptToolModel new];
        item2.toolType = TBToolType_Encrypt;
        item2.title = @"TripleDES";
        item2.brief = @"TripleDES是DES向AES过渡的加密算法，它相当于是对每个数据块应用三次DES加密算法。是DES的一个更安全的变形。";
        item2.encryptType = TBEncryptType_TripleDES;

        _encryptTools = [TBToolGroupModel new];
        _encryptTools.groupTitle = @"加密";
        _encryptTools.toolList = @[item0, item1, item2];
    }
    
    return _encryptTools;
}


- (TBToolGroupModel*)hashTools {
    if (!_hashTools) {
        TBHashToolModel *item0 = [TBHashToolModel new];
        item0.toolType = TBToolType_Hash;
        item0.title = @"MD5";
        item0.brief = @"MD5消息摘要算法，一种被广泛使用的密码散列函数，可以产生出一个128位的散列值，用于确保信息传输完整一致。";
        item0.hashType = TBHashType_MD5;

        TBHashToolModel *item1 = [TBHashToolModel new];
        item1.toolType = TBToolType_Hash;
        item1.title = @"SHA1";
        item1.brief = @"SHA1，安全哈希算法，主要适用于数字签名算法。对于长度小于2^64位的消息，SHA1会产生一个160位的消息摘要。";
        item1.hashType = TBHashType_SHA1;

        TBHashToolModel *item2 = [TBHashToolModel new];
        item2.toolType = TBToolType_Hash;
        item2.title = @"SHA256";
        item2.brief = @"SHA256是SHA-2下细分出的一种算法。对于任意长度的消息，SHA256都会产生一个256位长的哈希值，称作消息摘要。";
        item2.hashType = TBHashType_SHA256;

        _hashTools = [TBToolGroupModel new];
        _hashTools.groupTitle = @"哈希";
        _hashTools.toolList = @[item0, item1, item2];
    }
    
    return _hashTools;
}

@end
