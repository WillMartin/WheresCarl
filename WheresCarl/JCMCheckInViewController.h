//
//  JCMCheckInViewController.h
//  WheresCarl
//
//  Created by Noah Carnahan, Nick Jones, and Will Martin on 4/13/14.
//
//

#import <UIKit/UIKit.h>
#import "JCMCheckIn.h"

// Implements Location Manager (a protocol) which defines methods for receiving/reacting
// to CLLocationManager object
@interface JCMCheckInViewController : UIViewController <CLLocationManagerDelegate>

@property JCMCheckIn *currentCheckIn;

@end
