//
//  JCMMapViewController.h
//  WheresCarl
//
//  Created by Noah Carnahan on 4/13/14.
//
//

#import <UIKit/UIKit.h>
#import "MapKit/MapKit.h"
#import "JCMTabBarViewController.h"
#import "JCMCheckInViewController.h"

@interface JCMMapViewController : UIViewController <MKMapViewDelegate>
- (IBAction)unwindToViewAllCheckins:(UIStoryboardSegue *)segue;
@end
