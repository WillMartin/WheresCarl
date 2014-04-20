//
//  JCMCheckIn.m
//  WheresCarl
//
//  Created by Noah Carnahan, Nick Jones, and Will Martin on 4/13/14.
//
//

#import "JCMCheckIn.h"

@implementation JCMCheckIn

-(NSString *)description
{
    return [NSString stringWithFormat: @"Name: %@; Message: %@; Lat: %f; Long: %f; Time: ",
            self.name, self.message, self.location.latitude, self.location.longitude];
}

- (id)initWithCoder:(NSCoder *)decoder {
    self = [super init];
    if (!self) {
        return nil;
    }
    
    self.name = [decoder decodeObjectForKey:@"name"];
    self.message = [decoder decodeObjectForKey:@"message"];
    float lat = [decoder decodeFloatForKey:@"latitude"];
    float lon = [decoder decodeFloatForKey:@"longitude"];
    self.location = (CLLocationCoordinate2D) { .latitude = lat, .longitude=lon};
    return self;
}

- (void)encodeWithCoder:(NSCoder *)encoder {
    [encoder encodeObject:self.name forKey:@"name"];
    [encoder encodeObject:self.message forKey:@"message"];
    [encoder encodeFloat:self.location.latitude forKey:@"latitude"];
    [encoder encodeFloat:self.location.longitude forKey:@"longitude"];
}

@end
