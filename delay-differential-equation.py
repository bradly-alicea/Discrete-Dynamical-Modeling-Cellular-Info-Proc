import numpy as np
pip install diffeqpy
from diffeqpy import dde

def ddex1de(t, y, Z):
    """
    Python 3 version of the ddex1de function for DDE solving.
    y: Current state vector
    Z: Matrix where Z[:, 0] is the first lag and Z[:, 1] is the second lag
    """
    # ylag1 corresponds to Z(:,1) in MATLAB (0-indexed in Python)
    ylag1 = Z[:, 0]
    # ylag2 corresponds to Z(:,2) in MATLAB
    ylag2 = Z[:, 1]
    
    # Define the derivatives
    dy0 = ylag1[0]
    dy1 = ylag1[0] + ylag2[1] # ylag2(2) in MATLAB is ylag2[1] in Python
    dy2 = y[1]                # y(2) in MATLAB is y[1] in Python
    
    return np.array([dy0, dy1, dy2])
