//
//  DTPlayer.m
//  Deathtroid
//
//  Created by Per Borgman on 10/7/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import "DTPlayer.h"

@implementation DTPlayer

@synthesize name;
@synthesize entity;
@synthesize proto;
@synthesize room;
-(NSString*)description;
{
	return $sprintf(@"<DTPlayer '%@' in %@ running %@ over %@>", name, room, entity, proto);
}
@end
