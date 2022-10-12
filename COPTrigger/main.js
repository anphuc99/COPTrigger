const XLSX = require("xlsx")
const fs = require("fs")

var lua = "--next"

const setParam = (data)=>{
    let param = []
    for (let i = 1; i<= 10; i++){
        if (data["param"+i] != null){
            param.push(data["param"+i])
        }
    }
    return param.join(",")
}

const action = {

    event: (data)=>{
        let param = setParam(data)
        let str = `
            Event:RegisterCustomEvent("${data.Component}")
            Event:GetEvent("${data.Component}"):Bind(function (${param})
                --fill
            end)

            --next
        `
    lua = lua.replace("--next", str)
    },

    valiable: (data)=>{
        let param = setParam(data)
        let str = `
            local ${param}
            --fill
        `
        lua = lua.replace("--fill", str)
    },

    component: (data) =>{
        let param = setParam(data)
        let str = `
            local _____component = Lib.getComponent("${data.Component}")
            _____component:${data.function}(${param})
            --fill
        `
        lua = lua.replace("--fill", str)
    },

    global: (data) =>{
        let param = setParam(data)
        let str = `
            ${data.Component}.${data.function}(${param})
            --fill
        `
        lua = lua.replace("--fill", str)
    },

    if : (data)=>{
        let param = setParam(data)
        let str = `
            if ${data.Component} then
                --fill
            --else
            end
        `
        lua = lua.replace("--fill", str)
    },

    else: (data)=>{
        let param = setParam(data)
        let str = `
            else
                --fill            
        `
        lua = lua.replace("--fill", "")
        lua = lua.replace("--else", str)
    },
}

const main = ()=>{
    var workbook = XLSX.readFile('excel.xlsx');
    var sheet_name_list = workbook.Sheets["abc"];
    var xlData = XLSX.utils.sheet_to_json(sheet_name_list);
    xlData.forEach((data) => {
        
        action[data.type](data)
    })    
    fs.writeFileSync(__dirname + "/lua.lua", lua)
}

main()

