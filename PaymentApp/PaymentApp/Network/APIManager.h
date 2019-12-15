//
//  APIManager.h
//  PaymentApp
//
//  Created by Jonathan Garcia on 10/12/2019.
//  Copyright © 2019 Jonathan. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface APIManager : NSObject

- (void)doRequest:(NSString *)path parameters:(NSDictionary *)parameters response:(void (^)(id _Nullable, NSError * _Nullable))response;

@end
