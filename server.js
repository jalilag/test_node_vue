let express = require("express")

app = express()

app.use('/static',express.static('static'))

app.get("/",(req,res)=>{
	res.sendFile(__dirname+"/views/pages/index.html")
})

app.listen(8080)