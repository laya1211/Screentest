//
//  Detail.h
//  Screentest
//
//  Created by Apple on 13-7-9.
//  Copyright (c) 2013年 laya. All rights reserved.
//

#import "Bee_UIBoard.h"
#import "Bee.h"

@interface Detail : BeeUIBoard
{
    NSMutableArray *_datas;
    BeeUIImageView * _photo;
    UIImageView *_zan;
    BeeUILabel * _introduce;
    BeeUILabel * _address;
    BeeUILabel * _time;
    BeeUILabel * _znum;
    
    BeeUIButton *_ZanBoutton;
}

@end
