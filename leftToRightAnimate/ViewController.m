//
//  ViewController.m
//  leftToRightAnimate
//
//  Created by Guilherme Martins on 4/21/15.
//  Copyright (c) 2015 com.gui.kenshuGame. All rights reserved.
//

#import "ViewController.h"


@interface ViewController()
@end

@implementation ViewController


-(void)viewDidLoad{
    
    UISwipeGestureRecognizer* swipe = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(dissmissView:)];
    swipe.direction = UISwipeGestureRecognizerDirectionLeft;
    [self.view addGestureRecognizer:swipe];
    
    
}

-(IBAction)dissmissView:(id)sender{
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (IBAction)dismissButtonWasTouched:(UIButton *)sender{
    [self dismissViewControllerAnimated:YES completion:nil];
}

@end
