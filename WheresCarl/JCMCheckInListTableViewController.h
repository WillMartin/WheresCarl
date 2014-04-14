//
//  JCMCheckInListTableViewController.h
//  WheresCarl
//
//  Created by Noah Carnahan on 4/13/14.
//
//

#import <UIKit/UIKit.h>
#import "JCMCheckInViewController.h"
#import "JCMTabBarViewController.h"

@interface JCMCheckInListTableViewController : UITableViewController
- (IBAction)unwindToViewAllCheckins:(UIStoryboardSegue *)segue;
@end
