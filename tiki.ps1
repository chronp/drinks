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
$label2.Text = 'Recipe:'+ 
$form.Controls.Add($label2)

$label3 = New-Object System.Windows.Forms.Label
$label3.Location = New-Object System.Drawing.Point(10,205)
$label3.Size = New-Object System.Drawing.Size(280,20)
$label3.Text = 'Rums:'
$form.Controls.Add($label3)

$Combobox1                             =      New-Object System.Windows.Forms.Combobox
$Combobox1.Location                    =      New-Object System.Drawing.Size(10,50)  
$Combobox1.Size                        =      New-Object System.Drawing.Size(260,20)
$Combobox1.items.AddRange($cocktails)
$combobox2                             =      New-Object System.Windows.Forms.ListBox
$combobox2.Location                    =      New-Object System.Drawing.Size(10,100)  
$combobox2.Size                        =      New-Object System.Drawing.Size(500,100)
$combobox3                             =      New-Object System.Windows.Forms.ListBox
$combobox3.Location                    =      New-Object System.Drawing.Size(10,225)  
$combobox3.Size                        =      New-Object System.Drawing.Size(500,100)

$Form.Controls.Add($combobox1)
$Form.Controls.Add($combobox2)
$Form.Controls.Add($combobox3)
# Populate Combobox 2 When Combobox 1 changes
$ComboBox1_SelectedIndexChanged= {
    $combobox2.Items.Clear() # Clear the list
    $combobox2.Text = $null  # Clear the current entry
    $ToMake = $drinks -match $Combobox1.Text
    foreach($ing in $ToMake){
     $combobox2.Items.Add($ing.ingredient +" "+ $ing.amount+" " + $ing.units)
    }
    $label2.Text = 'Recipe: Page '+ $ing.page
    $form.Controls.Add($label2)

}

$ComboBox2_SelectedIndexChanged= {
    $combobox3.Items.Clear() # Clear the list
    $combobox3.Text = $null  # Clear the current entry
       
    if ($ComboBox2.Text.Contains("Rum")){
        $rumArray = ($ComboBox2.Text).Split(" ")
        $SpeedCode = $rumArray[1]
        foreach($rum in $rum_index){

            if($rum.speed_code -eq $SpeedCode){
                $combobox3.Items.Add($rum.Rum_Name)
                }

        }
        
    }

}

$ComboBox1.add_SelectedIndexChanged($ComboBox1_SelectedIndexChanged)
$ComboBox2.add_SelectedIndexChanged($ComboBox2_SelectedIndexChanged)

$Form.ShowDialog()
