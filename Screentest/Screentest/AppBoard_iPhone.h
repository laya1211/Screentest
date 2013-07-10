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
//  AppBoard_iPhone.h
//  Screentest
//
//  Created by Apple on 13-7-2.
//    Copyright (c) 2013年 laya. All rights reserved.
//

#import "Bee.h"

@interface AppBoard_iPhone : BeeUIBoard
{
    //BeeUIBoard *detailBoard;//00
    //BeeUIBoard *uploadBoard;//0708
    //BeeUIBoard *mywork;//0709
    //BeeUIBoard *lesson;
    //BeeUIBoard *detail;//070922
    BeeUIBoard *detail;//0710
}

AS_SINGLETON( AppBoard_iPhone )

-(void)EnterContest:(id)sender;

@end
