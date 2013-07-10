//
//  NSString+PopExtension.m
//  gxphotocontest
//
//  Created by 阿More on 13-7-3.
//  Copyright (c) 2013年 popalm.com. All rights reserved.
//

#import "NSString+PopExtension.h"

@implementation NSString (PopExtension)

-(BOOL)isJsonStringList
{
    unichar char0 = [self characterAtIndex:0];
    unichar char9 = [self characterAtIndex:[self length]-1];
    
    return (char0 == '{') && (char9 == '}');
}

-(NSString*)fillUpJsonString;
{
    NSString *separatedStr = @"\"}{\"";
    NSString *replaceStr = @"\"},{\"";
    
    
    NSRange range = [self rangeOfString:separatedStr];
    
    if (range.length >0 ) {
        NSMutableString *JsonRepString = [[NSMutableString alloc] initWithString:self];
        [JsonRepString replaceCharactersInRange:range withString:replaceStr];
        
        NSString *JsonString = [NSString stringWithFormat:@"[%@]",JsonRepString];
        return JsonString;
    }
    else
        return self;
}

-(NSString*)getListitemStringbyRemoveFilterStr
{
    NSString *filterOKStr = @"{\"Filter\":\"ok\"}";
    
    NSRange range = [self rangeOfString:filterOKStr];
    
    if (range.length >0 )
    {
        
        
        NSString *listitemStr = [self substringWithRange:NSMakeRange(range.length, [self length]-range.length)];
        
        return listitemStr;
    }
    else
        return  self;
    
}


+ (NSString *)stringWithUUIDStr		//随机id
{
    CFUUIDRef uuidObj = CFUUIDCreate(nil);
    NSString *randomStr= (NSString*)CFUUIDCreateString(nil, uuidObj);
    CFRelease(uuidObj);
    
    return [NSString stringWithString:randomStr];
}

+ (NSString *)stringWithRandomJpgfile;    //随机jpg文件名
{
    NSString *uid = [NSString stringWithUUIDStr];
    
	return [NSString stringWithFormat:@"%@.jpg", uid];
}

+ (NSString *)stringWithRandomPngfile;  //随机png文件名
{
    NSString *uid = [NSString stringWithUUIDStr];
    
	return [NSString stringWithFormat:@"%@.png", uid];
}

- (NSString *)URLEncodingByGB2312;
{
	NSString * result = (NSString *)CFURLCreateStringByAddingPercentEscapes( kCFAllocatorDefault,
																			(CFStringRef)self,
																			NULL,
																			//(CFStringRef)@"!*'();:@&=+$,/?%#[]",
                                                                            (CFStringRef)@"",
																			kCFStringEncodingGB_18030_2000 );
    
    
	return [result autorelease];
}

- (NSString *)URLDecodingByGB2312;
{
//	NSMutableString * string = [NSMutableString stringWithString:self];
//    [string replaceOccurrencesOfString:@"+"
//							withString:@" "
//							   options:NSLiteralSearch
//								 range:NSMakeRange(0, [string length])];
    
    NSStringEncoding enc = CFStringConvertEncodingToNSStringEncoding(kCFStringEncodingGB_18030_2000);
    NSString *urlDecode=[self stringByReplacingPercentEscapesUsingEncoding:enc];
    
    return urlDecode;
}

@end
