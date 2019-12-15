//
//  BanksViewController.h
//  PaymentApp
//
//  Created by Jonathan Garcia on 13/12/2019.
//  Copyright © 2019 Jonathan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BasePaymentViewController.h"

@class BanksViewModel;

@interface BanksViewController : BasePaymentViewController

@property (strong, nonatomic) BanksViewModel *banksViewModel;

@end
