//
//  DetailBoard.h
//  Screentest
//
//  Created by Apple on 13-7-6.
//  Copyright (c) 2013年 laya. All rights reserved.
//

#import "Bee_UIBoard.h"
#import "Bee.h"

@interface DetailBoard : BeeUIBoard <UITextFieldDelegate>
{
    BeeUIScrollView *scroll;
    
    BeeUITextField *province;//省/区
    BeeUITextField *city;//市
    BeeUITextField *county;//县/镇
    BeeUITextField *address;//地址
    BeeUITextField *introduce;//说点什么
}
@end
