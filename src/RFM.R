library(pacman)

p_load(tidyverse, readxl, writexl)

transacciones <- read_excel("rfm_transacciones.xlsx")


df <- transacciones |> 
       group_by(ID, Fecha) |> 
       summarise(total = sum(Monto))


df2 <- df |> 
       group_by(ID) |> 
       summarise(frecuencia = n(),
                 monto = sum(total),
                 ultCompra = max(Fecha))

write_xlsx(df2, "Archivo de clientes.xlsx")