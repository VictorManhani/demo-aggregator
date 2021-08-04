%dw 2.0
output application/xml writeDeclaration = false

var vars = {
    funcs: [
        {
            "Id": "1",
            "Nome": "Victor Manhani",
            "ValorMercado": 100.00
        }
    ]
}

var tableHeader = [{
        "tr": {
            "th": "Id",
            "th": "Nome",
            "th": "Valor de Mercado"
        }
    }]

var tableBody = vars.funcs map {
        "tr": {
            "td": $.Id,
            "td": $.Nome,
            "td": $.ValorMercado
        }
    }

var payload = 
    "html": {
        "head": read(head, "text/plain"),
        "body": {
            "h2": "Leilão - Mule", 
            "div" @("class": "row", "style": "background: #51A79B; color: white"): {
                "div" @(class: "col s12 m12"): {
                    "span" @(id: "spanRelogio"): ""
                }
            },
            "table": {
                (tableHeader ++ tableBody)
            },
            "script": read(script, "application/java")
        }
    }
---
payload