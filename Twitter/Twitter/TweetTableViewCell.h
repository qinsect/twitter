//
//  TweetTableViewCell.h
//  Twitter
//
//  Created by Yanfeng Ma on 9/20/16.
//  Copyright © 2016 Yanfeng Ma. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Tweet.h"

@class TweetTableViewCell;

@protocol TweetCellDelegate <NSObject>

- (void)onReply:(TweetTableViewCell *)tweetCell;
- (void)onProfile:(User *)user;

@end

// delegate

@interface TweetTableViewCell : UITableViewCell
@property (strong, nonatomic) Tweet* tweet;

-(void) setTweet:(Tweet*) tweet;

@end
