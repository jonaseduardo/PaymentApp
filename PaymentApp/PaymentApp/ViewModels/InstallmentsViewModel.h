//
//  InstallmentsViewModel.h
//  PaymentApp
//
//  Created by Jonathan Garcia on 14/12/2019.
//  Copyright © 2019 Jonathan. All rights reserved.
//

#import "BaseViewModel.h"

@class InstallmentCellViewModel;

@interface InstallmentsViewModel : BaseViewModel

@property (nonatomic, strong) NSArray * _Nullable cellViewModels;
@property (nonatomic) NSInteger numberOfCells;

- (void)getInstallments;
- (InstallmentCellViewModel *_Nullable)getCellViewModel:(NSUInteger)index;

@end
