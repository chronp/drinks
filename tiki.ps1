$rum_index = Import-Csv -Path .\rum_index.csv
$drinks = Import-Csv -Path .\tiki.csv
$cocktails= ($drinks.cocktail | Get-Unique | Sort-Object)

$Form                                  =      New-Object System.Windows.Forms.Form
$Form.Size                             =      New-Object System.Drawing.Size(600,400)  

$label1 = New-Object System.Windows.Forms.Label
$label1.Location = New-Object System.Drawing.Point(10,30)
$label1.Size = New-Object System.Drawing.Size(280,20)
$label1.Text = 'Please select a cocktail:'
$form.Controls.Add($label1)

$label2 = New-Object System.Windows.Forms.Label
$label2.Location = New-Object System.Drawing.Point(10,80)
$label2.Size = New-Object System.Drawing.Size(280,20)
$label2.Text = 'Recipe:'
$form.Controls.Add($label2)

$Combobox1                             =      New-Object System.Windows.Forms.Combobox
$Combobox1.Location                    =      New-Object System.Drawing.Size(10,50)  
$Combobox1.Size                        =      New-Object System.Drawing.Size(260,20)
$Combobox1.items.AddRange($cocktails)
$combobox2                             =      New-Object System.Windows.Forms.ListBox
$combobox2.Location                    =      New-Object System.Drawing.Size(10,100)  
$combobox2.Size                        =      New-Object System.Drawing.Size(500,100)
$Form.Controls.Add($combobox1)
$Form.Controls.Add($combobox2)
# Populate Combobox 2 When Combobox 1 changes
$ComboBox1_SelectedIndexChanged= {
    $combobox2.Items.Clear() # Clear the list
    $combobox2.Text = $null  # Clear the current entry
    <#Switch ($ComboBox1.Text) {
        "USA" {        
            $CitiesUS | ForEach { $combobox2.Items.Add($_) }
        }
        "England" {
            $CitiesEN | ForEach { $combobox2.Items.Add($_) }
        }
        "Canada" {
            $CitiesCA | ForEach { $combobox2.Items.Add($_) }
        }
    }#>
    foreach ($ingredient in $recipe){
     $combobox2.Items.Add($ingredient.ingredient +" "+ $ingredient.amount+" " + $ingredient.units)
    }
}

$ComboBox1.add_SelectedIndexChanged($ComboBox1_SelectedIndexChanged)

$Form.ShowDialog()
