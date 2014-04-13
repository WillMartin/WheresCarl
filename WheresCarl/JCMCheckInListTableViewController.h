//
//  JCMCheckInListTableViewController.h
//  WheresCarl
//
//  Created by  on 4/11/14.
//  Copyright (c) 2014 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "JCMCheckInViewController.h"
#import "JCMTabBarViewController.h"

@interface JCMCheckInListTableViewController : UITableViewController

- (IBAction)unwindToList:(UIStoryboardSegue *)segue;

@end
