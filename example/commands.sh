# you can build the app with
go build vcf2snp.go 

# process a vcf file or stdin
./vcf2snp example.vcf > test.txt
cat example.vcf | ./vcf2snp | less
cat example.vcf | ./vcf2snp > test.txt

# if your input is a compressed vcf.gz file, use zcat
zcat example.vcf.gz | ./vcf2snp > test.txt

