from cpython cimport array

import numpy as np

from numpy cimport ndarray, int64_t

cpdef ndarray[int64_t] update_connected(ndarray[int64_t] items, connected,
                     int[:] cols, int N):
    cdef int idx
    
    cols[:] = 0
    for idx in connected:
        cols[items[idx]] = 1
    connected = {i for i in range(N) if cols[items[i]]}
    a_connected = np.array(list(connected), dtype='int')
    return a_connected
    

cpdef _colors_or(ndarray[int64_t] left,
                ndarray[int64_t] right):
    
    cdef:
        int[:] cols = array.array('i', right)
        int N
    
    N = len(left)

    todo = np.ones(N)
    
    for idx in range(N):
        if not todo[idx]:
            continue
        
        connected = {idx}
        prev_size = 1
        
        for it in range(N):
            connected = update_connected(right, connected,
                                         cols,
                                         N)
            connected = update_connected(left, connected,
                                         cols,
                                         N)            
            size = len(connected)
            if size == prev_size:
                l_col = left[idx]
                r_col = right[idx]
                a_connected = np.array(list(connected),
                                       dtype='int')
                left[a_connected] = l_col
                right[a_connected] = r_col
                todo[a_connected] = False
                break
            prev_size = size
    return left

def colors_or(l_left, l_right):
    left = np.array(l_left, dtype='int')
    right = np.array(l_right, dtype='int')
    return _colors_or(left, right)
