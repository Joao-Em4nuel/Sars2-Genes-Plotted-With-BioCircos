#Load necessary packages/libraries
require(BioCircos)

#Create a list of the length of the genes to be plotted
SARS2 = list('ORF1ab' = 21555 - 266,
             'S' = 25384 - 21563,
             'ORF3a' = 26220 - 25393,
             'E' = 26472 - 26245,
             'M' = 27191 - 26523,
             'ORF6' = 27387 - 27202,
             'ORF7a' = 27759 - 27394,
             'ORF7b' = 27887 - 27756,
             'ORF8' = 28259 - 27894,
             'N' = 29533 - 28274,
             'ORF10' = 29674 - 29558)

#Identify possible nested genes to be plotted 
arcs.loc = c('ORF1ab', 'ORF1ab', 'ORF1ab', 'ORF1ab', 'ORF1ab', 'ORF1ab')
arcs.start = 	c(793 - 266, 2707 - 266, 10973 - 266, 13441 - 266, 16237 - 266, 18030 - 266)
arcs.end = c(2728 - 266, 8559 - 266, 11842 - 266, 16237 - 266, 18030 - 266, 19636 - 266)

#Identify SNPs gene location
snp.seq = c('ORF1ab', 'ORF1ab', 'ORF1ab', 'ORF1ab', 'ORF1ab', 'ORF1ab',
            'ORF1ab', 'S', 'ORF3a', 'ORF8', 'N')

#Identify SNPs aa location
snp.loc = c(1, 1, 1397 - 266, 2891 - 266, 14408 - 266,
            17746 - 266, 17857 - 266,
            23403 - 21563, 26143 - 25393, 28144 - 27894, 28881 - 28274)

#Assign different sizes to SNPs to help better visualize
snp.size = c(0, 30, 6.8, 5.9, 24.1, 6.8, 7.3, 16.8, 13.2, 10.5, 10.9)

#Define SNPs characteristics to later be plotted
snp = BioCircosSNPTrack('SNP', snp.seq,
                             snp.loc, snp.size,
                             opacities = c(0, 0, rep(1, 9)),
                             colors = c('#378abe', '#d53e50'),
                             shape = 'circle',
                             minRadius = 0.65,
                             maxRadius = 0.85,
                             size = 3)

#Identify different SNPs 
#Identify SNPs gene location
snp.seq2 = c('ORF1ab', 'ORF1ab', 'ORF1ab', 'ORF1ab', 'ORF1ab', 'ORF1ab', 'ORF1ab')

#Identify SNPs aa location
snp.loc2 = c(1, 1, 3036 - 266, 8782 - 266, 11083 - 266, 18060 - 266)

#Assign different sizes to SNPs to help better visualize
snp.size2 = c(0, 30, 26.8, 18.6, 20.5, 6.3)

#Attribute different characteristics to the second group of SNPs to help 
#in the visualization and save them with the first group of SNPs
snp = snp + BioCircosSNPTrack('SNP2', snp.seq2,
                             snp.loc2, snp.size2,
                             opacities = c(0, 0, rep(1, 4)),
                             colors = c('#378abe', '#d53e50'),
                             shape = 'rect',
                             minRadius = 0.65,
                             maxRadius = 0.85,
                             size = 5)

#Define the background track of the SNPs characteristics and save 
#them with the SNPs' characteristics
back.track = snp + BioCircosBackgroundTrack('BackTrack', 
                                             minRadius = 0.65,
                                             maxRadius = 0.85,
                                             borderColors = '#e0dcd3', 
                                             borderSize = 1, 
                                             fillColors = '#e0dcd3')

#Define the gene characteristics
arcs = BioCircosArcTrack('sars2.arcs', arcs.loc, 
                         arcs.start,
                         arcs.end,
                          colors = c('#8c510a','#d8b365','#f6e8c3','#c7eae5','#5ab4ac','#01665e'),
                          labels = c('ORF1a'),
                          minRadius = 0.90,
                          maxRadius = 0.95)

#Save the characteristics all together 
complete = back.track + arcs

#Plot
BioCircos(complete,
          genomeFillColor = c('#d53e4f', '#3288bd'),
          genome = SARS2, 
          displayGenomeBorder = TRUE,
          genomeLabelDisplay = TRUE,
          genomeLabelDy = 15,
          genomeLabelOrientation = 90,
          genomeTicksDisplay = FALSE)
