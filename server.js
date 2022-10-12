var express=require('express');
var path=require('path');
var app=express();

const port=3000;

app.use(express.static(path.join(__dirname, './public/')));

app.listen(port, () => {
    console.log(`Example app listening on port ${port}`)
  });

app.get('/',function(req,res){
    res.sendFile(__dirname + '/index.html');
});