def unique_names(names1, names2)
  names3 = []
  i = 0

  names1.each do |a|
    if !names3.include?( a)
      names3 << a
    end    
    
  end
  puts "Came here - First pass"
  puts "#{names3}"
  names2.each do |a| 
  
    # in rails if variable.exclude?("something")
    # in ruby if !variable.include?("something")
    if !names3.include?( a)
        names3 << a
    end    
  end

  puts "#{names3}"
  return names3
end

names1 = ["Ava", "Emma", "Olivia"]
names2 = ["Olivia", "Sophia", "Emma"]
puts(unique_names(names1, names2)) # should print Ava, Emma, Olivia, Sophia