//
//  SummaryCoordinator.h
//  PaymentApp
//
//  Created by Jonathan Garcia on 16/12/2019.
//  Copyright © 2019 Jonathan. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "Coordinator.h"

@interface SummaryCoordinator : NSObject <Coordinator>

@property (strong, nonatomic) NSString *amount;
@property (strong, nonatomic) NSString *paymentMethodId;
@property (strong, nonatomic) NSString *issuerId;
@property (strong, nonatomic) NSString *installment;

- (instancetype)initWithPresenter:(UINavigationController *)presenter;

@end
