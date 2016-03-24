//
//  ViewController.m
//  04_UIWindow
//
//  Created by Yuen-iMac on 16/3/24.
//  Copyright © 2016年 Yuen. All rights reserved.
//

#import "ViewController.h"

@interface ViewController () <UIAlertViewDelegate>

@property (nonatomic, strong) UIWindow *vcWindow;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
}

- (IBAction)createWindowButtonPressed:(id)sender {
    self.vcWindow = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    self.vcWindow.windowLevel = UIWindowLevelNormal;
    self.vcWindow.backgroundColor = [UIColor redColor];
    self.vcWindow.hidden = NO;
    
    UIGestureRecognizer *gesture = [[UITapGestureRecognizer alloc] init];
    [gesture addTarget:self action:@selector(hideWindow:)];
    [self.vcWindow addGestureRecognizer:gesture];
}

- (void)hideWindow:(UIGestureRecognizer *)gesture {
    self.vcWindow.hidden = YES;
    self.vcWindow = nil;
}

- (IBAction)sendertestBtnClicked:(UIButton *)sender {
    UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:nil message:@"测试"
                                                       delegate:self cancelButtonTitle:@"OK"
                                              otherButtonTitles:nil, nil];
    [alertView show];
}

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex {
    UIWindow *window = [alertView window];
    NSLog(@"window level = %f", window.windowLevel);
}

@end
