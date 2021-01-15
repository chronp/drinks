#commit damnit
$rum_index = Import-Csv -Path .\rum_index.csv
$drinks = Import-Csv -Path .\tiki.csv

Add-Type -AssemblyName System.Windows.Forms
Add-Type -AssemblyName System.Drawing

$form = New-Object System.Windows.Forms.Form
$form.Text = 'Select a Cocktail'
$form.Size = New-Object System.Drawing.Size(600,400)
$form.StartPosition = 'CenterScreen'

$okButton = New-Object System.Windows.Forms.Button
$okButton.Location = New-Object System.Drawing.Point(75,120)
$okButton.Size = New-Object System.Drawing.Size(75,23)
$okButton.Text = 'OK'
$okButton.DialogResult = [System.Windows.Forms.DialogResult]::OK
$form.AcceptButton = $okButton
$form.Controls.Add($okButton)

$cancelButton = New-Object System.Windows.Forms.Button
$cancelButton.Location = New-Object System.Drawing.Point(150,120)
$cancelButton.Size = New-Object System.Drawing.Size(75,23)
$cancelButton.Text = 'Cancel'
$cancelButton.DialogResult = [System.Windows.Forms.DialogResult]::Cancel
$form.CancelButton = $cancelButton
$form.Controls.Add($cancelButton)

$label = New-Object System.Windows.Forms.Label
$label.Location = New-Object System.Drawing.Point(10,20)
$label.Size = New-Object System.Drawing.Size(280,20)
$label.Text = 'Please select a cocktail:'
$form.Controls.Add($label)

$listBox = New-Object System.Windows.Forms.ListBox
$listBox.Location = New-Object System.Drawing.Point(10,40)
$listBox.Size = New-Object System.Drawing.Size(260,20)
$listBox.Height = 80

$outputBox = New-Object System.Windows.Forms.ListBox
$outputBox.Location = New-Object System.Drawing.Point(10,200)
$outputBox.Size = New-Object System.Drawing.Size(500,20)
$outputBox.Height = 80
$form.Controls.Add($outputBox)

$cocktails= ($drinks.cocktail | Get-Unique | Sort-Object )
Foreach ($cocktail in $cocktails){

[void] $listBox.Items.Add($cocktail)

}


$form.Controls.Add($listBox)
$form.Topmost = $true
$result = $form.ShowDialog()

if ($result -eq [System.Windows.Forms.DialogResult]::OK)
{
    $drinkWanted = $listBox.SelectedItem
    $recipe = $drinks -match $drinkWanted
    #$ingredient.Cocktail

    foreach ($ingredient in $recipe){
     [void] $outputBox.Items.Add($ingredient.ingredient +" "+ $ingredient.amount+" " + $ingredient.units)
    }
    $form.Controls.Add($outputBox)
    $form.Topmost = $true
    $result = $form.ShowDialog()
}
