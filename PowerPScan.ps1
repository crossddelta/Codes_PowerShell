 # Script para varrer portas em um host e verificar quais estao abertas
param($ip)

if($ip){
    foreach ( $porta in 1..65535 ){
        if (Test-NetConnection $ip -Port $porta -WarningAction SilentlyContinue -InformationLevel Quiet){
            echo “Porta $porta aberta”
        }
        else{
            echo “Porta $porta indisponível”
        }
