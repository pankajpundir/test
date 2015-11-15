cimport numpy as np
import numpy as np
import cython
from cython.parallel import prange

@cython.boundscheck(False)
def calculate_z(np.ndarray[double complex, ndim=1] q, int maxiter, np.ndarray[double complex, ndim=1] z):
    """Pure python with complex datatype, iterating over list of q and z"""
    cdef unsigned int i
    cdef unsigned int iteration
    cdef double zx, zy, qx, qy, zx_new, zy_new

    cdef np.ndarray[int, ndim=1] output = np.empty(dtype='i', shape=(len(q)))
    cdef unsigned int lengthq = len(q)

    # openMP variant (multithreaded at the OS level)
    #for i in prange(lengthq, nogil=True):
    #for i in prange(lengthq, nogil=True, schedule='dynamic'):
    # normal Python version (single threaded)
    for i in range(lengthq):
        zx = z[i].real # need to extract items using dot notation
        zy = z[i].imag
        qx = q[i].real
        qy = q[i].imag

        for iteration in range(maxiter):
            zx_new = (zx * zx - zy * zy) + qx
            zy_new = (zx * zy + zy * zx) + qy
            # must assign after else we're using the new zx/zy in the fla
            zx = zx_new
            zy = zy_new
            if (zx*zx + zy*zy) > 4.0:
                output[i] = iteration
                break
    return output


