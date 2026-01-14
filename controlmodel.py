import numpy as np

def controlmodel(TLT, TST):
    # Convert inputs to numpy arrays if they aren't already
    TLT = np.array(TLT)
    TST = np.array(TST)
    
    # a = number of rows, b = number of columns
    a, b = TLT.shape
    
    # 1. Normalization (using vectorized slicing)
    # TLT_2: Subtract first column from all subsequent columns and negate
    TLT_2 = -1 * (TLT[:, [0]] - TLT[:, 1:])
    TST_2 = -1 * (TST[:, [0]] - TST[:, 1:])

    # 2. Feedforward (FF) Component
    # FF(i,j) = abs(TLT-TST) where TLT > TST, else 0
    FF = np.where(TLT > TST, np.abs(TLT - TST), 0)

    # 3. Feedback (FB) Component
    # Note: MATLAB i+1 becomes i:i+1 in Python (0-indexed)
    # We slice to align i and i+1 indices
    FB = np.zeros((a, b))
    mask_fb = TLT[:-1, :] > TST[1:, :]
    FB[:-1, :][mask_fb] = np.abs(TLT[:-1, :][mask_fb] - TST[1:, :][mask_fb])

    # 4. Sink for Transcriptome (SINK_TST)
    SINK_TST = np.zeros((a, b))
    mask_sink_tst = TST[1:, :] < TST[:-1, :]
    SINK_TST[:-1, :][mask_sink_tst] = np.abs(TST[1:, :][mask_sink_tst] - TST[:-1, :][mask_sink_tst])

    # 5. Sink for TLT (SINK_TLT)
    SINK_TLT = np.zeros((a, b))
    mask_sink_tlt = TLT[1:, :] < TLT[:-1, :]
    SINK_TLT[:-1, :][mask_sink_tlt] = np.abs(TLT[1:, :][mask_sink_tlt] - TLT[:-1, :][mask_sink_tlt])

    return FF, FB, SINK_TST, SINK_TLT
