//
//  JCMCheckIn.h
//  WheresCarl
//
//  Created by Noah Carnahan, Nick Jones, and Will Martin on 4/13/14.
//
//

#import <Foundation/Foundation.h>
#import "MapKit/MapKit.h"

@interface JCMCheckIn : NSObject <NSCoding>

@property NSString *name;
@property NSString *message;
@property NSDate *time;
@property CLLocationCoordinate2D location;

-(NSString *)description;

@end
