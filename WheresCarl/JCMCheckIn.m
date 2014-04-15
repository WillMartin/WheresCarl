//
//  JCMCheckIn.m
//  WheresCarl
//
//  Created by Noah Carnahan on 4/13/14.
//
//

#import "JCMCheckIn.h"

@implementation JCMCheckIn

-(NSString *)description
{
    return [NSString stringWithFormat: @"Name: %@; Message: %@; Lat: %f; Long: %f; Time: ",
            self.name, self.message, self.location.latitude, self.location.longitude];
}

@end
