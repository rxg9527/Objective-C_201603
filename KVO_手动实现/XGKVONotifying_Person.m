//
//  XGKVONotifying_Person.m
//  Demo201603
//
//  Created by Yuen on 16/3/31.
//  Copyright © 2016年 Yuen. All rights reserved.
//

#import "XGKVONotifying_Person.h"
#import <objc/runtime.h>

@implementation XGKVONotifying_Person

- (void)setAge:(NSUInteger)age {
    [super setAge:age];
    id observer = objc_getAssociatedObject(self, @"observer");
    [observer observeValueForKeyPath:@"age" ofObject:self change:nil context:nil];
}

@end
