%dw 2.0
output application/xml writeDeclaration = false

var payload = [
  {
    "Id": 1,
    "Profissional": "Mifael Guimarães",
    "ValorMercado": 260.00,
    "Empresa": "Batatas"
  },
  {
    "Id": 1,
    "Profissional": "Mifael Guimarães",
    "ValorMercado": 280.00,
    "Empresa": "FazFrio"
  },
  {
    "Id": 1,
    "Profissional": "Mifael Guimarães",
    "ValorMercado": 270.00,
    "Empresa": "Mulinha"
  },
  {
    "Id": 2,
    "Profissional": "Victor Manhani",
    "Empresa": "Açaíteria",
    "ValorMercado": 240.00
  }
]

var group = payload groupBy $.Id

var winners = group pluck ($ orderBy -$.ValorMercado)[0]

var vars = {"winners": winners}

var tableHeader = [{
        "th": "Id",
        "th": "Empresa",
        "th": "Profissional",
        "th": "Valor de Mercado"
    }]

var tableBody = vars.winners map {
        "td": $.Id,
        "td": $.Empresa,
        "td": $.Profissional,
        "td": $.ValorMercado
    }
    
---
{"table": {"tr": (tableHeader ++ tableBody)}}