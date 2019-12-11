//
//  PaymentMethodModel.h
//  PaymentApp
//
//  Created by Jonathan Garcia on 10/12/2019.
//  Copyright © 2019 Jonathan. All rights reserved.
//

#import "BaseJSONModel.h"
#import "SettingModel.h"

@protocol PaymentMethodModel;

@interface PaymentMethodModel : BaseJSONModel

@property (nonatomic, strong) NSString<Optional> *id;
@property (nonatomic, strong) NSString<Optional> *name;
@property (nonatomic, strong) NSString<Optional> *paymentTypeId;
@property (nonatomic, strong) NSString<Optional> *status;
@property (nonatomic, strong) NSString<Optional> *secureThumbnail;
@property (nonatomic, strong) NSString<Optional> *thumbnail;
@property (nonatomic, strong) NSString<Optional> *deferredCapture;
@property (nonatomic, strong) NSArray <Optional, SettingModel> *settings;
@property (nonatomic, strong) NSArray <Optional> *additionalInfoNeeded;
@property (nonatomic, strong) NSNumber<Optional> *minAllowedAmount;
@property (nonatomic, strong) NSNumber<Optional> *maxAllowedAmount;
@property (nonatomic, strong) NSNumber<Optional> *accreditationTime;
@property (nonatomic, strong) NSArray <Optional> *financialInstitutions;
@property (nonatomic, strong) NSArray <Optional> *processingModes;

@end
