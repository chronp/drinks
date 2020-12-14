$rum_index = Import-Csv -Path .\rum_index.csv
$drinks = Import-Csv -Path .\tkik.csv

$puka = $drinks -match 'puka'


 $ingredient.Cocktail

foreach ($ingredient in $puka){
 $ingredient.ingredient +" "+ $ingredient.amount+" " + $ingredient.units

 }

#$drinks -match 'puka' | $drinks -match 'rum' 
