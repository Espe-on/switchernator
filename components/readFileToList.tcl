proc readFileToList {filename} {
    set filePath [open "$filename" r]
    set fileData [read $filePath]
    close $filePath
    set data [split $fileData "\n"]
    foreach line $data {
        puts $line
    }
}