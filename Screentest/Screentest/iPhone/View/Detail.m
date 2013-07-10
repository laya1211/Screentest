//
//  Detail.m
//  Screentest
//
//  Created by Apple on 13-7-9.
//  Copyright (c) 2013年 laya. All rights reserved.
//

#import "Detail.h"

@interface Detail ()

@end

@implementation Detail

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    
    [self initBoard_Title];
    
    _datas = [[NSMutableArray alloc]init];
    
     _datas = [NSArray arrayWithObjects: @"http://news.ngzb.com.cn//channel//2013//gx//pic//2013-07//1_20130708121241_x.jpg",@"有一个人，他很爱打电话，有一天，他挂了。哈哈哈哈哈哈哈！！！！！！！！！",@"南宁市大学东路188号",@" 07/09  22:17",@"23",nil];
    
    NSLog(@"datas====%@",_datas);
    
    [self displayinfor:_datas];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)initBoard_Title
{
    
    UIImageView *titleImage = [[[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 320, 45)] autorelease];
    [titleImage setImage:[UIImage imageNamed:@"title_bar.png"]];
    titleImage.opaque = YES; //opaque是否透明
    [self.view addSubview:titleImage];
    
    UILabel *inforLabel = [[[UILabel alloc] initWithFrame:CGRectMake(15, 12, 300, 20)] autorelease];
    inforLabel.backgroundColor = [UIColor clearColor];
    inforLabel.textAlignment = UITextAlignmentCenter;
    inforLabel.font=[UIFont systemFontOfSize:19];
    [inforLabel setTextColor:[UIColor whiteColor]];
    inforLabel.text = [NSString stringWithFormat:@"作品欣赏"];
    [self.view addSubview:inforLabel];
    
}

-(void)displayinfor:(NSArray *)data
{
    CGSize bound = self.viewFrame.size;
    
    _photo = [[[BeeUIImageView alloc]initWithFrame:CGRectMake(10, 45, 300, 300)] autorelease];
    
    
    _photo.url = (NSString *)[(NSArray *)data objectAtIndex:0];
    
    NSLog(@"_photourl====%@",_photo.url);
    
    _photo.contentMode = UIViewContentModeScaleAspectFill;
    _photo.indicator.activityIndicatorViewStyle = UIActivityIndicatorViewStyleGray;
	[_photo makeTappable];
    [self.view addSubview:_photo];
    
    _introduce = [[[BeeUILabel alloc] initWithFrame:CGRectMake(15, 360, 290, 50)] autorelease];
    _introduce.backgroundColor = [UIColor clearColor];
    _introduce.textAlignment = UITextAlignmentLeft;
    _introduce.font = [UIFont systemFontOfSize:12];
    [_introduce setTextColor:[UIColor brownColor]];
    _introduce.text = (NSString *)[(NSArray *)data objectAtIndex:1];
    _introduce.lineBreakMode = UILineBreakModeWordWrap;//自动换行
    _introduce.numberOfLines = 0;
    [self.view addSubview:_introduce];
    
    _address = [[[BeeUILabel alloc] initWithFrame:CGRectMake(0, 60, 150, 20)] autorelease];
    _address.backgroundColor = [UIColor clearColor];
    _address.textAlignment = UITextAlignmentLeft;
    _address.font = [UIFont systemFontOfSize:15];
    [_address setTextColor:[UIColor grayColor]];
    _address.text = (NSString *)[(NSArray *)data objectAtIndex:2];
    [_introduce addSubview:_address];
    
    _time = [[[BeeUILabel alloc] initWithFrame:CGRectMake(220, 40, 75, 20)] autorelease];
    _time.backgroundColor = [UIColor clearColor];
    _time.textAlignment = UITextAlignmentRight;
    _time.font = [UIFont systemFontOfSize:15];
    [_time setTextColor:[UIColor grayColor]];
    _time.text = (NSString *)[(NSArray *)data objectAtIndex:3];
    [_introduce addSubview:_time];
    
    _zan = [[[BeeUIImageView alloc]initWithFrame:CGRectMake(15, bound.height-45, 15, 15)] autorelease];
    [_zan setImage:[UIImage imageNamed:@"heart_icon.png"]];
    [self.view addSubview:_zan];
    
    _znum = [[[BeeUILabel alloc] initWithFrame:CGRectMake(32, 0, 20, 15)] autorelease];
    _znum.backgroundColor = [UIColor clearColor];
    _znum.textAlignment = UITextAlignmentRight;
    _znum.font = [UIFont systemFontOfSize:15];
    [_znum setTextColor:[UIColor redColor]];
    _znum.text = (NSString *)[(NSArray *)data objectAtIndex:4];
    [_zan addSubview:_znum];
    
    _ZanBoutton = [[[BeeUIButton alloc]initWithFrame:CGRectMake(225, bound.height-45, 80, 40)] autorelease];
    _ZanBoutton.opaque = YES; //opaque是否透明
    [_ZanBoutton setTitle:@"赞一个" forState:UIControlStateNormal];
    _ZanBoutton.titleLabel.font = [UIFont  systemFontOfSize:15];
    _ZanBoutton.tintColor = [UIColor redColor];
    [_ZanBoutton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [_ZanBoutton addTarget:self action:@selector(Zan_Pic) forControlEvents:UIControlEventTouchUpInside];
    _ZanBoutton.showsTouchWhenHighlighted = YES;
    [self.view addSubview:_ZanBoutton];
    
}

-(void)Zan_Pic
{
    [self presentMessageTips:@"赞！成功！"];
}

@end
