//
//  PaymentViewController.h
//  PaymentApp
//
//  Created by Jonathan Garcia on 13/12/2019.
//  Copyright © 2019 Jonathan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BasePaymentViewController.h"

@protocol PaymentViewControllerDelegate

- (void)amountCompleted:(NSString *)amount;

@end

@interface PaymentViewController : BasePaymentViewController

@property (nonatomic, weak) id<PaymentViewControllerDelegate> delegate;

@end
