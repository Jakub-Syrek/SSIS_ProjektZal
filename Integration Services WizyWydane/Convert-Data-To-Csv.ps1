

$scriptpath = $MyInvocation.MyCommand.Path

$dir = Split-Path $scriptpath

$originalCsv = $dir + "\_origCsv\"


foreach($file in (Get-ChildItem $originalCsv )) {
  if ($file.FullName.Contains("csv"))
  {
  
      $output = $dir + "\" + $file 
      
      (Get-Content $file.FullName) | Foreach-Object {$_ -replace ","," "} | Foreach-Object {$_ -replace ';', ','} |  Foreach-Object {$_ -replace ' ', ''} |Out-File $output -Encoding ascii
           
      #Copy $output $file.FullName
      #Remove-Item $output -Force 
      Write-Host $output " cleansed from quotations "    
  }
}



