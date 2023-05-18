if [ $# -ne 1 ]; then
    echo "Usage: $0 <web url without https:// tag>"
    exit 1
fi
url=$1 #enter url without https://
netcat="https://sitereport.netcraft.com/?url=http://"
robtex="https://www.robtex.com/dns-lookup/"
echo Navigating to website info for $url
firefox "$netcat$url" "$robtex$url" &
echo website info for $url is loaded in firefox paralelly
echo website sub domains listing for $url
knockpy $url
echo subdomain listing completed for $url
echo mining files and directories on $url
dirb https://$url -w
echo directory and file mining completed
