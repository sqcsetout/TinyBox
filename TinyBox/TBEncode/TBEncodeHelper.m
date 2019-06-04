//
//  TBEncodeHelper.m
//  TinyBox
//
//  Created by shenqichen on 2019/6/4.
//  Copyright © 2019 shenqichen. All rights reserved.
//

#import "TBEncodeHelper.h"

@implementation TBEncodeHelper

+ (NSString*)encodeBase64:(NSString*)originStr {
    NSData *data =[originStr dataUsingEncoding:NSUTF8StringEncoding];
    return [data base64EncodedStringWithOptions:0];
}

+ (NSString*)decodeBase64:(NSString*)originStr {
    NSData *data=[[NSData alloc] initWithBase64EncodedString:originStr options:0];
    return [[NSString alloc]initWithData:data encoding:NSUTF8StringEncoding];
}

+ (NSString*)encodeUrl:(NSString*)originStr {
    NSString *encodedString = [originStr stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];;
    return encodedString;
}

+ (NSString*)decodeUrl:(NSString*)originStr {
    NSString *result = [originStr stringByReplacingOccurrencesOfString:@"+" withString:@" "];
    result = [result stringByReplacingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    return result;
}

+ (NSString*)encodeHex:(NSString*)originStr {
    NSData *myD = [originStr dataUsingEncoding:NSUTF8StringEncoding];
    Byte *bytes = (Byte *)[myD bytes];
    //下面是Byte 转换为16进制。
    NSString *hexStr = @"";
    for(int i=0; i<[myD length]; i++) {
        NSString *newHexStr = [NSString stringWithFormat:@"%x",bytes[i]&0xff];///16进制数
        if([newHexStr length]==1) {
            hexStr = [NSString stringWithFormat:@"%@0%@",hexStr,newHexStr];
        } else {
            hexStr = [NSString stringWithFormat:@"%@%@",hexStr,newHexStr];
        }
    }
    
    return hexStr;
}

+ (NSString*)decodeHex:(NSString*)originStr {
    char *myBuffer = (char *)malloc((int)[originStr length] / 2 + 1);
    bzero(myBuffer, [originStr length] / 2 + 1);
    for (int i = 0; i < [originStr length] - 1; i += 2) {
        unsigned int anInt;
        NSString * hexCharStr = [originStr substringWithRange:NSMakeRange(i, 2)];
        NSScanner * scanner = [[NSScanner alloc] initWithString:hexCharStr];
        [scanner scanHexInt:&anInt];
        myBuffer[i / 2] = (char)anInt;
    }
    NSString *unicodeString = [NSString stringWithCString:myBuffer encoding:4];
    return unicodeString;
}

+ (NSString*)encodeUnicode:(NSString*)originStr {
    NSUInteger length = [originStr length];
    NSMutableString *str = [NSMutableString stringWithCapacity:0];
    for (int i = 0;i < length; i++){
        NSMutableString *s = [NSMutableString stringWithCapacity:0];
        unichar _char = [originStr characterAtIndex:i];
        // 判断是否为英文和数字
        if (_char <= '9' && _char >='0'){
            [s appendFormat:@"%@",[originStr substringWithRange:NSMakeRange(i,1)]];
        }else if(_char >='a' && _char <= 'z'){
            [s appendFormat:@"%@",[originStr substringWithRange:NSMakeRange(i,1)]];
        }else if(_char >='A' && _char <= 'Z')
        {
            [s appendFormat:@"%@",[originStr substringWithRange:NSMakeRange(i,1)]];
        }else{
            // 中文和字符
            [s appendFormat:@"\\u%x",[originStr characterAtIndex:i]];
            // 不足位数补0 否则解码不成功
            if (s.length == 4) {
                [s insertString:@"00" atIndex:2];
            } else if (s.length == 5) {
                [s insertString:@"0" atIndex:2];
            }
        }
        [str appendFormat:@"%@", s];
    }
    return str;
}

+ (NSString*)decodeUnicode:(NSString*)originStr {
    NSString *tempStr1 = [originStr stringByReplacingOccurrencesOfString:@"\\u"withString:@"\\U"];
    NSString *tempStr2 = [tempStr1 stringByReplacingOccurrencesOfString:@"\""withString:@"\\\""];
    NSString *tempStr3 = [[@"\""stringByAppendingString:tempStr2] stringByAppendingString:@"\""];
    NSData *tempData = [tempStr3 dataUsingEncoding:NSUTF8StringEncoding];
    NSString* returnStr = [NSPropertyListSerialization propertyListFromData:tempData mutabilityOption:NSPropertyListImmutable format:NULL errorDescription:NULL];
    return [returnStr stringByReplacingOccurrencesOfString:@"\\r\\n"withString:@"\n"];
}


@end
