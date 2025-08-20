# Disable ActionController Logger Example

In config/application.rb, we can set the logger to nil to disable it.

```ruby
config.action_controller.logger = nil
```

However, this will not work as expected.


## How to run the project

1. Start the container
```bash
docker compose up -d
```

2. visit http://localhost:80/

3. look at the logs to check the action controller logs.

expected logs:
```bash
web-1  | Started GET "/?foo=1&bar=2" for 192.168.158.1 at 2025-08-20 08:28:29 +0000
```

actual logs:
```bash
web-1  | Started GET "/?foo=1&bar=2" for 192.168.158.1 at 2025-08-20 08:28:29 +0000
web-1  | Processing by PostsController#index as HTML
web-1  |   Parameters: {"foo"=>"1", "bar"=>"2"}
web-1  | Completed 200 OK in 11ms (Views: 0.3ms | ActiveRecord: 0.0ms (0 queries, 0 cached) | GC: 0.3ms)
```
