//
//  Lesson6Board.m
//

#import "Lesson6Board.h"
#import "JSONKit.h"
#import "NSString+PopExtension.h"
#import "DetailBoard.h"

#define WIDTH 320/3
#define WIDTH111 320/2

#pragma mark -

@implementation Lesson6Cell

+ (CGSize)sizeInBound:(CGSize)bound forData:(NSObject *)data
{
	NSNumber * height = (NSNumber *)[(NSArray *)data objectAtIndex:0];
	return CGSizeMake( bound.width, height.floatValue );
}

- (void)layoutInBound:(CGSize)bound forCell:(BeeUIGridCell *)cell
{
    CGRect photoFrame;
	photoFrame.origin = CGPointZero;
	photoFrame.size.width = bound.width;
	photoFrame.size.height = bound.height;
	[cell subview:@"_photo"].frame = photoFrame;
    
 //   _boutton.frame = photoFrame;
//    
//    _background.frame = CGRectMake(0.0f, bound.height-15.0f,bound.width-2.0f, 15.0f);//文字背景
//    _address.frame = CGRectMake(3.0f, bound.height-15.0f,bound.width-30.0f, 15.0f);//地址
//    _zan.frame = CGRectMake(80.0f, bound.height-13.0f,10.0f , 10.0f);//赞的标志
//    _znum.frame = CGRectMake(91.0f, bound.height-13.0f,15.0f, 10.0f);//赞的票数

    _background.frame = CGRectMake(0.0f, bound.height-20.0f,bound.width-2.0f, 18.0f);//文字背景
    _address.frame = CGRectMake(3.0f, bound.height-19.0f,bound.width-30.0f, 18.0f);//地址
    _zan.frame = CGRectMake(bound.width-30.0f, bound.height-16.0f,12.0f , 12.0f);//赞的标志
    _znum.frame = CGRectMake(bound.width-15.0f, bound.height-16.0f,15.0f, 12.0f);//赞的票数
    
}

- (void)load
{
	[super load];
	
	self.layer.borderColor = [UIColor whiteColor].CGColor;
	self.layer.borderWidth = 2.0f;
	
	_photo = [[BeeUIImageView alloc] init];
	_photo.layer.borderColor = [UIColor whiteColor].CGColor;
	_photo.layer.borderWidth = 1.0f;
	_photo.contentMode = UIViewContentModeScaleAspectFill;
	_photo.indicator.activityIndicatorViewStyle = UIActivityIndicatorViewStyleGray;
	[_photo makeTappable];
	[self addSubview:_photo];

    
    _background = [[BeeUILabel alloc] init];
    _background.backgroundColor = [UIColor blackColor];
    _background.alpha = 0.5;
    [self addSubview:_background];

    _address = [[BeeUILabel alloc] init];
	_address.textAlignment = UITextAlignmentLeft;
    _address.backgroundColor = [UIColor clearColor];
	_address.textColor = [UIColor whiteColor];
    //    _address.font = [UIFont boldSystemFontOfSize:8.0f];
    
      _address.font = [UIFont boldSystemFontOfSize:10.0f];
    
	[self addSubview:_address];

    _zan = [[UIImageView alloc] init];
    _zan.opaque = YES;
	[self addSubview:_zan];
	
	    
	_znum = [[BeeUILabel alloc] init];
	_znum.textAlignment = UITextAlignmentCenter;
	_znum.textColor = [UIColor whiteColor];
    //_znum.font = [UIFont boldSystemFontOfSize:8.0f];
    
    _znum.font = [UIFont boldSystemFontOfSize:10.0f];
    
	[self addSubview:_znum];

       
}

- (void)unload
{
	SAFE_RELEASE_SUBVIEW( _photo );
//    SAFE_RELEASE_SUBVIEW( _boutton );
    
    SAFE_RELEASE_SUBVIEW( _background );
    
    SAFE_RELEASE_SUBVIEW( _address );
    SAFE_RELEASE_SUBVIEW( _zan );
    SAFE_RELEASE_SUBVIEW( _znum );
	
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
        
        NSString *cnText = (NSString *)[(NSArray *)self.cellData objectAtIndex:2];
        NSStringEncoding enc1 = CFStringConvertEncodingToNSStringEncoding(kCFStringEncodingGB_18030_2000);
        NSString *deText=[cnText stringByReplacingPercentEscapesUsingEncoding:enc1];
        _address.text = deText;
        
        _znum.text = (NSString *)[(NSArray *)self.cellData objectAtIndex:3];
        _zan.image = [UIImage imageNamed:@"scroe_icon.png"];
    }
	else
	{
		_photo.image = nil;
        _address.text = nil;
        _znum.text = nil;
        _zan.image = nil;
	}
}

@end

#pragma mark -

@implementation Lesson6Board

DEF_SINGLETON( Lesson6Board );

- (void)load
{
	[super load];
    NSURL *url = [NSURL URLWithString:@"http://news.ngzb.com.cn/channel/2013/gx/sj_list.php?page=%E9%A1%B5%E7%A0%81%E5%80%BC&num=%E9%A1%B5%E7%A0%81"];
    NSString *res = [NSString stringWithContentsOfURL:url encoding:NSUTF8StringEncoding error:nil];
    
    NSString *jsonResStr  = [res fillUpJsonString];
    
    NSArray *jsonArray = [jsonResStr objectFromJSONString ];
    
    NSDictionary *listItemDict = [jsonArray objectAtIndex:1];
    NSArray *itemArray = [listItemDict objectForKey:@"listitem"];
    
    _datas = [[NSMutableArray alloc] init];
    
    for (int i=0; i<itemArray.count; ++i)
    {
        [_datas addObject:[NSArray arrayWithObjects:__INT(120), [[itemArray objectAtIndex:i] valueForKey:@"tu"], [[itemArray objectAtIndex:i] valueForKey:@"dz"],[[itemArray objectAtIndex:i] valueForKey:@"tpnum"],nil]];
        
        [_datas addObject:[NSArray arrayWithObjects:__INT(180), [[itemArray objectAtIndex:++i] valueForKey:@"tu"], [[itemArray objectAtIndex:i] valueForKey:@"dz"],[[itemArray objectAtIndex:i] valueForKey:@"tpnum"],nil]];
    }

    
//    for (int i=0; i<itemArray.count; ++i)
//    {
//        [_datas addObject:[NSArray arrayWithObjects:__INT(100), [[itemArray objectAtIndex:i] valueForKey:@"tu"], [[itemArray objectAtIndex:i] valueForKey:@"dz"],[[itemArray objectAtIndex:i] valueForKey:@"tpnum"],nil]];
//        
//        [_datas addObject:[NSArray arrayWithObjects:__INT(80), [[itemArray objectAtIndex:++i] valueForKey:@"tu"], [[itemArray objectAtIndex:i] valueForKey:@"dz"],[[itemArray objectAtIndex:i] valueForKey:@"tpnum"],nil]];
//        
//        [_datas addObject:[NSArray arrayWithObjects:__INT(120), [[itemArray objectAtIndex:++i] valueForKey:@"tu"], [[itemArray objectAtIndex:i] valueForKey:@"dz"],[[itemArray objectAtIndex:i] valueForKey:@"tpnum"],nil]];
//        
//        [_datas addObject:[NSArray arrayWithObjects:__INT(100), [[itemArray objectAtIndex:++i] valueForKey:@"tu"],[[itemArray objectAtIndex:i] valueForKey:@"dz"],[[itemArray objectAtIndex:i] valueForKey:@"tpnum"],nil]];
//    }
//
    NSLog(@"datas=====%@",_datas);
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
		[self setTitleString:@"Lesson 6"];
		[self showNavigationBarAnimated:NO];
        
        int  h = self.viewBound.size.height;
        
        UIImageView *titleImage = [[[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 320, 45)] autorelease];
        [titleImage setImage:[UIImage imageNamed:@"title_bar.png"]];
        titleImage.opaque = YES; //opaque是否透明
        [self.view addSubview:titleImage];
        
        UILabel *inforLabel = [[[UILabel alloc] initWithFrame:CGRectMake(15, 12, 80, 20)] autorelease];
        inforLabel.backgroundColor = [UIColor clearColor];
        inforLabel.textAlignment = UITextAlignmentCenter;
        inforLabel.font=[UIFont systemFontOfSize:19];
        [inforLabel setTextColor:[UIColor whiteColor]];
        inforLabel.text = [NSString stringWithFormat:@"作品欣赏"];
        [self.view addSubview:inforLabel];
        
        UIImageView *bottomImage = [[[UIImageView alloc] initWithFrame:CGRectMake(0, h-50, 320, 50)] autorelease];
        [bottomImage setImage:[UIImage imageNamed:@"bottom_bar_bg.png"]];
        bottomImage.opaque = YES; //opaque是否透明
        [self.view addSubview:bottomImage];
        
        BeeUIButton *takephotoButton = [[[BeeUIButton alloc] initWithFrame:CGRectMake(33, 3, 35, 35)] autorelease];
        [takephotoButton setImage:[UIImage imageNamed:@"camera_icon.png"] forState:UIControlStateNormal];
        takephotoButton.opaque = YES; //opaque是否透明
        //[takephotoButton addTarget:self action:@selector(takePic) forControlEvents:UIControlEventTouchUpInside];
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
        //[photoButton addTarget:self action:@selector(loadPic) forControlEvents:UIControlEventTouchUpInside];
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
	//return 3;
    return 2;
}

- (NSInteger)numberOfViews
{
	return _datas.count;
}

- (UIView *)viewForIndex:(NSInteger)index scale:(CGFloat)scale
{
	NSNumber * data = [_datas objectAtIndex:index];
    Lesson6Cell * cell = (Lesson6Cell *)[self dequeueWithContentClass:[Lesson6Cell class]];
	if ( cell )
	{
        NSLog(@"number_data====%@",data);
		cell.cellData = data;
	}
	return cell;
}

- (CGSize)sizeForIndex:(NSInteger)index
{
	NSArray * item = (NSArray *)[_datas objectAtIndex:index];
	NSNumber * height = (NSNumber *)[item objectAtIndex:0];
	
	CGSize cellSize;
	cellSize.width = self.viewSize.width / self.numberOfColumns;
	cellSize.height = height.floatValue;
	return cellSize;
}

@end
