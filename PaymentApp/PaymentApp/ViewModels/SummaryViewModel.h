//
//  SummaryViewModel.h
//  PaymentApp
//
//  Created by Jonathan Garcia on 14/12/2019.
//  Copyright © 2019 Jonathan. All rights reserved.
//

#import "BaseViewModel.h"

@interface SummaryViewModel : BaseViewModel

@property (nonatomic, strong) NSString *amount;
@property (nonatomic, strong) NSString *paymentMethod;
@property (nonatomic, strong) NSString *bank;
@property (nonatomic, strong) NSString *fee;

@end
