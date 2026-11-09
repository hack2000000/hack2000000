import cv2, sys, numpy as np
out, ids = sys.argv[1], sys.argv[2:]
rows=[]
for v in ids:
    ims=[]
    for f in ['hqdefault','hq1','hq2','hq3']:
        im=cv2.imread(f'fr/{v}_{f}.jpg'); im = np.zeros((360,480,3),np.uint8) if im is None else cv2.resize(im,(480,360))
        ims.append(im)
    rows.append(np.hstack(ims))
cv2.imwrite(out, cv2.resize(np.vstack(rows),(1440, 270*len(ids))))
