def calculate_z_serial_purepython(list q, unsigned int maxiter, list z):
    """Pure python with complex datatype, iterating over list of q and z"""
    cdef unsigned int i
    cdef unsigned int iteration
    cdef complex zi, qi;
    cdef list output;
    
    output = [0] * len(q)
    for i in range(len(q)):
        if i % 1000 == 0:
            # print out some progress info since it is so slow...
            print "%0.2f%% complete" % (1.0/len(q) * i * 100)
        zi = z[i]
        qi = q[i]
        for iteration in range(maxiter):
            zi = zi * zi + qi
            if abs(zi) > 2.0:
                output[i] = iteration
                break
    return output
