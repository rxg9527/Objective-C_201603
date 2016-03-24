//
//  XGLabel.m
//  Demo201603
//
//  Created by Yuen on 16/3/24.
//  Copyright © 2016年 Yuen. All rights reserved.
//

#import "XGLabel.h"

@implementation XGLabel

- (void)drawTextInRect:(CGRect)rect
{
    [super drawTextInRect:UIEdgeInsetsInsetRect(rect, UIEdgeInsetsMake(0, 5, 0, 5))];
}

@end
