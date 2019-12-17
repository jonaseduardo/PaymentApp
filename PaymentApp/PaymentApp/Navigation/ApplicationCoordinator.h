//
//  ApplicationCoordinator.h
//  PaymentApp
//
//  Created by Jonathan Garcia on 16/12/2019.
//  Copyright © 2019 Jonathan. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "Coordinator.h"

@interface ApplicationCoordinator : NSObject <Coordinator>

- (instancetype)initWithUIWindow:(UIWindow *)window;

@end
