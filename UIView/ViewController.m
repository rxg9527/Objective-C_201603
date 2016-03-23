//
//  ViewController.m
//  UIView
//
//  Created by Yuen-iMac on 16/3/21.
//  Copyright © 2016年 Yuen. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UIImageView *addressEmptyImageView;
@property (weak, nonatomic) IBOutlet UIImageView *collectionEmptyImageView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.addressEmptyImageView.alpha = 0.0;

}

- (void)animationShow:(NSInteger)index {
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationDuration:1.0f];
    
    if (index == 0) {
        [UIView animateWithDuration:1 animations:^{
            self.addressEmptyImageView.alpha = 1.0;
            self.collectionEmptyImageView.alpha = 0.0;
        } completion:^(BOOL finished) {
            [UIView animateWithDuration:4.0
                             animations:^{
                                 self.addressEmptyImageView.center = CGPointMake(500.0, 470.0);
                                 self.collectionEmptyImageView.center = CGPointMake(160.0, 230.0);
                             }];
        }];
    } else {
        [UIView animateWithDuration:1 animations:^{
            self.collectionEmptyImageView.alpha = 1.0;
            self.addressEmptyImageView.alpha = 0.0;
        } completion:^(BOOL finished) {
            [UIView animateWithDuration:4.0
                             animations:^{
                                 self.collectionEmptyImageView.center = CGPointMake(500.0, 470.0);
                                 self.addressEmptyImageView.center = CGPointMake(160.0, 230.0);
                             }];
        }];
    }
}

- (IBAction)changePage:(id)sender {
    static BOOL bAgain = TRUE;
    if (bAgain) {
        [self.collectionEmptyImageView removeFromSuperview];
        [self.view addSubview:self.addressEmptyImageView];
        [self animationShow:0];
    } else {
        [self.addressEmptyImageView removeFromSuperview];
        [self.view addSubview:self.collectionEmptyImageView];
        [self animationShow:1];
    }
    bAgain = !bAgain;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

@end
