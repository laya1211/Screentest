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

#import "Mywork.h"
#import "JSONKit.h"
#import "NSString+PopExtension.h"

#import <MobileCoreServices/UTCoreTypes.h>



@implementation UserCell

+ (CGSize)sizeInBound:(CGSize)bound forData:(NSObject *)data
{
	NSNumber * height = (NSNumber *)[(NSArray *)data objectAtIndex:0];
	return CGSizeMake( bound.width, height.floatValue );
}

- (void)layoutInBound:(CGSize)bound forCell:(BeeUIGridCell *)cell
{

    _userimage.frame = CGRectMake(10, 6, 30 , 30);
    _phonenum.frame = CGRectMake(45, 4, 100, 30);
    _line.frame = CGRectMake(1, 43, 318, 1);
}

- (void)load
{
	[super load];
    
    _phonenum = [[BeeUILabel alloc] init];
	_phonenum.textAlignment = UITextAlignmentLeft;
    _phonenum.backgroundColor = [UIColor clearColor];
	_phonenum.textColor = [UIColor brownColor];
	_phonenum.font = [UIFont systemFontOfSize:15.0f];
	[self addSubview:_phonenum];

    _userimage = [[UIImageView alloc] init];
    _userimage.Image = [UIImage imageNamed:@"user_pic.png"];
    _userimage.opaque = YES;
	[self addSubview:_userimage];
    
    _line = [[UIImageView alloc] init];
    _line.Image = [UIImage imageNamed:@"divider.png"];
    _line.opaque = YES;
	[self addSubview:_line];


}

- (void)unload
{
	
	SAFE_RELEASE_SUBVIEW( _phonenum );
    SAFE_RELEASE_SUBVIEW( _userimage );
    SAFE_RELEASE_SUBVIEW( _line );
    
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
        _phonenum.text = (NSString *)[(NSArray *)self.cellData objectAtIndex:5];
        
	}
	else
	{
        _phonenum.text = nil;
    }

}


@end

@implementation MyworkCell

+ (CGSize)sizeInBound:(CGSize)bound forData:(NSObject *)data
{
	NSNumber * height = (NSNumber *)[(NSArray *)data objectAtIndex:0];
	return CGSizeMake( bound.width, height.floatValue );
}

- (void)layoutInBound:(CGSize)bound forCell:(BeeUIGridCell *)cell
{

    _line.frame = CGRectMake(10, 0, 15, bound.height);
    
    _head.frame = CGRectMake(30 , 8, 20, 20.5);
    _timeblackground.frame = CGRectMake(50 , 8, 80, 20);
        
    _time.frame = CGRectMake(40 , 8, 90, 20);
    _photo.frame = CGRectMake(40 , 43, 75, bound.height-70);
    _zan.frame = CGRectMake(127 , 45, 12, 12);
    _znum.frame = CGRectMake(144, 45, 15, 12);
    _introduce.frame = CGRectMake(130 , 55, 175, 50);
    
}

- (void)load
{
	[super load];
	
    _photo = [[BeeUIImageView alloc] init];
	_photo.contentMode = UIViewContentModeScaleAspectFill;
	_photo.indicator.activityIndicatorViewStyle = UIActivityIndicatorViewStyleGray;
	[_photo makeTappable];
	[self addSubview:_photo];
    
    _line = [[UIImageView alloc] init];
    _line.image = [UIImage imageNamed:@"line_byme.png"];
    _line.opaque = YES;
	[self addSubview:_line];

    _head = [[UIImageView alloc] init];
    _head.Image = [UIImage imageNamed:@"head.png"];
    _head.opaque = YES;
	[self addSubview:_head];
    
    _timeblackground = [[BeeUILabel alloc] init];
    _timeblackground.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"work_back.png"]];
    [self addSubview:_timeblackground];
    
    _zan = [[UIImageView alloc] init];
    _zan.Image = [UIImage imageNamed:@"heart_icon.png"];
    _zan.opaque = YES;
	[self addSubview:_zan];

    
    _time = [[BeeUILabel alloc] init];
    _time.textAlignment = UITextAlignmentCenter;
    _time.backgroundColor = [UIColor clearColor];
    _time.textColor = [UIColor whiteColor];
    _time.font = [UIFont systemFontOfSize:14.0f];
    [self addSubview:_time];
    
    
    _znum = [[BeeUILabel alloc] init];
	_znum.textAlignment = UITextAlignmentLeft;
    _znum.backgroundColor = [UIColor clearColor];
	_znum.textColor = [UIColor redColor];
	_znum.font = [UIFont systemFontOfSize:12.0f];
	[self addSubview:_znum];
    
    _introduce = [[BeeUILabel alloc] init];
	_introduce.textAlignment = UITextAlignmentLeft;
    _introduce.backgroundColor = [UIColor clearColor];
	_introduce.textColor = [UIColor blackColor];
	_introduce.font = [UIFont systemFontOfSize:12.0f];
    _introduce.lineBreakMode = UILineBreakModeWordWrap;//自动换行
    _introduce.numberOfLines = 0;

	[self addSubview:_introduce];

    
}

- (void)unload
{
	SAFE_RELEASE_SUBVIEW( _line );
    SAFE_RELEASE_SUBVIEW( _head );
    SAFE_RELEASE_SUBVIEW( _timeblackground );
    SAFE_RELEASE_SUBVIEW( _photo );
    SAFE_RELEASE_SUBVIEW( _zan);
    SAFE_RELEASE_SUBVIEW( _znum );
    SAFE_RELEASE_SUBVIEW( _time );
    SAFE_RELEASE_SUBVIEW( _introduce );
	
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
        _photo.url = (NSString *)[(NSArray *)self.cellData objectAtIndex:1];
        _time.text = (NSString *)[(NSArray *)self.cellData objectAtIndex:2];
        _znum.text = (NSString *)[(NSArray *)self.cellData objectAtIndex:3];
        _introduce.text = (NSString *)[(NSArray *)self.cellData objectAtIndex:4];
//        
//        NSString *cnText = (NSString *)[(NSArray *)self.cellData objectAtIndex:4];
//        NSStringEncoding enc1 = CFStringConvertEncodingToNSStringEncoding(kCFStringEncodingGB_18030_2000);
//        NSString *deText=[cnText stringByReplacingPercentEscapesUsingEncoding:enc1];
//        
//        _introduce.text = deText;
//
       
	}
	else
	{
        
		_photo.image = nil;
        _time.text = nil;
        _znum.text = nil;
        _introduce.text = nil;
	}
}

@end



#pragma mark -

@implementation MyworkBoard

DEF_SINGLETON( MyworkBoard );

- (void)load
{
	[super load];
    self.view.backgroundColor = [UIColor colorWithPatternImage: [UIImage imageNamed:@"mywork_background.png"]];

	_datas = [[NSMutableArray alloc] init];
    
    /* 此处数据库-—_datas[图片高度，图片地址，时间，赞的票数，介绍，电话号码]*/
	
    [_datas addObject:[NSArray arrayWithObjects:__INT(65),@"http://news.ngzb.com.cn//channel//2013//gx//pic//2013-07//201307892722_x.jpg",@"7/9  11:30",@"5",@"美丽广西，清洁乡村！",@"12345678998",nil]];
    [_datas addObject:[NSArray arrayWithObjects:__INT(65),@"http://news.ngzb.com.cn//channel//2013//gx//pic//2013-07//201307892722_x.jpg",@"7/9  11:30",@"5",@"xxxxxsdhfewjsdfdsjsabfdakkbddsajshda美丽广西，清洁乡村！",@"12345678998",nil]];
    [_datas addObject:[NSArray arrayWithObjects:__INT(80),@"http://news.ngzb.com.cn//channel//2013//gx//pic//2013-07//201307892722_x.jpg",@"7/9  11:30",@"5",@"xxxxxsdhfewjsdfdsjsabfdakkbddsajshda美丽广西，清洁乡村！",@"12345678998",nil]];

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
    NSArray *data =[_datas objectAtIndex:index];
    if (index == 0) {
        UserCell * cell = (UserCell *)[self dequeueWithContentClass:[UserCell class]];
        if ( cell )
        {
            cell.cellData = data;
        }
        return cell;
    }
    else
    {
        //NSArray * data = [_datas objectAtIndex:index];
        MyworkCell * cell = (MyworkCell *)[self dequeueWithContentClass:[MyworkCell class]];
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
        
        cellSize.width = self.viewSize.width;
        cellSize.height = 50;
        
        return cellSize;
        
    }
    else
    {
        NSArray * item = (NSArray *)[_datas objectAtIndex:index];
        NSNumber * height = (NSNumber *)[item objectAtIndex:0];
        
        CGSize cellSize;
        cellSize.width = self.viewSize.width;
        cellSize.height = height.floatValue+70;
        return cellSize;
    }
}

-(void)initBoard
{
    
    [self initBoard_Title];
    [self initBoard_BottomMenu];

}


-(void)initBoard_Title
{
    UIImageView *titleImage = [[[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 320, 45)] autorelease];
    [titleImage setImage:[UIImage imageNamed:@"title_bar.png"]];
    titleImage.opaque = YES; //opaque是否透明
    [self.view addSubview:titleImage];
    
    UILabel *inforLabel = [[[UILabel alloc] initWithFrame:CGRectMake(10, 12, 300, 20)] autorelease];
    inforLabel.backgroundColor = [UIColor clearColor];
    inforLabel.textAlignment = UITextAlignmentCenter;
    inforLabel.font=[UIFont systemFontOfSize:19];
    [inforLabel setTextColor:[UIColor whiteColor]];
    inforLabel.text = [NSString stringWithFormat:@"我的作品"];
    [self.view addSubview:inforLabel];
}


-(void)initBoard_BottomMenu
{
    int  h = self.viewBound.size.height;
    
    UIImageView *bottomImage = [[[UIImageView alloc] initWithFrame:CGRectMake(0, h-50, 320, 50)] autorelease];
    [bottomImage setImage:[UIImage imageNamed:@"bottom_bar_bg.png"]];
    bottomImage.opaque = YES; //opaque是否透明
    bottomImage.userInteractionEnabled = YES;
    [self.view addSubview:bottomImage];
    
    BeeUIButton *takephotoButton = [[[BeeUIButton alloc] initWithFrame:CGRectMake(33, 3, 35, 35)] autorelease];
    [takephotoButton setImage:[UIImage imageNamed:@"camera_icon.png"] forState:UIControlStateNormal];
    takephotoButton.opaque = YES; //opaque是否透明
    [takephotoButton addTarget:self action:@selector(takePic) forControlEvents:UIControlEventTouchUpInside];
    [bottomImage addSubview:takephotoButton];
    
    UIImageView *lineImage1 = [[[UIImageView alloc] initWithFrame:CGRectMake(106, 0, 1, 50)] autorelease];
    [lineImage1 setImage:[UIImage imageNamed:@"line.png"]];
    lineImage1.opaque = YES; //opaque是否透明
    [bottomImage addSubview:lineImage1];
    
    UIImageView *lineImage2 = [[[UIImageView alloc] initWithFrame:CGRectMake(213, 0, 1, 50)] autorelease];
    [lineImage2 setImage:[UIImage imageNamed:@"line.png"]];
    lineImage2.opaque = YES; //opaque是否透明
    [bottomImage addSubview:lineImage2];
    
    BeeUIButton *photoButton = [[[BeeUIButton alloc] initWithFrame:CGRectMake(141, 3, 35, 35)] autorelease];
    [photoButton setImage:[UIImage imageNamed:@"photo_icon.png"] forState:UIControlStateNormal];
    photoButton.opaque = YES; //opaque是否透明
    [photoButton addTarget:self action:@selector(loadPic) forControlEvents:UIControlEventTouchUpInside];
    [bottomImage addSubview:photoButton];
    
    UIImageView *userImage = [[[UIImageView alloc] initWithFrame:CGRectMake(250, 3, 35, 35)] autorelease];
    [userImage setImage:[UIImage imageNamed:@"user_icon.png"]];
    userImage.opaque = YES; //opaque是否透明
    [bottomImage addSubview:userImage];
    
    UILabel *txtLabel = [[[UILabel alloc] initWithFrame:CGRectMake(30, 38, 260, 10)] autorelease];
    txtLabel.backgroundColor = [UIColor clearColor];
    txtLabel.textAlignment = UITextAlignmentCenter;
    txtLabel.font=[UIFont systemFontOfSize:10];
    [txtLabel setTextColor:[UIColor whiteColor]];
    txtLabel.text =[NSString stringWithFormat:@"拍照上传                        相册上传                         我的作品"];
    [bottomImage addSubview:txtLabel];
    
}

-(void)takePic
{
    [self presentMessageTips:@"拍照上传"];
    
    [self getImageFromDevice:TRUE];
}

-(void)loadPic
{
    [self presentMessageTips:@"相册上传"];
    
    [self getImageFromDevice:FALSE];
}


-(void)getImageFromDevice:(BOOL)openCamara
{
    UIImagePickerController *picker = [[UIImagePickerController alloc] init];
    
    if([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera]) {
        
        if (openCamara)
        {
            picker.sourceType = UIImagePickerControllerSourceTypeCamera;
            picker.showsCameraControls = YES;
        }
        else
            picker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
        
        //NSArray *temp_MediaTypes = [UIImagePickerController availableMediaTypesForSourceType:picker.sourceType];
        NSArray *temp_MediaTypes  = [[NSArray alloc] initWithObjects: (NSString *) kUTTypeImage, nil];
        
        picker.mediaTypes = temp_MediaTypes;
    }
    
    picker.delegate = self;
    //picker.allowsEditing = YES;
    
    [self presentViewController:picker animated:YES completion:nil];
    
    [picker release];
}

//下面两个函数是遵守UIImagePickerControllerDelegate这个协议所实现的类.这样就能够完整的实现,获取照片或者视频,然后写入文件的过程.
- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info
{
    
    NSString *mediaType = [info objectForKey:UIImagePickerControllerMediaType];
    
    //    BOOL success;
    //    NSFileManager *fileManager = [NSFileManager defaultManager];
    //    NSError *error;
    //
    //    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    //    NSString *documentsDirectory = [paths objectAtIndex:0];
    
    if ([mediaType isEqualToString:@"public.image"]){
        
        UIImage *editedImage = [info objectForKey:UIImagePickerControllerEditedImage];
        UIImage *originalImage = [info objectForKey:UIImagePickerControllerOriginalImage];
        
        //if ((editedImage.size.width != originalImage.size.width) || (editedImage.size.height != originalImage.size.height)) {
        // The image has been edited
        //}
        
        UIImage *image = editedImage;
        if (image == nil) {
            image = originalImage;
            //2448.000000,3264.000000
            //2245800
        }
        
        
        NSLog(@"found an image:%f,%f",image.size.width,image.size.height);
        
        NSString *imageFile = [NSString stringWithRandomJpgfile];
        NSLog(@"%@", imageFile);
        
        
        NSData *jpegData = UIImageJPEGRepresentation(image, 0.9f);
        //NSData *jpegData = UIImagePNGRepresentation(image);
        
        NSLog(@"imageData-size:%d",[jpegData length]);
        
        //把文件保存到cache中
        //        [[AppCache sharedInstance] cacheData:jpegData toFile:imageFile];
        
        
        //SETIMAGE(image);
        //CFShow([[NSFileManager defaultManager] directoryContentsAtPath:[NSHomeDirectory() stringByAppendingString:@"/Documents"]]);
        
        [picker dismissViewControllerAnimated:NO completion:nil];
        //
        //        TakePicViewController *tackPic = [[TakePicViewController alloc] init];
        //
        //        [self presentViewController:tackPic animated:NO completion:nil];
        //        //tackPic.imageView.image =image;
        //        [tackPic loadImageFromPath:imageFile];
        //
        //        [tackPic release];
        //
        //        AppThread *newThread = [[AppData getInstance] postNewThread];
        //        [newThread addImageFile:imageFile];
        
    }
}

- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker {
    
    [picker dismissViewControllerAnimated:YES completion:nil];
    
}



@end
