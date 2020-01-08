
require ‘bit-struct’

class MRKdetail < BitStruct
    char :type, 8, “Typehead”
    unsigned :datetime, 32, “Datetime”
    unsigned :usrid, 64, “Usrid”
    unsigned :amount, 64, “Amount”
    
 
end


class MRKHead < BitStruct
    char :type, 32, “Typehead”
    unsigned :version, 8, "Version"
    unsigned :numrec, 32, "Numrec"

end


mrk = MRK.new

File.open(‘txnlog.dat’, ‘rb’).do |f|
    head_string = f.read(MRKHeader.round_byte_length)
    raise “No header!” unless head_string
    mrk_header = MRKHeader.new(head_string)
    puts mrk_header.inspect
    while data_string = f.read(MRK.round_byte_length) do
    puts MRK.new(data_string).inspect


#do something
end