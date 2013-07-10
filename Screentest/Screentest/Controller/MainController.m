//
//  MainController.m
//  Screentest
//
//  Created by Apple on 13-7-10.
//  Copyright (c) 2013年 laya. All rights reserved.
//

#import "MainController.h"
#import "JSONKit.h"
#import "NSString+PopExtension.h"

@implementation MainController

DEF_MESSAGE( APP_LOADDETAIL )

- (void)APP_LOADDETAIL:(BeeMessage *)msg
{
    if ( msg.sending )
	{

		NSNumber * didnum = [msg.input numberAtPath:@"/userdid"];
                
		NSString * baseURL = @"http://news.ngzb.com.cn/channel/2013/gx/sj_personal.php";
		NSString * callURL = [baseURL urlByAppendingArray:[NSArray arrayWithObjects:@"did", didnum,nil]];
        
        
        CC(@"callURL=====%@",callURL);
        
		msg.HTTP_POST( callURL );
	}
	else if ( msg.succeed )
	{
        
        NSString *jsonResStr  = [msg.responseString fillUpJsonString];
        
        NSArray *jsonArray = [jsonResStr objectFromJSONString ];
        NSDictionary * list = [jsonArray objectAtIndex:1];
        
		//NSDictionary * list = [msg.response objectFromJSONData];
		if ( nil == list )
		{
			[msg setLastError];
			return;
		}
        
		NSArray * items = [list arrayAtPath:@"/listitem"];
		if ( nil == items )
		{
			[msg setLastError];
			return;
		}
        
		NSNumber * total =  [NSNumber numberWithInteger:[items count]];
		if ( nil == total )
		{
			[msg setLastError];
			return;
		}
        
		[msg output:@"total", total, @"items", items, nil];
	}
	else if ( msg.failed )
	{
        [msg output:@"total", __INT(0), @"items", [NSArray array], nil];
	}
	else if ( msg.cancelled )
	{
	}
}


@end
