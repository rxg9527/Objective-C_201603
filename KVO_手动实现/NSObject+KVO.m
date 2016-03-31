//
//  NSObject+KVO.m
//  Demo201603
//
//  Created by Yuen on 16/3/31.
//  Copyright © 2016年 Yuen. All rights reserved.
//

#import "NSObject+KVO.h"
#import <objc/runtime.h>
#import "XGKVONotifying_Person.h"

@implementation NSObject (KVO)

- (void)xg_addObserver:(NSObject *)observer forKeyPath:(NSString *)keyPath options:(NSKeyValueObservingOptions)options context:(void *)context {
    // 1.动态创建NSKVONotifying_Person,NSKVONotifying_Person是Person子类,做KVO
    // 2.修改当前对象的isa指针->NSKVONotifying_Person
    // 3.只要调用对象的set,就会调用NSKVONotifying_Person的set方法
    // 4.重写NSKVONotifying_Person的set方法,1.[super set:] 2.通知观察者,告诉你属性改变
    
    // 修改isa指针
    object_setClass(self, [XGKVONotifying_Person class]);
    
    // 添加关联
    // id object:给哪个对象添加关联属性
    // key:属性名
    // value:关联值
    objc_setAssociatedObject(self, @"observer", observer, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

@end
