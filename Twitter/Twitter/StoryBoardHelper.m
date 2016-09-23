//
//  StoryBoardHelper.m
//  Twitter
//
//  Created by Yanfeng Ma on 9/23/16.
//  Copyright © 2016 Yanfeng Ma. All rights reserved.
//

#import "StoryBoardHelper.h"

@implementation StoryBoardHelper

+(id) getMenuViewController {
    UIStoryboard* storyBoard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    return [storyBoard instantiateViewControllerWithIdentifier:@"MenuViewController"];
}

+(id) getLoginViewController {
    UIStoryboard* storyBoard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    return [storyBoard instantiateViewControllerWithIdentifier:@"LoginViewController"];
}

+(id) getProfileViewController {
    UIStoryboard* storyBoard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    return [storyBoard instantiateViewControllerWithIdentifier:@"navigationController"];
}

@end
