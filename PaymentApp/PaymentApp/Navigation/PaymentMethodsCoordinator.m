//
//  PaymentMethodsCoordinator.m
//  PaymentApp
//
//  Created by Jonathan Garcia on 16/12/2019.
//  Copyright © 2019 Jonathan. All rights reserved.
//

#import "PaymentMethodsCoordinator.h"
#import "PaymentMethodsViewController.h"
#import "PaymentMethodCellViewModel.h"
#import "BanksCoordinator.h"


@interface PaymentMethodsCoordinator () <PaymentMethodsViewControllerDelegate>

@property (strong, nonatomic) UINavigationController *presenter;
@property (strong, nonatomic) PaymentMethodsViewController *paymentMethodsViewController;
@property (strong, nonatomic) BanksCoordinator *banksCoordinator;

@end

@implementation PaymentMethodsCoordinator

- (instancetype)initWithPresenter:(UINavigationController *)presenter {

    self = [super init];
    if(self) {
        
        self.presenter = presenter;
    }
    return self;
}

- (void)start {

    UIStoryboard *mystoryboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    PaymentMethodsViewController *paymentMethodsViewController = (PaymentMethodsViewController *)[mystoryboard instantiateViewControllerWithIdentifier:@"PaymentMethodsViewController"];
    
    paymentMethodsViewController.delegate = self;
    [self.presenter pushViewController:paymentMethodsViewController animated:YES];
    
    self.paymentMethodsViewController = paymentMethodsViewController;
}

#pragma mark - PaymentMethodsViewControllerDelegate

- (void)paymentMethodSelected:(PaymentMethodCellViewModel *)item {
    
    self.banksCoordinator = [[BanksCoordinator alloc] initWithPresenter:self.presenter];
    
    self.banksCoordinator.amount = self.amount;
    self.banksCoordinator.paymentMethodId = item.paymentMethodId;
    
    [self.banksCoordinator start];
}

@end
