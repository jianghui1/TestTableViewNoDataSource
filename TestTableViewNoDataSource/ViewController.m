//
//  ViewController.m
//  TestTableViewNoDataSource
//
//  Created by ys on 2019/1/22.
//  Copyright © 2019 mg. All rights reserved.
//

#import "ViewController.h"

#import "FirstTableViewCell.h"
#import "SecondTableViewCell.h"

@interface ViewController ()

@property (nonatomic, strong) UITableView *tableView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self addTableView];
    [self addFirstTableViewCell];
    [self addSecondTableViewCell];
}

- (void)addTableView
{
    self.tableView = [[UITableView alloc] initWithFrame:self.view.bounds];
    _tableView.backgroundColor = [UIColor colorWithRed:233 / 255.0 green:233 / 255.0 blue:233 / 255.0 alpha:1];
    _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    [self.view addSubview:_tableView];
}

- (void)addFirstTableViewCell
{
    FirstTableViewCell *firstCell = [[[NSBundle mainBundle] loadNibNamed:NSStringFromClass([FirstTableViewCell class])
                                                                   owner:nil
                                                                 options:nil]
                                     firstObject];
    firstCell.frame = CGRectMake(0, 100, self.view.frame.size.width, 60);
    [_tableView addSubview:firstCell];
}

- (void)addSecondTableViewCell
{
    SecondTableViewCell *secondCell = [[[NSBundle mainBundle] loadNibNamed:NSStringFromClass([SecondTableViewCell class])
                                                                     owner:nil
                                                                   options:nil]
                                       firstObject];
    secondCell.frame = CGRectMake(0, 200, self.view.frame.size.width, 60);
    [_tableView addSubview:secondCell];
}

@end
