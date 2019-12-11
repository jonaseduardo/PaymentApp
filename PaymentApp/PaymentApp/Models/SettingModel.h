//
//  SettingModel.h
//  PaymentApp
//
//  Created by Jonathan Garcia on 11/12/2019.
//  Copyright © 2019 Jonathan. All rights reserved.
//

#import "BaseJSONModel.h"

@class CardNumber;
@class Bin;
@class SecurityCode;

@protocol SettingModel;

@interface SettingModel : BaseJSONModel

@property (nonatomic, strong) CardNumber<Optional> *cardNumber;
@property (nonatomic, strong) Bin<Optional> *bin;
@property (nonatomic, strong) SecurityCode<Optional> *securityCode;

@end

@interface CardNumber : BaseJSONModel

@property (nonatomic, strong) NSString<Optional> *validation;
@property (nonatomic, strong) NSNumber<Optional> *length;

@end

@interface Bin : BaseJSONModel

@property (nonatomic, strong) NSString<Optional> *pattern;
@property (nonatomic, strong) NSString<Optional> *installments_pattern;
@property (nonatomic, strong) NSString<Optional> *exclusion_pattern;

@end

@interface SecurityCode : BaseJSONModel

@property (nonatomic, strong) NSNumber<Optional> *length;
@property (nonatomic, strong) NSString<Optional> *cardLocation;
@property (nonatomic, strong) NSString<Optional> *mode;

@end
