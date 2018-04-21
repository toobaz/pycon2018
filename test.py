COLORI = 900
CITIES = 1000

import random
random.seed(157)

left = [random.randint(0, COLORI-1) for i in range(CITIES)]
right = [random.randint(0, COLORI-1) for i in range(CITIES)]

