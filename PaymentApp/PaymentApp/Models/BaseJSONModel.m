//
//  BaseJSONModel.m
//  PaymentApp
//
//  Created by Jonathan Garcia on 10/12/2019.
//  Copyright © 2019 Jonathan. All rights reserved.
//

#import "BaseJSONModel.h"

@implementation BaseJSONModel

+(JSONKeyMapper*)keyMapper {
    return [JSONKeyMapper mapperForSnakeCase];
}

@end
