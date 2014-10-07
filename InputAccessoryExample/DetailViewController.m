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
}

- (BOOL)canBecomeFirstResponder
{
    return YES;
}

- (UIView *)inputAccessoryView
{
    return self.customInputView;
}

- (IBAction)sendButtonPressed:(id)sender
{
    [self.objects addObject:self.inputTextField.text];
    [self.tableView reloadData];
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
    NSLog(@">>> View dealloc with success!");
}

@end
