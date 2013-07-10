//
//  DribbbleBoard.h
//

#import "Bee.h"
#import "Bee_UIFlowBoard.h"

#pragma mark -

@interface Lesson6Cell : BeeUIGridCell
{
	BeeUIImageView *	_photo;
    BeeUILabel *	_background;
   
 //   UIImageView * _boutton;
    UIImageView *	_zan;
    
	BeeUILabel *		_address;
	BeeUILabel *		_znum;
}


@end

#pragma mark -

@interface Lesson6Board : BeeUIFlowBoard
{
	NSMutableArray *	_datas;
}


@end
