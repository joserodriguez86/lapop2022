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

