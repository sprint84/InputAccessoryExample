//
//  DetailViewController.h
//  InputAccessoryExample
//
//  Created by Guilherme Moura on 10/7/14.
//  Copyright (c) 2014 Reefactor, Inc. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ContainerView.h"

@interface DetailViewController : UIViewController <UITableViewDataSource, UITableViewDelegate>

@property (weak, nonatomic) IBOutlet ContainerView *containerView;
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (weak, nonatomic) IBOutlet UIView *customInputView;
@property (weak, nonatomic) IBOutlet UITextField *inputTextField;

- (IBAction)sendButtonPressed:(id)sender;
@end

