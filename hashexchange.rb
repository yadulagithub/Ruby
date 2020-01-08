def group_by_owners(files)
    h = Hash.new{|h,k| h[k] = []}
    files.map {|k,v| h[v]<< k}
    puts h
     
  return h
end

files = {
  'Input.txt' => 'Randy',
  'Code.py' => 'Stan',
  'Output.txt' => 'Randy'
}
puts group_by_owners(files)