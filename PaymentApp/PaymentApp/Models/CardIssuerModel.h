//
//  CardIssuerModel.h
//  PaymentApp
//
//  Created by Jonathan Garcia on 10/12/2019.
//  Copyright © 2019 Jonathan. All rights reserved.
//

#import "BaseJSONModel.h"

@protocol CardIssuerModel @end

@interface CardIssuerModel : BaseJSONModel

@property (nonatomic, strong) NSString<Optional> *id;
@property (nonatomic, strong) NSString<Optional> *name;
@property (nonatomic, strong) NSString<Optional> *secureThumbnail;
@property (nonatomic, strong) NSString<Optional> *thumbnail;
@property (nonatomic, strong) NSString<Optional> *processingMode;
@property (nonatomic, strong) NSString<Optional> *merchantAccountId;

@end
