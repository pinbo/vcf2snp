# vcf2snp
Convert a vcf file to a SNP table.

`vcf2snp` use stdin or an vcf file (not vcf.gz) as input and convert it to a SNP table.

The default output is stdout (e.g. print on screen), but you can redirect it to a file. See usage example.

## Usage

You can build by yourself or download the prebuilt app from [the latest release](https://github.com/pinbo/vcf2snp/releases/latest).

```sh
# you can build the app with
go build vcf2snp.go 

# to build for all 3 platforms (MacOS, Windows and Linux)
./go-build.sh vcf2snp.go

# process a vcf file or stdin
./vcf2snp example.vcf > test.txt
cat example.vcf | ./vcf2snp | less
cat example.vcf | ./vcf2snp > test.txt

# if your input is a compressed vcf.gz file, use zcat
zcat example.vcf.gz | ./vcf2snp > test.txt
```

