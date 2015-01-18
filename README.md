CodeIgniter Limiter
-----
This is a simple but effective rate limiter. It can be used to easilly limit the amount of requests a client can make to your application. 

# Installation
Merge the contents of the `application` folder with the `application` folder of your local project. Then add limiter to the autoloader. 
```php
$autoload['libraries'] = array('database', 'limiter');
```
Finally add the structure of `table.sql` to your database.

# Synopsis
```php
if($this->user->logged_in()) {
    /**
     * Make sure that the user is a unique 
     * user to the request limiter. otherwise
     * the only know info about the client 
     * will be it's IP address.
     */
    $this->limiter->add_user_data($this->user->username);
}

$abort = $this->limiter->limit('something', 10);

if($abort) {
    /**
     * Please note that the http response 
     * code has changed (this pleases bots)
     * and that the client has received a 
     * cooldown period.
     */
    echo "Sorry too many requests";
} else {
    echo "Hello world!";
}
```

Response headers:
```http
HTTP/1.1 200 OK
Host: localhost:12345
Connection: close
X-Powered-By: PHP/5.5.10
X-RateLimit-Limit: 10
X-RateLimit-Remaining: 5
X-RateLimit-Reset: 1421161173
Content-Type: application/json
```
