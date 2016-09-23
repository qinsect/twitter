//
//  ProfileViewController.m
//  Twitter
//
//  Created by Yanfeng Ma on 9/20/16.
//  Copyright © 2016 Yanfeng Ma. All rights reserved.
//

#import "ProfileViewController.h"
#import "User.h"
#import "TwitterClient.h"
#import "ProfileTableViewCell.h"
#import "TweetTableViewCell.h"
#import "TweetDetailViewController.h"

@interface ProfileViewController ()

@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (nonatomic, strong) User* user;
@property (nonatomic, strong) NSArray* tweets;
@property (nonatomic, strong) UIRefreshControl* refreshControl;

@end

@implementation ProfileViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    [self.view addSubview:self.tableView];
    
    self.tableView.estimatedRowHeight = 100;
    self.tableView.rowHeight = UITableViewAutomaticDimension;
    
    self.refreshControl = [[UIRefreshControl alloc] init];
    self.refreshControl.attributedTitle = [[NSAttributedString alloc] initWithString:NSLocalizedString(@"Pull to Refresh", @"Pull to Refresh")];
    [self.refreshControl addTarget:self action:@selector(onRefresh) forControlEvents:UIControlEventValueChanged];
    [self.tableView insertSubview:self.refreshControl atIndex:0];
    
    // Do any additional setup after loading the view.
    self.user = [User currentUser];
    [self refeshData];
}

- (void) onRefresh {
    [self refeshData];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void) refeshData {
    [[TwitterClient sharedInstance] userTimelineWithParams:nil user:self.user completion:^(NSArray *tweets, NSError *error) {
        if (error) {
            NSLog(@"%@", [NSString stringWithFormat:@"Error getting user timeline, too many requests?: %@", error]);
        } else {
            self.tweets = tweets;
            [self.tableView reloadData];
        }
    }];
}

#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if([segue.identifier isEqualToString:@"DetailTweet"]) {
        UITableViewCell* cell = sender;
        NSIndexPath* indexPath = [_tableView indexPathForCell:cell];
        UINavigationController *nc = segue.destinationViewController;
        TweetDetailViewController *vc = nc.topViewController;
        vc.tweet = [self.tweets objectAtIndex:indexPath.row - 1];
    }
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.tweets count] + 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if (indexPath.row == 0) {
        ProfileTableViewCell* cell = [tableView dequeueReusableCellWithIdentifier:@"ProfileTableViewCell" forIndexPath:indexPath];
        [cell setUser:self.user];
        return cell;
    }
    else {
        TweetTableViewCell* cell = [tableView dequeueReusableCellWithIdentifier:@"TweetTableViewCell" forIndexPath:indexPath];
        cell.tweet = [self.tweets objectAtIndex:indexPath.row - 1];
        return cell;
    }
    
    return nil;
}

//- (CGFloat)heightForTextView:(UITextView *)textView withItem:(Tweet*) item {
//    if (item) {
//        [textView setAttributedText:[[NSAttributedString alloc] initWithString:item.text]];
//    }
//    CGRect screenRect = [[UIScreen mainScreen] bounds];
//    CGFloat width = screenRect.size.width;//  : screenRect.size.height; [self isPortraitOrientation] ?
//    width -= 64;//84;
//
//    textView.dataDetectorTypes = UIDataDetectorTypeLink;
//    CGRect textRect = [textView.text boundingRectWithSize:CGSizeMake(width, MAXFLOAT)
//                                                  options:NSStringDrawingUsesLineFragmentOrigin
//                                               attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:14]}
//                                                  context:nil];
//
//    return textRect.size.height;
//}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.row == 0) {
        return 150;
    }
    else {
        return 100;
//        Tweet* tweet = [self.tweets objectAtIndex:indexPath.row + 1];
//    
//        UITextView *textView = [[UITextView alloc] init];
//    
//        CGFloat textViewHeight = [self heightForTextView:textView withItem:tweet];
//        CGFloat heightPadding = 25 + 27 + 8;
//        return textViewHeight + heightPadding;
    }
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

@end
