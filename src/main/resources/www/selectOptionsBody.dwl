
%dw 2.0
output application/xml writeDeclaration = false

var funcs = [
  {
    "Id": 1,
    "Profissional": "Victor Manhani",
    "ValorMercado": 260.00
  },
  {
    "Id": 2,
    "Profissional": "Mifael Guimarães",
    "ValorMercado": 270.00
  },
  {
    "Id": 3,
    "Profissional": "Max Muley",
    "ValorMercado": 280.00
  },
  {
    "Id": 4,
    "Profissional": "Enzo Batata",
    "ValorMercado": 280.00
  }
]

var vars = {
    "funcs": funcs
}

---

"select" @(id: "selectOptions"): {(
    vars."funcs" map {"option" @(value: $$+1): $.Profissional}
)}