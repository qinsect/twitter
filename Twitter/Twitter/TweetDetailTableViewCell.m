//
//  TweetDetailTableViewCell.m
//  Twitter
//
//  Created by Yanfeng Ma on 9/23/16.
//  Copyright © 2016 Yanfeng Ma. All rights reserved.
//

#import "TweetDetailTableViewCell.h"
#import <SDWebImage/UIImageView+WebCache.h>

@interface TweetDetailTableViewCell ()
@property (weak, nonatomic) IBOutlet UIImageView *userImage;
@property (weak, nonatomic) IBOutlet UILabel *userName;
@property (weak, nonatomic) IBOutlet UILabel *screenName;
@property (weak, nonatomic) IBOutlet UITextView *textContent;
@property (weak, nonatomic) IBOutlet UILabel *timeLabel;

@end

@implementation TweetDetailTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)setTweet:(Tweet *)tweet {
    _userName.text = [[tweet user] name];
    _screenName.text = [[tweet user] screenname];

    [_userImage sd_setImageWithURL:[NSURL URLWithString:[[tweet user] profileLargeImageUrl]] placeholderImage:[UIImage imageNamed:@"placeholder.png"]];
    _textContent.text = [tweet text];
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setLocale:[[NSLocale alloc] initWithLocaleIdentifier:@"en_US_POSIX"]];
    // Thu, 29 Jul 2010 14:58:42 GMT+00:00
    [dateFormatter setDateFormat:@"d/MM/yyyy HH:mm:ss"];
    [dateFormatter setTimeZone:[NSTimeZone timeZoneForSecondsFromGMT:0]];
    _timeLabel.text = [dateFormatter stringFromDate:[tweet createdAt]];
}

@end
