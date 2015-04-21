//
//  SlideInteractor.h
//  leftToRightAnimate
//
//  Created by Guilherme Martins on 4/21/15.
//  Copyright (c) 2015 com.gui.kenshuGame. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SlideInteractor : NSObject <UIViewControllerAnimatedTransitioning, UIViewControllerTransitioningDelegate>

@property (nonatomic, assign, getter = isPresenting) BOOL presenting;

@end
