//
//  UIViewController+Create.m
//  PaymentApp
//
//  Created by Jonathan Garcia on 16/12/2019.
//  Copyright © 2019 Jonathan. All rights reserved.
//

#import "UIViewController+Create.h"

@implementation UIViewController (Create)

+ (UIViewController *)instanceFromStoryBoard {
    return [UIViewController instanceFromStoryBoard:@"Main"];
}

+ (UIViewController *)instanceFromStoryBoard:(NSString *)storyBoardName {
    
    UIStoryboard *mystoryboard = [UIStoryboard storyboardWithName:storyBoardName bundle:nil];
    UIViewController *vc = [mystoryboard instantiateViewControllerWithIdentifier:NSStringFromClass(self.class)];

    return vc;
}

@end
