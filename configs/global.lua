SCREEN_SCALE_FACTOR = 2

VIRTUAL_WIDTH = 384
VIRTUAL_HEIGHT = 270

WINDOW_WIDTH = VIRTUAL_WIDTH * SCREEN_SCALE_FACTOR
WINDOW_HEIGHT = VIRTUAL_HEIGHT * SCREEN_SCALE_FACTOR

row1 = {1,1,1,2,2,3,1,3,2,3,1,1}
row2 = {1,2,3,2,2,3,1,4,1,3,1,1}
row3 = {1,1,4,2,2,3,1,1,1,1,1,1}
row4 = {1,1,1,1,2,3,1,3,4,1,1,1}
row5 = {1,3,1,2,4,1,1,3,2,3,1,1}
map = {}
map[1] = row1
map[2] = row2
map[3] = row3
map[4] = row4
map[5] = row5