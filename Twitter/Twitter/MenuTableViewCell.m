//
//  MenuTableViewCell.m
//  Twitter
//
//  Created by Yanfeng Ma on 9/19/16.
//  Copyright © 2016 Yanfeng Ma. All rights reserved.
//

#import "MenuTableViewCell.h"

@interface MenuTableViewCell ()
@property (weak, nonatomic) IBOutlet UILabel *menuItem;

@end

@implementation MenuTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    // Configure the view for the selected state
}

- (void)setName:(NSString*) name {
    self.menuItem.text = name;
}
@end
