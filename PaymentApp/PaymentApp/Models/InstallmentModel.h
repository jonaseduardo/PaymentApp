//
//  InstallmentModel.h
//  PaymentApp
//
//  Created by Jonathan Garcia on 10/12/2019.
//  Copyright © 2019 Jonathan. All rights reserved.
//

#import "BaseJSONModel.h"
#import "CardIssuerModel.h"
#import "PayerCostsModel.h"

@interface InstallmentModel : BaseJSONModel

@property (nonatomic, strong) NSString<Optional> *paymentMethodId;
@property (nonatomic, strong) NSString<Optional> *paymentTypeId;
@property (nonatomic, strong) CardIssuerModel<Optional> *issuer;
@property (nonatomic, strong) NSString<Optional> *processing_mode;
@property (nonatomic, strong) NSString<Optional> *merchantAccountId;
@property (nonatomic, strong) NSArray<Optional, PayerCostsModel> *payerCosts;
@property (nonatomic, strong) NSString<Optional> *agreements;

@end
