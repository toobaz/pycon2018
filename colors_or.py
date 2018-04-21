def colors_or(left, right):
    left = list(left)
    right = list(right)
    
    N = len(left)

    todo = [True] * N
    
    for idx in range(N):
        if not todo[idx]:
            continue
        
        connected = {idx}
        prev_size = 1
        
        for it in range(N):
            r_cols = {right[idx] for idx in connected}
            connected = {i for i in range(N) if right[i] in r_cols}
            
            l_cols = {left[idx] for idx in connected}
            connected = {i for i in range(N) if left[i] in l_cols}
            
            size = len(connected)
            if size == prev_size:
                l_col = l_cols.pop()
                r_col = r_cols.pop()
                for i in connected:
                    left[i] = l_col
                    right[i] = r_col
                    todo[i] = False
                break
            prev_size = size
    return left
