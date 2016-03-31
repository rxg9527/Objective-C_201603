//
//  NSObject+KVO.h
//  Demo201603
//
//  Created by Yuen on 16/3/31.
//  Copyright © 2016年 Yuen. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSObject (KVO)

- (void)xg_addObserver:(NSObject *)observer forKeyPath:(NSString *)keyPath options:(NSKeyValueObservingOptions)options context:(void *)context;

@end
