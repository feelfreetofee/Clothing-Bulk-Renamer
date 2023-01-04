$folders = Get-ChildItem -Directory .
foreach ($folder in $folders) {
    $count = -1
    $count1 = -1

    $files = Get-ChildItem -File $folder
    foreach ($file in $files) {
        $name = $file.Name

        if ($name -like "*^*") {
            $name = $name.Substring($name.IndexOf("^") + 1)
        }

        $number = $name.IndexOf($name -replace "\D" , "")
        $first = $name.Substring(0, $number)
        $last = $name.Substring($number + 3)

        $ext = $name.Substring($name.Length - 3)
        if ($ext -eq 'ydd') {
            $count += 1
            $pos = '000'.Substring($count.tostring().Length) + $count
            Rename-Item $file.fullname $first$pos$last
        } elseif ($ext -eq 'ytd') {
            if ($name.Substring($number + 4, 1) -eq 'a') {
                $count1 += 1
            }
            $pos = '000'.Substring($count1.tostring().Length) + $count1
            Rename-Item $file.fullname $first$pos$last
        }
    }
}
