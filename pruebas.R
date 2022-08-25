prueba <- lapop2004_2018 %>% 
  filter(wave == 2018 & ocup4a == 1) %>% 
  group_by(formal, country_f) %>% 
  tally() %>% 
  pivot_wider(id_cols = formal, names_from = country_f, values_from = n) %>% 
  adorn_percentages(denominator = "col") %>% 
  adorn_pct_formatting(digits = 1)


prueba <- lapop2004_2018 %>% 
  group_by(country_f, wave) %>% 
  summarise(wt = mean(weight1500)) %>% 
  pivot_wider(id_cols = country_f, names_from = wave, values_from = wt)


TCI <- lapop2004_2018 %>% 
  filter(wave == 2016) %>% 
  group_by(cct1b, country_f) %>% 
  tally() %>% 
  pivot_wider(id_cols = cct1b, names_from = country_f, values_from = n) %>% 
  adorn_percentages(denominator = "col") %>% 
  adorn_pct_formatting(digits = 1)

Subsidios <- lapop2004_2018 %>% 
  filter(wave == 2016) %>% 
  group_by(wf1, country_f) %>% 
  tally() %>% 
  pivot_wider(id_cols = wf1, names_from = country_f, values_from = n) %>% 
  adorn_percentages(denominator = "col") %>% 
  adorn_pct_formatting(digits = 1)

subsidiosxtci <- lapop2004_2018 %>% 
  filter(wave == 2016 & country_f %in% "Chile") %>% 
  group_by(wf1, cct1b) %>% 
  tally() %>% 
  pivot_wider(id_cols = wf1, names_from = cct1b, values_from = n) %>%
  adorn_totals(where = c("row", "col")) %>% 
  adorn_percentages(denominator = "col") %>% 
  adorn_pct_formatting(digits = 1)

prueba <- lapop2004_2018 %>% 
  filter(wave == 2016) %>% 
  group_by(democracia7, country_f) %>% 
  tally() %>% 
  pivot_wider(id_cols = democracia7, names_from = country_f, values_from = n) %>% 
  adorn_percentages(denominator = "col") %>% 
  adorn_pct_formatting(digits = 1)


prueba <- lapop2004_2018 %>%
  drop_na(formal) %>% 
  filter(wave == 2018) %>% 
  group_by(formal_f, country_f) %>% 
  tally() %>% 
  pivot_wider(id_cols = formal_f, names_from = country_f, values_from = n) %>% 
  adorn_percentages(denominator = "col") %>% 
  adorn_pct_formatting(digits = 1)

prueba <- lapop2004_2018 %>%
  filter(wave == 2018) %>%
  group_by(ocupoit) %>% 
  summarise(educacion = mean(ed, na.rm = T)) %>% 
  view()

lapop2004_2018 %>%
  drop_na(ocupoit) %>% 
  filter(wave == 2018) %>%
  ggplot(aes(x=as.factor(ocupoit), y=ed, fill=ocupoit)) +
  geom_boxplot(outlier.shape = NA, show.legend = FALSE, na.rm = T) +
  geom_hline(aes(yintercept = median(ed, na.rm = T)), linetype = "dotted") +
  labs(y = "Años educativos",
       x = "Grandes grupos CIUO 08") +
  scale_y_continuous(breaks = seq(1,20,1))

ggsave("salidas/ciuo_edu.png", dpi = 300, type = "cairo", width = 8, height = 6)

lapop2004_2018 %>%
  drop_na(estatus_ocup_f) %>% 
  filter(wave == 2018) %>%
  ggplot(aes(x=as.factor(estatus_ocup_f), y=ed, fill=estatus_ocup_f)) +
  geom_boxplot(outlier.shape = NA, show.legend = FALSE, na.rm = T) +
  geom_hline(aes(yintercept = median(ed, na.rm = T)), linetype = "dotted") +
  labs(y = "Años educativos") +
  scale_y_continuous(breaks = seq(1,20,1)) +
  scale_x_discrete(labels = function(x) str_wrap(x, width = 10))

ggsave("salidas/prueba_estatus_ed.png", dpi = 300, type = "cairo", width = 8, height = 6)

lapop2004_2018 %>%
  drop_na(estatus_ocup_f) %>% 
  filter(wave == 2018) %>%
  ggplot(aes(x=as.factor(estatus_ocup_f), y=ing_decil, fill=estatus_ocup_f)) +
  geom_boxplot(outlier.shape = NA, show.legend = FALSE, na.rm = T) +
  geom_hline(aes(yintercept = median(ing_decil, na.rm = T)), linetype = "dotted") +
  labs(y = "Grupo de ingresos del hogar") +
  scale_y_continuous(breaks = seq(1,20,1)) +
  scale_x_discrete(labels = function(x) str_wrap(x, width = 10))

ggsave("salidas/prueba_estatus_ingresos.png", dpi = 300, type = "cairo", width = 8, height = 6)
