# DropDownList


``` How To Use ```
   ```
   @IBAction func sizeChange_buttonClicked(_ sender: UIButton) {
        let rect =  self.view.convert(sender.frame, from: sender)
        let listItems = ((0..<5).map({"\($0)"}), "1")
      
        DropDownList.show(in: self.view, listFrame: rect, listData: listItems) { newSelectedItem in
            sender.setTitle("Qty : \(newSelectedItem)", for: .normal)
        }
    }

```
``` Screen Shots ```
<table><tr>
<td>
<img src="https://github.com/vikashideveloper/DropDownList_IOS/blob/master/Simulator%20Screen%20Shot%2022-Jul-2017,%208.07.00%20PM.png"  width="320px" height="568px"/>
</td> 
<td>
<img src="https://github.com/vikashideveloper/DropDownList_IOS/blob/master/Simulator%20Screen%20Shot%2022-Jul-2017,%208.07.07%20PM.png"  width="320px" height="568px"/>

</td>
</tr></table>


