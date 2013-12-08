//
//  ADViewController.h
//  OilPrices
//
//  Created by dong xin on 12-12-17.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ADViewController : UIViewController
{
    NSMutableArray *_objects;
}
@property (retain, nonatomic) IBOutlet UITableView *tableView;
@end
