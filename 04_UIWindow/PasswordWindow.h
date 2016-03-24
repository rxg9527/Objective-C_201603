//
//  PasswordWindow.h
//  Demo201603
//
//  Created by Yuen-iMac on 16/3/24.
//  Copyright © 2016年 Yuen. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PasswordWindow : UIWindow

+ (PasswordWindow *)sharedInstance;

- (void)show;

@end
