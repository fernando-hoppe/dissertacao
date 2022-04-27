
**** Adicionando covariadas (Ferraz et al).
merge m:m CódigoIBGE using https://github.com/fernando-hoppe/dissertacao/raw/main/covar_geog_sp_pr.dta
drop mun
drop _merge

merge m:m CódigoIBGE using https://github.com/fernando-hoppe/dissertacao/raw/main/covar_ecodemo_sp_pr.dta
drop _merge
label variable pop_tot_1950 "População em 1950"
label variable pc_protest_1950 "% protestantes 1950"
label variable pc_analf_1950 "% analfabetos 1950"
label variable pc_empreg_agric_1950 "% empregados em atividade agrícola 1950"
label variable pc_estrang_1950 "% estrangeiros"
label variable pc_negros_1950 "% negros/pardos 1950"

merge m:m CódigoIBGE using https://github.com/fernando-hoppe/dissertacao/raw/main/covar_gini1950.dta
drop _merge
label variable gini1950 "Gini terra 1950"



merge m:m CódigoIBGE using https://github.com/fernando-hoppe/dissertacao/raw/main/mun_anofunda_regi%C3%A3o.dta
drop _merge

replace maize_area1970 = 0 if missing(maize_area1970) & anofundação<=1970
replace wheat_area1970 = 0 if missing(wheat_area1970) & anofundação<=1970
replace soy_area1970 = 0 if missing(soy_area1970) & anofundação<=1970
replace sugar_area1970 = 0 if missing(sugar_area1970) & anofundação<=1970
replace beans_area1970 = 0 if missing(beans_area1970) & anofundação<=1970

IV NA FORMA REDUZIDA (não colapsar o painel na linha 1229)

																		
************************************************************ Geada como variável instrumental de mudança na concentração política ************************************************
*/



********************************************************************* Y == Governança local ***************************************************************************************

****** FORMA REDUZIDA: OLS com coffeetrees_perarea1975. Y = indice Naritomi de Governança    SEM COVARIADAS
regress rescale_governanca d_PR coffeetrees_perarea1975 PRcoffeetrees if ANOELEIÇÃO == 2020, cluster(amc1960)
*** rodando OLS direto usando coffeetrees_perarea como intrumento para concentração política, percebe-se um efeito negativo sobre indice de governança. Ou seja:
* mais café --> maior impacto da geada --> impacto negativo sobre qualidade institucional.


*** FORMA REDUZIDA COM COVARIADAS
regress rescale_governanca d_PR coffeetrees_perarea1975 PRcoffeetrees PopulaçãoestimadaMunic2019 ÁreaEmkm2 Nºtotalestabelecimentosagríco AreaTotalEstabelecimentosAgr TamanhoMédioEst dist_capital latitude longitude aluguel_1950 pop_tot_1950 pc_negros_1950 pc_protest_1950 pc_analf_1950 pc_empreg_agric_1950 pc_estrang_1950 gini1950 maize_area1970 wheat_area1970 soy_area1970 sugar_area1970 beans_area1970 anofundação if ANOELEIÇÃO == 2020, cluster(amc1960)
*** as únicas covariadas demográfico-históricas com p valor dentro de 5% são % negros e % de protestantes, ambas com efeito negativo sobre indice de governança
*** Efeito da geada seria estatisticamente significativo à 5%, com efeito negativo sobre governança atual.

** Testando com a dummie coffeemun
regress rescale_governanca d_PR coffee_mun1975 PRcoffeemun if ANOELEIÇÃO == 2020, cluster(amc1960)
regress rescale_governanca d_PR coffee_mun1975 PRcoffeemun PopulaçãoestimadaMunic2019 ÁreaEmkm2 Nºtotalestabelecimentosagríco AreaTotalEstabelecimentosAgr TamanhoMédioEst dist_capital latitude longitude aluguel_1950 pop_tot_1950 pc_negros_1950 pc_protest_1950 pc_analf_1950 pc_empreg_agric_1950 pc_estrang_1950 gini1950 maize_area1970 wheat_area1970 soy_area1970 sugar_area1970 beans_area1970 anofundação if ANOELEIÇÃO == 2020, cluster(amc1960)
*regress rescale_governanca d_PR coffee_mun1975 PRcoffeemun  if ANOELEIÇÃO == 2020, cluster(amc1960)
*** coffeemun apenas é significativa se rodar sem covariadas. Em ambos os casos, teria efeito negativo sobre governança atual.




***************************************************************** Y == Acesso à justiça *****************************************************************************************

*** FORMA REDUZIDA: Número de instrumentos de Justiça (Naritomi)
regress NoInstJusti d_PR coffeetrees_perarea1975 PRcoffeetrees if ANOELEIÇÃO == 2020, cluster(amc1960)
regress NoInstJusti d_PR coffeetrees_perarea1975 PRcoffeetrees PopulaçãoestimadaMunic2019 ÁreaEmkm2 Nºtotalestabelecimentosagríco AreaTotalEstabelecimentosAgr TamanhoMédioEst dist_capital latitude longitude aluguel_1950 pop_tot_1950 pc_negros_1950 pc_protest_1950 pc_analf_1950 pc_empreg_agric_1950 pc_estrang_1950 gini1950 maize_area1970 wheat_area1970 soy_area1970 sugar_area1970 beans_area1970 anofundação if ANOELEIÇÃO == 2020, cluster(amc1960)
*regress NoInstJusti d_PR coffeetrees_perarea1975 PRcoffeetrees if ANOELEIÇÃO == 2020, robust
*** Rodando com covariadas, coffeetrees deixa de ser significativo. Sem covariadas, a 5% tem efeito positivo sobre quantidade de instrumentos de justiça.

regress NoInstJusti d_PR coffee_mun1975 PRcoffeemun if ANOELEIÇÃO == 2020, cluster(amc1960)
regress NoInstJusti d_PR coffee_mun1975 PRcoffeemun PopulaçãoestimadaMunic2019 ÁreaEmkm2 Nºtotalestabelecimentosagríco AreaTotalEstabelecimentosAgr TamanhoMédioEst dist_capital latitude longitude aluguel_1950 pop_tot_1950 pc_negros_1950 pc_protest_1950 pc_analf_1950 pc_empreg_agric_1950 pc_estrang_1950 gini1950 maize_area1970 wheat_area1970 soy_area1970 sugar_area1970 beans_area1970 anofundação if ANOELEIÇÃO == 2020, cluster(amc1960)
*regress NoInstJusti d_PR coffee_mun1975 PRcoffeemun  if ANOELEIÇÃO == 2020, robust
*** Dummie coffeemun está positivamente associada ao numero de instrumentos de justiça. 
*** A produção de café em 75 deve requerer maior necessidade de formalização de contratos e salvarguardas legais, o que faria com que hoje haja mais instrumentos de justiça nessas localidades.




********************************************************************* Y = Gini terra atual *************************************************************************************
regress GiniTerra d_PR coffeetrees_perarea1975 PRcoffeetrees if ANOELEIÇÃO == 2020, cluster(amc1960)
regress GiniTerra d_PR coffeetrees_perarea1975 PRcoffeetrees PopulaçãoestimadaMunic2019 ÁreaEmkm2 Nºtotalestabelecimentosagríco AreaTotalEstabelecimentosAgr TamanhoMédioEst dist_capital latitude longitude aluguel_1950 pop_tot_1950 pc_negros_1950 pc_protest_1950 pc_analf_1950 pc_empreg_agric_1950 pc_estrang_1950 gini1950 maize_area1970 wheat_area1970 soy_area1970 sugar_area1970 beans_area1970 anofundação if ANOELEIÇÃO == 2020, cluster(amc1960)

regress GiniTerra d_PR coffee_mun1975 PRcoffeemun if ANOELEIÇÃO == 2020, cluster(amc1960)
regress GiniTerra d_PR coffee_mun1975 PRcoffeemun PopulaçãoestimadaMunic2019 ÁreaEmkm2 Nºtotalestabelecimentosagríco AreaTotalEstabelecimentosAgr TamanhoMédioEst dist_capital latitude longitude aluguel_1950 pop_tot_1950 pc_negros_1950 pc_protest_1950 pc_analf_1950 pc_empreg_agric_1950 pc_estrang_1950 gini1950 maize_area1970 wheat_area1970 soy_area1970 sugar_area1970 beans_area1970 anofundação if ANOELEIÇÃO == 2020, cluster(amc1960)
*** Em ambos casos (coffeetrees e coffeemun), não há correlação estatisticamente significativa entre desigualdade de terras e produção de café em 75.





**** Outros indicadores de governança pública: Txa Mortalidade Infantil, Coleta de Esgoto, Nº Bibliotecas, Txa de Analfabetismo, Renda per capita

*** Txa Mortalidade Infantil
regress Tx_Mortalidade_Infantil d_PR coffeetrees_perarea1975 PRcoffeetrees if ANOELEIÇÃO == 2020, cluster(amc1960)
regress Tx_Mortalidade_Infantil d_PR coffeetrees_perarea1975 PRcoffeetrees PopulaçãoestimadaMunic2019 ÁreaEmkm2 Nºtotalestabelecimentosagríco AreaTotalEstabelecimentosAgr TamanhoMédioEst dist_capital latitude longitude aluguel_1950 pop_tot_1950 pc_negros_1950 pc_protest_1950 pc_analf_1950 pc_empreg_agric_1950 pc_estrang_1950 gini1950 maize_area1970 wheat_area1970 soy_area1970 sugar_area1970 beans_area1970 anofundação if ANOELEIÇÃO == 2020, cluster(amc1960)

regress Tx_Mortalidade_Infantil d_PR coffee_mun1975 PRcoffeemun if ANOELEIÇÃO == 2020, cluster(amc1960)
regress Tx_Mortalidade_Infantil d_PR coffee_mun1975 PRcoffeemun PopulaçãoestimadaMunic2019 ÁreaEmkm2 Nºtotalestabelecimentosagríco AreaTotalEstabelecimentosAgr TamanhoMédioEst dist_capital latitude longitude aluguel_1950 pop_tot_1950 pc_negros_1950 pc_protest_1950 pc_analf_1950 pc_empreg_agric_1950 pc_estrang_1950 gini1950 maize_area1970 wheat_area1970 soy_area1970 sugar_area1970 beans_area1970 anofundação if ANOELEIÇÃO == 2020, cluster(amc1960)

*** não é significativo se utilizado coffee_trees ou coffeemun.


*** Coleta de Esgoto
regress IN015_AEÍndicedecoletadee d_PR coffeetrees_perarea1975 PRcoffeetrees if ANOELEIÇÃO == 2020, cluster(amc1960)
regress IN015_AEÍndicedecoletadee d_PR coffeetrees_perarea1975 PRcoffeetrees PopulaçãoestimadaMunic2019 ÁreaEmkm2 Nºtotalestabelecimentosagríco AreaTotalEstabelecimentosAgr TamanhoMédioEst dist_capital latitude longitude aluguel_1950 pop_tot_1950 pc_negros_1950 pc_protest_1950 pc_analf_1950 pc_empreg_agric_1950 pc_estrang_1950 gini1950 maize_area1970 wheat_area1970 soy_area1970 sugar_area1970 beans_area1970 anofundação if ANOELEIÇÃO == 2020, cluster(amc1960)

regress IN015_AEÍndicedecoletadee d_PR coffee_mun1975 PRcoffeemun if ANOELEIÇÃO == 2020, cluster(amc1960)
regress IN015_AEÍndicedecoletadee d_PR coffee_mun1975 PRcoffeemun PopulaçãoestimadaMunic2019 ÁreaEmkm2 Nºtotalestabelecimentosagríco AreaTotalEstabelecimentosAgr TamanhoMédioEst dist_capital latitude longitude aluguel_1950 pop_tot_1950 pc_negros_1950 pc_protest_1950 pc_analf_1950 pc_empreg_agric_1950 pc_estrang_1950 gini1950 maize_area1970 wheat_area1970 soy_area1970 sugar_area1970 beans_area1970 anofundação if ANOELEIÇÃO == 2020, cluster(amc1960)
*** Significativo à 10%. Quantidade de pés de café negativamente associada à qualidade de saneamento básico. Utilizando a dummie, não é significativo.


*** Nº Bibliotecas
regress QuantidadeBibliotec d_PR coffeetrees_perarea1975 PRcoffeetrees if ANOELEIÇÃO == 2020, cluster(amc1960)
regress QuantidadeBibliotec d_PR coffeetrees_perarea1975 PRcoffeetrees PopulaçãoestimadaMunic2019 ÁreaEmkm2 Nºtotalestabelecimentosagríco AreaTotalEstabelecimentosAgr TamanhoMédioEst dist_capital latitude longitude aluguel_1950 pop_tot_1950 pc_negros_1950 pc_protest_1950 pc_analf_1950 pc_empreg_agric_1950 pc_estrang_1950 gini1950 maize_area1970 wheat_area1970 soy_area1970 sugar_area1970 beans_area1970 anofundação if ANOELEIÇÃO == 2020, cluster(amc1960)

regress QuantidadeBibliotec d_PR coffee_mun1975 PRcoffeemun if ANOELEIÇÃO == 2020, cluster(amc1960)
regress QuantidadeBibliotec d_PR coffee_mun1975 PRcoffeemun PopulaçãoestimadaMunic2019 ÁreaEmkm2 Nºtotalestabelecimentosagríco AreaTotalEstabelecimentosAgr TamanhoMédioEst dist_capital latitude longitude aluguel_1950 pop_tot_1950 pc_negros_1950 pc_protest_1950 pc_analf_1950 pc_empreg_agric_1950 pc_estrang_1950 gini1950 maize_area1970 wheat_area1970 soy_area1970 sugar_area1970 beans_area1970 anofundação if ANOELEIÇÃO == 2020, cluster(amc1960)
** Apesar de não ser significativo à 10%, café em 75 é positivamente correlacionado com quantidade de bibliotecas.

*** Existência de estabelecimento de saude sob gestão municipal
gen saudemunic = 1 if MSAU25existênciadeestabelec == "Sim"
replace saudemunic =0 if missing(saudemunic)
regress saudemunic d_PR coffeetrees_perarea1975 PRcoffeetrees if ANOELEIÇÃO == 2020, cluster(amc1960)
regress saudemunic d_PR coffeetrees_perarea1975 PRcoffeetrees PopulaçãoestimadaMunic2019 ÁreaEmkm2 Nºtotalestabelecimentosagríco AreaTotalEstabelecimentosAgr TamanhoMédioEst dist_capital latitude longitude aluguel_1950 pop_tot_1950 pc_negros_1950 pc_protest_1950 pc_analf_1950 pc_empreg_agric_1950 pc_estrang_1950 gini1950 maize_area1970 wheat_area1970 soy_area1970 sugar_area1970 beans_area1970 anofundação if ANOELEIÇÃO == 2020, cluster(amc1960)

regress saudemunic d_PR coffee_mun1975 PRcoffeemun if ANOELEIÇÃO == 2020, cluster(amc1960)
regress saudemunic d_PR coffee_mun1975 PRcoffeemun PopulaçãoestimadaMunic2019 ÁreaEmkm2 Nºtotalestabelecimentosagríco AreaTotalEstabelecimentosAgr TamanhoMédioEst dist_capital latitude longitude aluguel_1950 pop_tot_1950 pc_negros_1950 pc_protest_1950 pc_analf_1950 pc_empreg_agric_1950 pc_estrang_1950 gini1950 maize_area1970 wheat_area1970 soy_area1970 sugar_area1970 beans_area1970 anofundação if ANOELEIÇÃO == 2020, cluster(amc1960)


*** Txa de Analfabetismo
regress TaxadeAnalfabetismodaPopulaç d_PR coffeetrees_perarea1975 PRcoffeetrees if ANOELEIÇÃO == 2020, cluster(amc1960)
regress TaxadeAnalfabetismodaPopulaç d_PR coffeetrees_perarea1975 PRcoffeetrees PopulaçãoestimadaMunic2019 ÁreaEmkm2 Nºtotalestabelecimentosagríco AreaTotalEstabelecimentosAgr TamanhoMédioEst dist_capital latitude longitude aluguel_1950 pop_tot_1950 pc_negros_1950 pc_protest_1950 pc_analf_1950 pc_empreg_agric_1950 pc_estrang_1950 gini1950 maize_area1970 wheat_area1970 soy_area1970 sugar_area1970 beans_area1970 anofundação if ANOELEIÇÃO == 2020, cluster(amc1960)

regress TaxadeAnalfabetismodaPopulaç d_PR coffee_mun1975 PRcoffeemun if ANOELEIÇÃO == 2020, cluster(amc1960)
regress TaxadeAnalfabetismodaPopulaç d_PR coffee_mun1975 PRcoffeemun PopulaçãoestimadaMunic2019 ÁreaEmkm2 Nºtotalestabelecimentosagríco AreaTotalEstabelecimentosAgr TamanhoMédioEst dist_capital latitude longitude aluguel_1950 pop_tot_1950 pc_negros_1950 pc_protest_1950 pc_analf_1950 pc_empreg_agric_1950 pc_estrang_1950 gini1950 maize_area1970 wheat_area1970 soy_area1970 sugar_area1970 beans_area1970 anofundação if ANOELEIÇÃO == 2020, cluster(amc1960)
** Resultados contraditórios: usando coffeetrees existe correlação positiva com taxa de analfabetismo (sem significancia estatistica); usando coffeemun: forte correlação negativo com taxa de analfabetismo (10%).


*** Renda per capita
regress PIBpercapita2018emR d_PR coffeetrees_perarea1975 PRcoffeetrees if ANOELEIÇÃO == 2020, cluster(amc1960)
regress PIBpercapita2018emR d_PR coffeetrees_perarea1975 PRcoffeetrees PopulaçãoestimadaMunic2019 ÁreaEmkm2 Nºtotalestabelecimentosagríco AreaTotalEstabelecimentosAgr TamanhoMédioEst dist_capital latitude longitude aluguel_1950 pop_tot_1950 pc_negros_1950 pc_protest_1950 pc_analf_1950 pc_empreg_agric_1950 pc_estrang_1950 gini1950 maize_area1970 wheat_area1970 soy_area1970 sugar_area1970 beans_area1970 anofundação if ANOELEIÇÃO == 2020, cluster(amc1960)

regress PIBpercapita2018emR d_PR coffee_mun1975 PRcoffeemun if ANOELEIÇÃO == 2020, cluster(amc1960)
regress PIBpercapita2018emR d_PR coffee_mun1975 PRcoffeemun PopulaçãoestimadaMunic2019 ÁreaEmkm2 Nºtotalestabelecimentosagríco AreaTotalEstabelecimentosAgr TamanhoMédioEst dist_capital latitude longitude aluguel_1950 pop_tot_1950 pc_negros_1950 pc_protest_1950 pc_analf_1950 pc_empreg_agric_1950 pc_estrang_1950 gini1950 maize_area1970 wheat_area1970 soy_area1970 sugar_area1970 beans_area1970 anofundação if ANOELEIÇÃO == 2020, cluster(amc1960)
** nenhuma das duas variáveis é correlacionada de forma estatisticamente significativa com renda per capita


********************************************************************** IV em dois estágios (HHI 2005-2020) ****************************************************************
