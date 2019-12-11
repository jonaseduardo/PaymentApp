//
//  PayerCostsModel.h
//  PaymentApp
//
//  Created by Jonathan Garcia on 11/12/2019.
//  Copyright © 2019 Jonathan. All rights reserved.
//

#import "BaseJSONModel.h"

@protocol PayerCostsModel;

@interface PayerCostsModel : BaseJSONModel

@property (nonatomic, strong) NSNumber<Optional> *installments;
@property (nonatomic, strong) NSNumber<Optional> *installmentRate;
@property (nonatomic, strong) NSNumber<Optional> *discountRate;
@property (nonatomic, strong) NSString<Optional> *reimbursementRate;
@property (nonatomic, strong) NSArray<Optional> *labels;
@property (nonatomic, strong) NSArray<Optional> *installmentRateCollector;
@property (nonatomic, strong) NSNumber<Optional> *minAllowedAmount;
@property (nonatomic, strong) NSNumber<Optional> *maxAllowedAmount;
@property (nonatomic, strong) NSString<Optional> *recommendedMessage;
@property (nonatomic, strong) NSNumber<Optional> *installmentAmount;
@property (nonatomic, strong) NSNumber<Optional> *totalAmount;
@property (nonatomic, strong) NSString<Optional> *paymentMethodOptionId;

@end
