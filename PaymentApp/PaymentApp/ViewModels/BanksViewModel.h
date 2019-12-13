//
//  BanksViewModel.h
//  PaymentApp
//
//  Created by Jonathan Garcia on 13/12/2019.
//  Copyright © 2019 Jonathan. All rights reserved.
//

#import "BaseViewModel.h"

@class BankCellViewModel;

@interface BanksViewModel : BaseViewModel

@property (nonatomic, strong) NSArray * _Nullable cellViewModels;
@property (nonatomic) NSInteger numberOfCells;

@property (nonatomic, strong) NSString * _Nonnull paymentMethodId;

- (void)getBanks;
- (BankCellViewModel *_Nullable)getCellViewModel:(NSUInteger)index;

@end
