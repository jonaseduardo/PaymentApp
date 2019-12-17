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

@property (nonatomic, strong) NSString *fee;
@property (nonatomic, strong) NSString *cft;

- (instancetype)initWithModel:(PayerCostsModel *)model;


@end
