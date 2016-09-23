//
//  TweetDetailViewController.m
//  Twitter
//
//  Created by Yanfeng Ma on 9/23/16.
//  Copyright © 2016 Yanfeng Ma. All rights reserved.
//

#import "TweetDetailViewController.h"
#import "TweetDetailTableViewCell.h"
#import "TweetSummaryTableViewCell.h"
#import "TweetActionTableViewCell.h"

@interface TweetDetailViewController () <UITableViewDataSource, UITableViewDelegate>
@property (weak, nonatomic) IBOutlet UITableView *tweetTableView;

@end

@implementation TweetDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _tweetTableView.delegate = self;
    _tweetTableView.dataSource = self;
    // Do any additional setup after loading the view.

    UIView* view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, [_tweetTableView bounds].size.width, 10)];
    [view setBackgroundColor:[UIColor whiteColor]];
    _tweetTableView.tableFooterView = view;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 3;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.row == 0) {
        TweetDetailTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"TweetDetailTableViewCell" forIndexPath:indexPath];
        [cell setTweet:_tweet];
        return cell;
    }
    else if (indexPath.row == 1) {
        TweetSummaryTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"TweetSummaryTableViewCell" forIndexPath:indexPath];
        [cell setTweet:_tweet];
        return cell;
    }
    else if (indexPath.row == 2) {
        TweetActionTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"TweetActionTableViewCell" forIndexPath:indexPath];
        [cell setTweet:_tweet];
        return cell;
    }
    else {
        UITableViewCell *cell = [[UITableViewCell alloc] init];
        return cell;
    }
    
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
//    return UITableViewAutomaticDimension;
    if (indexPath.row == 0) {
        return 200;
    }
    else if (indexPath.row == 1) {
        return 50;
    }
    else if(indexPath.row == 2){
        return 50;
    }
    else {
        return 1000;
    }
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

@end
