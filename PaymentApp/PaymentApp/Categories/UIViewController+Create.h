//
//  UIViewController+Create.h
//  PaymentApp
//
//  Created by Jonathan Garcia on 16/12/2019.
//  Copyright © 2019 Jonathan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIViewController (Create)

+ (UIViewController *)instanceFromStoryBoard;
+ (UIViewController *)instanceFromStoryBoard:(NSString *)storyBoardName;

@end
