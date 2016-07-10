//
//  Song.m
//  prog1
//
//  Created by Corey Wiley on 7/6/16.
//  Copyright © 2016 Corey Wiley. All rights reserved.
//

#import "Song.h"

@implementation Song
@synthesize title, artist, album, duration;

-(id) initSongTitle:(NSString *)theTitle andArtist:(NSString *)theArtist andAlbum:(NSString *)theAlbum andDuration:(NSString *)theDuration
{
    self = [super init];
    
    if (self) {
    
        self.title = theTitle;
        self.artist = theArtist;
        self.album = theAlbum;
        self.duration = theDuration;
    }
    
    return self;
}

-(id) init
{
    return [self initSongTitle:@"Title" andArtist:@"Artist" andAlbum:@"Album" andDuration:@"Duration"];
}


@end
