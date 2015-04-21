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
@end


@implementation LeftTORightAnimationController

- (void)viewDidLoad
{
    [super viewDidLoad];
}


- (void)willAnimateRotationToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation duration:(NSTimeInterval)duration
{
    NSLog(@"view frame=%@ bounds=%@", NSStringFromCGRect(self.view.frame), NSStringFromCGRect(self.view.bounds));
}


- (IBAction)showModalButtonWasTouched:(id)sender
{
    self.interactor = [[SlideInteractor alloc] init];
    self.interactor.presenting = YES;
    
    ViewController *modalController = [self.storyboard instantiateViewControllerWithIdentifier:@"ModalViewController"];
    modalController.modalPresentationStyle = UIModalPresentationCustom;
    modalController.transitioningDelegate = self.interactor;
    [self presentViewController:modalController animated:YES completion:nil];
}



@end
