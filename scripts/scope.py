import csv

with open('../stp2.csv') as csvfile:

    str = ""
    while str.strip() != "Data:":
        str = csvfile.readline()

    spamreader = csv.reader(csvfile, delimiter=',', quotechar='|')
    
    title = next(spamreader)
    #for i,v in enumerate(title):
    #    print (i,v)

    for row in spamreader:
        #XXX Note 0000f000 01eba88d 2422 a8b5 1662 271

        checksum1 = row[69].strip()
        checksum2 = row[102].strip()
        checksum3 = row[119].strip()
        memory_access_cnt = row[136].strip()
        video_x = row[169].strip()
        video_y = row[183].strip()
        
        print(f"XXX Note {memory_access_cnt} {checksum1} {checksum2} {checksum3} {video_x} {video_y}")