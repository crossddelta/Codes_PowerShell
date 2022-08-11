# Script para varrer a rede executando um ping em cada endereço ip
param($rede)

if($rede){
    foreach ( $ip in 1..255 ){
        try{
            $check = ping -n 1 "$rede.$ip" | Select-String "bytes=32"
            $check.Line.split(' ')[2] -replace ":",""
        }
        catch{
            echo "Sem resposta do endereco $rede.$ip"
        }
    }
}
else{
    echo "======================================"
    echo "+      P O W E R   S W E E P E R     +"
    echo "======================================"
    echo "Modo de uso: .\PowerSweeper 192.168.0"
}

