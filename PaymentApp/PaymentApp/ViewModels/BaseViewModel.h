//
//  BaseViewModel.h
//  PaymentApp
//
//  Created by Jonathan Garcia on 13/12/2019.
//  Copyright © 2019 Jonathan. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BaseViewModel : NSObject

@property (nonatomic, strong) NSString * _Nullable title;

@property (nonatomic, copy, nullable) void (^reloadTableView)(void);
@property (nonatomic, copy, nullable) void (^error)(NSString *_Nullable);

@end
