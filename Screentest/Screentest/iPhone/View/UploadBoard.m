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
//  UploadBoard.m
//  Screentest
//
//  Created by Apple on 13-7-8.
//    Copyright (c) 2013年 laya. All rights reserved.
//

#import "UploadBoard.h"


@implementation AddressCell

+ (CGSize)sizeInBound:(CGSize)bound forData:(NSObject *)data
{
	NSNumber * height = (NSNumber *)[(NSArray *)data objectAtIndex:0];
	return CGSizeMake( bound.width, height.floatValue );
}

- (void)layoutInBound:(CGSize)bound forCell:(BeeUIGridCell *)cell
{
//	CGRect photoFrame;
//	photoFrame.origin = CGPointMake(2.0f, 1.0f);
//	photoFrame.size.width = bound.width-4;
//	photoFrame.size.height = bound.height-30;
//	[cell subview:@"_photo"].frame = photoFrame;
    
}

- (void)load
{
	[super load];
	
	//self.layer.borderColor = [UIColor blackColor].CGColor;
	//self.layer.borderWidth = 2.0f;
	
    [self initBoard_TextField];
}

- (void)unload
{
	
	[super unload];
}

- (void)dataWillChange
{
	[super dataWillChange];
}

- (void)dataDidChanged
{
}


-(void)initBoard_TextField
{
    //int H = self.viewBound.size.height;
    //int W = self.viewBound.size.width;
    
    province = [[[BeeUITextField alloc]initWithFrame:CGRectMake(2, 2, 150, 25)] autorelease];
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
    [self addSubview:province];
    
    city = [[[BeeUITextField alloc]initWithFrame:CGRectMake(162, 2, 150, 25)] autorelease];
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
    [self addSubview:city];
    
    county = [[[BeeUITextField alloc]initWithFrame:CGRectMake(2, 29, 150, 25)] autorelease];
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
    [self addSubview:county];
    
    address = [[[BeeUITextField alloc]initWithFrame:CGRectMake(162, 29, 150, 25)] autorelease];
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
    [self addSubview:address];
    
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];    //键盘往下收
    return YES;
}

- (void)textFieldDidBeginEditing:(BeeUITextField *)textField
{
//    if (textField == introduce) {
//        CGRect frame = textField.frame;
//        int offset = frame.origin.y +25 - (self.frame.size.height - 216.0);//键盘高度216
//        NSTimeInterval animationDuration = 0.30f;
//        [UIView beginAnimations:@"ResizeForKeyBoard" context:nil];
//        [UIView setAnimationDuration:animationDuration];
//        float width = self.frame.size.width;
//        float height = self.frame.size.height;
//        if(offset > 0)
//        {
//            CGRect rect = CGRectMake(0.0f, -offset,width,height);
//            self.frame = rect;
//        }
//        [UIView commitAnimations];
//    }
}


@end

@implementation UploadCell

+ (CGSize)sizeInBound:(CGSize)bound forData:(NSObject *)data
{
	NSNumber * height = (NSNumber *)[(NSArray *)data objectAtIndex:0];
	return CGSizeMake( bound.width, height.floatValue );
}

- (void)layoutInBound:(CGSize)bound forCell:(BeeUIGridCell *)cell
{
	CGRect photoFrame;
	photoFrame.origin = CGPointMake(2.0f, 1.0f);
	photoFrame.size.width = bound.width-4;
	photoFrame.size.height = bound.height-30;
	[cell subview:@"_photo"].frame = photoFrame;
    
    introduce.frame = CGRectMake(2, bound.height-28, bound.width-5, 25);

}

- (void)load
{
	[super load];
	
	self.layer.borderColor = [UIColor blackColor].CGColor;
	self.layer.borderWidth = 2.0f;
	
	_photo = [[BeeUIImageView alloc] init];
	_photo.layer.borderColor = [UIColor whiteColor].CGColor;
	_photo.layer.borderWidth = 1.0f;
	_photo.contentMode = UIViewContentModeScaleAspectFill;
	_photo.indicator.activityIndicatorViewStyle = UIActivityIndicatorViewStyleGray;
	[_photo makeTappable];
	[self addSubview:_photo];
    
    introduce = [[BeeUITextField alloc]init];
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
    [self addSubview:introduce];
}

- (void)unload
{
	SAFE_RELEASE_SUBVIEW( _photo );
	
	[super unload];
}

- (void)dataWillChange
{
	[super dataWillChange];
}

- (void)dataDidChanged
{
	if ( self.cellData )
	{
		_photo.image = [UIImage imageNamed:(NSString *)[(NSArray *)self.cellData objectAtIndex:1]];
	}
	else
	{
		_photo.image = nil;
	}
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];    //键盘往下收

    if (textField == introduce) {
        
        BeeUIScrollView *scrollview = (BeeUIScrollView *)self.superview;
        [scrollview setContentOffset:CGPointMake(0.0, 0.0) animated:YES];
    }
    
    return YES;
}

- (void)textFieldDidBeginEditing:(BeeUITextField *)textField
{
    if (textField == introduce) {

        BeeUIScrollView *scrollview = (BeeUIScrollView *)self.superview;
        [scrollview setContentOffset:CGPointMake(0, 150) animated:YES];
    }
}

//-(void)scrollFrame:(CGRect)frame offset:(float)heightOffset
//{
//    int offset = frame.origin.y +25 - (self.frame.size.height + heightOffset);//键盘高度216
//    NSTimeInterval animationDuration = 0.30f;
//    
//    [UIView beginAnimations:@"ResizeForKeyBoard" context:nil];
//    [UIView setAnimationDuration:animationDuration];
//    
//    float width = self.frame.size.width;
//    float height = self.frame.size.height;
//    
//    if(offset > 0)
//    {
//        CGRect rect = CGRectMake(0.0f, -offset,width,height);
//        self.superview.frame = rect;
//    }
//    
//    [UIView commitAnimations];
//}


@end



#pragma mark -

@implementation UploadBoard

DEF_SINGLETON( UploadBoard );

- (void)load
{
	[super load];
	
	_datas = [[NSMutableArray alloc] init];
	
    [_datas addObject:[NSArray arrayWithObjects:__INT(200),@"Default.png",nil]];
    [_datas addObject:[NSArray arrayWithObjects:__INT(200),@"Default.png",nil]];
}

- (void)unload
{
	[_datas removeAllObjects];
	[_datas release];
	
	[super unload];
}

- (void)handleUISignal:(BeeUISignal *)signal
{
	[super handleUISignal:signal];
}

- (void)handleUISignal_BeeUIBoard:(BeeUISignal *)signal
{
	[super handleUISignal:signal];
	
	if ( [signal is:BeeUIBoard.CREATE_VIEWS] )
	{
        [self showNavigationBarAnimated:NO];
        [self initBoard];
	}
	else if ( [signal is:BeeUIBoard.DELETE_VIEWS] )
	{
	}
	else if ( [signal is:BeeUIBoard.LOAD_DATAS] )
	{
	}
	else if ( [signal is:BeeUIBoard.WILL_APPEAR] )
	{
		[self.scrollView flashScrollIndicators];
	}
	else if ( [signal is:BeeUIBoard.DID_DISAPPEAR] )
	{
	}
}

#pragma mark -

- (NSInteger)numberOfColumns
{
	return 1;
}

- (NSInteger)numberOfViews
{
	return _datas.count;
}

- (UIView *)viewForIndex:(NSInteger)index scale:(CGFloat)scale
{
    if (index == 0) {
        AddressCell * cell = (AddressCell *)[self dequeueWithContentClass:[AddressCell class]];
        if ( cell )
        {
            cell.cellData = nil;
        }
        return cell;
    }
    else
    {
        NSNumber * data = [_datas objectAtIndex:index];
        UploadCell * cell = (UploadCell *)[self dequeueWithContentClass:[UploadCell class]];
        if ( cell )
        {
            cell.cellData = data;
        }
        return cell;
    }
}

- (CGSize)sizeForIndex:(NSInteger)index
{
    if (index == 0) {
        CGSize cellSize;
        
        cellSize.width = self.viewSize.width-4;
        cellSize.height = 55;
        
        return cellSize;
        
    }
    else
    {
        NSArray * item = (NSArray *)[_datas objectAtIndex:index];
        NSNumber * height = (NSNumber *)[item objectAtIndex:0];
        
        CGSize cellSize;
        cellSize.width = self.viewSize.width-4;
        cellSize.height = height.floatValue+32;
        return cellSize;
    }
}

-(void)initBoard
{
    
    [self initBoard_Title];
    [self initBoard_Bottom];
//    [self initBoard_TextField];
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



@end
