//
// Created by Yuen-iMac on 16/3/21.
// Copyright (c) 2016 Yuen. All rights reserved.
//

#import <Foundation/Foundation.h>

/*总结：
 *
 *                               +(void)load	    +(void)initialize
 * 执行时机	                 在程序运行后立即执行	  在类的方法第一次被调时执行
 * 若自身未定义，是否沿用父类的方法？	否	                    是
 * 类别中的定义	          全都执行，但后于类中的方法  覆盖类中的方法，只执行一个
 * */
@interface SuperClass : NSObject
@end

@interface ChildClass : SuperClass
@end

/******* Interface *******/
@interface MainClass : NSObject
@end

