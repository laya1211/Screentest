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
//  detail_board.h
//  Screentest
//
//  Created by Apple on 13-7-10.
//  Copyright (c) 2013年 laya. All rights reserved.
//

#import "Bee.h"
#import "Bee_UIFlowBoard.h"
#import "DetailModel.h"


#pragma mark -
@interface detailCell : BeeUIGridCell
{
	BeeUIImageView * _photo;
    UIImageView *_zan;
    
    BeeUILabel * _introduce;
    BeeUILabel * _address;
    BeeUILabel * _time;
    BeeUILabel * _znum;
    
    UIButton *_ZanBoutton;

}

@end

@interface detail_board : BeeUIFlowBoard<UIImagePickerControllerDelegate,UINavigationControllerDelegate>

{

    NSMutableArray  *	_datas;
    DetailModel * _detailModel;
}
@end
