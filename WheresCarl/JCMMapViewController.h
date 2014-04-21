//
//  JCMMapViewController.h
//  WheresCarl
//
//  Created by Noah Carnahan, Nick Jones, and Will Martin on 4/13/14.
//
//

#import <UIKit/UIKit.h>
#import "MapKit/MapKit.h"
#import "JCMTabBarViewController.h"
#import "JCMCheckInViewController.h"
#import "constants.h"

@interface JCMMapViewController : UIViewController <MKMapViewDelegate>

- (IBAction)unwindToViewAllCheckins:(UIStoryboardSegue *)segue;

@end
