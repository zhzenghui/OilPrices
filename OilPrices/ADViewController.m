//
//  ADViewController.m
//  OilPrices
//
//  Created by dong xin on 12-12-17.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "ADViewController.h"

#import "OilDetailViewcontroller.h"


#import "TFHpple.h"
#import "Tutorial.h"
#import "Contributor.h"
#import "OilPrice.h"

@implementation ADViewController
@synthesize tableView = _tableView;

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Release any cached data, images, etc that aren't in use.
}



- (void)loadContributors {
    // 1
    NSURL *contributorsUrl = [NSURL URLWithString:@"http://www.raywenderlich.com/"];
    NSData *contributorsHtmlData = [NSData dataWithContentsOfURL:contributorsUrl];
    
    // 2
    TFHpple *contributorsParser = [TFHpple hppleWithHTMLData:contributorsHtmlData];
    
    // 3
    NSString *contributorsXpathQueryString = @"//div[@id='contributors']/div[@id='moderator']/a";
    NSArray *contributorsNodes = [contributorsParser searchWithXPathQuery:contributorsXpathQueryString];
    
    // 4
    NSMutableArray *newContributors = [[NSMutableArray alloc] initWithCapacity:0];
    for (TFHppleElement *element in contributorsNodes) {
        // 5
        Contributor *contributor = [[Contributor alloc] init];
        [newContributors addObject:contributor];
        
        // 6
        contributor.url = [element objectForKey:@"href"];
        
        // 7
        for (TFHppleElement *child in element.children) {
            if ([child.tagName isEqualToString:@"img"]) {
                // 8
                contributor.imageUrl = [child objectForKey:@"src"];
            } else if ([child.tagName isEqualToString:@"p"]) {
                // 9
                contributor.name = [[child firstChild] content];
            }
        }
    }
    
    // 10
//    _contributors = newContributors;
//    [self.tableView reloadData];
    
    for (Contributor *cont in newContributors) {
            
        NSLog(@"%@", cont.name);
    }
    
}



- (void)loadOil {
    // 1
    NSURL *contributorsUrl = [NSURL URLWithString:@"http://db.duowan.com/lushi"];
    NSData *contributorsHtmlData = [NSData dataWithContentsOfURL:contributorsUrl];
    
    // 2
    TFHpple *contributorsParser = [TFHpple hppleWithHTMLData:contributorsHtmlData];
    

    // 3 表头信息
//    NSString *contributorsXpathQueryString = @"//div[@class='oilTableOut']/table[@class='oilTable']/thead/tr/td";
//    NSArray *contributorsNodes = [contributorsParser searchWithXPathQuery:contributorsXpathQueryString];

    // 4
    NSMutableArray *newContributors = [[NSMutableArray alloc] initWithCapacity:0];
//
//    for (TFHppleElement *element in contributorsNodes) {
////        NSLog(@"%@", [[element firstChild] content]);
//        for (TFHppleElement *child in element.children) {
//            if ([child.tagName isEqualToString:@"q"]) {
////                NSLog(@"%@", [[child firstChild] content]);
//            }
//
//        }
//    }

    // 5
    NSString *oilContentXpathQueryString = @"//div[@class='mod-table table-gray']/table[@class='table-s3']/tbody/tr";
    NSArray *oilContributorsNodes = [contributorsParser searchWithXPathQuery:oilContentXpathQueryString];
    NSLog(@"%d", oilContributorsNodes.count);

//    int i = 0;
    
    for (TFHppleElement *element in oilContributorsNodes) {

//        if (i <= 5)   {
            
        TFHppleElement *province1 = (TFHppleElement *)[element.children objectAtIndex:0] ;
        TFHppleElement *gasoline90_1 = (TFHppleElement *)[element.children objectAtIndex:1] ;
        TFHppleElement *gasoline93_1 = (TFHppleElement *)[element.children objectAtIndex:2] ;
        TFHppleElement *gasoline97_1 = (TFHppleElement *)[element.children objectAtIndex:3] ;
        TFHppleElement *diesel0_1 = (TFHppleElement *)[element.children objectAtIndex:4] ;  
        
        TFHppleElement *province2 = (TFHppleElement *)[element.children objectAtIndex:5] ;
        TFHppleElement *gasoline90_2 = (TFHppleElement *)[element.children objectAtIndex:6] ;
        TFHppleElement *gasoline93_2= (TFHppleElement *)[element.children objectAtIndex:7] ;
        TFHppleElement *gasoline97_2 = (TFHppleElement *)[element.children objectAtIndex:8] ;
        TFHppleElement *diesel0_2 = (TFHppleElement *)[element.children objectAtIndex:9] ;  
        
        
        OilPrice *oilPrice1 = [[OilPrice alloc] init];
        oilPrice1.province = [province1.firstChild.firstChild content];
        oilPrice1.gasoline90 = [gasoline90_1.firstChild content];
        oilPrice1.gasoline93 = [gasoline93_1.firstChild content];
        oilPrice1.gasoline97 = [gasoline97_1.firstChild content];
        oilPrice1.diesel0 = [diesel0_1.firstChild content];
        
        [newContributors addObject:oilPrice1];
    
        
        OilPrice *oilPrice2 = [[OilPrice alloc] init];
        oilPrice2.province = [province2.firstChild.firstChild content];
        oilPrice2.gasoline90 = [gasoline90_2.firstChild content];
        oilPrice2.gasoline93 = [gasoline93_2.firstChild content];
        oilPrice2.gasoline97 = [gasoline97_2.firstChild content];
        oilPrice2.diesel0 = [diesel0_2.firstChild content];
        
        [newContributors addObject:oilPrice2];
        
//        }
//        if (i > 5)   {
//            
//            TFHppleElement *province = (TFHppleElement *)[element.children objectAtIndex:0] ;
//            OilPrice *oilPrice = [[OilPrice alloc] init];
//            oilPrice.province = [province.firstChild.firstChild content];
//            NSLog(@"%@", oilPrice.province);
//            [newContributors addObject:oilPrice];
//            if (i == 10) {
//                break;
//            }
//        }
//        i ++;

//        for (TFHppleElement *child  in element.children) {            
//
//            if (i <= 5)   {
//                if ([child.tagName isEqualToString:@"th"]) {
////                    NSLog(@"%@", [child.firstChild.firstChild content]);
//                    
//                }
//                else if ([child.tagName isEqualToString:@"td"]) {
////                    NSLog(@"%@", [child.firstChild content]);
//                }
//                
//                if ( i == 5) {
//                    i = 0;           
//                    NSLog(@"------------");
//                }
//            }
//        }
    }
    
    // 10 重载数据
    _objects = newContributors;
    [self.tableView reloadData];
    
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    [self loadOil];
//    [self loadContributors];
    self.title = @"www.bitauto.com/youjia/";

}

- (void)viewDidUnload
{
    [self setTableView:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
}

- (void)viewWillDisappear:(BOOL)animated
{
	[super viewWillDisappear:animated];
}

- (void)viewDidDisappear:(BOOL)animated
{
	[super viewDidDisappear:animated];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone) {
        return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
    } else {
        return YES;
    }
}


#pragma mark - Table View

- (NSString*)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    switch (section) {
        case 0:
            return @"www.bitauto.com/youjia/";
            break;
        case 1:
            return @"Contributors";
            break;
    }
    return nil;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    switch (section) {
        case 0:
            return _objects.count;
            break;
    }
    return 0;
}

// Customize the appearance of table view cells.
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:CellIdentifier];
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    }
    
     OilPrice *oilPrice = [_objects objectAtIndex:indexPath.row];
        cell.textLabel.text = oilPrice.province;
    NSString *detailString = [NSString stringWithFormat:@"汽油#90：%@,汽油#93：%@,汽油#97：%@,柴油#0：%@",oilPrice.gasoline90, oilPrice.gasoline93,oilPrice.gasoline97, oilPrice.diesel0];
        cell.detailTextLabel.text = detailString;

    
    return cell;
}

- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        [_objects removeObjectAtIndex:indexPath.row];
        [tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view.
    }
}

/*
 // Override to support rearranging the table view.
 - (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
 {
 }
 */

/*
 // Override to support conditional rearranging of the table view.
 - (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
 {
 // Return NO if you do not want the item to be re-orderable.
 return YES;
 }
 */

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    OilDetailViewcontroller *oilDetail = [[OilDetailViewcontroller alloc] init];
    oilDetail.oilPrice = [_objects objectAtIndex:indexPath.row];
    [self presentModalViewController:oilDetail animated:YES];
    [oilDetail release];
}
- (void)dealloc {
    [_tableView release];
    [super dealloc];
}
@end
