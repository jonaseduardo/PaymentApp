//
//  InstallmentCellViewModel.h
//  PaymentApp
//
//  Created by Jonathan Garcia on 14/12/2019.
//  Copyright © 2019 Jonathan. All rights reserved.
//

#import "BaseViewModel.h"
#import "PayerCostsModel.h"

@interface InstallmentCellViewModel : BaseViewModel

- (instancetype)initWithModel:(PayerCostsModel *)model;

@property (nonatomic, strong) NSString *cuota;
@property (nonatomic, strong) NSString *cft;

@end
