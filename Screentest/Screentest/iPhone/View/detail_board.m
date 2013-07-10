

#import "detail_board.h"

#import "NSString+PopExtension.h"
#import <MobileCoreServices/UTCoreTypes.h>
#import "UIImage+PopExtension.h"


#pragma mark -

@implementation detailCell

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
	photoFrame.size.height = bound.height-150;//Cell的高度为图片高度+150
	[cell subview:@"_photo"].frame = photoFrame;
    
    int H = photoFrame.size.height;
    
    _introduce.frame = CGRectMake(20.0f, H+10.0f, 280.0f, 50.0f);//文字说明
    _address.frame = CGRectMake(20.0f, H+70.0f, 140.0f, 20.0f);//地址
    _time.frame = CGRectMake(200.0f, H+70.0f, 100.0f, 20.0f);//时间
    _zan.frame = CGRectMake(20.0f, H+100.0f, 15.0f , 15.0f);//赞的标志
    _znum.frame = CGRectMake(40.0f, H+100.0f, 15.0f, 15.0f);//赞的票数
    
    _ZanBoutton.frame = CGRectMake(bound.width-100.0f, bound.height-45.0f,80.0f, 35.0f);//赞的按钮
    
}

- (void)load
{
	[super load];
		
	_photo = [[BeeUIImageView alloc] init];
	_photo.contentMode = UIViewContentModeScaleAspectFill;
	_photo.indicator.activityIndicatorViewStyle = UIActivityIndicatorViewStyleGray;
	[_photo makeTappable];
	[self addSubview:_photo];
    
    _introduce = [[BeeUILabel alloc] init];
    _introduce.backgroundColor = [UIColor clearColor];
    _introduce.textAlignment = UITextAlignmentLeft;
    _introduce.font = [UIFont systemFontOfSize:13];
    [_introduce setTextColor:[UIColor brownColor]];
    _introduce.lineBreakMode = UILineBreakModeWordWrap;//自动换行
    _introduce.numberOfLines = 0;
    [self addSubview:_introduce];
    
    _address = [[BeeUILabel alloc] init];
    _address.backgroundColor = [UIColor clearColor];
    _address.textAlignment = UITextAlignmentLeft;
    _address.font = [UIFont systemFontOfSize:13];
    [_address setTextColor:[UIColor grayColor]];
    [self addSubview:_address];
    
    _time = [[BeeUILabel alloc] init];
    _time.backgroundColor = [UIColor clearColor];
    _time.textAlignment = UITextAlignmentRight;
    _time.font = [UIFont systemFontOfSize:13];
    [_time setTextColor:[UIColor grayColor]];
    [self addSubview:_time];
    
    _zan = [[UIImageView alloc] init];
    [_zan setImage:[UIImage imageNamed:@"heart_icon.png"]];
    _zan.opaque = YES;
    [self addSubview:_zan];
    
    _znum = [[BeeUILabel alloc] init];
    _znum.backgroundColor = [UIColor clearColor];
    _znum.textAlignment = UITextAlignmentCenter;
    _znum.font = [UIFont systemFontOfSize:13];
    [_znum setTextColor:[UIColor redColor]];
    [self addSubview:_znum];
    
    _ZanBoutton =  [UIButton buttonWithType:UIButtonTypeCustom];
    [_ZanBoutton setTitle:@"赞一个" forState:UIControlStateNormal];
    _ZanBoutton.titleLabel.font = [UIFont  boldSystemFontOfSize:15];
    [_ZanBoutton setBackgroundImage:[UIImage imageNamed:@"welcome_anter_btn.9.png"]];
    [_ZanBoutton.layer setMasksToBounds:YES];  
    [_ZanBoutton.layer setCornerRadius:10.0]; //设置矩形四个圆角半径
    [_ZanBoutton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [_ZanBoutton addTarget:self action:@selector(Zan_Pic) forControlEvents:UIControlEventTouchUpInside];
    _ZanBoutton.showsTouchWhenHighlighted = YES;
    _ZanBoutton.opaque = YES; //opaque是否透明
    [self addSubview:_ZanBoutton];
    
}

- (void)unload
{
	SAFE_RELEASE_SUBVIEW( _photo );
    SAFE_RELEASE_SUBVIEW( _time );
    SAFE_RELEASE_SUBVIEW( _introduce );
    SAFE_RELEASE_SUBVIEW( _address );
    SAFE_RELEASE_SUBVIEW( _zan );
    SAFE_RELEASE_SUBVIEW( _znum );

    SAFE_RELEASE_SUBVIEW( _ZanBoutton );
    
	
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
                
        NSDictionary *itemDict = [self.cellData objectAtIndex:1];
		_photo.url =(NSString *)[itemDict valueForKey:ListItem_tu];
        _introduce.text = (NSString *)[itemDict valueForKey:ListItem_tusm];
        
        NSString *cnText = (NSString *)[itemDict valueForKey:ListItem_dz];
        NSStringEncoding enc1 = CFStringConvertEncodingToNSStringEncoding(kCFStringEncodingGB_18030_2000);
        NSString *deText=[cnText stringByReplacingPercentEscapesUsingEncoding:enc1];
        _address.text = deText;
        
        _znum.text = (NSString *)[itemDict valueForKey:ListItem_tpnum];
        _time.text = (NSString *)[itemDict valueForKey:ListItem_sj];
        

    }
    
	else
	{
		_photo.image = nil;
        _introduce.text = nil;
        _address.text = nil;
        _time.text = nil;
        _znum.text = nil;
    }
}

-(void)Zan_Pic
{
    [self presentMessageTips:@"赞！成功！"];
}

@end

#pragma mark -
@interface detail_board(Private)
- (void)refresh:(BOOL)force;
@end

@implementation detail_board

DEF_SINGLETON( detail_board );

- (void)load
{
	[super load];
    
    _detailModel = [DetailModel sharedInstance];
	[_detailModel addObserver:self];


//    _datas = [[NSMutableArray alloc]init];
//    
//    [_datas addObject:[NSArray arrayWithObjects: @"300",@"http://news.ngzb.com.cn//channel//2013//gx//pic//2013-07//1_20130708121241_x.jpg",@"有一个人，他很爱打电话，有一天，他挂了。哈哈哈哈哈哈哈！！！！！！！！！",@"南宁市大学东路188号",@" 07/09  22:17",@"23",nil]];
//    NSLog(@"datas=====%@",_datas);
    
 }

- (void)unload
{
	[_detailModel unload];
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
        
        [self initBoard_Title];
        
	}
	else if ( [signal is:BeeUIBoard.DELETE_VIEWS] )
	{
	}
	else if ( [signal is:BeeUIBoard.LOAD_DATAS] )
	{
        [_detailModel loadCache];
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

- (void)refresh:(BOOL)force
{
	[self cancelMessages];
    
    if ( 0 == _detailModel.listitems.count || force )
    {
        [_detailModel fetchShots];
    }
}

- (void)handleMessage:(BeeMessage *)msg
{
	[super handleMessage:msg];
}

- (void)handleMessage_AppController:(BeeMessage *)msg
{
	[super handleMessage:msg];
	
	if ( [msg is:MainController.APP_LOADDETAIL] )
	{
		if ( msg.sending )
		{
            //			BeeUIActivityIndicatorView * indicator = [BeeUIActivityIndicatorView spawn];
            //			[self showBarButton:UINavigationBar.BARBUTTON_RIGHT custom:indicator];
            //			[indicator startAnimating];
			
			[self setPullLoading:YES];
		}
		else
		{
            //			[self showBarButton:UINavigationBar.BARBUTTON_RIGHT system:UIBarButtonSystemItemRefresh];
			
			[self setPullLoading:NO];
		}
        
		if ( msg.succeed || msg.failed )
		{
            [self asyncReloadData];
		}
		
		
	}
}

#pragma mark -

- (NSInteger)numberOfColumns
{
    return 1;
}

- (NSInteger)numberOfViews
{
	return _detailModel.listitems.count;
}

- (UIView *)viewForIndex:(NSInteger)index scale:(CGFloat)scale
{
	NSArray * data = [_detailModel.listitems objectAtIndex:index];
    detailCell * cell = (detailCell *)[self dequeueWithContentClass:[detailCell class]];
	if ( cell )
	{
        NSLog(@"number_data====%@",data);
		cell.cellData = data;
	}
	return cell;
}

- (CGSize)sizeForIndex:(NSInteger)index
{
	NSArray * item = (NSArray *)[_detailModel.listitems objectAtIndex:index];
	NSNumber * height = (NSNumber *)[item objectAtIndex:0];
	
	CGSize cellSize;
	cellSize.width = self.viewSize.width;
	cellSize.height = height.floatValue+150;//GridCell高度为图片高度加150
    
	return cellSize;
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


@end
