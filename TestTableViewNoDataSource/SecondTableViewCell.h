//
//  SecondTableViewCell.h
//  TestTableViewNoDataSource
//
//  Created by ys on 2019/1/22.
//  Copyright © 2019 mg. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface SecondTableViewCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UITextField *firstTF;
@property (weak, nonatomic) IBOutlet UITextField *secondTF;

@end

NS_ASSUME_NONNULL_END
