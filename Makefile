
data/BARCS_Data_used_for_paper.sav :
	wget -O - https://ndownloader.figshare.com/files/7512949 > $@


.PHONY : clean
clean :
	rm data/*
