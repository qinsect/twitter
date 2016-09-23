//
//  Tweet.h
//  Twitter
//
//  Created by Yanfeng Ma on 9/19/16.
//  Copyright © 2016 Yanfeng Ma. All rights reserved.


#import <Foundation/Foundation.h>
#import "User.h"

@interface Tweet : NSObject

@property (nonatomic, strong) NSString *text;
@property (nonatomic, strong) NSDate *createdAt;
@property (nonatomic, strong) User *user;
@property (nonatomic) NSInteger retweetCount;
@property (nonatomic) NSInteger favoriteCount;
@property (nonatomic) BOOL retweeted;
@property (nonatomic) BOOL favorited;
@property (nonatomic, strong) NSString *idStr;
@property (nonatomic, strong) NSString *replyToIdStr;
@property (nonatomic, strong) NSString *retweetIdStr;
@property (nonatomic, strong) Tweet *retweetedTweet;

- (id) initWithDictionary:(NSDictionary *)dictionary;
- (id) initWithText:(NSString *)text replyToTweet:(Tweet *)replyToTweet;
- (BOOL) retweet;
- (BOOL) favorite;

+ (NSArray *)tweetsWithArray:(NSArray *)array;

@end
