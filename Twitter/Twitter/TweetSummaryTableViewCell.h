//
//  TweetSummaryTableViewCell.h
//  Twitter
//
//  Created by Yanfeng Ma on 9/23/16.
//  Copyright © 2016 Yanfeng Ma. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Tweet.h"

@interface TweetSummaryTableViewCell : UITableViewCell

@property (weak, nonatomic) Tweet* tweet;

- (void)setTweet:(Tweet*) tweet;

@end
