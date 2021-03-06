//
//  DTEntityRipper.m
//  Deathtroid
//
//  Created by Per Borgman on 10/8/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import "DTEntityRipper.h"

#import "Vector2.h"
#import "DTWorld.h"

@implementation DTEntityRipper

-(id)init;
{
    if(!(self = [super init])) return nil;
    
    self.maxHealth = self.health = 5;
    self.destructible = YES;
    
    speed = 2;
    self.gravity = false;
    
    self.velocity.x = speed;
    self.moveDirection = EntityDirectionRight;
    self.collisionType = EntityCollisionTypeStop;
        
    return self;
}

-(void)didCollideWithWorld:(DTTraceResult*)info;
{
	[super didCollideWithWorld:info];
    self.moveDirection = self.lookDirection = self.moveDirection == EntityDirectionRight ? EntityDirectionLeft : EntityDirectionRight;
    if(self.moveDirection == EntityDirectionLeft) self.velocity.x = -speed;
    else self.velocity.x = speed;
}

@end
