//
//  PaymentMethodsViewModel.h
//  PaymentApp
//
//  Created by Jonathan Garcia on 11/12/2019.
//  Copyright © 2019 Jonathan. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface PaymentMethodsViewModel : NSObject

@property (nonatomic, strong) NSMutableArray * _Nullable paymentMethods;
@property (nonatomic, copy, nullable) void (^callBack)(void);

- (void)getPaymentMethods;

@end
