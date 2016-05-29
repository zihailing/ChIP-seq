#!/bin/sh
grep -v 'Distal Intergenic' ChIPseeker_annotation_ash2-3_15_function.txt|cut -f 11|sort|uniq >gene_list_ash2-3_15.txt
