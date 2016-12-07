#!/usr/bin/perl

use strict;
use warnings;
use Bio::KBase::workspace::ScriptHelpers qw(printObjectInfo get_ws_client workspace workspaceURL parseObjectMeta parseWorkspaceMeta printObjectMeta);
use Bio::KBase::fbaModelServices::ScriptHelpers qw(get_ws_objects_list fbaws get_fba_client runFBACommand universalFBAScriptCode );

my $procindex = $ARGV[0];
my $numprocs = $ARGV[1];
my $fba = get_fba_client();

my $genomes = [qw(
59310.6
148942.4
186103.3
193567.3
205921.4
208435.3
218495.5
370552.4
373153.25
386894.6
406563.6
453364.9
467705.8
482234.3
487213.3
487214.3
487214.5
497738.3
525379.3
545774.3
568813.3
699248.3
742820.3
760745.3
760760.3
760780.3
760794.3
760801.3
760802.3
760806.3
760808.3
760810.3
760815.3
760820.3
760842.3
760848.3
760856.3
760860.3
760862.3
760877.3
760881.3
760887.3
760888.3
764298.3
764299.3
767463.3
864567.3
864569.5
869304.3
873448.3
873449.3
875093.3
876138.3
883168.3
888746.3
888808.3
888816.3
888821.3
888833.3
889201.3
904293.3
904294.3
904306.3
914138.3
914139.3
914144.3
981540.3
997356.4
1005041.3
1005705.3
1005706.3
1010840.4
1035184.3
1046629.4
1054460.4
1069533.5
1069623.3
1074106.3
1095738.3
1105115.3
1105238.3
1105257.3
1105266.3
1105281.3
1114965.3
1123301.3
1123302.3
1123303.3
1123304.3
1123306.3
1123308.3
1123309.3
1123312.3
1130804.3
1131627.3
1154794.3
1154800.3
1154805.3
1154809.3
1154810.3
1154811.3
1154815.3
1154824.3
1154830.3
1154832.3
1154833.3
1154839.3
1154840.3
1154842.3
1154857.3
1154878.3
1154897.3
1154912.3
1154928.3
1154955.3
1159082.3
1159085.3
1159088.3
1159092.3
1184252.3
1203670.3
1207545.3
1257042.3
1282664.3
1297534.3
1297857.3
1302863.3
1316583.3
1215915.3
333990.5
565653.4
1234409.3
638301.3
1090974.4
592026.3
655812.3
314315.12
883081.3
908337.3
)];

for (my $i=0; $i < @{$genomes}; $i++) {
	my $value = $i-$procindex;
	if (($value % $numprocs) == 0) {
		my $output = $fba->genome_to_workspace({
			genome => $genomes->[$i],
			workspace => "chenry:QualitativeGapfillingStudy",
			source => "seed"
	   	});
		printObjectInfo($output);
		$output = $fba->genome_to_fbamodel({
			genome => $genomes->[$i],
			workspace => "chenry:QualitativeGapfillingStudy",
			model => $genomes->[$i].".model"
	   	});
		printObjectInfo($output);
	}
}