//
//  PaymentMethodsViewModel.h
//  PaymentApp
//
//  Created by Jonathan Garcia on 11/12/2019.
//  Copyright © 2019 Jonathan. All rights reserved.
//

#import <Foundation/Foundation.h>

@class PaymentMethodCellViewModel;

@interface PaymentMethodsViewModel : NSObject

// Data
@property (nonatomic, strong) NSArray * _Nullable cellViewModels;
@property (nonatomic) NSInteger numberOfCells;

// Notify
@property (nonatomic, copy, nullable) void (^reloadTableView)(void);

- (void)getPaymentMethods;

- (PaymentMethodCellViewModel *_Nullable)getCellViewModel:(NSUInteger)index;

@end
