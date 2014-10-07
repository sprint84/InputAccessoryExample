//
//  DetailViewController.m
//  InputAccessoryExample
//
//  Created by Guilherme Moura on 10/7/14.
//  Copyright (c) 2014 Reefactor, Inc. All rights reserved.
//

#import "DetailViewController.h"

@interface DetailViewController ()
@property NSMutableArray *objects;
@end

@implementation DetailViewController

#pragma mark - Managing the detail item

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.objects = [NSMutableArray arrayWithArray:@[@"Message 1", @"Message 2", @"Message 3", @"Message 4", @"Message 5", @"Message 6", @"Message 7", @"Message 8", @"Message 9", @"Message 10", @"Message 11", @"Message 12", @"Message 13"]];
    
    [self becomeFirstResponder];
    
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(GT_keyboardWillShow:) name:UIKeyboardWillShowNotification object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(GT_keyboardWillHide:) name:UIKeyboardWillHideNotification object:nil];
    
    self.containerView.customInputView = self.customInputView;
    [self.containerView becomeFirstResponder];
}

- (IBAction)sendButtonPressed:(id)sender
{
    [self.objects addObject:self.inputTextField.text];
    self.inputTextField.text = @"";
    [self.tableView reloadData];
}

#pragma mark - Notifications
- (void)GT_keyboardWillShow:(NSNotification *)notification
{
    [self GT_showKeyboardWithInfo:notification.userInfo];
}

- (void)GT_keyboardWillHide:(NSNotification *)notification
{
    [self GT_showKeyboardWithInfo:notification.userInfo];
}

- (void)GT_showKeyboardWithInfo:(NSDictionary *)info
{
    CGRect keyboardFrame = [info[UIKeyboardFrameEndUserInfoKey] CGRectValue];
    
    CGFloat viewHeight = CGRectGetHeight(self.view.frame);
    CGFloat targetBottomSpace = viewHeight - CGRectGetMinY(keyboardFrame);
    UIEdgeInsets contentInsets = self.tableView.contentInset;
    contentInsets = UIEdgeInsetsMake(contentInsets.top, contentInsets.left, targetBottomSpace, contentInsets.right);
    self.tableView.contentInset = contentInsets;
    self.tableView.scrollIndicatorInsets = contentInsets;
}

#pragma mark - Table View

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.objects.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"MessageCell" forIndexPath:indexPath];
    
    cell.textLabel.text = self.objects[indexPath.row];
    return cell;
}

- (void)dealloc
{
    [[NSNotificationCenter defaultCenter] removeObserver:self name:UIKeyboardWillShowNotification object:nil];
    [[NSNotificationCenter defaultCenter] removeObserver:self name:UIKeyboardWillHideNotification object:nil];
    
    NSLog(@">>> View dealloc with success!");
}

@end
