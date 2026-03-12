const http = require('http');
const fs = require('fs');
const path = require('path');

const MIME = {
  'html': 'text/html', 'css': 'text/css', 'js': 'application/javascript',
  'json': 'application/json', 'png': 'image/png', 'jpg': 'image/jpeg',
  'jpeg': 'image/jpeg', 'gif': 'image/gif', 'svg': 'image/svg+xml',
  'ico': 'image/x-icon', 'webp': 'image/webp', 'woff2': 'font/woff2',
  'woff': 'font/woff', 'ttf': 'font/ttf'
};

const ROOT = __dirname;

http.createServer((req, res) => {
  let url = req.url.split('?')[0];
  if (url === '/') url = '/index.html';
  const filePath = path.join(ROOT, url);

  fs.readFile(filePath, (err, data) => {
    if (err) {
      res.writeHead(404);
      res.end('Not found');
      return;
    }
    const ext = path.extname(filePath).slice(1);
    res.writeHead(200, { 'Content-Type': MIME[ext] || 'application/octet-stream' });
    res.end(data);
  });
}).listen(3000, () => console.log('Server running on port 3000'));
