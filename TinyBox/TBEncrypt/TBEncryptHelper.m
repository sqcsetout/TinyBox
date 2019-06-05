//
//  TBEncryptHelper.m
//  TinyBox
//
//  Created by shenqichen on 2019/6/5.
//  Copyright © 2019 shenqichen. All rights reserved.
//

#import "TBEncryptHelper.h"
#import <CommonCrypto/CommonDigest.h>
#import <CommonCrypto/CommonCryptor.h>

@interface NSData (AES256)

-(NSData *) aes256_encrypt:(NSString *)key;
-(NSData *) aes256_decrypt:(NSString *)key;

@end

@implementation NSData (AES256)

// 加密
- (NSData *)aes256_encrypt:(NSString *)key{
    
    char keyPtr[kCCKeySizeAES256 + 1];
    bzero(keyPtr, sizeof(keyPtr));
    [key getCString:keyPtr maxLength:sizeof(keyPtr) encoding:NSUTF8StringEncoding];
    
    NSUInteger dataLength = [self length];
    size_t bufferSize = dataLength + kCCBlockSizeAES128;
    void *buffer = malloc(bufferSize);
    size_t numBytesEncrypted = 0;
    
    CCCryptorStatus cryptStatus = CCCrypt(kCCEncrypt, kCCAlgorithmAES128, kCCOptionPKCS7Padding | kCCOptionECBMode, keyPtr, kCCBlockSizeAES128, NULL, [self bytes], dataLength, buffer, bufferSize, &numBytesEncrypted);
    
    if (cryptStatus == kCCSuccess) {
        
        return [NSData dataWithBytesNoCopy:buffer length:numBytesEncrypted];
    }
    
    free(buffer);
    return nil;
}


// 解密
- (NSData *)aes256_decrypt:(NSString *)key{
    
    char keyPtr[kCCKeySizeAES256+1];
    bzero(keyPtr, sizeof(keyPtr));
    [key getCString:keyPtr maxLength:sizeof(keyPtr) encoding:NSUTF8StringEncoding];
    NSUInteger dataLength = [self length];
    size_t bufferSize = dataLength + kCCBlockSizeAES128;
    void *buffer = malloc(bufferSize);
    size_t numBytesDecrypted = 0;
    CCCryptorStatus cryptStatus = CCCrypt(kCCDecrypt, kCCAlgorithmAES128,
                                          kCCOptionPKCS7Padding | kCCOptionECBMode,
                                          keyPtr, kCCBlockSizeAES128,
                                          NULL,
                                          [self bytes], dataLength,
                                          buffer, bufferSize,
                                          &numBytesDecrypted);
    if (cryptStatus == kCCSuccess) {
        return [NSData dataWithBytesNoCopy:buffer length:numBytesDecrypted];
        
    }
    free(buffer);
    return nil;
}

@end


@interface NSString (AES256)

-(NSString *) aes256_encrypt:(NSString *)key;
-(NSString *) aes256_decrypt:(NSString *)key;

@end

@implementation NSString (AES256)


// 加密
- (NSString *) aes256_encrypt:(NSString *)key{
    
    const char *cstr = [self cStringUsingEncoding:NSUTF8StringEncoding];
    NSData *data = [NSData dataWithBytes:cstr length:self.length];
    //对数据进行加密
    NSData *result = [data aes256_encrypt:key];
    
    //转换为2进制字符串
    if (result && result.length > 0) {
        
        Byte *datas = (Byte*)[result bytes];
        NSMutableString *output = [NSMutableString stringWithCapacity:result.length * 2];
        for(int i = 0; i < result.length; i++){
            [output appendFormat:@"%02x", datas[i]];
        }
        return output;
    }
    return nil;
}


// 解密
-(NSString *) aes256_decrypt:(NSString *)key{
    
    //转换为2进制Data
    NSMutableData *data = [NSMutableData dataWithCapacity:self.length / 2];
    unsigned char whole_byte;
    char byte_chars[3] = {'\0','\0','\0'};
    int i;
    for (i=0; i < [self length] / 2; i++) {
        byte_chars[0] = [self characterAtIndex:i*2];
        byte_chars[1] = [self characterAtIndex:i*2+1];
        whole_byte = strtol(byte_chars, NULL, 16);
        [data appendBytes:&whole_byte length:1];
    }
    
    //对数据进行解密
    NSData* result = [data aes256_decrypt:key];
    if (result && result.length > 0) {
        
        return [[NSString alloc] initWithData:result encoding:NSUTF8StringEncoding];
    }
    return nil;
}

@end



@implementation TBEncryptHelper

+ (NSString*)encryptAES:(NSString*)originStr key:(NSString*)key {
    NSString *result = [originStr aes256_encrypt:key];
    return result;
}

+ (NSString*)decryptAES:(NSString*)originStr key:(NSString*)key {
    NSString *result = [originStr aes256_decrypt:key];
    return result;
}

+ (NSString*)encryptDES:(NSString*)originStr key:(NSString*)key {
    return nil;
}

+ (NSString*)decryptDES:(NSString*)originStr key:(NSString*)key {
    return nil;
}

+ (NSString*)encrypt3DES:(NSString*)originStr key:(NSString*)key {
    return nil;
}

+ (NSString*)decrypt3DES:(NSString*)originStr key:(NSString*)key {
    return nil;
}

+ (NSString*)encryptRC4:(NSString*)originStr key:(NSString*)key {
    return nil;
}

+ (NSString*)decryptRC4:(NSString*)originStr key:(NSString*)key {
    return nil;
}


@end
