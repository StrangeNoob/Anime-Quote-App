const http = require('http');
const fs = require('fs');
const path = require('path');
const port = 3000;

http.createServer((req, res) => {
  
  if(req.url == "/"){
    console.log('The Server is Running in : http://127.0.0.1:3000/');
    fs.readFile("./Anime-Quote-WallpaperAdminPanel/public/index.html","UTF-8",function(err,html){
    res.writeHead(200,{"Content-Type":"text/html"});
    res.end(html);
  });
  } else if (req.url.match("\.css$")){
      var csspath= path.join(__dirname,'public',req.url);
      var filestream = fs.createReadStream(csspath,"UTF-8");
      res.writeHead(200,{"Content-Type":"text/css"});
      filestream.pipe(res);
  } else if (req.url.match("\.js$")){
    var jspath= path.join(__dirname,'public',req.url);
    var filestream = fs.createReadStream(jspath,"UTF-8");
    res.writeHead(200,{"Content-Type":"text/javascript"});
    filestream.pipe(res);
  }else if (req.url.match("\.html$")){
    var htmlpath= path.join(__dirname,'public',req.url);
    var filestream = fs.createReadStream(htmlpath,"UTF-8");
    res.writeHead(200,{"Content-Type":"text/html"});
    filestream.pipe(res);
  }else{
    res.writeHead(404,{"Content-Type":"text/html"});
    res.end("No Page Found");
  } 
}).listen(port);

