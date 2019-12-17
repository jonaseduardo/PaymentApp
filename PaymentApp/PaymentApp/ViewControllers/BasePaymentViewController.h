//
//  BasePaymentViewController.h
//  PaymentApp
//
//  Created by Jonathan Garcia on 15/12/2019.
//  Copyright © 2019 Jonathan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MBProgressHUD.h"

@interface BasePaymentViewController : UIViewController

- (void)cleanData;
- (void)presentViewController:(UIViewController *)viewController andView:(UIView *)view;
- (void)removeViewController;

@end
