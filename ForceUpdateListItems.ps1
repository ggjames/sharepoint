# 1. create a column in your list as [Today's Date]
# 2. Setup this powershell into task scheduler, and set the trigger frequecy as you like

Add-PSSnapin Microsoft.SharePoint.PowerShell
$SPWeb = Get-SPWeb http://abc.com/sites/web/  #name of web app 
$SPList = $SPWeb.Lists["MyList"]    #name of your list
foreach($SPItem in $SPList.Items)
{
    $DateToday = (Get-date).Date               #get today's date
  	$SPItem["Today's Date"] = $DateToday       #update today's date into your column which used to store the today's date.    
    $SPItem.SystemUpdate() #Will force an item be updated, trigger all the calculated columns in this item to be recalculated as well.
}
