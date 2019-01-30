
all : esp-eng.automorf.bin \
      esp-eng.autogen.bin \
      esp-eng.autobil.bin \
      esp-eng.t1x.bin \
      eng-esp.automorf.bin \
      eng-esp.autogen.bin \
      eng-esp.autobil.bin

esp-eng.automorf.bin : apertium-esp.esp.dix
	lt-comp lr apertium-esp.esp.dix esp-eng.automorf.bin

esp-eng.autogen.bin : apertium-eng.eng.dix
	lt-comp rl apertium-eng.eng.dix esp-eng.autogen.bin

eng-esp.automorf.bin : apertium-eng.eng.dix
	lt-comp lr apertium-eng.eng.dix eng-esp.automorf.bin

eng-esp.autogen.bin : apertium-esp.esp.dix
	lt-comp rl apertium-esp.esp.dix eng-esp.autogen.bin

esp-eng.autobil.bin : apertium-esp-eng.esp-eng.dix
	lt-comp lr apertium-esp-eng.esp-eng.dix esp-eng.autobil.bin

eng-esp.autobil.bin : apertium-esp-eng.esp-eng.dix
	lt-comp rl apertium-esp-eng.esp-eng.dix eng-esp.autobil.bin

esp-eng.t1x.bin : apertium-esp-eng.esp-eng.t1x
	apertium-preprocess-transfer apertium-esp-eng.esp-eng.t1x esp-eng.t1x.bin

.PHONY : clean
clean :
	-rm *.bin

.PHONY : check
check :
	bash tests.sh
