# Instalar o pacote ggplot2, caso ainda não esteja instalado
if (!require(ggplot2)) install.packages("ggplot2")

library(ggplot2)
library(readxl)

# Ler a planilha
dados <- read_excel("C:/workspace2/R/manifestacoes-de-ouvidoria.xlsx", sheet = "manifestacoes-de-ouvidoria")

# Filtrar os dados apenas para Florianópolis
dados_florianopolis <- subset(dados, nm_municipio == "Florianópolis")

# Criar o gráfico
grafico <- ggplot(dados_florianopolis, aes(x = de_forma, fill = de_forma)) +
  geom_bar() +
  geom_text(stat = "count", aes(label = ..count..), vjust = -0.5) +  # Adicionar o número no topo
  labs(title = "Comparação do Uso de Telefone e Internet em Florianópolis", 
       x = "Forma de Manifestação", 
       y = "Contagem") +
  theme_minimal()

# Salvar o gráfico como arquivo PNG
ggsave("grafico_florianopolis.png", plot = grafico, width = 8, height = 6, dpi = 300)
