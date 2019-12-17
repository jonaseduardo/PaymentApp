//
//  BasePaymentViewController.m
//  PaymentApp
//
//  Created by Jonathan Garcia on 15/12/2019.
//  Copyright © 2019 Jonathan. All rights reserved.
//

#import "BasePaymentViewController.h"

@interface BasePaymentViewController ()

@end

@implementation BasePaymentViewController

- (void)cleanData {
}

- (void)presentViewController:(UIViewController *)viewController andView:(UIView *)view {

    [viewController addChildViewController:self];
    [view addSubview:self.view];
    [self didMoveToParentViewController:viewController];
}

- (void)removeViewController {
    
    [self willMoveToParentViewController:nil];
    [self.view removeFromSuperview];
    [self removeFromParentViewController];
}

@end
