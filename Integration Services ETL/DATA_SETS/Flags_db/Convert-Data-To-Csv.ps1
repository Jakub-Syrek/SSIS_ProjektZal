
If (-NOT ([Security.Principal.WindowsPrincipal][Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole] "Administrator"))
{ 
$arguments = "& '" + $myinvocation.mycommand.definition + "'"
Start-Process powershell -Verb runAs -ArgumentList $arguments
Break
}

Set-ExecutionPolicy -ExecutionPolicy UnRestricted

$scriptpath = $MyInvocation.MyCommand.Path

$dir = Split-Path $scriptpath

Get-ChildItem $dir -Include *.csv -Recurse  -Exclude headers*.csv | Remove-Item -Force

foreach($file in (Get-ChildItem $dir )) {
  if ($file.FullName.Contains("data"))
  {
  $newname = $file.FullName -replace '\.data$', '.csv'  
  $ExcelWB = new-object -comobject excel.application
  $Workbook = $ExcelWB.Workbooks.Open($file.FullName) 
  $Workbook.SaveAs($newname,6) 
  $Workbook.Close($false)
  $ExcelWB.quit()
  Write-Host $file " converted to " $newname
  }
}

Function ReturnHeadersPath() 
{
   foreach($file in (Get-ChildItem $dir )) 
    {
     if ($file.FullName.Contains("header"))
      {
       $headers = $file.FullName;
      }
    }
    return $headers
}


foreach($file in (Get-ChildItem $dir )) {
  if ($file.FullName.Contains("csv"))
  {
  if ($file.FullName.Contains("header"))
    {
     
    }
    else
    {
      $output = $dir + "\1" + $file 
      (Get-Content $file.FullName) | Foreach-Object {$_ -replace '"', ''}|  Out-File $output -Encoding ascii
      Copy $output $file.FullName
      Remove-Item $output -Force 
      Write-Host $file " cleansed from quotations "
    } 
  }
}



foreach($file in (Get-ChildItem $dir )) 
{
  if ($file.FullName.Contains("csv"))
  {
    if ($file.FullName.Contains("header"))
    {
     
    }
    else
    {
    [string]$headers = ReturnHeadersPath
    [string]$output = $dir + "\1" + $file 
    $HeadersData =  Get-Content $headers  -Encoding ASCII  |  select -First 1
    $FileData = Get-Content $file.FullName -Delimiter ","
    $joined = $HeadersData + "`r`n" +$FileData 
    $joined | Out-File -FilePath $output -NoClobber   
    Copy $output $file.FullName
    Remove-Item $output -Force
    Write-Host "Added headers to" $file
    }
  }
}
 return 0