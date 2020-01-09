//
//  GameBoard.h
//  PointersExample
//
//  Created by Soni Suman on 09/01/20.
//  Copyright © 2020 Soni Suman. All rights reserved.
//

#ifndef GameBoard_h
#define GameBoard_h

#include <stdio.h>

typedef struct {
    int p1Score;
    int p2Score;
    
}GameBoard;

const char * CreateCurrentScoreText(GameBoard *);

#endif /* GameBoard_h */
