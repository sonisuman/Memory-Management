//
//  GameBoard.c
//  PointersExample
//
//  Created by Soni Suman on 09/01/20.
//  Copyright © 2020 Soni Suman. All rights reserved.
//

#include "GameBoard.h"

const char * CreateCurrentScoreText(GameBoard *gameBoard) {
    char *outText;
    asprintf(&outText, "P1 | P2\n%3d|%3d", gameBoard->p1Score, gameBoard->p2Score);
    return outText;
}
