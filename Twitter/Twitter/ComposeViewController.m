//
//  ComposeViewController.m
//  Twitter
//
//  Created by Yanfeng Ma on 9/21/16.
//  Copyright © 2016 Yanfeng Ma. All rights reserved.
//

#import "ComposeViewController.h"
#import "User.h"
#import "Tweet.h"
#import "TwitterClient.h"
#import <SDWebImage/UIImageView+WebCache.h>

@interface ComposeViewController ()<UITextViewDelegate>
@property (weak, nonatomic) IBOutlet UIImageView *userImageView;
@property (weak, nonatomic) IBOutlet UILabel *userName;
@property (weak, nonatomic) IBOutlet UILabel *userScreenName;
@property (weak, nonatomic) IBOutlet UITextView *textField;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *berifView;

@property (weak, nonatomic) IBOutlet UILabel *placeHolder;

@end

@implementation ComposeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [[self.textField layer] setBorderColor:[[UIColor grayColor] CGColor]];
    [[self.textField layer] setBorderWidth:2.3];
    [[self.textField layer] setCornerRadius:15];
    
    self.textField.delegate = self;
    // Do any additional setup after loading the view.
    User* user = [User currentUser];
    self.userName.text = [user name];
    self.userScreenName.text = [user screenname];
    [self.userImageView sd_setImageWithURL:[NSURL URLWithString:[user profileLargeImageUrl]] placeholderImage:[UIImage imageNamed:@"placeholder.png"]];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/
- (IBAction)onTweet:(UIBarButtonItem *)sender {
    Tweet *tweet = [[Tweet alloc] initWithText:self.textField.text replyToTweet:nil];
    
    [[TwitterClient sharedInstance] sendTweetWithParams:nil tweet:tweet completion:^(NSString *tweetIdStr, NSError *error) {
        if (error) {
            NSLog(@"Error sending tweet: %@", tweet);
        } else {
            NSLog(@"Tweet successful, tweet id_str: %@", tweetIdStr);
            tweet.idStr = tweetIdStr;
        }
    }];
}


- (void)textViewDidChange:(UITextView *)textView {
    if ([textView hasText]) {
        self.placeHolder.hidden = YES;
    }
    else {
        self.placeHolder.hidden = NO;
    }
    
    self.berifView.title = [NSString stringWithFormat:@"%lu", (unsigned long)textView.text.length];
}
@end
