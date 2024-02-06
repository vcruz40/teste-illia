resource "aws_athena_database" "testeilia" {
  name   = "testeilia"
  bucket = "teste-ilia-s3"
}

resource "aws_athena_named_query" "named_query" {
  name      = "tabelailia"
  database  = aws_athena_database.testeilia.name
  query     = <<EOF
CREATE EXTERNAL TABLE IF NOT EXISTS teste.ilia (
  coluna1 string,
  coluna2 string
)
ROW FORMAT DELIMITED
FIELDS TERMINATED BY ','
STORED AS TEXTFILE
LOCATION 's3://teste-ilia-s3/';
EOF
}