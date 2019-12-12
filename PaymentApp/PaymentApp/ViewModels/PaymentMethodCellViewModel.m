//
//  PaymentMethodCellViewModel.m
//  PaymentApp
//
//  Created by Jonathan Garcia on 12/12/2019.
//  Copyright © 2019 Jonathan. All rights reserved.
//

#import "PaymentMethodCellViewModel.h"

@implementation PaymentMethodCellViewModel

- (instancetype)initWithModel:(PaymentMethodModel *)model {
    
    self = [super init];
    if(self) {
        self.name = model.name;
        self.paymentType = model.paymentTypeId;
        self.urlImage = model.secureThumbnail;
    }
    return self;
}

@end
