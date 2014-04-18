//
//  JCMCheckIn.h
//  WheresCarl
//
//  Created by Noah Carnahan on 4/13/14.
//
//

#import <Foundation/Foundation.h>
#import "MapKit/MapKit.h"

@interface JCMCheckIn : NSObject

@property NSString *name;
@property NSString *message;
@property NSString *time;
@property CLLocationCoordinate2D location;

-(NSString *)description;

@end
