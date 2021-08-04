
        function lanceFunc() {
            var selector = document.getElementById("selectOptions");
            var value = selector.options[selector.selectedIndex].value;
            var text = selector.options[selector.selectedIndex].text;
            
            const empresa = document.getElementById("Empresa");
            const valorSalario = document.getElementById("ValorSalario");
            
            // Request
            var url = "/api/bid";
            var xhttp = new XMLHttpRequest();
            xhttp.open("POST", url, false);
            //A execução do script pára aqui até a requisição retornar do servidor
            var res = xhttp.send(); 
            
            empresa.value = "Mudou";
            valorSalario.value = "Mudou Aqui";

            alert("Lance de R$ " + valorSalario + " feito pelo profissional: " + text);
        }