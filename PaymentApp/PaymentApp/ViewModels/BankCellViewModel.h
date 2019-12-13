//
//  BankCellViewModel.h
//  PaymentApp
//
//  Created by Jonathan Garcia on 13/12/2019.
//  Copyright © 2019 Jonathan. All rights reserved.
//

#import "BaseViewModel.h"
#import "CardIssuerModel.h"

@interface BankCellViewModel : BaseViewModel

@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) NSString *urlImage;

- (instancetype)initWithModel:(CardIssuerModel *)model;

@end
