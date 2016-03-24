//
//  UIImage+gif.h
//  Demo201603
//
//  Created by Yuen on 16/3/24.
//  Copyright © 2016年 Yuen. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (gif)

+ (UIImage *)sd_animatedGIFNamed:(NSString *)name;
+ (UIImage *)sd_animatedGIFWithData:(NSData *)data;

@end
