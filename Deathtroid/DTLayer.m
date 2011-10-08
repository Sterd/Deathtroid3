//
//  Layer.m
//  SuperJetpack
//
//  Created by Per Borgman on 1/11/09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import "DTLayer.h"

#import "DTMap.h"

@implementation DTLayer

@synthesize map;
@synthesize depth;
@synthesize currentPosition;
@synthesize autoScrollSpeed;

-(id)initWithRep:(NSDictionary*)rep;
{
    if(!(self = [super init])) return nil;

	currentPosition = [MutableVector2 vector];
	startPosition = [Vector2 vectorWithX:0. y:0.];
	
    depth = [[rep objectForKey:@"depth"]?:$num(1) floatValue];
	autoScrollSpeed = CGPointMake(0.f, 0.f);
		
	map = [[DTMap alloc] initWithRep:rep];
    
    return self;
}

-(void)tick:(float)delta {
	currentPosition.x += autoScrollSpeed.x * delta;
	currentPosition.y += autoScrollSpeed.y * delta;
	
	[self clampPosition];
}

-(void)clampPosition {
}

@end
