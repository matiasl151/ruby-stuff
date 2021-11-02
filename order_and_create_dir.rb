#!usr/bin/ruby

# Simple script to organize files into folders named after their extensions

require 'fileutils'
Directory = "SET-DIRECTORY-TO-ORGANIZE"

Dir.chdir(Directory) do
    # Gets all the files from a directory into an array
    allFiles = Dir.glob('**/**').select {|e| File.file? e} 
    
    allFiles.each do |n|
        # Extracts the extension name
        ext = File.extname(n) 
        begin
            # Creates the directory with the name of the extension
            # ext[1..] is used to eliminate the '.'
            FileUtils.mkdir(ext[1..]) unless Dir.exists?(ext[1..]) 

            FileUtils.mv(n, Directory+"/#{ext[1..]}")
        rescue => exception
            puts("Already moved file #{File.basename("#{n}")}")
        end
                          
    end
end
