//
//  ProfileTableViewCell.m
//  Twitter
//
//  Created by Yanfeng Ma on 9/20/16.
//  Copyright © 2016 Yanfeng Ma. All rights reserved.
//

#import "ProfileTableViewCell.h"
#import "UIImageView+AFNetworking.h"
#import <SDWebImage/UIImageView+WebCache.h>

@interface ProfileTableViewCell ()
@property (weak, nonatomic) IBOutlet UILabel *userName;
@property (weak, nonatomic) IBOutlet UILabel *screenName;
@property (weak, nonatomic) IBOutlet UILabel *numOfTweets;
@property (weak, nonatomic) IBOutlet UILabel *numOfFollowing;
@property (weak, nonatomic) IBOutlet UILabel *numOfFollowers;
@property (weak, nonatomic) IBOutlet UIImageView *userImage;
@property (weak, nonatomic) IBOutlet UIImageView *backgroundImage;
@end

@implementation ProfileTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setUser:(User*) user {
    CALayer *userImagelayer = [self.userImage layer];
    [userImagelayer setCornerRadius:6.0];
    [userImagelayer setBorderColor:[[UIColor whiteColor] CGColor]];
    [userImagelayer setBorderWidth:3.0];
    [userImagelayer setMasksToBounds:YES];

    self.userName.text = [user name];
    self.screenName.text = [NSString stringWithFormat:@"@%@", [user screenname]];
    self.numOfTweets.text = [NSString stringWithFormat:@"%ld", (long)[user tweetCount]];
    self.numOfFollowers.text = [NSString stringWithFormat:@"%ld", (long)[user followerCount]];
    self.numOfFollowing.text = [NSString stringWithFormat:@"%ld", (long)[user friendCount]];
    
    [self.userImage sd_setImageWithURL:[NSURL URLWithString:[user profileLargeImageUrl]] placeholderImage:[UIImage imageNamed:@"placeholder.png"]];
    [self.backgroundImage sd_setImageWithURL:[NSURL URLWithString:[user bannerUrl]] placeholderImage:[UIImage imageNamed:@"placeholder.png"]];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:NO animated:animated];
    // Configure the view for the selected state
}

@end
