//
//  OilDetailViewcontroller.m
//  OilPrices
//
//  Created by dong xin on 12-12-17.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "OilDetailViewcontroller.h"
#import "OilPrice.h"

@implementation OilDetailViewcontroller
@synthesize oilPrice = _oilPrice;
@synthesize provinceButton = _provinceButton;


- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];

    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];

    NSLog(@"%@", self.oilPrice.province);
    [_provinceButton setTitle:self.oilPrice.province forState:UIControlStateNormal];
}

- (void)viewDidUnload
{
    [self setProvinceButton:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

- (void)dealloc {
    [_provinceButton release];
    [super dealloc];
}
@end
