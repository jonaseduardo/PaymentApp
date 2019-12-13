//
//  PaymentMethodTableViewCell.h
//  PaymentApp
//
//  Created by Jonathan Garcia on 12/12/2019.
//  Copyright © 2019 Jonathan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PaymentMethodTableViewCell : UITableViewCell

@property (strong, nonatomic) IBOutlet UIImageView *paymentImageView;
@property (strong, nonatomic) IBOutlet UILabel *nameLabel;
@property (strong, nonatomic) IBOutlet UILabel *typeLabel;

@end
