//
//  DetailBoard.m
//  Screentest
//
//  Created by Apple on 13-7-6.
//  Copyright (c) 2013年 laya. All rights reserved.
//

#import "DetailBoard.h"
#import "Bee.h"

@interface DetailBoard ()

@end

@implementation DetailBoard

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
    self.view.backgroundColor = [UIColor whiteColor];
    [self initBoard];

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)initBoard
{
    [self initBoard_Title];
    [self addScrollView];
    [self initBoard_Bottom];
    [self initBoard_TextField];
}

-(void)addScrollView
{
    CGSize bound = self.view.frame.size;
    
    scroll = [[[BeeUIScrollView alloc]initWithFrame:CGRectMake(2, 101,bound.width-4, bound.height-173)] autorelease];//滚动视图
    scroll.layer.borderColor = [[UIColor grayColor]CGColor];//后期可以去掉边框颜色，这里只是为了测试
    scroll.layer.borderWidth = 1.0f;
    //scroll.contentSize = CGSizeMake(320, 600);//可滚动范围
    
    [self.view addSubview:scroll];
    
    introduce = [[[BeeUITextField alloc]initWithFrame:CGRectMake(10, scroll.contentSize.height-30, 300, 25)] autorelease];
    [introduce.layer setMasksToBounds:YES];//边框可见
    [introduce.layer setCornerRadius:7];//边框圆角
    [introduce.layer setBorderWidth:1];//边框线的宽
    [introduce.layer setBorderColor:[[UIColor blackColor] CGColor]];//边框颜色
    introduce.layer.shadowColor = [UIColor blackColor].CGColor;//阴影颜色
    introduce.layer.shadowOffset = CGSizeMake(1, 1);
    introduce.layer.shadowOpacity = 0.5;//透明度
    introduce.layer.shadowRadius = 0;
    introduce.placeholder = @" 说点什么";//提示文字
    [introduce setFont:[UIFont systemFontOfSize:16]];
    introduce.delegate=self;
    [self textFieldShouldReturn:introduce];//键盘收起
    introduce.keyboardAppearance = UIKeyboardAppearanceAlert;//键盘颜色：深灰/石墨色 半透明
    
    [scroll addSubview:introduce];

}

-(void)initBoard_Title
{
        
    UIImageView *titleImage = [[[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 320, 45)] autorelease];
    [titleImage setImage:[UIImage imageNamed:@"title_bar.png"]];
    titleImage.opaque = YES; //opaque是否透明
    [self.view addSubview:titleImage];
    
    UILabel *inforLabel = [[[UILabel alloc] initWithFrame:CGRectMake(10, 15, 100, 20)] autorelease];
    inforLabel.backgroundColor = [UIColor clearColor];
    inforLabel.textAlignment = UITextAlignmentCenter;
    inforLabel.font=[UIFont systemFontOfSize:19];
    [inforLabel setTextColor:[UIColor whiteColor]];
    inforLabel.text = [NSString stringWithFormat:@"上传图片"];
    [titleImage addSubview:inforLabel];
    
    UILabel *localLabel = [[[UILabel alloc] initWithFrame:CGRectMake(240, 28, 80, 15)] autorelease];
    localLabel.backgroundColor = [UIColor clearColor];
    localLabel.textAlignment = UITextAlignmentCenter;
    localLabel.font=[UIFont systemFontOfSize:12];
    [localLabel setTextColor:[UIColor whiteColor]];
    localLabel.text = [NSString stringWithFormat:@"当前位置*"];
    [titleImage addSubview:localLabel];
    
}


-(void)initBoard_Bottom
{
    int H = self.viewBound.size.height;
    int W = self.viewBound.size.width;
    
    UIImageView *bottomImage = [[[UIImageView alloc] initWithFrame:CGRectMake(0, H-50, 320, 50)] autorelease];
    [bottomImage setImage:[UIImage imageNamed:@"bottom_bar_bg.png"]];
    bottomImage.opaque = YES; //opaque是否透明
    [self.view addSubview:bottomImage];
    
    UIImageView *lineImage = [[[UIImageView alloc] initWithFrame:CGRectMake(W/2, H-50, 1, 50)] autorelease];
    [lineImage setImage:[UIImage imageNamed:@"line.png"]];
    lineImage.opaque = YES; //opaque是否透明
    [self.view addSubview:lineImage];
        
    BeeUIButton *continuebutton = [[[BeeUIButton alloc] initWithFrame:CGRectMake(0, H-40, W/2, 30)] autorelease];
    continuebutton.backgroundColor = [UIColor clearColor];
    continuebutton.title = @"继续添加";
    [continuebutton setTitleFont: [UIFont systemFontOfSize:16]];
    [continuebutton setTitleColor: [UIColor whiteColor]];
    [continuebutton addTarget:self action:@selector(go_on) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:continuebutton];

    BeeUIButton *uploadbutton = [[[BeeUIButton alloc] initWithFrame:CGRectMake(W/2, H-40, W/2, 30)] autorelease];
    uploadbutton.backgroundColor = [UIColor clearColor];
    uploadbutton.title = @"发布";
    [uploadbutton setTitleFont: [UIFont systemFontOfSize:16]];
    [uploadbutton setTitleColor: [UIColor whiteColor]];
    [uploadbutton addTarget:self action:@selector(upload) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:uploadbutton];
    
}

-(void)initBoard_TextField
{
    //int H = self.viewBound.size.height;
    //int W = self.viewBound.size.width;

    province = [[[BeeUITextField alloc]initWithFrame:CGRectMake(2, 47, 150, 25)] autorelease];
    [province.layer setMasksToBounds:YES];//边框可见
    [province.layer setCornerRadius:7];//边框圆角
    [province.layer setBorderWidth:1];//边框线的宽
    [province.layer setBorderColor:[[UIColor blackColor] CGColor]];//边框颜色
    province.layer.shadowColor = [UIColor blackColor].CGColor;//阴影颜色
    province.layer.shadowOffset = CGSizeMake(1, 1);
    province.layer.shadowOpacity = 0.5;//透明度
    province.layer.shadowRadius = 0;
    province.placeholder = @" 省/区";//提示文字
    [province setFont:[UIFont systemFontOfSize:16]];
    province.delegate=self;
    [self textFieldShouldReturn:province];//键盘收起
    province.keyboardAppearance = UIKeyboardAppearanceAlert;//键盘颜色：深灰/石墨色 半透明
    [self.view addSubview:province];
    
     city = [[[BeeUITextField alloc]initWithFrame:CGRectMake(162, 47, 150, 25)] autorelease];
    [city.layer setMasksToBounds:YES];//边框可见
    [city.layer setCornerRadius:7];//边框圆角
    [city.layer setBorderWidth:1];//边框线的宽
    [city.layer setBorderColor:[[UIColor blackColor] CGColor]];//边框颜色
    city.layer.shadowColor = [UIColor blackColor].CGColor;//阴影颜色
    city.layer.shadowOffset = CGSizeMake(1, 1);
    city.layer.shadowOpacity = 0.5;//透明度
    city.layer.shadowRadius = 0;
    city.placeholder = @" 市";//提示文字
    [city setFont:[UIFont systemFontOfSize:16]];
    city.delegate=self;
    [self textFieldShouldReturn:city];//键盘收起
    city.keyboardAppearance = UIKeyboardAppearanceAlert;//键盘颜色：深灰/石墨色 半透明
    [self.view addSubview:city];
    
    county = [[[BeeUITextField alloc]initWithFrame:CGRectMake(2, 74, 150, 25)] autorelease];
    [county.layer setMasksToBounds:YES];//边框可见
    [county.layer setCornerRadius:7];//边框圆角
    [county.layer setBorderWidth:1];//边框线的宽
    [county.layer setBorderColor:[[UIColor blackColor] CGColor]];//边框颜色
    county.layer.shadowColor = [UIColor blackColor].CGColor;//阴影颜色
    county.layer.shadowOffset = CGSizeMake(1, 1);
    county.layer.shadowOpacity = 0.5;//透明度
    county.layer.shadowRadius = 0;
    county.placeholder = @" 县/镇";//提示文字
    [county setFont:[UIFont systemFontOfSize:16]];
    county.delegate=self;
    [self textFieldShouldReturn:county];//键盘收起
    county.keyboardAppearance = UIKeyboardAppearanceAlert;//键盘颜色：深灰/石墨色 半透明
    [self.view addSubview:county];

    address = [[[BeeUITextField alloc]initWithFrame:CGRectMake(162, 74, 150, 25)] autorelease];
    [address.layer setMasksToBounds:YES];//边框可见
    [address.layer setCornerRadius:7];//边框圆角
    [address.layer setBorderWidth:1];//边框线的宽
    [address.layer setBorderColor:[[UIColor blackColor] CGColor]];//边框颜色
    address.layer.shadowColor = [UIColor blackColor].CGColor;//阴影颜色
    address.layer.shadowOffset = CGSizeMake(1, 1);
    address.layer.shadowOpacity = 0.5;//透明度
    address.layer.shadowRadius = 0;
    address.placeholder = @" 地址";//提示文字
    [address setFont:[UIFont systemFontOfSize:16]];
    address.delegate=self;
    [self textFieldShouldReturn:address];//键盘收起
    address.keyboardAppearance = UIKeyboardAppearanceAlert;//键盘颜色：深灰/石墨色 半透明
    [self.view addSubview:address];

}

-(void)go_on
{
    [self presentMessageTips:@"继续添加"];
}

-(void)upload
{
    [self presentMessageTips:@"上传"];
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];    //键盘往下收
    return YES;
}

//- (void)keyboardWillShow:(NSNotification *)noti
//{
//    //键盘输入的界面调整
//    //键盘的高度
//    float height = 216.0;
//    CGRect frame = self.view.frame;
//    frame.size = CGSizeMake(frame.size.width, frame.size.height - height);
//    [UIView beginAnimations:@"Curl"context:nil];//动画开始
//    [UIView setAnimationDuration:0.30];
//    [UIView setAnimationDelegate:self];
//    [self.view setFrame:frame];
//    [UIView commitAnimations];
//}
//
- (void)textFieldDidBeginEditing:(UITextField *)textField
{
    if (textField == introduce) {
        CGRect frame = textField.frame;
        int offset = frame.origin.y +25 - (self.view.frame.size.height - 216.0);//键盘高度216
        NSTimeInterval animationDuration = 0.30f;
        [UIView beginAnimations:@"ResizeForKeyBoard" context:nil];
        [UIView setAnimationDuration:animationDuration];
        float width = self.view.frame.size.width;
        float height = self.view.frame.size.height;
        if(offset > 0)
        {
            CGRect rect = CGRectMake(0.0f, -offset,width,height);
            self.view.frame = rect;
        }
        [UIView commitAnimations];
    }
}


@end
