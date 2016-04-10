//
//  ApplicationTableViewCell.h
//  IWMTest
//
//  Created by Trevor Doodes on 10/04/2016.
//  Copyright © 2016 Trevor Doodes. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface IWMApplicationTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UILabel *categoryLabel;
@property (weak, nonatomic) IBOutlet UILabel *artistLabel;
@property (weak, nonatomic) IBOutlet UIImageView *photoImageView;

@end
