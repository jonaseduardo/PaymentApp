//
//  SummaryViewController.h
//  PaymentApp
//
//  Created by Jonathan Garcia on 14/12/2019.
//  Copyright © 2019 Jonathan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BasePaymentViewController.h"

@class SummaryViewModel;

@protocol SummaryViewControllerDelegate

- (void)endProcess;

@end

@interface SummaryViewController : BasePaymentViewController

@property (strong, nonatomic) SummaryViewModel *summaryViewModel;
@property (weak, nonatomic) id<SummaryViewControllerDelegate> delegate;

@end
