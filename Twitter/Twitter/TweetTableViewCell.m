//
//  TweetTableViewCell.m
//  Twitter
//
//  Created by Yanfeng Ma on 9/20/16.
//  Copyright © 2016 Yanfeng Ma. All rights reserved.
//

#import "TweetTableViewCell.h"
#import <SDWebImage/UIImageView+WebCache.h>

@interface TweetTableViewCell ()
@property (weak, nonatomic) IBOutlet UITextView *tweetTextView;
@property (weak, nonatomic) IBOutlet UIImageView *userViewImage;

@property (weak, nonatomic) IBOutlet UILabel *userName;
@property (weak, nonatomic) IBOutlet UILabel *screenName;
@property (weak, nonatomic) IBOutlet UILabel *dateLabel;

@property (weak, nonatomic) IBOutlet UIButton *retweetBtn;
@property (weak, nonatomic) IBOutlet UIButton *likeBtn;

@end

@implementation TweetTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:NO animated:animated];
    // Configure the view for the selected state
}

-(void) setTweet:(Tweet*) tweet {
    _tweet = tweet;
    
    self.tweetTextView.text = [tweet text];
    [self.userViewImage sd_setImageWithURL:[NSURL URLWithString:[tweet user].profileBiggerImageUrl] placeholderImage:[UIImage imageNamed:@"placeholder.png"]];
    
    CALayer *backgrondImage = [self.userViewImage layer];
    [backgrondImage setCornerRadius:6.0];
    [backgrondImage setBorderColor:[[UIColor whiteColor] CGColor]];
    [backgrondImage setBorderWidth:1.0];
    [backgrondImage setMasksToBounds:YES];
    
    _userName.text = [[tweet user] name];
    _screenName.text = [[tweet user] screenname];
    
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setLocale:[[NSLocale alloc] initWithLocaleIdentifier:@"en_US_POSIX"]];
    // Thu, 29 Jul 2010 14:58:42 GMT+00:00
    [dateFormatter setDateFormat:@"d/MM/yyyy HH:mm:ss"];
    [dateFormatter setTimeZone:[NSTimeZone timeZoneForSecondsFromGMT:0]];
    _dateLabel.text = [dateFormatter stringFromDate:[tweet createdAt]];
}

- (IBAction)onReply:(UIButton *)sender {
}

- (IBAction)onRetweet:(id)sender {
    if ([self.tweet retweeted]) {
        [_retweetBtn setImage:[UIImage imageNamed:@"retweet"] forState:UIControlStateNormal];
        _tweet.retweeted = NO;
    }
    else {
        [_retweetBtn setImage:[UIImage imageNamed:@"retweet_on"] forState:UIControlStateNormal];
        _tweet.retweeted = YES;
    }        
}

- (IBAction)onLike:(id)sender {
    if ([self.tweet favorited]) {
        [self.likeBtn setImage:[UIImage imageNamed:@"favorite"] forState:UIControlStateNormal];
        self.tweet.favorited = NO;
    }
    else {
        [self.likeBtn setImage:[UIImage imageNamed:@"favorite_on"] forState:UIControlStateNormal];
        self.tweet.favorited = YES;
    }
}

@end
