# The Default Execution Policy is set to restricted, you can see it by typing:

# Get-ExecutionPolicy
# You should type the following to make it go to unrestricted mode:

# Set-ExecutionPolicy unrestricted
# in admin mode
$latest_diary = Get-ChildItem *-Diary.md  | Resolve-Path -Relative |Sort -desc |Select-Object -First 1
echo $latest_diary
$latest_day = $latest_diary -replace "\.\\" -replace "-Diary.md"
echo $latest_day


$day = (get-date (get-date).addDays(-1) -UFormat "%Y-%m-%d")
echo $day
$filename = -join($day, "-Diary.md")
echo $filename
Copy-Item $latest_diary  $filename
(Get-Content $filename).replace($latest_day, $day) | Set-Content $filename
