# MLSP2017_bird_seg
"RENYI ENTROPY BASED MUTUAL INFORMATION FOR SEMI-SUPERVISED BIRD ´
VOCALIZATION SEGMENTATION"

A semi-supervised algorithm to segment bird vocalizations using matrix factorization and
Renyi entropy based mutual information is implemented. 

Singular value decomposition (SVD) is applied on pooled time-frequency
representations of bird vocalizations to learn basis vectors.
By utilizing only a few of the bases, a compact feature representation
is obtained for input test data. Renyi entropy ´
based mutual information is calculated between feature representations
of consecutive frames. After some simple postprocessing,
a threshold is used to reliably distinguish bird
vocalizations from other sounds. The algorithm is evaluated
on the field recordings of different bird species and different
SNR conditions. The results highlight the effectiveness of the
proposed method in all SNR conditions, improvements over
other methods, and its generality.


Dependencies: 
1) voicebox

Acknowledgement: Thanks to Will Dwinnell for providing Mutual Information code.


Dictionary used in code (see demo.m) is the left singular vector matrix of the pooled frames of bird vocalization regions of the training spectrogram. (Files not included due to licensing issues) 
