//
//  OilDetailViewcontroller.h
//  OilPrices
//
//  Created by dong xin on 12-12-17.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>


@class OilPrice;
@interface OilDetailViewcontroller : UIViewController

@property(nonatomic, retain) OilPrice *oilPrice;
@property (retain, nonatomic) IBOutlet UIButton *provinceButton;

@end
