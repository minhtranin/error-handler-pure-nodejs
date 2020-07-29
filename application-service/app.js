const http = require('http');
const router = require('./route');

http.createServer(async(req, res) => {
    try {
        action(200, 'successful',await router(req.url, req, res), res);
    } catch (error) {
        action(error.status || 500, error.message || 'Internal Service Error !', null, res);
    }
}).listen(process.env.port || 9000, () => {
 console.log("server start at port 9000");
});

const action = (status, message, data, res) => {
    res.writeHead(status, { 'Content-Type': 'application/json' });
    res.end(JSON.stringify({ status, message, data }));
}
