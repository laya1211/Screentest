//
//  NSString+PopExtension.h
//  gxphotocontest
//
//  Created by 阿More on 13-7-3.
//  Copyright (c) 2013年 popalm.com. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (PopExtension)

-(BOOL)isJsonStringList;

-(NSString*)fillUpJsonString;

-(NSString*)getListitemStringbyRemoveFilterStr;

//-(BOOL)testGit;


+ (NSString *)stringWithUUIDStr;		//随机id
+ (NSString *)stringWithRandomJpgfile;  //随机jpg文件名
+ (NSString *)stringWithRandomPngfile;  //随机png文件名


- (NSString *)URLEncodingByGB2312;
- (NSString *)URLDecodingByGB2312;

@end
