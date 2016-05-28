#!/bin/sh
cat tmp_data/*/*.sta >ash2-3_sequencing_1
perl ~/zihailing/tool/format_reads_report.pl ash2-3_sequencing_1 >ash2-3_sequencing_2
perl ~/zihailing/tool/sta_to_xls.pl ash2-3_sequencing_2 >ash2-3_sequencing_3
