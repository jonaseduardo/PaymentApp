//
//  PaymentMethodsViewController.m
//  PaymentApp
//
//  Created by Jonathan Garcia on 11/12/2019.
//  Copyright © 2019 Jonathan. All rights reserved.
//

#import "PaymentMethodsViewController.h"
#import "PaymentMethodsViewModel.h"

@interface PaymentMethodsViewController ()

@property (nonatomic, strong) PaymentMethodsViewModel *paymentMethodsViewModel;

@end

@implementation PaymentMethodsViewController

#pragma mark - Getters/Setters

- (PaymentMethodsViewModel *)paymentMethodsViewModel {
    if (_paymentMethodsViewModel == nil) {
        _paymentMethodsViewModel = [PaymentMethodsViewModel new];
    }
    return _paymentMethodsViewModel;
}

#pragma mark - View lyfeCycle

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self bindViewModel];
    [self getPaymentMethods];
}

#pragma mark - Navigation

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
//     Get the new view controller using [segue destinationViewController].
//     Pass the selected object to the new view controller.
}

#pragma mark - Bindings

- (void)bindViewModel {
    
    self.paymentMethodsViewModel.callBack = ^(){
        
    };
}

#pragma mark - Custom Methods

- (void)getPaymentMethods {
    
    [self.paymentMethodsViewModel getPaymentMethods];
}

@end
