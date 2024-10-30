#!/opt/homebrew/bin/gawk -f

BEGIN {
    FPAT = "([^,]*|\"([^\"]|\"\")*\")"
    OFS=","
    count = 0
    total_age = 0
}
{
    # extract passengers from 2nd class who embarked at Southampton
    if ($3 == "2" && $NF == "S") {
        
        # replace male/female labels with M/F
        if ($5 == "male") {
            $5 = "M"
        }
        else if ($5 == "female") {
            $5 = "F"
        }
        
        # filter out null age value
        if ($6 != "") {
            count++
            total_age += $6
        }
        print $0
    }
}
END {
    print "Average Age: " total_age/count
}
