const fs = require('fs')
const main = require("./main.js")
let old = fs.readFileSync(__dirname + "/excel.xlsx")
function run(){
    let New = fs.readFileSync(__dirname + "/excel.xlsx")
    if(New.toString() != old.toString()){
        console.log("building........")
        main()
        old = New
        console.log("built")
    }
    setTimeout(run,100)
}

run()