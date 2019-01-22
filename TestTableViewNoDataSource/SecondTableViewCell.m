//
//  SecondTableViewCell.m
//  TestTableViewNoDataSource
//
//  Created by ys on 2019/1/22.
//  Copyright © 2019 mg. All rights reserved.
//

#import "SecondTableViewCell.h"

@implementation SecondTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [_firstTF resignFirstResponder];
    [_secondTF resignFirstResponder];
}

- (void)dealloc
{
    NSLog(@"todo -- 我挂了");
}

@end
