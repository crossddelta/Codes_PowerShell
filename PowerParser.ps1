# Script para fazer um recon simples em um site | Precisa ser testado
param($site)

echo "=================================================="
echo "             P O W E R   P A R S E R              "
echo "=================================================="
echo ""

if($site){
    $web = Invoke-WebRequest -uri $site -Method Options
    echo "O servidor do site utiliza: $web.headers.server"
    echo "Aceita os métodos         : $web.headers.allow"

    $links = (Invoke-WebRequest - uri $site).links.href | Select-String "http"
    echo "Links encontrados no endereço:"
    foreach($url in $links){
    echo "+ $url"
    }
}
else{
    echo "Modo de uso: .\PowerParser www.businesscorp.com.br"
}
