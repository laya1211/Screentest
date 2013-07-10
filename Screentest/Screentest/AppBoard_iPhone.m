//
//   ______    ______    ______    
//  /\  __ \  /\  ___\  /\  ___\   
//  \ \  __<  \ \  __\_ \ \  __\_ 
//   \ \_____\ \ \_____\ \ \_____\ 
//    \/_____/  \/_____/  \/_____/ 
//
//  Powered by BeeFramework
//
//
//  AppBoard_iPhone.m
//  Screentest
//
//  Created by Apple on 13-7-2.
//    Copyright (c) 2013年 laya. All rights reserved.
//

#import "AppBoard_iPhone.h"
#import "Bee_Debug.h"
#import "Bee_Runtime.h"
#import "DetailBoard.h"//00
#import "UploadBoard.h"//0708
#import "Mywork.h"//0709
#import "Lesson6Board.h"

#import "Detail.h"

#import "detail_board.h"//0710

#pragma mark -

@implementation AppBoard_iPhone

DEF_SINGLETON( AppBoard_iPhone )

- (void)load
{
    [super load];
}

- (void)unload
{
    [super unload];
}

#pragma mark Signal

- (void)handleUISignal_BeeUIBoard:(BeeUISignal *)signal
{
    [super handleUISignal:signal];
    
    if ( [signal is:BeeUIBoard.CREATE_VIEWS] )
    {
        //self.view.backgroundColor = [UIColor whiteColor];
        
        detail = [[detail_board board] retain];//00
        
        [self.view addSubview:detail.view];//00

        
//        self.view.backgroundColor = [UIColor colorWithPatternImage: [UIImage imageNamed:@"bg_repeat.9.png"]];
//        
//        //add logo
//        UIImageView *myImage = [[[UIImageView alloc] initWithFrame:CGRectMake(60, 20, 200, 200)] autorelease];
//        [myImage setImage:[UIImage imageNamed:@"welcome_logo.png"]];
//        myImage.opaque = YES; //opaque是否透明
//        [self.view addSubview:myImage];
//        //[myImage release];
//        
//        UILabel *guideLable1 = [[[UILabel alloc] initWithFrame:CGRectMake(10, 220, 300, 15)] autorelease];
//        guideLable1.backgroundColor = [UIColor clearColor];
//        guideLable1.textAlignment = UITextAlignmentCenter;
//        guideLable1.font = [UIFont systemFontOfSize:12];
//        guideLable1.text = [NSString stringWithFormat:@"指导单位：自治区党委宣传部 / 自治区“美丽办”"];
//        [self.view addSubview:guideLable1];
//               
//        UILabel *guideLable12 = [[[UILabel alloc] initWithFrame:CGRectMake(10, 235, 300, 15)] autorelease];
//        guideLable12.backgroundColor = [UIColor clearColor];
//        guideLable12.textAlignment = UITextAlignmentCenter;
//        guideLable12.font = [UIFont systemFontOfSize:12];
//        guideLable12.text = [NSString stringWithFormat:@"/ 自治区互联网信息办"];
//        [self.view addSubview:guideLable12];
//
//        UILabel *organizerLabel = [[[UILabel alloc] initWithFrame:CGRectMake(10, 250, 300, 15)] autorelease];
//        organizerLabel.backgroundColor = [UIColor clearColor];
//        organizerLabel.textAlignment = UITextAlignmentCenter;
//        organizerLabel.font = [UIFont systemFontOfSize:12];
//        organizerLabel.text = [NSString stringWithFormat:@"主办单位：广西日报传媒集团"];
//        [self.view addSubview:organizerLabel];
//        
//        UILabel *undertakeLabel = [[[UILabel alloc] initWithFrame:CGRectMake(10, 265, 300, 15)] autorelease];
//        undertakeLabel.backgroundColor = [UIColor clearColor];
//        undertakeLabel.textAlignment = UITextAlignmentCenter;
//        undertakeLabel.font = [UIFont systemFontOfSize:12];
//        undertakeLabel.text = [NSString stringWithFormat:@"承办单位：南国早报 / 南国早报网"];
//        [self.view addSubview:undertakeLabel];
//        
//        //add enter button
//        UIImageView *enterbutton = [[[UIImageView alloc] initWithFrame:CGRectMake(100, 310, 120, 45)] autorelease];
//        [enterbutton setImage:[UIImage imageNamed:@"enter.png"]];
//        enterbutton.opaque = YES; //opaque是否透明
//        enterbutton.userInteractionEnabled = YES;
//        UITapGestureRecognizer *singleTouch = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(EnterContest:)];
//         [enterbutton addGestureRecognizer:singleTouch];
//        enterbutton.tag = 100;
//        [self.view addSubview:enterbutton];
//           
//        UILabel *inforLabel = [[[UILabel alloc] initWithFrame:CGRectMake(10, 370, 300, 15)] autorelease];
//        inforLabel.backgroundColor = [UIColor clearColor];
//        inforLabel.textAlignment = UITextAlignmentCenter;
//        inforLabel.font = [UIFont systemFontOfSize:14];
//        [inforLabel setTextColor:[UIColor brownColor]];
//        inforLabel.text = [NSString stringWithFormat:@"大赛简介"];
//        [self.view addSubview:inforLabel];
//        
//        UIImageView *divider = [[[UIImageView alloc] initWithFrame:CGRectMake(10, 390, 300, 2)] autorelease];
//        [divider setImage:[UIImage imageNamed:@"divider.png"]];
//        divider.opaque = YES; //opaque是否透明
//        [self.view addSubview:divider];
//        
//        
//        UILabel *infor = [[[UILabel alloc] initWithFrame:CGRectMake(10, 400, 300, 50)] autorelease];
//        infor.backgroundColor = [UIColor clearColor];//消去背景颜色
//        infor.lineBreakMode = UITextAlignmentCenter;//居中
//        infor.font = [UIFont systemFontOfSize:12];//字号设置
//        [infor setTextColor:[UIColor brownColor]];//文字颜色
//        infor.text = [NSString stringWithFormat:@"       大赛于2013年7月至2014年1月展开，征集作品范围：所有反映“美丽广西.清洁乡村”活动开展、做法、变化、成果的摄影作品。"];
//        infor.lineBreakMode = UILineBreakModeWordWrap;//自动换行
//        infor.numberOfLines = 0;
//        [self.view addSubview:infor];

        
    }
    else if ( [signal is:BeeUIBoard.DELETE_VIEWS] )
    {
         SAFE_RELEASE_SUBVIEW(detail.view);//00
    }
    else if ( [signal is:BeeUIBoard.LAYOUT_VIEWS] )
    {
    }
    else if ( [signal is:BeeUIBoard.LOAD_DATAS] )
    {
    }
    else if ( [signal is:BeeUIBoard.FREE_DATAS] )
    {
    }
    else if ( [signal is:BeeUIBoard.WILL_APPEAR] )
    {
    }
    else if ( [signal is:BeeUIBoard.DID_APPEAR] )
    {
    }
    else if ( [signal is:BeeUIBoard.WILL_DISAPPEAR] )
    {
    }
    else if ( [signal is:BeeUIBoard.DID_DISAPPEAR] )
    {
    }
    else if ( [signal is:BeeUIBoard.ORIENTATION_CHANGED] )
    {
    }
    else if ( [signal is:BeeUIBoard.ANIMATION_BEGIN] )
    {
    }
    else if ( [signal is:BeeUIBoard.ANIMATION_FINISH] )
    {
    }
    else if ( [signal is:BeeUIBoard.MODALVIEW_WILL_SHOW] )
    {
    }
    else if ( [signal is:BeeUIBoard.MODALVIEW_DID_SHOWN] )
    {
    }
    else if ( [signal is:BeeUIBoard.MODALVIEW_WILL_HIDE] )
    {
    }
    else if ( [signal is:BeeUIBoard.MODALVIEW_DID_HIDDEN] )
    {
    }
    else if ( [signal is:BeeUIBoard.POPOVER_WILL_PRESENT] )
    {
    }
    else if ( [signal is:BeeUIBoard.POPOVER_DID_PRESENT] )
    {
    }
    else if ( [signal is:BeeUIBoard.POPOVER_WILL_DISMISS] )
    {
    }
    else if ( [signal is:BeeUIBoard.POPOVER_DID_DISMISSED] )
    {
    }
}

- (void)handleUISignal_UINavigationBar:(BeeUISignal *)signal
{
    if ( [signal is:UINavigationBar.BARBUTTON_LEFT_TOUCHED] )
    {
        // TODO
    }
    else if ( [signal is:UINavigationBar.BARBUTTON_RIGHT_TOUCHED] )
    {
        // TODO
    }
}

#pragma mark Notification

- (void)handleNotification:(NSNotification *)notification
{
    [super handleNotification:notification];
}

#pragma mark Message

- (void)handleMessage:(BeeMessage *)msg
{
    [super handleMessage:msg];
}

#pragma mark Enter the contest

-(void)EnterContest:(id)sender{
    
    BeeUIBoard * board = [[(BeeUIBoard *)[BeeRuntime allocByClassName:@"DetailBoard"] init] autorelease];
    NSLog(@"board===%@",board);
    
	if ( board )
	{
        //[self.stack pushBoard:board animated:YES];
        [self presentViewController:board animated:YES completion:nil];
        NSLog(@"jump!!");
	}
    
}

@end
