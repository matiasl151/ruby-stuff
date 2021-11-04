#!usr/bin/ruby

# Simple script to organize files into folders named after their extensions

require 'fileutils'
Directory = "SET-YOUR-DIRECTORY-HERE"

Dir.chdir(Directory) do
    # Gets all the files from a directory into an array
    allFiles = Dir.glob('**/**').select {|e| File.file? e} 
    
    allFiles.each do |n|
        # Extracts the extension name
        ext = File.extname(n).sub(/./, '') 
        puts ext
        begin
            # Creates the directory with the name of the extension
            # ext[1..] is used to eliminate the '.'
            FileUtils.mkdir(ext) unless Dir.exists?(ext) 

            FileUtils.mv(n, Directory+"/#{ext}")
        rescue => exception
            puts("Already moved file #{File.basename("#{n}")}")
        #end
                          
    end
end
