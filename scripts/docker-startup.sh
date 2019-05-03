#!/bin/sh
output_folder=book-output
release_folder=book-release

# put the name of your ebook here
book_name=automated-ebook

book_name_asc=$book_name.asc
logs=$output_folder/ebook.log

# you can also personalize your ebook version, if your want
# or remove this parameter if it is to much for you ;)
version=0.1.0

revdate=$(date '+%Y-%m-%d')
params="--attribute revnumber=$version --attribute revdate=$revdate -D $release_folder"

mkdir -p $output_folder
mkdir -p $release_folder

printf "\n--------------------------------------------------------\n" >> $logs
printf "$(date '+%Y-%m-%d %H:%M:%S') ---------- Exporting book formats...\n" >> $logs

printf "Converting to HTML...\n"
asciidoctor $params $book_name_asc >> $logs
printf " -- HTML output at $book_name.html\n"

printf "Converting to EPub...\n"
asciidoctor-epub3 $params $book_name_asc >> $logs
printf " -- Epub output at $book_name.epub\n"

printf "Converting to Mobi (kf8)...\n"
asciidoctor-epub3 $params -a ebook-format=kf8 $book_name_asc >> $logs
printf " -- Mobi output at $book_name.mobi\n"

printf "Converting to PDF... (this one takes a while)\n"
asciidoctor-pdf $params $book_name_asc 2>/dev/null >> $logs
printf " -- PDF  output at $book_name.pdf\n"
