//
//  InstallmentsViewController.h
//  PaymentApp
//
//  Created by Jonathan Garcia on 14/12/2019.
//  Copyright © 2019 Jonathan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BasePaymentViewController.h"

@class InstallmentsViewModel;

@interface InstallmentsViewController : BasePaymentViewController

@property (strong, nonatomic) InstallmentsViewModel *installmentsViewModel;

@end
