#include <stdio.h>
#include "song.h"

main()
{
    Song firstSong = make_song (210, 2004);
    Song secondSong = make_song (120, 1993);

    Song thirdSong = { 223, 1997};
    display_song (thirdSong);
}
