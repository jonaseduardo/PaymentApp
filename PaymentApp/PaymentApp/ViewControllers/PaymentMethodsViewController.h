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
@class PaymentMethodCellViewModel;

@protocol PaymentMethodsViewControllerDelegate

- (void)paymentMethodSelected:(PaymentMethodCellViewModel *)item;

@end

@interface PaymentMethodsViewController : BasePaymentViewController

@property (strong, nonatomic) PaymentMethodsViewModel *paymentMethodsViewModel;
@property (weak, nonatomic) id<PaymentMethodsViewControllerDelegate> delegate;

@end
