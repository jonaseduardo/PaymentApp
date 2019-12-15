//
//  PaymentMethodsViewController.h
//  PaymentApp
//
//  Created by Jonathan Garcia on 11/12/2019.
//  Copyright © 2019 Jonathan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BasePaymentViewController.h"

@class PaymentMethodsViewModel;

@interface PaymentMethodsViewController : BasePaymentViewController

@property (strong, nonatomic) PaymentMethodsViewModel *paymentMethodsViewModel;

@end
