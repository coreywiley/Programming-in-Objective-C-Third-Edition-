//
//  PlayList.m
//  prog1
//
//  Created by Corey Wiley on 7/6/16.
//  Copyright © 2016 Corey Wiley. All rights reserved.
//

#import "PlayList.h"
#import "Song.h"

@implementation PlayList
@synthesize playList, name, deletable;

-(BOOL) addSong:(Song*)theSong
{
    if ([self search:theSong]) {
        return NO;
    }
    
    [playList addObject:theSong];
    return YES;
    
}

-(void) removeSong:(Song *)theSong
{
    [playList removeObject:theSong];
      
}

-(id) initWithName:(NSString *)theName andIsDeletable:(BOOL)isDeletable
{
    self = [super init];
    
    if (self) {
        name = [[NSString alloc]initWithString:theName];
        playList = [[NSMutableArray alloc]init];
        deletable = isDeletable;
    }
    
    return self;
}

-(id) init
{
    return [self initWithName:@"NoName" andIsDeletable:YES];
}

-(BOOL) search: (Song*) theSearch
{
    if([playList containsObject:theSearch])
    {
        return YES;
    }
    else
    {
        return NO;
    }
}

-(void) listAll
{
    NSLog(@"======== Contents of: %@ ========", name);
    
    
    
    for (Song *song in playList) {
        
        
        NSLog(@"%s, %s, %s, %s", [song.title UTF8String],[song.artist UTF8String],[song.album UTF8String], [song.duration UTF8String]);
    }
    
    NSLog(@"============================================");
        
 
}


-(int) count
{
    int i = 0;
    for (int j = 0; j < playList.count; j++) {
        i++;
    }
    
    return i;
}



@end
