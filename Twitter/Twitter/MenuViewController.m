//
//  MenuTableViewController.m
//  Twitter
//
//  Created by Yanfeng Ma on 9/19/16.
//  Copyright © 2016 Yanfeng Ma. All rights reserved.
//

#import "MenuViewController.h"
#import "MenuTableViewCell.h"
#import "StoryBoardHelper.h"

@interface MenuViewController ()
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (weak, nonatomic) IBOutlet UIView *contentView;

@property (nonatomic, assign) BOOL isOpenMenu;
@property (nonatomic, strong) NSArray *viewControllerList;
@property (nonatomic, assign) CGPoint orignalCenter;
@end

@implementation MenuViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    [self.view addSubview:_tableView];
    [self.view addSubview:_contentView];
    
    _viewControllerList = [self buildViewControllerList];
    
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    self.isOpenMenu = NO;
    
    [self setViewController:[_viewControllerList objectAtIndex:0]];
    // close the menu
    [self.contentView setCenter:CGPointMake(self.tableView.bounds.size.width/2, self.contentView.bounds.size.height/2)];
    
    // set footer view
    UIView* view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, [_tableView bounds].size.width, 10)];
    [view setBackgroundColor:[UIColor grayColor]];
    _tableView.tableFooterView = view;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 3;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    MenuTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"MenuTableViewCell" forIndexPath:indexPath];
    
    if (indexPath.row == 0) {
        [cell setName:@"Profile"];
    }
    else if (indexPath.row == 1) {
        [cell setName:@"TimeLine"];
    }
    else {
        [cell setName:@"Mentions"];
    }
    [cell setBackgroundColor:[UIColor grayColor]];
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 100;
//    UITextView *textView = [[UITextView alloc] init];
//    
//    CGFloat textViewHeight = [self heightForTextView:textView withItem:tableView];
//    CGFloat heightPadding = tweet.isRetweet ? 20 : 0; // (overhead)
//    heightPadding += 25 + 27 + 25; // (actions + user + extra)
//    
//    return textViewHeight + heightPadding;
}

//- (CGFloat)heightForTextView:(UITextView *)textView withItem:(IDZTweet *)item
//{
//    if (item) {
//        [textView setAttributedText:[[NSAttributedString alloc] initWithString:item.text]];
//    }
//    
//    CGRect screenRect = [[UIScreen mainScreen] bounds];
//    CGFloat width = [self isPortraitOrientation] ? screenRect.size.width : screenRect.size.height;
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

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    [self setViewController:[_viewControllerList objectAtIndex:indexPath.row]];
}

#pragma mark - MenuBar

- (void)openMenu {
    [UIView animateWithDuration:1 animations: ^{
        [self.contentView setCenter:CGPointMake(self.tableView.bounds.size.width/2 + 100, self.contentView.bounds.size.height/2)];
    }];
}

- (void)closeMenu {
    [UIView animateWithDuration:1 animations: ^{
         [self.contentView setCenter:CGPointMake(self.tableView.bounds.size.width/2, self.contentView.bounds.size.height/2)];
    }];
}

- (IBAction)onPen:(id)sender {
    
    CGPoint velocity = [sender velocityInView:self.contentView];
//    CGPoint location = [sender locationInView:self.tableView];
    CGPoint translation = [sender translationInView:self.contentView];
    
    // get gesture state
    if ([(UIPanGestureRecognizer*)sender state] == UIGestureRecognizerStateBegan) {
        _orignalCenter = [self.contentView center];
    }
    else if ([(UIPanGestureRecognizer*)sender state] == UIGestureRecognizerStateChanged) {
        if (translation.x + _orignalCenter.x >= self.contentView.bounds.size.width/2 && translation.x + _orignalCenter.x <= self.contentView.bounds.size.width - 20) {
            [self.contentView setCenter:CGPointMake(translation.x + _orignalCenter.x, self.contentView.center.y)];
        }
    }
    else if ([(UIPanGestureRecognizer*)sender state] == UIGestureRecognizerStateEnded) {
        if (velocity.x > 0) {
            [self openMenu];
        }
        else {
            [self closeMenu];
        }
    }
    
    self.isOpenMenu ^= YES;
}

#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}

#pragma mark - Helper

- (void)setViewController:(UIViewController*) viewController {
    viewController.view.frame = self.contentView.bounds;
    [self addChildViewController:viewController];
    [self.contentView addSubview:viewController.view];
    [self didMoveToParentViewController:self];
    
}

-(NSArray*) buildViewControllerList {
    NSMutableArray* array = [NSMutableArray arrayWithCapacity:3];
    [array addObject:[StoryBoardHelper getProfileViewController]];
    [array addObject:[StoryBoardHelper getProfileViewController]];
    [array addObject:[StoryBoardHelper getProfileViewController]];
    return array;
}

@end
