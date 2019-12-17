//
//  PaymentCoordinator.m
//  PaymentApp
//
//  Created by Jonathan Garcia on 16/12/2019.
//  Copyright © 2019 Jonathan. All rights reserved.
//

#import "PaymentCoordinator.h"
#import "PaymentViewController.h"
#import "PaymentMethodsCoordinator.h"
#import "UIViewController+Create.h"

@interface PaymentCoordinator () <PaymentViewControllerDelegate>

@property (strong, nonatomic) UINavigationController *presenter;
@property (strong, nonatomic) PaymentViewController *paymentViewController;
@property (strong, nonatomic) PaymentMethodsCoordinator *paymentMethodsCoordinator;

@end

@implementation PaymentCoordinator

- (instancetype)initWithPresenter:(UINavigationController *)presenter {

    self = [super init];
    if(self) {
        
        self.presenter = presenter;
    }
    return self;
}

- (void)start {

    UIStoryboard *mystoryboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    PaymentViewController *paymentViewController = (PaymentViewController *)[mystoryboard instantiateViewControllerWithIdentifier:@"PaymentViewController"];
    
    paymentViewController.delegate = self;
    [self.presenter pushViewController:paymentViewController animated:YES];
    
    self.paymentViewController = paymentViewController;
}

#pragma mark - PaymentViewControllerDelegate

- (void)amountCompleted:(NSString *)amount {
    
    self.paymentMethodsCoordinator = [[PaymentMethodsCoordinator alloc] initWithPresenter:self.presenter];
    self.paymentMethodsCoordinator.amount = amount;
    [self.paymentMethodsCoordinator start];
}

@end
