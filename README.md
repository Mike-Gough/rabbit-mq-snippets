# RabbitMQ Snippets
Code snippets for use with RabbitMQ.

## Publish from file
This bash script can be used to publish multiple messages based on the contents of a file. After prompting you to provide an exchange, routing key, username, password and file it will loop through the contents of the file and publish each line as a message to the RabbitMQ exchange.
