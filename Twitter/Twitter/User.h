//
//  User.h
//  Twitter
//
//  Created by Yanfeng Ma on 9/19/16.
//  Copyright © 2016 Yanfeng Ma. All rights reserved.

#import <Foundation/Foundation.h>
#import "BDBOAuth1RequestOperationManager.h"

extern NSString * const UserDidLoginNotification;
extern NSString * const UserDidLogoutNotification;

@interface User : NSObject

@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) NSString *screenname;
@property (nonatomic, strong) NSString *profileImageUrl;
@property (nonatomic, strong) NSString *profileBiggerImageUrl;
@property (nonatomic, strong) NSString *profileLargeImageUrl;
@property (nonatomic, strong) NSString *tagline;
@property (nonatomic, strong) NSString *backgroundImageUrl;
@property (nonatomic, strong) NSString *bannerUrl;
@property (nonatomic) NSInteger tweetCount;
@property (nonatomic) NSInteger friendCount;
@property (nonatomic) NSInteger followerCount;

- (id)initWithDictionary:(NSDictionary *)dictionary;

+ (User *)currentUser;
+ (void)setCurrentUser:(User *)currentUser;
+ (NSArray *)accounts;

+ (void)removeUser:(User *)user;
+ (void)logout;
+ (void)storeToken:(BDBOAuthToken *)token;

@end
