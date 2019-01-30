
	declare -a sentences=("gato")

		

	for sent in "${sentences[@]}"
	do
		echo -e ${sent}$"\t\t"$(echo ${sent} | lt-proc esp-eng.automorf.bin |   gawk 'BEGIN{RS="$"; FS="/";}{nf=split($1,COMPONENTS,"^"); for(i = 1; i<nf; i++) printf COMPONENTS[i]; if($2 != "") printf("^%s$",$2);}' |   apertium-transfer apertium-esp-eng.esp-eng.t1x esp-eng.t1x.bin esp-eng.autobil.bin  |   lt-proc -g esp-eng.autogen.bin)

