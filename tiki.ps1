Add-Type -assembly System.Windows.Forms
$main_form = New-Object System.Windows.Forms.Form
$main_form.Text ='Tiki Drinks'
$main_form.Width = 600
$main_form.Height = 400
$main_form.AutoSize = $true
$main_form.ShowDialog()

$Label = New-Object System.Windows.Forms.Label

$Label.Text = "AD users"

$Label.Location  = New-Object System.Drawing.Point(0,10)

$Label.AutoSize = $true

$main_form.Controls.Add($Label)


$rum_index = Import-Csv -Path .\rum_index.csv
$drinks = Import-Csv -Path .\tiki.csv

$puka = $drinks -match 'puka'


 $ingredient.Cocktail

foreach ($ingredient in $puka){
 $ingredient.ingredient +" "+ $ingredient.amount+" " + $ingredient.units

 }

 
