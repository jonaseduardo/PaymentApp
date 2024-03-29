//
//  PaymentMethodCellViewModel.h
//  PaymentApp
//
//  Created by Jonathan Garcia on 12/12/2019.
//  Copyright © 2019 Jonathan. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BaseViewModel.h"
#import "PaymentMethodModel.h"

@interface PaymentMethodCellViewModel : BaseViewModel

@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) NSString *paymentType;
@property (nonatomic, strong) NSString *urlImage;

@property (nonatomic, strong) NSString *paymentMethodId;

- (instancetype)initWithModel:(PaymentMethodModel *)model;

@end
