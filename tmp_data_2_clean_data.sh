#!/bin/sh
cat tmp_data/*ash2-3*/Len*/*.paired1 >clean_data/ash2-3_R1.fastq
cat tmp_data/*ash2-3*/Len*/*.paired2 >clean_data/ash2-3_R2.fastq
cat tmp_data/*ash2-input-3*/Len*/*.paired1 >clean_data/ash2-input-3_R1.fastq
cat tmp_data/*ash2-input-3*/Len*/*.paired2 >clean_data/ash2-input-3_R2.fastq
