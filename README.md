<!-- GETTING STARTED -->
# Introduction
A multiome analysis of sn-RNA and sn-ATAC of hypothalamus cells.
![](https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEiuFsV6P6c5qbv6h8i4YCnqSBZzGzb59-mMON2BUR-pfIbVo1vjq3f4-BmkkpK1u8LWYWhYSNh6lVbHhfK0QPpuJxYzwBMRgtuGtQkudszAC-UhP1X7Bpg8dT8ffOXUBelJ0W_n4ekKkPD77O1rGy6zLnzQtplJ-DfGixBchvvGffWwmZjt1LqQLZxP5ec/s11600/Figure_Hypothalamus_3.png)

# Test data
Two hypotlamus samples from mouse [1] were used as test data, each contaning both RNA and ATAC.

# Goals
The main goal is to identify hypothalamus celltypes and investigate sub-population. The bioinformatics goal is to adapt Seurat [2] piepeline to be used in samples of hypothalamus.

#  Analysis
### Quality control
![](https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEgscA9dYsOLuoRLlwRgy_UotYX6TgAjv0TAgS4jbXBi0Qa01Ybnt_fpQGKA9Mh7neWJodtCm8nVrr3SW8qv3yl53jC4FcNrGxJ3STtC3cZazpoA948amr5d_eV1vH0GoHRkevw-QXTokzgTWaTggwaisbK13lj3sP3KVOZKqbqsunN5MYGNS9bYamkTDRc/s5669/plot_VlnPlot_multiome_rna_atac.png)

### Merging samples
Computational performance of two ways for merging the samples were analysed, the first aggregating sample with cellranger aggr. The second using Serat function merge.
![](https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEiRRiUq-rF_ePp4cU2obk5zRtZ6b0RFbBrtvtnFeq_DLuzZ1gFOUEFBpYTrlEya9wPWfl7dcNtPgM2trXw9SnJeQl6flGU4cSekk2zo9IMaJ-qSAz-WH9DjuvItnVGg540B8nbL5fs37NAH_JFaxedc4-TPOLOCmLUYPqqtzw0lnCeOWe02p9lBmRjTyhQ/s3779/DimPlot_comparisson_aggr_combined.png)

### Analysis of RNA, ATAC and multimodal RNA+ATAC samples
A reference RNA expression map was used (top left figure) to identify the celltypes. Anchor cells were used to annotate ATAC map and to transfer annotation to multimodal RNA+ATAC map.
![](https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEj7ZjmkAGlaVnro5rji3ynMWDHu8B28bdrcMmrV42YLuAEADUWC4yqxlx8GCivVDFWZYYA5DkxycIjnLwVZWBiZc73dz0cSl4LWfsqFcIp3m1PtytUqE_Vn_6Pi7IlUlEmW22d2NmJLglDWd_6-CUO-4TBcLwKHSMR8c7IVzlHsdRnTXfWJFSG4L5Ll73s/s1600/WhatsApp%20Image%202023-11-30%20at%2005.39.52.jpeg)

### sn-RNA-seq exp. and sn-ATAC-seq peak track for celltypes
All celltypes were considered for analysis as well as the corresponding markers identifying each. Noteworthy, Pdgfra is a good marker for OPCs in this testdata.
![](https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEiyAKrkkNiN4apyHcn6M32WX2vGaKSaRKkmUEhf_Vm-O_pYWEYcD8FmxvMTh1fqAtSSraad94VBg-rqKWGHbr6Y7gUks78BqjN8T0cLnW-_wFfd9i929YDrjV-TLbzyNNktVM81PPFWhas-u4ce3RD8BMWAtt6eRAdIdFsFoh-YYzsdVO9_ZsabZGXqctQ/s1600/WhatsApp%20Image%202023-12-08%20at%2004.09.56%20(1).jpeg)

### UMAPs of neuronal cells
We next investigated sub-popualations of neuronal cells. In the paper describind the data [1], authors described 33 neuronal su-bpopulations using 6 mouse samples and 100% of the filtered cells. In our test case, ~17 clusters are seen.
![](https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEj0ekzzRaYkGnAkd3jzQ6TQR8q9qe4glYkTivGz-j9RuqxhGdJYv524U4rUJgHuqVPfTaKadqs4aAMRYhoO9NlqNb4SMCqciVU5LpdblkoN2jSbtkWwSkRyfWzWAWdmo5eNSPaLs0Ui1fxl_CcOPXVuK8RZU2VkGN5QoHobBNrMsMYZdNilomAYS7zo7b0/s1600/WhatsApp%20Image%202023-12-06%20at%2012.34.52%20(1).jpeg)

### Clusters of neuronal cells
Neuronal cells were sublected for clusterring and further investigation.
![](https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEj-QNdCjidcGhZUtM8cs5LxGCiVdqEBRRdzgaBbQDRSeXGi2P4ai_lgY89Kxk13lwFDYiFP04gdvZddP_bQuQhd48NbMRQui8TV-xFD_UwM2yS325TTIx6wc8o42xwaTMxm3n-hf6O0pq4hhp_Xd7qQwCkZYs1ozy5ALJAWn2PNs7mCMEfZW3bjxs-Cxy0/s1600/WhatsApp%20Image%202023-12-06%20at%2015.49.02.jpeg)

### sn-RNA-seq exp. and sn-ATAC-seq peak track for neuronal clusters
Neuronal sub-poppulations were investigated for magnocellular population using markers Oxt, Avp and Caprin2. Interesting, clusters 9 and 10 show both, differential ATAC peaks and differential RNA expr.
![](https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEjFYH9giY0Cr217eXCMdLjweQT8F78zZh6q8dVhVBzwUyy2wpl9C3D_HNo-FY9fk8JG_4iWrF12xExHqWwcFIp7Oxqp7JoeCFmQZ4P8gHa-pxLXNGAhGDt6gcWP66CQUT91WYd5jE9OMSil5ZGqadYpfun7WE_tu2cbf-p4RF9LOrr2hx9LgSDlTYsIdEM/s1600/WhatsApp%20Image%202023-12-07%20at%2007.32.07%20(1).jpeg)

### Investigating magnocellular population among neuronal cells
Noteworthy, clusters 9 and 10 can be considered for further investigation for magnocellular populations.
![](https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEiXiMA9LU7fJzyhbbaiexFzwh2pv2SKeC2PsBLLXuWrCcMOgYn9yXAhk3dV3nwHbxuQ5iuMf8ZYtPgic2AYTK3n0Ah-3fJ6kpLrEgCxPmHReUqrTcPySmWj1GbVt89FEzfPLTtUufzNLZGVg7lmba9Y7rkJnuUufKAUhh9MR3YzsULhB7rcRrzyyd4IwCw/s1600/WhatsApp%20Image%202023-12-07%20at%2011.03.33.jpeg)

### References 
[1] Integrative single-cell characterization of hypothalamus sex-differential and obesity-associated genes and regulatory elements HP Nguyen, CSY Chan, DL Cintron, R Sheng, L Harshman, M Nobuhara, A Ushiki, C Biellak… bioRxiv, 2022•biorxiv.org
[2] Seurat. Integrated analysis of multimodal single-cell data. Cell. Yuhan Hao et. al.
