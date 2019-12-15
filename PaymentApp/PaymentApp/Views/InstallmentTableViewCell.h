//
//  InstallmentTableViewCell.h
//  PaymentApp
//
//  Created by Jonathan Garcia on 14/12/2019.
//  Copyright © 2019 Jonathan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface InstallmentTableViewCell : UITableViewCell

@property (strong, nonatomic) IBOutlet UILabel *feeLabel;
@property (strong, nonatomic) IBOutlet UILabel *cftLabel;

@end
