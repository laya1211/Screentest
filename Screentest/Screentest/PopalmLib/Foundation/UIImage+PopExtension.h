//
//  UIImage+PopExtension.h
//  gxphotocontest
//
//  Created by Apple on 13-7-8.
//  Copyright (c) 2013年 popalm.com. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (PopExtension)
+ (UIImage *) scaleImage: (UIImage *)image scaleFactor:(float)scaleBy;

//返回一個等比縮放的image
- (UIImage *)scaleImage:(UIImage *)image toScale:(float)scaleSize;


//返回一個自定size的image
- (UIImage *)reSizeImage:(UIImage *)image toSize:(CGSize)reSize;

@end

