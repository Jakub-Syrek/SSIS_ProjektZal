

$scriptpath = $MyInvocation.MyCommand.Path

$dir = Split-Path $scriptpath




foreach($file in (Get-ChildItem $dir )) {
  if ($file.FullName.Contains("csv"))
  {
  
      $output = $dir + "\1" + $file 
      (Get-Content $file.FullName) | Foreach-Object {$_ -replace ","," "} | Foreach-Object {$_ -replace ';', ','} |  Foreach-Object {$_ -replace ' ', ''} |Out-File $output -Encoding ascii
      #$fil = Get-Content $output  #$file.FullName 
      #$fil = $fil.Replace(",Zast?pienie naklejki wizowej, Rodzaj wizy - VD,Zast?pienie naklejki wizowej, Rodzaj wizy - VC BiOSG","`r`n")
      #$fil | Out-File $output -Encoding ascii
      Write-Host $fil     
      Copy $output $file.FullName
      Remove-Item $output -Force 
      Write-Host $file " cleansed from quotations "    
  }
}



