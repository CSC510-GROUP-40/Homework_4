#!/opt/homebrew/bin/gawk -f

BEGIN {
    FS = ","  # Set the field separator to comma
    count = 0
    total_age = 0
}

function trim(value) {
    gsub(/^[ \t]+|[ \t]+$/, "", value)  # Remove leading and trailing spaces or tabs
    return value
}

{
    $3 = trim($3)    # Trim field 3
    $13 = trim($13)  # Trim field 12
}

$3 == "2" && index($13, "S") > 0   {
    count++ 
    total_age += $7
}

END {
    print "Total count: " count
    print "Total age: " total_age 
    print "Ageverage Age: " total_age/count
}
