from cpython cimport array

def update_connected(items, connected, int N):
    cols = {items[idx] for idx in connected}
    connected = {i for i in range(N) if items[i] in cols}
    return connected
    

def colors_or(l_left, l_right):
    
    cdef int[:] left = array.array('i', l_left)
    cdef int[:] right = array.array('i', l_right)
    
    cdef int N
    
    N = len(left)

    todo = [True] * N
    
    for idx in range(N):
        if not todo[idx]:
            continue
        
        connected = {idx}
        prev_size = 1
        
        for it in range(N):
            connected = update_connected(right, connected,
                                         N)
            connected = update_connected(left, connected,
                                         N)            
            size = len(connected)
            if size == prev_size:
                l_col = left[idx]
                r_col = right[idx]
                for i in connected:
                    left[i] = l_col
                    right[i] = r_col
                    todo[i] = False
                break
            prev_size = size
    return left

