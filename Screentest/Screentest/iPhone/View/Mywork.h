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
//  UploadBoard.h
//  Screentest
//
//  Created by Apple on 13-7-8.
//    Copyright (c) 2013年 laya. All rights reserved.
//

#import "Bee.h"
#import "Bee_UIFlowBoard.h"

#pragma mark -

@interface UserCell : BeeUIGridCell 
{
    UIImageView * _userimage;
    BeeUILabel *_phonenum;
    UIImageView * _line;
}

@end


@interface MyworkCell : BeeUIGridCell 
{
	BeeUIImageView *	_photo;
    UIImageView * _zan ;//赞的标志
    BeeUILabel * _znum  ;//赞的票数
    BeeUILabel * _introduce;//介绍
    BeeUILabel * _time;//发布时间
    
    BeeUILabel *_timeblackground;
    UIImageView *_head;
    UIImageView *_tail;
    
    UIImageView *_line;
    UIImageView *_brownline;
    
}

@end

#pragma mark -

@interface MyworkBoard : BeeUIFlowBoard 
{
    NSMutableArray *	_datas;
}
@end
