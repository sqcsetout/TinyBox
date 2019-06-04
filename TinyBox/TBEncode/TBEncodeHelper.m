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
    return nil;
}

+ (NSString*)decodeHex:(NSString*)originStr {
    return nil;
}

+ (NSString*)encodeUnicode:(NSString*)originStr {
    return nil;
}

+ (NSString*)decodeUnicode:(NSString*)originStr {
    return nil;
}

+ (NSString*)encodeUTF8:(NSString*)originStr {
    return nil;

}

+ (NSString*)decodeUTF8:(NSString*)originStr {
    return nil;

}

+ (NSString*)encodeASCII:(NSString*)originStr {
    const char *ch = [originStr cStringUsingEncoding:NSASCIIStringEncoding];
    for (int i = 0; i < strlen(ch); i++) {
        printf("%c", ch[i]);
    }
    
    return nil;

}

+ (NSString*)decodeASCII:(NSString*)originStr {
    return nil;

}

@end
