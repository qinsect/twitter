//
//  ProfileTableViewCell.h
//  Twitter
//
//  Created by Yanfeng Ma on 9/20/16.
//  Copyright © 2016 Yanfeng Ma. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "User.h"

@interface ProfileTableViewCell : UITableViewCell

@property (weak, nonatomic) User* user;

- (void)setUser:(User*) user;

@end
