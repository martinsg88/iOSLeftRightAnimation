//
//  LeftTORightAnimationController.m
//  leftToRightAnimate
//
//  Created by Guilherme Martins on 4/21/15.
//  Copyright (c) 2015 com.gui.kenshuGame. All rights reserved.
//

#import "LeftTORightAnimationController.h"
#import "SlideInteractor.h"
#import "ViewController.h"
@interface LeftTORightAnimationController()

@property(strong, nonatomic)SlideInteractor* interactor;
@property(nonatomic)ViewController *modalController;

@end


@implementation LeftTORightAnimationController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.interactor = [[SlideInteractor alloc] init];
    UISwipeGestureRecognizer* swipe = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(hide:)];
    _modalController = [self.storyboard instantiateViewControllerWithIdentifier:@"ModalViewController"];
    _modalController.modalPresentationStyle = UIModalPresentationCustom;
    _modalController.transitioningDelegate = self.interactor;

    [self.view addGestureRecognizer:swipe];
    
}


- (void)willAnimateRotationToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation duration:(NSTimeInterval)duration
{
    NSLog(@"view frame=%@ bounds=%@", NSStringFromCGRect(self.view.frame), NSStringFromCGRect(self.view.bounds));
}

-(IBAction)hide:(id)sender{
    NSLog(@"swiped");
    self.interactor.presenting = YES;
    [self presentViewController:_modalController animated:YES completion:nil];

}

- (IBAction)showModalButtonWasTouched:(id)sender{
    self.interactor.presenting = YES;
    
}



@end
