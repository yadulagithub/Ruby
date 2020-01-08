
filename = "txnlog.dat"
firstread = true
tot_debit = 0
tot_credit = 0
tot_startauto = 0
tot_endauto = 0
pos = 0
# Read file in Binary mode
File.open(filename, "rb") do |file|
  puts "came here"
  if firstread
    # Header: | 4 byte magic string "MPS7" | 1 byte version | 4 byte (uint32) # of records |
    # first_portion = file.read(9)
    # decode binary data
    first_portion_1 = file.read(4)
    first_portion_2 = file.read(1)
    first_portion_3 = file.read(4)
    
    puts first_portion_1, first_portion_2.unpack('C'), first_portion_3.unpack('L')
    firstread = false
  end

  if !(first_portion_3.nil?) 
    while 1  
        # detail
        # | 1 byte record type enum | 4 byte (uint32) Unix timestamp | 8 byte (uint64) user ID |8 byte amount 

        # file.seek(pos, IO::SEEK_END)
        record_type = file.read(1)
        if record_type.nil?
            break
        end 
        rectype = record_type.to_i
        puts record_type.to_i, rectype

        record_tmp = file.read(4)
        if record_tmp.nil?
            break
        end    
        dattmp = record_tmp.unpack('L')

        record_usrid = file.read(8)
        if record_usrid.nil?
            break
        end    
        #usrid = record_usrid.unpack('L')
        usrid = record_usrid.to_i

        puts rectype, dattmp, usrid
        # Not sure following is right. I cannot get correct values. 
        if ( rectype == 0 || rectype == 1)
            record_amount = file.read(8)
            puts record_amount, record_amount.unpack('F')[0] , record_amount.to_f
        end  
        # want to test one record
        # break
    end
  end
  
  
end