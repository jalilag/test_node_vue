let express = require("express")

app = express()

app.use('/static',express.static('static'))
app.set('view engine','jade')

app.get("/",(req,res)=>{
	// res.sendFile(__dirname+"/views/pages/index.html")
		res.render('pages/index',{test:"salut"})
})

app.listen(8080)