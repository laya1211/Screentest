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

@interface AddressCell : BeeUIGridCell <UITextFieldDelegate>
{
	BeeUITextField *  province;//省/区
    BeeUITextField *  city;//市
    BeeUITextField *  county;//县/镇
    BeeUITextField *  address;//地址
}


@end


@interface UploadCell : BeeUIGridCell <UITextFieldDelegate>
{
	BeeUIImageView *	_photo;
    BeeUITextField *  introduce;//说点什么
}


@end

#pragma mark -

@interface UploadBoard : BeeUIFlowBoard <UITextFieldDelegate>
{
	BeeUITextField *  province;//省/区
    BeeUITextField *  city;//市
    BeeUITextField *  county;//县/镇
    BeeUITextField *  address;//地址
    NSMutableArray *	_datas;
}

@end
