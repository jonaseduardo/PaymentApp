//
//  PaymentMethodsViewModel.m
//  PaymentApp
//
//  Created by Jonathan Garcia on 11/12/2019.
//  Copyright © 2019 Jonathan. All rights reserved.
//

#import "PaymentMethodsViewModel.h"
#import "APIManager.h"

@interface PaymentMethodsViewModel ()

@property (nonatomic, strong) APIManager *myAPIManager;

@end

@implementation PaymentMethodsViewModel

- (instancetype)init {
    self = [super init];
    if(self) {
        self.myAPIManager = [APIManager new];
    }
    return self;
}

- (void)getPaymentMethods {
    
    [self.myAPIManager doRequest:@"payment_methods" parameters:@{@"public_key":PUBLIC_KEY} response:^(NSMutableArray *data, NSError *error) {
        
        self.paymentMethods = data;
        self.callBack();
    }];
}

@end
