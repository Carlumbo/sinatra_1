<!doctype html>
<html>
  <head>
    <title>Flower Slecetion Picker</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css">
  </head>
  <body>
    <nav>
      <% if logged_in? %>

        <a href="/flowers/new"> Breed Flowers</a>
        <a href="/logout"> Log Out </a>
        <p>Welcome, <%=current_user.username %></p>

      <% else %>
        <a href="/signup">Sign Up</a>
        <a href="/login"> Sign In </a>
      <%end %>

    </nav>
    <div class="container">
      <h1>Gardener</h1>
      <% if !@error_message.nil? %>
      <div class="alert alert-warning">
        <%= @error_message %>
      </div>
    <% end %>
      <%= yield %>
    </div>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>
  </body>
</html>
