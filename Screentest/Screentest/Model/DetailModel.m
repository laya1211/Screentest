//
//	 ______    ______    ______    
//	/\  __ \  /\  ___\  /\  ___\   
//	\ \  __<  \ \  __\_ \ \  __\_ 
//	 \ \_____\ \ \_____\ \ \_____\ 
//	  \/_____/  \/_____/  \/_____/ 
//
//	Powered by BeeFramework
//
//
//  DetailModel.m
//  Screentest
//
//  Created by Apple on 13-7-10.
//    Copyright (c) 2013年 laya. All rights reserved.
//

#import "DetailModel.h"
#import "UIDevice+PopExtension.h"

#pragma mark -

@interface DetailModel(Private)
- (void)asyncSaveCache;
- (void)addShot:(NSObject *)shot;
- (void)addShots:(NSArray *)shots;
- (void)removeShost:(NSObject *)shot;
- (void)removeShosts:(NSArray *)shots;
- (void)removeAllShots;
@end

@implementation DetailModel


DEF_SINGLETON( DetailModel )

- (void)load
{
	[super load];
    
    self.did = [[UIDevice currentDevice] uniqueDeviceIdentifier];
    _total = 0;
	_listitems = [[NSMutableArray alloc] init];

    
}

- (void)unload
{
	[NSObject cancelPreviousPerformRequestsWithTarget:self];
    
	_total = 0;
	
	[_listitems removeAllObjects];
	[_listitems release];
	_listitems = nil;
	
	
	[super unload];
}


- (void)loadCache
{
	[NSObject cancelPreviousPerformRequestsWithTarget:self];
    
	NSDictionary * dict = (NSDictionary *)[[BeeFileCache sharedInstance] objectForKey:self.name];
	if ( dict )
	{
		_total = [[dict numberAtPath:@"total" otherwise:__INT(0)] intValue];
        
		[_listitems removeAllObjects];
		[_listitems addObjectsFromArray:[dict arrayAtPath:@"items" otherwise:[NSArray array]]];
	}
}

- (void)saveCache
{
	[NSObject cancelPreviousPerformRequestsWithTarget:self];
	[self performSelector:@selector(asyncSaveCache) withObject:nil afterDelay:0.1f];
}

- (void)asyncSaveCache
{
	NSDictionary * dict = [NSDictionary dictionaryWithObjectsAndKeys:__INT(_total), @"total", _listitems, @"items", nil];
	[[BeeFileCache sharedInstance] saveObject:dict forKey:self.name];
}

- (void)addShot:(NSObject *)shot
{
	[self addShots:[NSArray arrayWithObject:shot]];
}

- (void)addShots:(NSArray *)itemArray
{
	// TODO: 排重
    
    NSMutableArray *_datas = [[NSMutableArray alloc] init];
    
    for (int i=0; i<itemArray.count; ++i)
    {
                
        [_datas addObject:[NSArray arrayWithObjects:__INT(100), [itemArray objectAtIndex:i] ,nil]];
        [_datas addObject:[NSArray arrayWithObjects:__INT(80),  [itemArray objectAtIndex:++i] ,nil]];
        [_datas addObject:[NSArray arrayWithObjects:__INT(120), [itemArray objectAtIndex:++i] ,nil]];
        [_datas addObject:[NSArray arrayWithObjects:__INT(100), [itemArray objectAtIndex:++i] ,nil]];
        
    }
    
	[_listitems addObjectsFromArray:_datas];
    
    [_datas release];
    
    
    //	[_listitems sortUsingComparator:^(NSDictionary * value1, NSDictionary * value2){
    //		NSString * date1 = [value1 stringAtPath:@"/sj"];
    //		NSString * date2 = [value2 stringAtPath:@"/sj"];
    //		return [date1 compare:date2];
    //	}];
    
	[self saveCache];
}

- (void)removeShost:(NSObject *)shot
{
	[self removeShosts:[NSArray arrayWithObject:shot]];
}

- (void)removeShosts:(NSArray *)shots
{
	[_listitems removeObjectsInArray:shots];
    //	[_listitems sortUsingComparator:^(NSDictionary * feed1, NSDictionary * feed2){
    //		NSString * date1 = [feed1 stringAtPath:@"/sj"];
    //		NSString * date2 = [feed2 stringAtPath:@"/sj"];
    //		return [date1 compare:date2];
    //	}];
    
	[self saveCache];
}

- (void)removeAllShots
{
	[_listitems removeAllObjects];
	[self saveCache];
}

- (void)fetchShots
{
	[[self sendMessage:MainController.APP_LOADDETAIL timeoutSeconds:30.0f] input:
    @"userdid", __INT(self.did),
	 nil];
}

- (void)handleMessage:(BeeMessage *)msg
{
	[super handleMessage:msg];
}

- (void)handleAppController:(BeeMessage *)msg
{
	[super handleMessage:msg];
    
	if ( [msg is:MainController.APP_LOADDETAIL] )
	{
		if ( msg.succeed )
		{
//			NSNumber * page = [msg.input numberAtPath:@"/userdid" otherwise:self.did];
//			if ( 0 == [page intValue] )
//			{
//				[self removeAllShots];
//			}
			
			[self setTotal:[msg.output numberAtPath:@"/total"].intValue];
			[self addShots:[msg.output arrayAtPath:@"/items"]];
		}
	}
}


@end
