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
//  DetailModel.h
//  Screentest
//
//  Created by Apple on 13-7-10.
//    Copyright (c) 2013年 laya. All rights reserved.
//

#import "Bee_Model.h"
#import "MainController.h"

#define ListItem_id     @"id"
#define ListItem_tu     @"tu"
#define ListItem_tusm   @"tusm"
#define ListItem_tuid   @"tuid"
#define ListItem_tpnum  @"tpnum"
#define ListItem_sj     @"sj"
#define ListItem_dz     @"dz"
#define ListItem_did    @"did"
#define ListItem_tuw    @"tuw"
#define ListItem_tuh    @"tuh"


#pragma mark -

@interface DetailModel : BeeModel

@property (nonatomic, retain) NSNumber *	id;
@property (nonatomic, retain) NSMutableArray *listitems;
@property (nonatomic, retain) NSString *did;
@property (nonatomic, assign) NSInteger		total;

- (void)loadCache;
- (void)saveCache;

- (void)fetchShots;

@end
