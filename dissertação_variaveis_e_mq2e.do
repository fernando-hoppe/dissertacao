

clear
clear mata
clear matrix
use https://github.com/fernando-hoppe/dissertacao/raw/main/Painelv2.dta, clear
/*
cd "C:\Users\hoppe\Documents\Mestrado"

import excel "C:\Users\hoppe\Documents\Mestrado\Painel - Copia.xlsx", sheet("Plan1") firstrow
*/
**** Converter strings em numéricos, substituindo valores não numéricos por missing values

destring AMC1970, generate(amc1970n) ignore(`" "')
destring AMC1940, generate(amc1940) ignore(`" "')
drop AMC1940
destring AMC1960, generate(amc1960) ignore(`" "')
drop AMC1960

**** Corrigir nome de municípios
/* não é necessário
replace MUNICÍPIO="Paranapanema" if MUNICÍPIO=="PARANAPANEMA"
replace MUNICÍPIO="Paranapuã" if MUNICÍPIO=="PARANAPUA"
replace MUNICÍPIO="Parapuã" if MUNICÍPIO=="PARAPUA"
replace MUNICÍPIO="Pardinho" if MUNICÍPIO=="PARDINHO"
replace MUNICÍPIO="Pariquera-Açu" if MUNICÍPIO=="PARIQUERA-ACU"
replace MUNICÍPIO="Parisi" if MUNICÍPIO=="PARISI"
replace MUNICÍPIO="Patrocínio Paulista" if MUNICÍPIO=="PATROCINIO PAULISTA"
replace MUNICÍPIO="Paulicéia" if MUNICÍPIO=="PAULICEIA"
replace MUNICÍPIO="Paulínia" if MUNICÍPIO=="PAULINIA"
replace MUNICÍPIO="Paulistânia" if MUNICÍPIO=="PAULISTANIA"
replace MUNICÍPIO="Paulo de Faria" if MUNICÍPIO=="PAULO DE FARIA"
replace MUNICÍPIO="Pederneiras" if MUNICÍPIO=="PEDERNEIRAS"
replace MUNICÍPIO="Pedra Bela" if MUNICÍPIO=="PEDRA BELA"
replace MUNICÍPIO="Pedregulho" if MUNICÍPIO=="PEDREGULHO"
replace MUNICÍPIO="Pedranópolis" if MUNICÍPIO=="PEDRANOPOLIS"
replace MUNICÍPIO="Pedreira" if MUNICÍPIO=="PEDREIRA"
replace MUNICÍPIO="Pedrinhas Paulista" if MUNICÍPIO=="PEDRINHAS PAULISTA"
replace MUNICÍPIO="Pedro de Toledo" if MUNICÍPIO=="PEDRO DE TOLEDO"
replace MUNICÍPIO="Penápolis" if MUNICÍPIO=="PENAPOLIS"
replace MUNICÍPIO="Pereira Barreto" if MUNICÍPIO=="PEREIRA BARRETO"
replace MUNICÍPIO="Pereiras" if MUNICÍPIO=="PEREIRAS"
replace MUNICÍPIO="Peruíbe" if MUNICÍPIO=="PERUIBE"
replace MUNICÍPIO="Piacatu" if MUNICÍPIO=="PIACATU"
replace MUNICÍPIO="Piedade" if MUNICÍPIO=="PIEDADE"
replace MUNICÍPIO="Pilar do Sul" if MUNICÍPIO=="PILAR DO SUL"
replace MUNICÍPIO="Pindamonhangaba" if MUNICÍPIO=="PINDAMONHANGABA"
replace MUNICÍPIO="Pindorama" if MUNICÍPIO=="PINDORAMA"
replace MUNICÍPIO="Pinhalzinho" if MUNICÍPIO=="PINHALZINHO"
replace MUNICÍPIO="Piquerobi" if MUNICÍPIO=="PIQUEROBI"
replace MUNICÍPIO="Piquete" if MUNICÍPIO=="PIQUETE"
replace MUNICÍPIO="Piracaia" if MUNICÍPIO=="PIRACAIA"
replace MUNICÍPIO="Piracicaba" if MUNICÍPIO=="PIRACICABA"
replace MUNICÍPIO="Piraju" if MUNICÍPIO=="PIRAJU"
replace MUNICÍPIO="Pirajuí" if MUNICÍPIO=="PIRAJUI"
replace MUNICÍPIO="Pirangi" if MUNICÍPIO=="PIRANGI"
replace MUNICÍPIO="Pompéia" if MUNICÍPIO=="POMPEIA"
replace MUNICÍPIO="Pirapora do Bom Jesus" if MUNICÍPIO=="PIRAPORA DO BOM JESUS"
replace MUNICÍPIO="Pirapozinho" if MUNICÍPIO=="PIRAPOZINHO"
replace MUNICÍPIO="Pirassununga" if MUNICÍPIO=="PIRASSUNUNGA"
replace MUNICÍPIO="Piratininga" if MUNICÍPIO=="PIRATININGA"
replace MUNICÍPIO="Pitangueiras" if MUNICÍPIO=="PITANGUEIRAS"
replace MUNICÍPIO="Planalto" if MUNICÍPIO=="PLANALTO"
replace MUNICÍPIO="Platina" if MUNICÍPIO=="PLATINA"
replace MUNICÍPIO="Poá" if MUNICÍPIO=="POA"
replace MUNICÍPIO="Poloni" if MUNICÍPIO=="POLONI"
replace MUNICÍPIO="Pongaí" if MUNICÍPIO=="PONGAI"
replace MUNICÍPIO="Pontal" if MUNICÍPIO=="PONTAL"
replace MUNICÍPIO="Pontalinda" if MUNICÍPIO=="PONTALINDA"
replace MUNICÍPIO="Pontes Gestal" if MUNICÍPIO=="PONTES GESTAL"
replace MUNICÍPIO="Populina" if MUNICÍPIO=="POPULINA"
replace MUNICÍPIO="Porangaba" if MUNICÍPIO=="PORANGABA"
replace MUNICÍPIO="Porto Feliz" if MUNICÍPIO=="PORTO FELIZ"
replace MUNICÍPIO="Porto Ferreira" if MUNICÍPIO=="PORTO FERREIRA"
replace MUNICÍPIO="Potim" if MUNICÍPIO=="POTIM"
replace MUNICÍPIO="Potirendaba" if MUNICÍPIO=="POTIRENDABA"
replace MUNICÍPIO="Pracinha" if MUNICÍPIO=="PRACINHA"
replace MUNICÍPIO="Pradópolis" if MUNICÍPIO=="PRADOPOLIS"
replace MUNICÍPIO="Praia Grande" if MUNICÍPIO=="PRAIA GRANDE"
replace MUNICÍPIO="Pratânia" if MUNICÍPIO=="PRATANIA"
replace MUNICÍPIO="Presidente Alves" if MUNICÍPIO=="PRESIDENTE ALVES"
replace MUNICÍPIO="Presidente Bernardes" if MUNICÍPIO=="PRESIDENTE BERNARDES"
replace MUNICÍPIO="Presidente Epitácio" if MUNICÍPIO=="PRESIDENTE EPITACIO"
replace MUNICÍPIO="Presidente Prudente" if MUNICÍPIO=="PRESIDENTE PRUDENTE"
replace MUNICÍPIO="Presidente Venceslau" if MUNICÍPIO=="PRESIDENTE VENCESLAU"
replace MUNICÍPIO="Promissão" if MUNICÍPIO=="PROMISSAO"
replace MUNICÍPIO="Quadra" if MUNICÍPIO=="QUADRA"
replace MUNICÍPIO="Quatá" if MUNICÍPIO=="QUATA"
replace MUNICÍPIO="Queiroz" if MUNICÍPIO=="QUEIROZ"
replace MUNICÍPIO="Queluz" if MUNICÍPIO=="QUELUZ"
replace MUNICÍPIO="Quintana" if MUNICÍPIO=="QUINTANA"
replace MUNICÍPIO="Rafard" if MUNICÍPIO=="RAFARD"
replace MUNICÍPIO="Rancharia" if MUNICÍPIO=="RANCHARIA"
replace MUNICÍPIO="Redenção da Serra" if MUNICÍPIO=="REDENCAO DA SERRA"
replace MUNICÍPIO="Regente Feijó" if MUNICÍPIO=="REGENTE FEIJO"
replace MUNICÍPIO="Reginópolis" if MUNICÍPIO=="REGINOPOLIS"
replace MUNICÍPIO="Registro" if MUNICÍPIO=="REGISTRO"
replace MUNICÍPIO="Restinga" if MUNICÍPIO=="RESTINGA"
replace MUNICÍPIO="Ribeira" if MUNICÍPIO=="RIBEIRA"
replace MUNICÍPIO="Ribeirão Bonito" if MUNICÍPIO=="RIBEIRAO BONITO"
replace MUNICÍPIO="Ribeirão Branco" if MUNICÍPIO=="RIBEIRAO BRANCO"
replace MUNICÍPIO="Ribeirão Corrente" if MUNICÍPIO=="RIBEIRAO CORRENTE"
replace MUNICÍPIO="Ribeirão do Sul" if MUNICÍPIO=="RIBEIRAO DO SUL"
replace MUNICÍPIO="Ribeirão dos Índios" if MUNICÍPIO=="RIBEIRAO DOS INDIOS"
replace MUNICÍPIO="Ribeirão Grande" if MUNICÍPIO=="RIBEIRAO GRANDE"
replace MUNICÍPIO="Ribeirão Pires" if MUNICÍPIO=="RIBEIRAO PIRES"
replace MUNICÍPIO="Ribeirão Preto" if MUNICÍPIO=="RIBEIRAO PRETO"
replace MUNICÍPIO="Riversul" if MUNICÍPIO=="RIVERSUL"
replace MUNICÍPIO="Rifaina" if MUNICÍPIO=="RIFAINA"
replace MUNICÍPIO="Rincão" if MUNICÍPIO=="RINCAO"
replace MUNICÍPIO="Rinópolis" if MUNICÍPIO=="RINOPOLIS"
replace MUNICÍPIO="Rio Claro" if MUNICÍPIO=="RIO CLARO"
replace MUNICÍPIO="Rio das Pedras" if MUNICÍPIO=="RIO DAS PEDRAS"
replace MUNICÍPIO="Rio Grande da Serra" if MUNICÍPIO=="RIO GRANDE DA SERRA"
replace MUNICÍPIO="Riolândia" if MUNICÍPIO=="RIOLANDIA"
replace MUNICÍPIO="Rosana" if MUNICÍPIO=="ROSANA"
replace MUNICÍPIO="Roseira" if MUNICÍPIO=="ROSEIRA"
replace MUNICÍPIO="Rubiácea" if MUNICÍPIO=="RUBIACEA"
replace MUNICÍPIO="Rubinéia" if MUNICÍPIO=="RUBINEIA"
replace MUNICÍPIO="Sabino" if MUNICÍPIO=="SABINO"
replace MUNICÍPIO="Sagres" if MUNICÍPIO=="SAGRES"
replace MUNICÍPIO="Sales" if MUNICÍPIO=="SALES"
replace MUNICÍPIO="Sales Oliveira" if MUNICÍPIO=="SALES OLIVEIRA"
replace MUNICÍPIO="Salesópolis" if MUNICÍPIO=="SALESOPOLIS"
replace MUNICÍPIO="Salmourão" if MUNICÍPIO=="SALMOURÃO"
replace MUNICÍPIO="Saltinho" if MUNICÍPIO=="SALTINHO"
replace MUNICÍPIO="Salto" if MUNICÍPIO=="SALTO"
replace MUNICÍPIO="Salto de Pirapora" if MUNICÍPIO=="SALTO DE PIRAPORA"
replace MUNICÍPIO="Salto Grande" if MUNICÍPIO=="SALTO GRANDE"
replace MUNICÍPIO="Sandovalina" if MUNICÍPIO=="SANDOVALINA"
replace MUNICÍPIO="Santa Adélia" if MUNICÍPIO=="SANTA ADELIA"
replace MUNICÍPIO="Santa Albertina" if MUNICÍPIO=="SANTA ALBERTINA"
replace MUNICÍPIO="Santa Bárbara d'Oeste" if MUNICÍPIO=="SANTA BARBARA D OESTE"
replace MUNICÍPIO="Santa Branca" if MUNICÍPIO=="SANTA BRANCA"
replace MUNICÍPIO="Santa Clara d'Oeste" if MUNICÍPIO=="SANTA CLARA D OESTE"
replace MUNICÍPIO="Santa Cruz da Conceição" if MUNICÍPIO=="SANTA CRUZ DA CONCEICAO"
replace MUNICÍPIO="Santa Cruz das Palmeiras" if MUNICÍPIO=="SANTA CRUZ DAS PALMEIRAS"
replace MUNICÍPIO="Santa Cruz da Esperança" if MUNICÍPIO=="SANTA CRUZ DA ESPERANCA"
replace MUNICÍPIO="Santa Cruz do Rio Pardo" if MUNICÍPIO=="SANTA CRUZ DO RIO PARDO"
replace MUNICÍPIO="Santa Ernestina" if MUNICÍPIO=="SANTA ERNESTINA"
replace MUNICÍPIO="Santa Fé do Sul" if MUNICÍPIO=="SANTA FE DO SUL"
replace MUNICÍPIO="Santa Gertrudes" if MUNICÍPIO=="SANTA GERTRUDES"
replace MUNICÍPIO="Santa Isabel" if MUNICÍPIO=="SANTA ISABEL"
replace MUNICÍPIO="Santa Lúcia" if MUNICÍPIO=="SANTA LUCIA"
replace MUNICÍPIO="Santa Maria da Serra" if MUNICÍPIO=="SANTA MARIA DA SERRA"
replace MUNICÍPIO="Santa Mercedes" if MUNICÍPIO=="SANTA MERCEDES"
replace MUNICÍPIO="Santana da Ponte Pensa" if MUNICÍPIO=="SANTANA DA PONTE PENSA"
replace MUNICÍPIO="Santana de Parnaíba" if MUNICÍPIO=="SANTANA DE PARNAIBA"
replace MUNICÍPIO="Santa Rita d'Oeste" if MUNICÍPIO=="SANTA RITA D OESTE"
replace MUNICÍPIO="Santa Rita do Passa Quatro" if MUNICÍPIO=="SANTA RITA DO PASSA QUATRO"
replace MUNICÍPIO="Santa Rosa de Viterbo" if MUNICÍPIO=="SANTA ROSA DE VITERBO"
replace MUNICÍPIO="Santa Salete" if MUNICÍPIO=="SANTA SALETE"
replace MUNICÍPIO="Santo Anastácio" if MUNICÍPIO=="SANTO ANASTACIO"
replace MUNICÍPIO="Santo André" if MUNICÍPIO=="SANTO ANDRE"
replace MUNICÍPIO="Santo Antônio da Alegria" if MUNICÍPIO=="SANTO ANTONIO DA ALEGRIA"
replace MUNICÍPIO="Santo Antônio de Posse" if MUNICÍPIO=="SANTO ANTONIO DE POSSE"
replace MUNICÍPIO="Santo Antônio do Aracanguá" if MUNICÍPIO=="SANTO ANTONIO DO ARACANGUA"
replace MUNICÍPIO="Santo Antônio do Jardim" if MUNICÍPIO=="SANTO ANTONIO DO JARDIM"
replace MUNICÍPIO="Santo Antônio do Pinhal" if MUNICÍPIO=="SANTO ANTONIO DO PINHAL"
replace MUNICÍPIO="Santo Expedito" if MUNICÍPIO=="SANTO EXPEDITO"
replace MUNICÍPIO="Santópolis do Aguapeí" if MUNICÍPIO=="SANTOPOLIS DO AGUAPEI"
replace MUNICÍPIO="Santos" if MUNICÍPIO=="SANTOS"
replace MUNICÍPIO="São Bento do Sapucaí" if MUNICÍPIO=="SAO BENTO DO SAPUCAI"
replace MUNICÍPIO="São Bernardo do Campo" if MUNICÍPIO=="SAO BERNARDO DO CAMPO"
replace MUNICÍPIO="São Caetano do Sul" if MUNICÍPIO=="SAO CAETANO DO SUL"
replace MUNICÍPIO="São Carlos" if MUNICÍPIO=="SAO CARLOS"
replace MUNICÍPIO="São Francisco" if MUNICÍPIO=="SAO FRANCISCO"
replace MUNICÍPIO="São João da Boa Vista" if MUNICÍPIO=="SAO JOAO DA BOA VISTA"
replace MUNICÍPIO="São João das Duas Pontes" if MUNICÍPIO=="SAO JOAO DAS DUAS PONTES"
replace MUNICÍPIO="São João de Iracema" if MUNICÍPIO=="SAO JOAO DE IRACEMA"
replace MUNICÍPIO="São João do Pau d'Alho" if MUNICÍPIO=="SAO JOAO DO PAU D ALHO"
replace MUNICÍPIO="São Joaquim da Barra" if MUNICÍPIO=="SAO JOAQUIM DA BARRA"
replace MUNICÍPIO="São José da Bela Vista" if MUNICÍPIO=="SAO JOSE DA BELA VISTA"
replace MUNICÍPIO="São José do Barreiro" if MUNICÍPIO=="SAO JOSE DO BARREIRO"
replace MUNICÍPIO="São José do Rio Pardo" if MUNICÍPIO=="SAO JOSE DO RIO PARDO"
replace MUNICÍPIO="São José do Rio Preto" if MUNICÍPIO=="SAO JOSE DO RIO PRETO"
replace MUNICÍPIO="São José dos Campos" if MUNICÍPIO=="SAO JOSE DOS CAMPOS"
replace MUNICÍPIO="São Lourenço da Serra" if MUNICÍPIO=="SAO LOURENCO DA SERRA"
replace MUNICÍPIO="São Luís do Paraitinga" if MUNICÍPIO=="SAO LUIS DO PARAITINGA"
replace MUNICÍPIO="São Manuel" if MUNICÍPIO=="SAO MANUEL"
replace MUNICÍPIO="São Miguel Arcanjo" if MUNICÍPIO=="SAO MIGUEL ARCANJO"
replace MUNICÍPIO="São Paulo" if MUNICÍPIO=="SAO PAULO"
replace MUNICÍPIO="São Pedro" if MUNICÍPIO=="SAO PEDRO"
replace MUNICÍPIO="São Pedro do Turvo" if MUNICÍPIO=="SAO PEDRO DO TURVO"
replace MUNICÍPIO="São Roque" if MUNICÍPIO=="SAO ROQUE"
replace MUNICÍPIO="São Sebastião" if MUNICÍPIO=="SAO SEBASTIAO"
replace MUNICÍPIO="São Sebastião da Grama" if MUNICÍPIO=="SAO SEBASTIAO DA GRAMA"
replace MUNICÍPIO="São Simão" if MUNICÍPIO=="SAO SIMAO"
replace MUNICÍPIO="São Vicente" if MUNICÍPIO=="SAO VICENTE"
replace MUNICÍPIO="Sarapuí" if MUNICÍPIO=="SARAPUI"
replace MUNICÍPIO="Sarutaiá" if MUNICÍPIO=="SARUTAIA"
replace MUNICÍPIO="Sebastianópolis do Sul" if MUNICÍPIO=="SEBASTIANOPOLIS DO SUL"
replace MUNICÍPIO="Serra Azul" if MUNICÍPIO=="SERRA AZUL"
replace MUNICÍPIO="Serrana" if MUNICÍPIO=="SERRANA"
replace MUNICÍPIO="Serra Negra" if MUNICÍPIO=="SERRA NEGRA"
replace MUNICÍPIO="Sertãozinho" if MUNICÍPIO=="SERTAOZINHO"
replace MUNICÍPIO="Sete Barras" if MUNICÍPIO=="SETE BARRAS"
replace MUNICÍPIO="Severínia" if MUNICÍPIO=="SEVERINIA"
replace MUNICÍPIO="Silveiras" if MUNICÍPIO=="SILVEIRAS"
replace MUNICÍPIO="Socorro" if MUNICÍPIO=="SOCORRO"
replace MUNICÍPIO="Sorocaba" if MUNICÍPIO=="SOROCABA"
replace MUNICÍPIO="Sud Mennucci" if MUNICÍPIO=="SUD MENNUCCI"
replace MUNICÍPIO="Sumaré" if MUNICÍPIO=="SUMARE"
replace MUNICÍPIO="Suzano" if MUNICÍPIO=="SUZANO"
replace MUNICÍPIO="Suzanápolis" if MUNICÍPIO=="SUZANAPOLIS"
replace MUNICÍPIO="Tabapuã" if MUNICÍPIO=="TABAPUA"
replace MUNICÍPIO="Tabatinga" if MUNICÍPIO=="TABATINGA"
replace MUNICÍPIO="Taboão da Serra" if MUNICÍPIO=="TABOAO DA SERRA"
replace MUNICÍPIO="Taciba" if MUNICÍPIO=="TACIBA"
replace MUNICÍPIO="Taguaí" if MUNICÍPIO=="TAGUAI"
replace MUNICÍPIO="Taiaçu" if MUNICÍPIO=="TAIACU"
replace MUNICÍPIO="Taiúva" if MUNICÍPIO=="TAIUVA"
replace MUNICÍPIO="Tambaú" if MUNICÍPIO=="TAMBAU"
replace MUNICÍPIO="Tanabi" if MUNICÍPIO=="TANABI"
replace MUNICÍPIO="Tapiraí" if MUNICÍPIO=="TAPIRAI"
replace MUNICÍPIO="Tapiratiba" if MUNICÍPIO=="TAPIRATIBA"
replace MUNICÍPIO="Taquaral" if MUNICÍPIO=="TAQUARAL"
replace MUNICÍPIO="Taquaritinga" if MUNICÍPIO=="TAQUARITINGA"
replace MUNICÍPIO="Taquarituba" if MUNICÍPIO=="TAQUARITUBA"
replace MUNICÍPIO="Taquarivaí" if MUNICÍPIO=="TAQUARIVAI"
replace MUNICÍPIO="Tarabai" if MUNICÍPIO=="TARABAI"
replace MUNICÍPIO="Tarumã" if MUNICÍPIO=="TARUMA"
replace MUNICÍPIO="Tatuí" if MUNICÍPIO=="TATUI"
replace MUNICÍPIO="Taubaté" if MUNICÍPIO=="TAUBATE"
replace MUNICÍPIO="Tejupá" if MUNICÍPIO=="TEJUPA"
replace MUNICÍPIO="Teodoro Sampaio" if MUNICÍPIO=="TEODORO SAMPAIO"
replace MUNICÍPIO="Terra Roxa" if MUNICÍPIO=="TERRA ROXA"
replace MUNICÍPIO="Tietê" if MUNICÍPIO=="TIETE"
replace MUNICÍPIO="Timburi" if MUNICÍPIO=="TIMBURI"
replace MUNICÍPIO="Torre de Pedra" if MUNICÍPIO=="TORRE DE PEDRA"
replace MUNICÍPIO="Torrinha" if MUNICÍPIO=="TORRINHA"
replace MUNICÍPIO="Trabiju" if MUNICÍPIO=="TRABIJU"
replace MUNICÍPIO="Tremembé" if MUNICÍPIO=="TREMEMBE"
replace MUNICÍPIO="Três Fronteiras" if MUNICÍPIO=="TRES FRONTEIRAS"
replace MUNICÍPIO="Tuiuti" if MUNICÍPIO=="TUIUTI"
replace MUNICÍPIO="Tupã" if MUNICÍPIO=="TUPA"
replace MUNICÍPIO="Tupi Paulista" if MUNICÍPIO=="TUPI PAULISTA"
replace MUNICÍPIO="Turiúba" if MUNICÍPIO=="TURIUBA"
replace MUNICÍPIO="Turmalina" if MUNICÍPIO=="TURMALINA"
replace MUNICÍPIO="Ubarana" if MUNICÍPIO=="UBARANA"
replace MUNICÍPIO="Ubatuba" if MUNICÍPIO=="UBATUBA"
replace MUNICÍPIO="Ubirajara" if MUNICÍPIO=="UBIRAJARA"
replace MUNICÍPIO="Uchoa" if MUNICÍPIO=="UCHOA"
replace MUNICÍPIO="União Paulista" if MUNICÍPIO=="UNIAO PAULISTA"
replace MUNICÍPIO="Urânia" if MUNICÍPIO=="URANIA"
replace MUNICÍPIO="Uru" if MUNICÍPIO=="URU"
replace MUNICÍPIO="Urupês" if MUNICÍPIO=="URUPES"
replace MUNICÍPIO="Valentim Gentil" if MUNICÍPIO=="VALENTIM GENTIL"
replace MUNICÍPIO="Valinhos" if MUNICÍPIO=="VALINHOS"
replace MUNICÍPIO="Valparaíso" if MUNICÍPIO=="VALPARAÍSO"
replace MUNICÍPIO="Vargem" if MUNICÍPIO=="VARGEM"
replace MUNICÍPIO="Vargem Grande do Sul" if MUNICÍPIO=="VARGEM GRANDE DO SUL"
replace MUNICÍPIO="Vargem Grande Paulista" if MUNICÍPIO=="VARGEM GRANDE PAULISTA"
replace MUNICÍPIO="Várzea Paulista" if MUNICÍPIO=="VARZEA PAULISTA"
replace MUNICÍPIO="Vera Cruz" if MUNICÍPIO=="VERA CRUZ"
replace MUNICÍPIO="Vinhedo" if MUNICÍPIO=="VINHEDO"
replace MUNICÍPIO="Viradouro" if MUNICÍPIO=="VIRADOURO"
replace MUNICÍPIO="Vista Alegre do Alto" if MUNICÍPIO=="VISTA ALEGRE DO ALTO"
replace MUNICÍPIO="Vitória Brasil" if MUNICÍPIO=="VITORIA BRASIL"
replace MUNICÍPIO="Votorantim" if MUNICÍPIO=="VOTORANTIM"
replace MUNICÍPIO="Votuporanga" if MUNICÍPIO=="VOTUPORANGA"
replace MUNICÍPIO="Zacarias" if MUNICÍPIO=="ZACARIAS"
replace MUNICÍPIO="Bocaiúva do Sul" if MUNICÍPIO=="Bocaiuva do Sul"
replace MUNICÍPIO="Capitão Leônidas Marques" if MUNICÍPIO=="Capitão Leônicas Marques"
replace MUNICÍPIO="Carambeí" if MUNICÍPIO=="Carambei"
replace MUNICÍPIO="Cesário Lange" if MUNICÍPIO=="Césario Lange"
replace MUNICÍPIO="Brodowski" if MUNICÍPIO=="Brodósqui"
replace MUNICÍPIO="Diamante D'Oeste" if MUNICÍPIO=="Diamante do Oeste"
replace MUNICÍPIO="Florínia" if MUNICÍPIO=="Florínea"
replace MUNICÍPIO="Ipaussu" if MUNICÍPIO=="Ipauçu"
replace MUNICÍPIO="Itaóca" if MUNICÍPIO=="Itaoca"
replace MUNICÍPIO="Itapejara d'Oeste" if MUNICÍPIO=="Itapejara do Oeste"
replace MUNICÍPIO="Lençóis Paulista" if MUNICÍPIO=="Lençois Paulista"
replace MUNICÍPIO="Marinópolis" if MUNICÍPIO=="Marinopólis"
replace MUNICÍPIO="Moji das Cruzes" if MUNICÍPIO=="Mogi das Cruzes"
replace MUNICÍPIO="Mogi Guaçu" if MUNICÍPIO=="Mogi-Guaçu"
replace MUNICÍPIO="Moji-Mirim" if MUNICÍPIO=="Mogi-Mirim"
replace MUNICÍPIO="Munhoz de Melo" if MUNICÍPIO=="Munhoz de Mello"
replace MUNICÍPIO="Nova Canaã Paulista" if MUNICÍPIO=="Nova Canaa Paulista"
replace MUNICÍPIO="Nova Olímpia" if MUNICÍPIO=="Nova Olimpia"
replace MUNICÍPIO="Pérola d'Oeste" if MUNICÍPIO=="Pérola D'Oeste"
replace MUNICÍPIO="Santa Cruz de Monte Castelo" if MUNICÍPIO=="Santa Cruz do Monte Castelo"
replace MUNICÍPIO="Santa Isabel do Ivaí" if MUNICÍPIO=="Santa Izabel do Ivaí"
replace MUNICÍPIO="Santa Terezinha de Itaipu" if MUNICÍPIO=="Santa Tereza do Itaipu"
replace MUNICÍPIO="Saudade do Iguaçu" if MUNICÍPIO=="Saudades do Iguaçu"
replace MUNICÍPIO="Sengés" if MUNICÍPIO=="Sengês"
replace MUNICÍPIO="São Jorge d'Oeste" if MUNICÍPIO=="São Jorge D'Oeste"
*/
replace NOME1ºCOLOCADO = "CLODOALDO MEDINA" if NOME1ºCOLOCADO == "CLODOALDO MEDINA (32.678 VOTOS)"
replace NOME1ºCOLOCADO = "JOÃO MATHEUS TELES DE MENEZES" if NOME1ºCOLOCADO == "JOÃO MATHEUS T. DE MENEZES"
replace NOME1ºCOLOCADO = "LUIZ EDMUNDO CARRIJO COUBE" if NOME1ºCOLOCADO == "LUIZ EDMUNDO C. COUBE"
replace NOME1ºCOLOCADO = "Joaquim dos Santos Camponez" if NOME1ºCOLOCADO == "JOAQUIM CAMPONEZ"
replace NOME1ºCOLOCADO = "ARISTIDES DE OLIVEIRA RIBAS DE ANDRADE" in 2208
replace NOME1ºCOLOCADO = "Dirceu Silvestre Zaloti" in 2906
replace NOME1ºCOLOCADO = "LUIZ FINOTO NETO" in 4003
replace NOME1ºCOLOCADO = "LUIZ FINOTO NETO" in 4007
replace NOMEOUTROCANDIDATO_1 = "Jesus Natalino Peres" in 4007
replace NOME1ºCOLOCADO = "JULIO MARCONDES DE MOURA" in 4611
replace NOME1ºCOLOCADO = "Oziris Souza e Silva" in 4761
replace NOME1ºCOLOCADO = "MOYSES SILVA" in 5224
replace NOME1ºCOLOCADO = "JOSE DA SILVA" in 5223
replace NOME1ºCOLOCADO = "florisvaldo antonio fiorentino" if NOME1ºCOLOCADO == "FLORISVALDO  ANTONIO FIORENTINO"
replace NOME1ºCOLOCADO = "francisco tadao nakano" if NOME1ºCOLOCADO == "36614"
replace NOME1ºCOLOCADO = "Orlando Leme Franco" in 7340
replace NOME1ºCOLOCADO = "Joaquim Lopes Troya" in 7341
replace NOME1ºCOLOCADO = "João Benedito Costa e Silva" if NOME1ºCOLOCADO == "João Benedito Costa e SilvaJoão Benedito Costa e Silva"
replace NOME1ºCOLOCADO = "RUBENS FURQUIM" in 7449
replace NOME1ºCOLOCADO = "JOSÉ DOMINGOS FOGAÇA" in 13610
replace NOME1ºCOLOCADO = "Walcyr Guandalini Gomes" if NOME1ºCOLOCADO == "Walcyr G. Gomes"
replace NOME1ºCOLOCADO = "Afonso Benevenuto Sanvido" if NOME1ºCOLOCADO == "Afonso B. Sanvido"
replace NOME1ºCOLOCADO = "Haride Cavaletti" in 1600
replace NOME1ºCOLOCADO = "LAERCIO BARBOSA SANTOS" in 14719
replace VtosNomin1 = 2303 in 14719
replace TOTALVOTOSNOMINAIS = 4268 in 1965
replace NOME1ºCOLOCADO = "PAULO SÉRGIO RIBAS SANTIAGO" if NOME1ºCOLOCADO == "PAULO SÉRGIO RIBAS"
replace NOME1ºCOLOCADO = "VALMOR VANDERLINDE" if NOME1ºCOLOCADO == "VALMOR VANDERLINDE (11-2010)"
replace NOME1ºCOLOCADO = "MAIKON ANDRÉ PARZIANELLO" if NOME1ºCOLOCADO == "MAIKON ANDRÉ PARZIANELLO (45-2012)"
replace NOME1ºCOLOCADO = "TARCISO SALES MEDEIROS MAIA" if NOME1ºCOLOCADO == "TARCISO SALES"
replace NOME1ºCOLOCADO = "DIRNEI DE FATIMA GANDOLFI CARDOSO" if NOME1ºCOLOCADO == "DIRNEI DE FATIMA GANDOLFI"
replace NOME1ºCOLOCADO = "BLANIR FRANCISCO BORTOLI" if NOME1ºCOLOCADO == "BLANIR F. BORTOLI"
replace NOME1ºCOLOCADO = "otavio cyrilo de oliveira" if NOME1ºCOLOCADO == "OTAVIO C. DE OLIVEIRA"
replace NOME1ºCOLOCADO = "DONALD LOYOLA RIBEIRO" if NOME1ºCOLOCADO == "DONALD LOYOLA RIBEIRÃO"
replace NOME1ºCOLOCADO = "LUCIMAR DE SOUZA MORAIS ASSUNÇÃO" if NOME1ºCOLOCADO == "LUCIMAR DE SOUZA MORAIS"
replace NOME1ºCOLOCADO = "FRANCISCO LEMES GONÇALVES" if NOME1ºCOLOCADO == "FRANCISCO L. GONÇALVES"
replace NOME1ºCOLOCADO = "WALDEVINO PEREIRA DE CARVALHO" if NOME1ºCOLOCADO == "WALDEVINO P. CARVALHO"
replace NOME1ºCOLOCADO = "ANTONIO CASEMIRO BELINATI" if NOME1ºCOLOCADO == "ANTONIO C. BELINATI"
replace NOME1ºCOLOCADO = "ILENA DE FATIMA PEGORARO DE OLIVEIRA" if NOME1ºCOLOCADO == "ILENA DE FATIMA PEGORARO OLIVEIRA"
replace NOME1ºCOLOCADO = "DIOGO ANTONIO MARINS CAPRARO" if NOME1ºCOLOCADO == "DIOGO ANTONIO M. CAPRARO"
replace CódigoIBGE = 4108601 in 4720


**** Retirar espaços indesejados
replace MUNICÍPIO = strtrim(MUNICÍPIO)

/* Nesse .dta já está feito 
**** gerando variáveis

* Adicionando mais um ano IPTU para ter menos missings
merge m:m MUNICÍPIO using "C:\Users\hoppe\Documents\Mestrado\ANOIPTU2004.dta", generate(AnoIPTU2004)

* fundindo MREG041 e A68 - ano da ultima atualização da planta genérica de valores IPTU, mantendo valor mais alto
gen AnoIPTU= max(Anoúltimaatualização1, Anoúltimaatualização2)

* fundindo essa variável com ela mesma de 2004:
gen ANO_IPTU= max(AnoIPTU, anoIPTU2004c)

* Igualando Txas de Arrecadação maiores que 100% à 0
replace TaxaIPTU = 0 if TaxaIPTU>100
replace TaxaIPTU = 0 if missing(TaxaIPTU)
*/
drop Anoúltimaatualização1 Anoúltimaatualização2
/*
* Gerando índice de governança (Naritomi, 2012): Governança = média_simples(ANO_IPTU TxaIPTU NºInstAdm NºInstrPlanej) numa escala de 1 a 6
egen governanca = rowmean(ANO_IPTU TaxaIPTU NoInstrumentosAdmmédia NoInstrumentosdePlanejamento)
su governanca, meanonly
gen rescale_governanca = (((governanca - r(min)) / (r(max) - r(min))) * 5) + 1

* Número de instrumentos de justiça (já tinha feito média no excel, mas agora vou pegar apenas a soma para ter a variável entre 0 e 3, como consta em Naritomi, 2012)
egen NoInstJusti = anycount(B1003existênciacomissãodefe A583existênciaconselhotutel B1006existênciajuizadosespe), values(1)

* Seguindo procedimento de Barsaneti, criando share of land in coffee
gen share_coffee_land1970 = coffee_area1970/area1970
gen share_coffee_land1975 = coffee_area1975/area1975
gen share_coffee_land1980 = coffee_area1980/area1980

*Criando productive age trees per total farm area:
	gen coffeetrees_perarea1970 = coffee_trees_prod1970/area1970
	gen coffeetrees_perarea1975 = coffee_trees_prod1975/area1975
	gen coffeetrees_perarea1980 = coffee_trees_prod1980/area1980

*now we generate coffee municipalities by using 10 tree per ha as a cutoff:
gen coffee_mun1970 = 0
replace coffee_mun1970 = 1 if coffeetrees_perarea1970>10
replace coffee_mun1970 = 0 if missing(coffeetrees_perarea1970)
gen coffee_mun1975 = 0
replace coffee_mun1975 = 1 if coffeetrees_perarea1975>10
replace coffee_mun1975 = 0 if missing(coffeetrees_perarea1975)
gen coffee_mun1980 = 0
replace coffee_mun1980 = 1 if coffeetrees_perarea1980>10
replace coffee_mun1980 = 0 if missing(coffeetrees_perarea1980)

*generate the cooperatives as the share of farms:
replace coop_sale1970 = coop_sale1970/farms1970

*generate the milling as a share of coffee production:
replace mill_tot1975 = mill_tot1975/coffee_prod1975
replace mill_own1975 = mill_own1975/coffee_prod1975

* arrumando labels:
label var share_coffee_land1970 "Coffee Harvest Area over Total Farm Area, 1970"
label var share_coffee_land1975 "Coffee Harvest Area over Total Farm Area, 1975"
label var share_coffee_land1980 "Coffee Harvest Area over Total Farm Area, 1980"
label var coffeetrees_perarea1970 "Coffee Trees per Farm Area (units/ha), 1970"
label var coffeetrees_perarea1975 "Coffee Trees per Farm Area (units/ha), 1975"
label var coffeetrees_perarea1980 "Coffee Trees per Farm Area (units/ha), 1980"
label var coffee_farms1970 "Coffee Producing Farms, 1970"
label var coffee_farms1975 "Coffee Producing Farms, 1975"
label var coffee_farms1980 "Coffee Producing Farms, 1980"
label var coffee_farms1985 "Coffee Producing Farms, 1985"
label var coffee_trees1970 "Coffee Producing Trees, 1970"
label var coffee_trees1975 "Coffee Producing Trees, 1975"
label var coffee_trees1980 "Coffee Producing Trees, 1980"
label var coffee_trees_prod1970 "Coffee Productive Age Trees, 1970"
label var coffee_trees_prod1975 "Coffee Productive Age Trees, 1975"
label var coffee_trees_prod1980 "Coffee Productive Age Trees, 1980"
label var coffee_trees_young1970 "Coffee Young Age Trees, 1970"
label var coffee_trees_young1975 "Coffee Young Age Trees, 1975"
label var coffee_trees_young1980 "Coffee Young Age Trees, 1980"
label var coffee_trees_planted1975 "Coffee Trees Planted, 1975"
label var coffee_trees_planted1980 "Coffee Trees Planted, 1980"
	rename coffee_trees1985 coffee_trees_all1985
label var coffee_trees_all1985 "Coffee Trees (all), 1985"
label var coffee_area1970 "Coffee Harvest Area, 1970"
label var coffee_area1975 "Coffee Harvest Area, 1975"
label var coffee_area1980 "Coffee Harvest Area, 1980"
label var coffee_area1985 "Coffee Harvest Area, 1985"
label var coffee_prod1970 "Coffee Production, 1970"
label var coffee_prod1975 "Coffee Production, 1975"
label var coffee_prod1980 "Coffee Production, 1980"
label var coffee_prod1985 "Coffee Production, 1980"
label var mill_tot1975 "Coffee milling, total, share of production, 1975"
label var mill_own1975 "Coffee milling, own, share of production, 1975"
label var land_value1970 "Total Farmland Value, 1970"
label var land_value1975 "Total Farmland Value, 1975"
label var land_value1980 "Total Farmland Value, 1980"
label var prod_value1970 "Total Production Value, 1970"
label var prod_value1975 "Total Production Value, 1975"
label var prod_value1980 "Total Production Value, 1980"
label var exp_total1970 "Total Expenditure, 1970"
label var exp_total1975 "Total Expenditure, 1975"
label var exp_total1980 "Total Expenditure, 1980"
label var area1970 "Farm Area, 1970"
label var area1975 "Farm Area, 1975"
label var area1980 "Farm Area, 1980"
label var area1985 "Farm Area, 1985"
label var farms1970 "Number of Farms, 1970"
label var farms1975 "Number of Farms, 1975"
label var farms1980 "Number of Farms, 1980"
label var farms1985 "Number of Farms, 1985"
label var coffee_mun1970 "Coffee Municipality, 1970"
label var coffee_mun1975 "Coffee Municipality, 1975"
label var coffee_mun1980 "Coffee Municipality, 1980"
label var ANO_IPTU "Ano da última atualização planta genérica de valores IPTU"
label var rescale_governanca "Índice de Governança (Naritomi)"
label var coop_sale1970 "Share of farms associated with cooperatives, 1970"
label var NoInstJusti "Número de Instrumentos de Justiça"
label var coop_sale1970 "Share of farms associated with cooperatives, 1970"
label var coop_sale1970 "Share of farms associated with cooperatives, 1970"
label var coop_sale1970 "Share of farms associated with cooperatives, 1970"
label var coop_sale1970 "Share of farms associated with cooperatives, 1970"
label var coop_sale1970 "Share of farms associated with cooperatives, 1970"
label var coop_sale1970 "Share of farms associated with cooperatives, 1970"
label var coop_sale1970 "Share of farms associated with cooperatives, 1970"
label var coop_sale1970 "Share of farms associated with cooperatives, 1970"
label var coop_sale1970 "Share of farms associated with cooperatives, 1970"
label var coop_sale1970 "Share of farms associated with cooperatives, 1970"

*/


******************* Criando variáveis de concentração política

*** retirando observações para as quais não houve eleições
drop if NOME1ºCOLOCADO=="SEM ELEIÇÃO"
drop if NOME1ºCOLOCADO=="sem eleicoes"
drop if NOME1ºCOLOCADO=="Sem eleição"
drop if NOME1ºCOLOCADO=="PREFEITO NOMEADO"
drop if NOME1ºCOLOCADO=="Prefeito nomeado"
drop if NOME1ºCOLOCADO=="Prefeito Nomeado"
drop if NOME1ºCOLOCADO=="Sem Eleição"
drop if NOME1ºCOLOCADO=="SEM ELEIÇÕES"
drop if NOME1ºCOLOCADO=="PREFEITO NOMEADO: JUAREZ LOYOLA"
drop if NOME1ºCOLOCADO=="PREFEITO NOMEADO: MANOEL CLINEU DE ANDRADE JUNQUEIRA"
drop if NOME1ºCOLOCADO=="PREFEITO NOMEADO: GERALDO MANTOVANI"
drop if NOME1ºCOLOCADO=="PREFEITO NOMEADO: IVO CAROTINI"
drop if NOME1ºCOLOCADO=="PREFEITO NOMEADO: MIZAEL MARQUES SOBRINHO"
drop if NOME1ºCOLOCADO=="PREFEITO NOMEADO: EUGÊNIO SCARANELO PIRES"
drop if NOME1ºCOLOCADO=="PREFEITO NOMEADO: JOÃO POSSATO"
drop if NOME1ºCOLOCADO=="PREFEITO NOMEADO: ARISTIDES VICENZO FABRINI"
drop if NOME1ºCOLOCADO=="PREFEITO NOMEADO: JOÃO BATISTA DE CAMPOS CINTRA"
drop if NOME1ºCOLOCADO=="PREFEITO NOMEADO: MARCO VINICIO CHIOCHETTI"
drop if NOME1ºCOLOCADO=="PREFEITO NOMEADO: OLAVO AMORIM SILVEIRA"
drop if NOME1ºCOLOCADO=="PREFEITO NOMEADO: OMAR ZIGAIB"
drop if NOME1ºCOLOCADO=="PREFEITO NOMEADO: JOSÉ APARECIDO FERREIRA FRANCO"
drop if NOME1ºCOLOCADO=="PREFEITO NOMEADO: FRANCISCO SAMPAIO DE SOUZA"
drop if NOME1ºCOLOCADO=="PREFEITO NOMEADO: JOSÉ JORGE ZAHR"
drop if NOME1ºCOLOCADO=="PREFEITO NOMEADO: CARLOS FREDERICO SOARES CAMPOS"
drop if NOME1ºCOLOCADO=="PREFEITO NOMEADO: ALCEU SIMPLICIO DA SILVA"
drop if NOME1ºCOLOCADO=="PREFEITO NOMEADO: CLAUDIO TEDESCHI"
drop if NOME1ºCOLOCADO=="PREFEITO NOMEADO: NEREU BENEDUZZI"
drop if NOME1ºCOLOCADO=="PREFEITO NOMEADO: ELMANO FERREIRA VELOSO"
drop if NOME1ºCOLOCADO=="SEM ELEIÇÕES (NOMEADO)"
drop if NOME1ºCOLOCADO=="NOMEADO PELO GOVERNO: JOSÉ LUIZ GUERRA REGO"
drop if NOME1ºCOLOCADO=="PREFEITO NOMEADO: JOSÉ ANTÔNIO PADOVAN"
drop if NOME1ºCOLOCADO=="NOMEADO (LEI DE SEGURANÇA NACIONAL)"
drop if NOME1ºCOLOCADO=="OMAR SABBAG (NOMEADO)"
drop if NOME1ºCOLOCADO=="PREFEITO NOMEADO: JOSÉ ANTÔNO PADOVAN"
drop if NOME1ºCOLOCADO=="ELEIÇÃO ANULADA"
drop if NOME1ºCOLOCADO=="ELEIÇÃO ANULADA: GILMAR JOSE BENKENDORF SILVA"
drop if NOME1ºCOLOCADO=="PREFEITO DE NOMEAÇÃO"
drop if NOME1ºCOLOCADO=="PREFEITO DE NOMEAÇÃO: IRINEU SARAGIOTTO"
drop if NOME1ºCOLOCADO=="PREFEITO DE NOMEAÇÃO: BRAZ EDUARDO DE CASTRO BLOTA"
drop if NOME1ºCOLOCADO=="PREFEITO DE NOMEAÇÃO: JOSÉ ARANHA"
drop if NOME1ºCOLOCADO=="PREFEITO DE NOMEAÇÃO: IMIR BALADI"
drop if NOME1ºCOLOCADO=="PREFEITO DE NOMEAÇÃO: SERGIO SOBRAL DE OLIVEIRA"
drop if NOME1ºCOLOCADO=="PREFEITO DE NOMEAÇÃO: PAULO SALIM MALUF"
drop if NOME1ºCOLOCADO=="PREFEITO DE NOMEAÇÃO: MANSUETO PIERROTTI"
drop if NOME1ºCOLOCADO=="PREFEITO DE NOMEAÇÃO: MISAEL MARQUES SOBRINHO"
drop if NOME1ºCOLOCADO=="PREFEITO DE NOMEAÇÃO ARMANDO BRANDINI"
drop if NOME1ºCOLOCADO=="PREFEITO DE NOMEAÇÃO: EURICO GONÇALVES CAETANO"
drop if NOME1ºCOLOCADO=="SEM ELEIÇÕES - Cap. Jacob A. Beck, Francisco Guaraná de Menezes"
drop if NOME1ºCOLOCADO=="INTERVENTOR: GAL. CLOVIS BANDEIRA BRASIL"
drop if NOME1ºCOLOCADO=="INTERVENTOR: ANTONIO TEIXEIRA VIANNA"
drop if NOME1ºCOLOCADO=="INTERVENTOR: CEL. THEODORO DE ALMEIDA PUPO"
drop if NOME1ºCOLOCADO=="INTERVENTOR: AURÉLIO ARAÚJO"
drop if NOME1ºCOLOCADO=="INTERVENTOR: JEAN PIERRE HERMAN DE MORAES BARROS"
drop if NOME1ºCOLOCADO=="INTERVENTOR: GAL. JOÃO PAULO DA ROCHA FRAGOSO"
drop if NOME1ºCOLOCADO=="Não houve eleição (lei 5449/1968)"
drop if NOME1ºCOLOCADO=="NOMEADO (LEI DE SEGURANÇA NACIONAL)"

*** retirando letras maiúsculas e acentuação
gen nome_prefeito = ustrlower( ustrregexra( ustrnormalize( NOME1ºCOLOCADO, "nfd" ) , "\p{Mark}", "" )  )

/* não é necessário:
*** dividindo os termos de cada nome
split NOME1ºCOLOCADO

*** retirando artigos
replace NOME1ºCOLOCADO2="" if NOME1ºCOLOCADO2=="de"
replace NOME1ºCOLOCADO2="" if NOME1ºCOLOCADO2=="DE"
replace NOME1ºCOLOCADO2="" if NOME1ºCOLOCADO2=="De"
replace NOME1ºCOLOCADO2="" if NOME1ºCOLOCADO2=="da"
replace NOME1ºCOLOCADO2="" if NOME1ºCOLOCADO2=="DA"
replace NOME1ºCOLOCADO2="" if NOME1ºCOLOCADO2=="Da"
replace NOME1ºCOLOCADO2="" if NOME1ºCOLOCADO2=="das"
replace NOME1ºCOLOCADO2="" if NOME1ºCOLOCADO2=="DAS"
replace NOME1ºCOLOCADO2="" if NOME1ºCOLOCADO2=="Das"
replace NOME1ºCOLOCADO2="" if NOME1ºCOLOCADO2=="do"
replace NOME1ºCOLOCADO2="" if NOME1ºCOLOCADO2=="DO"
replace NOME1ºCOLOCADO2="" if NOME1ºCOLOCADO2=="Dos"

replace NOME1ºCOLOCADO3="" if NOME1ºCOLOCADO3=="de"
replace NOME1ºCOLOCADO3="" if NOME1ºCOLOCADO3=="DE"
replace NOME1ºCOLOCADO3="" if NOME1ºCOLOCADO3=="De"
replace NOME1ºCOLOCADO3="" if NOME1ºCOLOCADO3=="da"
replace NOME1ºCOLOCADO3="" if NOME1ºCOLOCADO3=="DA"
replace NOME1ºCOLOCADO3="" if NOME1ºCOLOCADO3=="Da"
replace NOME1ºCOLOCADO3="" if NOME1ºCOLOCADO3=="das"
replace NOME1ºCOLOCADO3="" if NOME1ºCOLOCADO3=="DAS"
replace NOME1ºCOLOCADO3="" if NOME1ºCOLOCADO3=="Das"
replace NOME1ºCOLOCADO3="" if NOME1ºCOLOCADO3=="do"
replace NOME1ºCOLOCADO3="" if NOME1ºCOLOCADO3=="DO"
replace NOME1ºCOLOCADO3="" if NOME1ºCOLOCADO3=="Dos"

replace NOME1ºCOLOCADO4="" if NOME1ºCOLOCADO4=="de"
replace NOME1ºCOLOCADO4="" if NOME1ºCOLOCADO4=="DE"
replace NOME1ºCOLOCADO4="" if NOME1ºCOLOCADO4=="De"
replace NOME1ºCOLOCADO4="" if NOME1ºCOLOCADO4=="da"
replace NOME1ºCOLOCADO4="" if NOME1ºCOLOCADO4=="DA"
replace NOME1ºCOLOCADO4="" if NOME1ºCOLOCADO4=="Da"
replace NOME1ºCOLOCADO4="" if NOME1ºCOLOCADO4=="das"
replace NOME1ºCOLOCADO4="" if NOME1ºCOLOCADO4=="DAS"
replace NOME1ºCOLOCADO4="" if NOME1ºCOLOCADO4=="Das"
replace NOME1ºCOLOCADO4="" if NOME1ºCOLOCADO4=="do"
replace NOME1ºCOLOCADO4="" if NOME1ºCOLOCADO4=="DO"
replace NOME1ºCOLOCADO4="" if NOME1ºCOLOCADO4=="Dos"

replace NOME1ºCOLOCADO5="" if NOME1ºCOLOCADO5=="de"
replace NOME1ºCOLOCADO5="" if NOME1ºCOLOCADO5=="DE"
replace NOME1ºCOLOCADO5="" if NOME1ºCOLOCADO5=="De"
replace NOME1ºCOLOCADO5="" if NOME1ºCOLOCADO5=="da"
replace NOME1ºCOLOCADO5="" if NOME1ºCOLOCADO5=="DA"
replace NOME1ºCOLOCADO5="" if NOME1ºCOLOCADO5=="Da"
replace NOME1ºCOLOCADO5="" if NOME1ºCOLOCADO5=="das"
replace NOME1ºCOLOCADO5="" if NOME1ºCOLOCADO5=="DAS"
replace NOME1ºCOLOCADO5="" if NOME1ºCOLOCADO5=="Das"
replace NOME1ºCOLOCADO5="" if NOME1ºCOLOCADO5=="do"
replace NOME1ºCOLOCADO5="" if NOME1ºCOLOCADO5=="DO"
replace NOME1ºCOLOCADO5="" if NOME1ºCOLOCADO5=="Dos"

replace NOME1ºCOLOCADO6="" if NOME1ºCOLOCADO6=="de"
replace NOME1ºCOLOCADO6="" if NOME1ºCOLOCADO6=="DE"
replace NOME1ºCOLOCADO6="" if NOME1ºCOLOCADO6=="De"
replace NOME1ºCOLOCADO6="" if NOME1ºCOLOCADO6=="da"
replace NOME1ºCOLOCADO6="" if NOME1ºCOLOCADO6=="DA"
replace NOME1ºCOLOCADO6="" if NOME1ºCOLOCADO6=="Da"
replace NOME1ºCOLOCADO6="" if NOME1ºCOLOCADO6=="das"
replace NOME1ºCOLOCADO6="" if NOME1ºCOLOCADO6=="DAS"
replace NOME1ºCOLOCADO6="" if NOME1ºCOLOCADO6=="Das"
replace NOME1ºCOLOCADO6="" if NOME1ºCOLOCADO6=="do"
replace NOME1ºCOLOCADO6="" if NOME1ºCOLOCADO6=="DO"
replace NOME1ºCOLOCADO6="" if NOME1ºCOLOCADO6=="Dos"

drop NOME1ºCOLOCADO1

*/

*** Adição de uma dummie para reeleição e um identificador de família:
merge m:m CódigoIBGE ESTADO MUNICÍPIO ANOELEIÇÃO nome_prefeito using https://github.com/fernando-hoppe/dissertacao/raw/main/dummie_reelei%C3%A7%C3%A3o.dta
drop if nome_prefeito == "sem eleicoes"
drop if _merge == 2
drop _merge
merge m:m CódigoIBGE ANOELEIÇÃO nome_prefeito using https://github.com/fernando-hoppe/dissertacao/raw/main/Identificador_Familia2.dta
drop _merge

*** PainelRealv4.dta vai até aqui (contudo, estou usando o painelv2.dta)

******************************************************************************************************************************************************************************
******************************************************************************************************************************************************************************

** Construção indíce herfindahl de concentração: HHI = Som_i((contagem de eleições vencidas familia_i)/total de eleições)^2 

************************************************************** HHI fami para o período inteiro 47-2020 ***********************************************************************

egen double eleições=count(ANOELEIÇÃO), by(CódigoIBGE)
by CódigoIBGE IdentificadorFamíliaPrefeito, sort: gen xfamil = _N
by CódigoIBGE IdentificadorFamíliaPrefeito, sort: g double eleições_sqrd=(xfamil/eleições)^2
egen tag = tag(IdentificadorFamíliaPrefeito CódigoIBGE)
egen double HHI=sum(eleições_sqrd) if tag==1, by(CódigoIBGE)

mipolate HHI IdentificadorFamíliaPrefeito, generate(HHI_fam) groupwise by(CódigoIBGE)
drop HHI
drop tag
drop eleições
drop xfamil
drop eleições_sqrd
label var HHI_fam "HHI famílias 1947-2020"


********************************************************************** HHI_fami para antes de 1975 ***************************************************************************

egen double eleições_PRÉ=count(ANOELEIÇÃO) if ANOELEIÇÃO<=1975, by(CódigoIBGE)
egen double xfamil_i_pré=count(IdentificadorFamíliaPrefeito) if ANOELEIÇÃO<=1975, by(CódigoIBGE IdentificadorFamíliaPrefeito)
by CódigoIBGE IdentificadorFamíliaPrefeito, sort: g double eleiçõespré_sqrd=(xfamil_i_pré/eleições_PRÉ)^2
egen tag = tag(IdentificadorFamíliaPrefeito CódigoIBGE) if ANOELEIÇÃO<=1975
egen double HHI=sum(eleiçõespré_sqrd) if tag==1, by(CódigoIBGE)
mipolate HHI IdentificadorFamíliaPrefeito, generate(HHI_fam_pré) groupwise by(CódigoIBGE)
drop HHI
drop tag
drop eleições_PRÉ
drop xfamil_i_pré
drop eleiçõespré_sqrd
label var HHI_fam_pré "HHI famílias pré-1975"
replace HHI_fam_pré = . if HHI_fam_pré == 0

sum HHI_fam_pré if HHI_fam_pré!=1 


******************************************************* HHI_fami para depois de 1975 (eliminando reeleição pós-1997) ***********************************************************

egen double eleições_pós=count(ANOELEIÇÃO) if ANOELEIÇÃO>=1975 & dummie_reeleição!=1, by(CódigoIBGE)
egen double xfamil_i_pós=count(IdentificadorFamíliaPrefeito) if ANOELEIÇÃO>=1975 & dummie_reeleição!=1, by(CódigoIBGE IdentificadorFamíliaPrefeito)
by CódigoIBGE IdentificadorFamíliaPrefeito, sort: g double eleiçõespós_sqrd=(xfamil_i_pós/eleições_pós)^2
egen tag = tag(IdentificadorFamíliaPrefeito CódigoIBGE) if ANOELEIÇÃO>=1975 & dummie_reeleição!=1
egen double HHI=sum(eleiçõespós_sqrd) if tag==1, by(CódigoIBGE)

mipolate HHI IdentificadorFamíliaPrefeito, generate(HHI_fam_pós) groupwise by(CódigoIBGE)
drop HHI
drop tag
drop eleições_pós
drop xfamil_i_pós
drop eleiçõespós_sqrd
label var HHI_fam_pós "HHI famílias pós-1975 sem reeleições"

************************************************************** HHI_fami para depois de 1975 (com reeleições) ********************************************************************

egen double eleições_pós=count(ANOELEIÇÃO) if ANOELEIÇÃO>=1975, by(CódigoIBGE)
egen double xfamil_i_pós=count(IdentificadorFamíliaPrefeito) if ANOELEIÇÃO>=1975, by(CódigoIBGE IdentificadorFamíliaPrefeito)
by CódigoIBGE IdentificadorFamíliaPrefeito, sort: g double eleiçõespós_sqrd=(xfamil_i_pós/eleições_pós)^2
egen tag = tag(IdentificadorFamíliaPrefeito CódigoIBGE) if ANOELEIÇÃO>=1975
egen double HHI=sum(eleiçõespós_sqrd) if tag==1, by(CódigoIBGE)
mipolate HHI IdentificadorFamíliaPrefeito, generate(HHI_fam_pós1) groupwise by(CódigoIBGE)
drop HHI
drop tag
drop eleições_pós
drop xfamil_i_pós
drop eleiçõespós_sqrd
label var HHI_fam_pós1 "HHI famílias pós-1975 com reeleições"

****************************************************************** HHI_fami para antes, durante e após Ditadura ********************************************************************
*ANTES:
egen double eleições_pré64=count(ANOELEIÇÃO) if ANOELEIÇÃO<=1964, by(CódigoIBGE)
egen double xfamil_i_pré64=count(IdentificadorFamíliaPrefeito) if ANOELEIÇÃO<=1964, by(CódigoIBGE IdentificadorFamíliaPrefeito)
by CódigoIBGE IdentificadorFamíliaPrefeito, sort: g double eleiçõespré64_sqrd=(xfamil_i_pré64/eleições_pré64)^2
egen tag = tag(IdentificadorFamíliaPrefeito CódigoIBGE) if ANOELEIÇÃO<=1964
egen double HHI=sum(eleiçõespré64_sqrd) if tag==1, by(CódigoIBGE)
mipolate HHI IdentificadorFamíliaPrefeito, generate(HHI_fam_pré64) groupwise by(CódigoIBGE)
drop HHI
drop tag
drop eleições_pré64
drop xfamil_i_pré64
drop eleiçõespré64_sqrd
label var HHI_fam_pré64 "HHI famílias pré Ditadura"
replace HHI_fam_pré64 = . if HHI_fam_pré64 == 0

*DURANTE:
egen double eleições_Ditad=count(ANOELEIÇÃO) if ANOELEIÇÃO>=1964 & ANOELEIÇÃO<1988, by(CódigoIBGE)
egen double xfamil_i_Ditad=count(IdentificadorFamíliaPrefeito) if ANOELEIÇÃO>=1964 & ANOELEIÇÃO<1988, by(CódigoIBGE IdentificadorFamíliaPrefeito)
by CódigoIBGE IdentificadorFamíliaPrefeito, sort: g double eleiçõesDitad_sqrd=(xfamil_i_Ditad/eleições_Ditad)^2
egen tag = tag(IdentificadorFamíliaPrefeito CódigoIBGE) if ANOELEIÇÃO>=1964 & ANOELEIÇÃO<1988
egen double HHI=sum(eleiçõesDitad_sqrd) if tag==1, by(CódigoIBGE)
mipolate HHI IdentificadorFamíliaPrefeito, generate(HHI_fam_Ditad) groupwise by(CódigoIBGE)
drop HHI
drop tag
drop eleições_Ditad
drop xfamil_i_Ditad
drop eleiçõesDitad_sqrd
label var HHI_fam_Ditad "HHI famílias sob Ditadura"

*PÓS SEM REELEIÇÕES:
egen double eleições_pós88=count(ANOELEIÇÃO) if ANOELEIÇÃO>=1988 & dummie_reeleição!=1, by(CódigoIBGE)
egen double xfamil_i_pós88=count(IdentificadorFamíliaPrefeito) if ANOELEIÇÃO>=1988 & dummie_reeleição!=1, by(CódigoIBGE IdentificadorFamíliaPrefeito)
by CódigoIBGE IdentificadorFamíliaPrefeito, sort: g double eleiçõespós88_sqrd=(xfamil_i_pós88/eleições_pós88)^2
egen tag = tag(IdentificadorFamíliaPrefeito CódigoIBGE) if ANOELEIÇÃO>=1988 & dummie_reeleição!=1
egen double HHI=sum(eleiçõespós88_sqrd) if tag==1, by(CódigoIBGE)
mipolate HHI IdentificadorFamíliaPrefeito, generate(HHI_fam_pós88) groupwise by(CódigoIBGE)
drop HHI
drop tag
drop eleições_pós88
drop xfamil_i_pós88
drop eleiçõespós88_sqrd
label var HHI_fam_pós88 "HHI famílias pós-ditadura sem reeleições"

*PÓS COM REELEIÇÕES:
egen double eleições_pós88=count(ANOELEIÇÃO) if ANOELEIÇÃO>=1988, by(CódigoIBGE)
egen double xfamil_i_pós88=count(IdentificadorFamíliaPrefeito) if ANOELEIÇÃO>=1988, by(CódigoIBGE IdentificadorFamíliaPrefeito)
by CódigoIBGE IdentificadorFamíliaPrefeito, sort: g double eleiçõespós88_sqrd=(xfamil_i_pós88/eleições_pós88)^2
egen tag = tag(IdentificadorFamíliaPrefeito CódigoIBGE) if ANOELEIÇÃO>=1988
egen double HHI=sum(eleiçõespós88_sqrd) if tag==1, by(CódigoIBGE)
mipolate HHI IdentificadorFamíliaPrefeito, generate(HHI_fam_pós88r) groupwise by(CódigoIBGE)
drop HHI
drop tag
drop eleições_pós88
drop xfamil_i_pós88
drop eleiçõespós88_sqrd
label var HHI_fam_pós88r "HHI famílias pós-ditadura com reeleições"


sum HHI_fam HHI_fam_pré HHI_fam_pós HHI_fam_pós1 HHI_fam_pré64 HHI_fam_Ditad HHI_fam_pós88 HHI_fam_pós88r

******************************************************************************************************************************************************************************
******************************************************************************************************************************************************************************
*** perceba que o valor máximo para HHI antes de 75 e antes de 64 é 1, o que decorre em geral de algumas observações terem apenas uma eleição antes do ano de corte
* perceba como, de qualquer modo, a média da concentração por famiílias diminui, antes e depois do choque de 75. O mesmo ocorreu antes, durante e após a ditadura.


********************************************** HHI_famil calculado em blocos: 1947:62; 63:75; 76:88; 89:04; 05:20 ***********************************************************
/*
***** HHI_fam: 47:62

egen double eleições_lim62=count(ANOELEIÇÃO) if ANOELEIÇÃO<=1962, by(CódigoIBGE)
egen double xfamil_i_lim62=count(IdentificadorFamíliaPrefeito) if ANOELEIÇÃO<=1962, by(CódigoIBGE IdentificadorFamíliaPrefeito)
by CódigoIBGE IdentificadorFamíliaPrefeito, sort: g double eleiçõeslim62_sqrd=(xfamil_i_lim62/eleições_lim62)^2
egen tag = tag(IdentificadorFamíliaPrefeito CódigoIBGE) if ANOELEIÇÃO<=1962
egen double HHI=sum(eleiçõeslim62_sqrd) if tag==1, by(CódigoIBGE)
mipolate HHI IdentificadorFamíliaPrefeito, generate(HHI_fam_lim62) groupwise by(CódigoIBGE)
drop HHI
drop tag
drop eleições_lim62
drop xfamil_i_lim62
drop eleiçõeslim62_sqrd
label var HHI_fam_lim62 "HHI famílias 47:62"
replace HHI_fam_lim62 = . if HHI_fam_lim62 == 0
sort(CódigoIBGE ESTADO ANOELEIÇÃO)

* a média é puxada para cima por conta dos municípios que só tiveram uma eleição no período

*/

***** HHI_fam: 64:75

egen double eleições_64_75=count(ANOELEIÇÃO) if ANOELEIÇÃO>=1964 & ANOELEIÇÃO<=1975, by(CódigoIBGE)
egen double xfamil_i_64_75=count(IdentificadorFamíliaPrefeito) if ANOELEIÇÃO>=1964 & ANOELEIÇÃO<=1975, by(CódigoIBGE IdentificadorFamíliaPrefeito)
by CódigoIBGE IdentificadorFamíliaPrefeito, sort: g double eleições_64_75_sqrd=(xfamil_i_64_75/eleições_64_75)^2
egen tag = tag(IdentificadorFamíliaPrefeito CódigoIBGE) if ANOELEIÇÃO>=1964 & ANOELEIÇÃO<=1975
egen double HHI=sum(eleições_64_75_sqrd) if tag==1, by(CódigoIBGE)
mipolate HHI IdentificadorFamíliaPrefeito, generate(HHI_fam_64_75) groupwise by(CódigoIBGE)
drop HHI
drop tag
drop eleições_64_75
drop xfamil_i_64_75
drop eleições_64_75_sqrd
label var HHI_fam_64_75 "HHI famílias 64:75"



***** HHI_fam: 75:88

egen double eleições_75_88=count(ANOELEIÇÃO) if ANOELEIÇÃO>1975 & ANOELEIÇÃO<=1988, by(CódigoIBGE)
egen double xfamil_i_75_88=count(IdentificadorFamíliaPrefeito) if ANOELEIÇÃO>1975 & ANOELEIÇÃO<=1988, by(CódigoIBGE IdentificadorFamíliaPrefeito)
by CódigoIBGE IdentificadorFamíliaPrefeito, sort: g double eleições_75_88_sqrd=(xfamil_i_75_88/eleições_75_88)^2
egen tag = tag(IdentificadorFamíliaPrefeito CódigoIBGE) if ANOELEIÇÃO>1975 & ANOELEIÇÃO<=1988
egen double HHI=sum(eleições_75_88_sqrd) if tag==1, by(CódigoIBGE)
mipolate HHI IdentificadorFamíliaPrefeito, generate(HHI_fam_75_88) groupwise by(CódigoIBGE)
drop HHI
drop tag
drop eleições_75_88
drop xfamil_i_75_88
drop eleições_75_88_sqrd
label var HHI_fam_75_88 "HHI famílias 75:88"


***** HHI_fam: 76:2020

egen double eleições_75_20=count(ANOELEIÇÃO) if ANOELEIÇÃO>1975 & ANOELEIÇÃO<=2020, by(CódigoIBGE)
egen double xfamil_i_75_20=count(IdentificadorFamíliaPrefeito) if ANOELEIÇÃO>1975 & ANOELEIÇÃO<=2020, by(CódigoIBGE IdentificadorFamíliaPrefeito)
by CódigoIBGE IdentificadorFamíliaPrefeito, sort: g double eleições_75_20_sqrd=(xfamil_i_75_20/eleições_75_20)^2
egen tag = tag(IdentificadorFamíliaPrefeito CódigoIBGE) if ANOELEIÇÃO>1975 & ANOELEIÇÃO<=2020
egen double HHI=sum(eleições_75_20_sqrd) if tag==1, by(CódigoIBGE)
mipolate HHI IdentificadorFamíliaPrefeito, generate(HHI_fam_75_20) groupwise by(CódigoIBGE)
drop HHI
drop tag
drop eleições_75_20
drop xfamil_i_75_20
drop eleições_75_20_sqrd
label var HHI_fam_75_20 "HHI famílias 75:20"

***** HHI_fam: 86:20

egen double eleições_86_20=count(ANOELEIÇÃO) if ANOELEIÇÃO>=1986 & ANOELEIÇÃO<=2020, by(CódigoIBGE)
egen double xfamil_i_86_20=count(IdentificadorFamíliaPrefeito) if ANOELEIÇÃO>=1986 & ANOELEIÇÃO<=2020, by(CódigoIBGE IdentificadorFamíliaPrefeito)
by CódigoIBGE IdentificadorFamíliaPrefeito, sort: g double eleições_86_20_sqrd=(xfamil_i_86_20/eleições_86_20)^2
egen tag = tag(IdentificadorFamíliaPrefeito CódigoIBGE) if ANOELEIÇÃO>=1986 & ANOELEIÇÃO<=2020
egen double HHI=sum(eleições_86_20_sqrd) if tag==1, by(CódigoIBGE)
mipolate HHI IdentificadorFamíliaPrefeito, generate(HHI_fam_86_20) groupwise by(CódigoIBGE)
drop HHI
drop tag
drop eleições_86_20
drop xfamil_i_86_20
drop eleições_86_20_sqrd
label var HHI_fam_86_20 "HHI famílias 86:20"

***** HHI_fam: 86:97

egen double eleições_86_97=count(ANOELEIÇÃO) if ANOELEIÇÃO>=1986 & ANOELEIÇÃO<=1997, by(CódigoIBGE)
egen double xfamil_i_86_97=count(IdentificadorFamíliaPrefeito) if ANOELEIÇÃO>=1986 & ANOELEIÇÃO<=1997, by(CódigoIBGE IdentificadorFamíliaPrefeito)
by CódigoIBGE IdentificadorFamíliaPrefeito, sort: g double eleições_86_97_sqrd=(xfamil_i_86_97/eleições_86_97)^2
egen tag = tag(IdentificadorFamíliaPrefeito CódigoIBGE) if ANOELEIÇÃO>=1986 & ANOELEIÇÃO<=1997
egen double HHI=sum(eleições_86_97_sqrd) if tag==1, by(CódigoIBGE)
mipolate HHI IdentificadorFamíliaPrefeito, generate(HHI_fam_86_97) groupwise by(CódigoIBGE)
drop HHI
drop tag
drop eleições_86_97
drop xfamil_i_86_97
drop eleições_86_97_sqrd
label var HHI_fam_86_97 "HHI famílias 86:97"

***** HHI_fam: 00:20
*/
egen double eleições_lim20=count(ANOELEIÇÃO) if ANOELEIÇÃO>=2000 & ANOELEIÇÃO<=2020, by(CódigoIBGE)
egen double xfamil_i_lim20=count(IdentificadorFamíliaPrefeito) if ANOELEIÇÃO>=2000 & ANOELEIÇÃO<=2020, by(CódigoIBGE IdentificadorFamíliaPrefeito)
by CódigoIBGE IdentificadorFamíliaPrefeito, sort: g double eleições_lim20_sqrd=(xfamil_i_lim20/eleições_lim20)^2
egen tag = tag(IdentificadorFamíliaPrefeito CódigoIBGE) if ANOELEIÇÃO>=2000 & ANOELEIÇÃO<=2020
egen double HHI=sum(eleições_lim20_sqrd) if tag==1, by(CódigoIBGE)
mipolate HHI IdentificadorFamíliaPrefeito, generate(HHI_fam_00_20) groupwise by(CódigoIBGE)
drop HHI
drop tag
drop eleições_lim20
drop xfamil_i_lim20
drop eleições_lim20_sqrd
label var HHI_fam_00_20 "HHI famílias 00:20"

******************************************************************************************************************************************************************************
******************************************************************************************************************************************************************************

****************************************************************** HHI em termos de concentração de partidos ** *************************************************************

************************************* HHI Partidos: somat_i(quantidade de vezes que partido i venceu eleição/total eleições)^2 *************************************************
************************************************************************ Todo o período: ************************************************************************************

sort(CódigoIBGE ESTADO)
egen double n_eleições=count(ANOELEIÇÃO) if PARTIDO1ºCOLOCADO!="", by(CódigoIBGE)
by CódigoIBGE PARTIDO1ºCOLOCADO, sort: gen xpart = _N if PARTIDO1ºCOLOCADO!=""
by CódigoIBGE PARTIDO1ºCOLOCADO, sort: g double part_sqrd=(xpart/n_eleições)^2
egen tag2 = tag(PARTIDO1ºCOLOCADO CódigoIBGE ESTADO)
egen double HHIp=sum(part_sqrd) if tag==1, by(CódigoIBGE ESTADO)
sum HHIp
mipolate HHIp tag2, generate(HHI_partidos) groupwise by(CódigoIBGE ESTADO)
drop HHIp
drop tag2
drop n_eleições
drop xpart
drop part_sqrd
label var HHI_partidos "HHI partidos 1947-2020"

************************************************************************** Antes de 1975: ************************************************************************************

sort(CódigoIBGE ESTADO)
egen double n_eleições=count(ANOELEIÇÃO) if PARTIDO1ºCOLOCADO!="" & ANOELEIÇÃO<=1975, by(CódigoIBGE)
egen double xpart_i_pré=count(PARTIDO1ºCOLOCADO) if ANOELEIÇÃO<=1975, by(CódigoIBGE PARTIDO1ºCOLOCADO)
by CódigoIBGE PARTIDO1ºCOLOCADO, sort: g double xpartpré_sqrd=(xpart_i_pré/n_eleições)^2
egen tag = tag(PARTIDO1ºCOLOCADO CódigoIBGE) if ANOELEIÇÃO<=1975
egen double HHI=sum(xpartpré_sqrd) if tag==1, by(CódigoIBGE)
mipolate HHI CódigoIBGE, generate(HHI_part_pré75) groupwise by(CódigoIBGE)
drop HHI
drop tag
drop n_eleições
drop xpart_i_pré
drop xpartpré_sqrd
label var HHI_part_pré75 "HHI partidos pré-1975"
replace HHI_part_pré75 = . if HHI_fam_pré == 0

sum HHI_fam_pré if HHI_fam_pré!=1 

********************************************************************** Pós 1975 (com reeleições): ***************************************************************************

sort(CódigoIBGE ESTADO)
egen double eleições_pós75=count(ANOELEIÇÃO) if ANOELEIÇÃO>=1975 & PARTIDO1ºCOLOCADO!="", by(CódigoIBGE)
egen double xpart_i_pós75c=count(PARTIDO1ºCOLOCADO) if ANOELEIÇÃO>=1975, by(CódigoIBGE PARTIDO1ºCOLOCADO)
by CódigoIBGE PARTIDO1ºCOLOCADO, sort: g double eleiçõespós75_sqrd=(xpart_i_pós75c/eleições_pós75)^2
egen tag = tag(PARTIDO1ºCOLOCADO CódigoIBGE) if ANOELEIÇÃO>=1975
egen double HHI=sum(eleiçõespós75_sqrd) if tag==1, by(CódigoIBGE)
mipolate HHI CódigoIBGE, generate(HHI_part_pós75c) groupwise by(CódigoIBGE)
drop HHI
drop tag
drop eleições_pós75
drop xpart_i_pós75
drop eleiçõespós75_sqrd
label var HHI_part_pós75c "HHI partidos pós-1975 com reeleições"

********************************************************************** Pós 1975 (sem reeleições): ****************************************************************************

egen double eleições_pós75=count(ANOELEIÇÃO) if ANOELEIÇÃO>=1975 & dummie_reeleição!=1 & PARTIDO1ºCOLOCADO!="", by(CódigoIBGE)
egen double xpart_i_pós75=count(PARTIDO1ºCOLOCADO) if ANOELEIÇÃO>=1975 & dummie_reeleição!=1, by(CódigoIBGE PARTIDO1ºCOLOCADO)
by CódigoIBGE PARTIDO1ºCOLOCADO, sort: g double eleiçõespós75_sqrd=(xpart_i_pós75/eleições_pós)^2
egen tag = tag(PARTIDO1ºCOLOCADO CódigoIBGE) if ANOELEIÇÃO>=1975 & dummie_reeleição!=1
egen double HHI=sum(eleiçõespós75_sqrd) if tag==1, by(CódigoIBGE)

mipolate HHI CódigoIBGE, generate(HHI_part_pós75s) groupwise by(CódigoIBGE)
drop HHI
drop tag
drop eleições_pós75
drop xpart_i_pós75
drop eleiçõespós75_sqrd
label var HHI_part_pós75s "HHI partidos pós-1975 sem reeleições"


******************************************************************* Período 1964-1975 ***************************************************************************************
sort(CódigoIBGE ESTADO)
egen double eleições_64_75=count(ANOELEIÇÃO) if ANOELEIÇÃO<=1975 & ANOELEIÇÃO>=1964 & PARTIDO1ºCOLOCADO!="", by(CódigoIBGE)
egen double xpart_i_64_75=count(PARTIDO1ºCOLOCADO) if ANOELEIÇÃO<=1975 & ANOELEIÇÃO>=1964 & PARTIDO1ºCOLOCADO!="", by(CódigoIBGE PARTIDO1ºCOLOCADO)
by CódigoIBGE PARTIDO1ºCOLOCADO, sort: g double eleições_64_75_sqrd=(xpart_i_64_75/eleições_64_75)^2
egen tag = tag(PARTIDO1ºCOLOCADO CódigoIBGE) if ANOELEIÇÃO<=1975 & ANOELEIÇÃO>=1964 & PARTIDO1ºCOLOCADO!=""
egen double HHI=sum(eleições_64_75_sqrd) if tag==1, by(CódigoIBGE)
mipolate HHI CódigoIBGE, generate(HHI_part_64_75) groupwise by(CódigoIBGE)
drop HHI
drop tag
drop eleições_64_75
drop xpart_i_64_75
drop eleições_64_75_sqrd
label var HHI_part_64_75 "HHI partidos 1964-1975"


********************************************************************* Período 1975-1988 ***************************************************************************************
sort(CódigoIBGE ESTADO)
egen double eleições_75_88=count(ANOELEIÇÃO) if ANOELEIÇÃO>1975 & ANOELEIÇÃO<=1988 & PARTIDO1ºCOLOCADO!="", by(CódigoIBGE)
egen double xpart_i_75_88=count(PARTIDO1ºCOLOCADO) if ANOELEIÇÃO>1975 & ANOELEIÇÃO<=1988 & PARTIDO1ºCOLOCADO!="", by(CódigoIBGE PARTIDO1ºCOLOCADO)
by CódigoIBGE PARTIDO1ºCOLOCADO, sort: g double eleições_75_88_sqrd=(xpart_i_75_88/eleições_75_88)^2
egen tag = tag(PARTIDO1ºCOLOCADO CódigoIBGE) if ANOELEIÇÃO>1975 & ANOELEIÇÃO<=1988 & PARTIDO1ºCOLOCADO!=""
egen double HHI=sum(eleições_75_88_sqrd) if tag==1, by(CódigoIBGE)
mipolate HHI CódigoIBGE, generate(HHI_part_75_88) groupwise by(CódigoIBGE)
drop HHI
drop tag
drop eleições_75_88
drop xpart_i_75_88
drop eleições_75_88_sqrd
label var HHI_part_75_88 "HHI partidos 1975-1988"

******************************************************************************************************************************************************************************
******************************************************************************************************************************************************************************

** fazer a diferenciação de pós 75 com reeleições e sem reeleições para HHI partidos é irrelevante, tendo em conta de que nunca existiu vedação à reeleição de partidos

** Interpretação: HHI = 1: um partido vence as eleições no período destacado
**************** HHI = 0.1: 10 partidos vencem as eleições no período destacado

**************** Lembrando que eleições com missing partidos não foram contabilizadas: 898 eleições em 547 municípios (apenas 3 municípios do PR)
*************** Os valores para SP devem estar viesados pela falta de dados.

******************************************************************************************************************************************************************************
******************************************************************************************************************************************************************************



*************************************** indicador de alternância política em termos de % eleições vencidas por partido entrantes **********************************************

************************************************************************* Para todo o período: ********************************************************************************

egen double n_eleições=count(ANOELEIÇÃO) if PARTIDO1ºCOLOCADO!="", by(CódigoIBGE)
gen n1_eleições = (n_eleições-1)
sort(CódigoIBGE ESTADO ANOELEIÇÃO)
gen DV = 0
bysort CódigoIBGE: replace DV = 1 if _n == 1
bysort CódigoIBGE: replace DV = 1 if PARTIDO1ºCOLOCADO == ""
bysort CódigoIBGE: replace DV = 1 if DV == 0 & DV[_n-1] == 1 & PARTIDO1ºCOLOCADO[_n-1] == ""
bysort CódigoIBGE: replace DV = 1 if DV == 0 & PARTIDO1ºCOLOCADO[_n-1] == PARTIDO1ºCOLOCADO[_n]
egen double n_p_entr=count(DV) if DV == 0, by(CódigoIBGE)

sort(CódigoIBGE ESTADO ANOELEIÇÃO)

by CódigoIBGE PARTIDO1ºCOLOCADO, sort: g double percent_p_entrantes = (n_p_entr/n1_eleições)*100
sort(CódigoIBGE ESTADO ANOELEIÇÃO)
mipolate percent_p_entrantes CódigoIBGE, generate(percent_p_entrantes_m) groupwise by(CódigoIBGE)
label var percent_p_entrantes_m "Percentual Alternância de poder"
drop n_eleições n1_eleições DV n_p_entr percent_p_entrantes

** Interpretação: 100%: houve alternância de poder entre partidos em todas eleições.
** ************** 14%: alternância de poder em 14% das eleições

***************************************************************************** ANTES DE 1975: ***********************************************************************************

egen double n_eleições=count(ANOELEIÇÃO) if PARTIDO1ºCOLOCADO!="" & ANOELEIÇÃO<=1975, by(CódigoIBGE)
gen n1_eleições = (n_eleições-1)
gen DV = 0
bysort CódigoIBGE: replace DV = 1 if _n == 1
bysort CódigoIBGE: replace DV = 1 if PARTIDO1ºCOLOCADO == ""
bysort CódigoIBGE: replace DV = 1 if DV == 0 & DV[_n-1] == 1 & PARTIDO1ºCOLOCADO[_n-1] == ""
bysort CódigoIBGE: replace DV = 1 if DV == 0 & PARTIDO1ºCOLOCADO[_n-1] == PARTIDO1ºCOLOCADO[_n] & ANOELEIÇÃO <= 1975
egen double n_p_entr=count(DV) if DV == 0 & ANOELEIÇÃO <=1975, by(CódigoIBGE)
sort(CódigoIBGE ESTADO ANOELEIÇÃO)
by CódigoIBGE PARTIDO1ºCOLOCADO, sort: g double percent_p_entr_pré75 = (n_p_entr/n1_eleições)*100
mipolate percent_p_entr_pré75 CódigoIBGE, generate(percent_p_entr_pré75_m) groupwise by(CódigoIBGE)
label var percent_p_entr_pré75_m "Percentual Alternância de poder pré-1975"

sort(CódigoIBGE ESTADO ANOELEIÇÃO)
drop n_eleições n1_eleições DV n_p_entr percent_p_entr_pré75

********************************************************************** DEPOIS DE 1975 (com reeleições): ************************************************************************

egen double n_eleições=count(ANOELEIÇÃO) if PARTIDO1ºCOLOCADO!="" & ANOELEIÇÃO>=1975, by(CódigoIBGE)
gen DV = 0
bysort CódigoIBGE: replace DV = 1 if _n == 1
bysort CódigoIBGE: replace DV = 1 if PARTIDO1ºCOLOCADO == ""
bysort CódigoIBGE: replace DV = 1 if DV == 0 & DV[_n-1] == 1 & PARTIDO1ºCOLOCADO[_n-1] == ""
bysort CódigoIBGE: replace DV = 1 if DV == 0 & PARTIDO1ºCOLOCADO[_n-1] == PARTIDO1ºCOLOCADO[_n]
egen double n_p_entr=count(DV) if DV == 0 & ANOELEIÇÃO >=1975, by(CódigoIBGE)
by CódigoIBGE PARTIDO1ºCOLOCADO, sort: g double percent_p_entr_pós75 = (n_p_entr/n_eleições)*100
mipolate percent_p_entr_pós75 CódigoIBGE, generate(percent_p_entr_pós75_m) groupwise by(CódigoIBGE)
label var percent_p_entr_pós75_m "Percentual Alternância de poder pós-1975"
sort(CódigoIBGE ESTADO ANOELEIÇÃO)
drop n_eleições DV n_p_entr percent_p_entr_pós75



********************************************************************* Período 1964-1975 ****************************************************************************************
egen double n_eleições=count(ANOELEIÇÃO) if PARTIDO1ºCOLOCADO!="" & ANOELEIÇÃO<=1975 & ANOELEIÇÃO>=1964, by(CódigoIBGE)
gen DV = 0
bysort CódigoIBGE: replace DV = 1 if _n == 1
bysort CódigoIBGE: replace DV = 1 if PARTIDO1ºCOLOCADO == ""
bysort CódigoIBGE: replace DV = 1 if DV == 0 & DV[_n-1] == 1 & PARTIDO1ºCOLOCADO[_n-1] == ""
bysort CódigoIBGE: replace DV = 1 if DV == 0 & PARTIDO1ºCOLOCADO[_n-1] == PARTIDO1ºCOLOCADO[_n]
egen double n_p_entr=count(DV) if DV == 0 & ANOELEIÇÃO>=1964 & ANOELEIÇÃO<=1975, by(CódigoIBGE)
by CódigoIBGE PARTIDO1ºCOLOCADO, sort: g double percent_p_entr_64_75 = (n_p_entr/n_eleições)*100
mipolate percent_p_entr_64_75 CódigoIBGE, generate(percent_p_entr_64_75_m) groupwise by(CódigoIBGE)
label var percent_p_entr_64_75_m "Percentual Alternância 1964-1975"
sort(CódigoIBGE ESTADO ANOELEIÇÃO)
drop n_eleições DV n_p_entr percent_p_entr_64_75

*********************************************************************** Período 1975-1988 **************************************************************************************
egen double n_eleições=count(ANOELEIÇÃO) if PARTIDO1ºCOLOCADO!="" & ANOELEIÇÃO>1975 & ANOELEIÇÃO>=1988, by(CódigoIBGE)
gen DV = 0
bysort CódigoIBGE: replace DV = 1 if _n == 1
bysort CódigoIBGE: replace DV = 1 if PARTIDO1ºCOLOCADO == ""
bysort CódigoIBGE: replace DV = 1 if DV == 0 & DV[_n-1] == 1 & PARTIDO1ºCOLOCADO[_n-1] == ""
bysort CódigoIBGE: replace DV = 1 if DV == 0 & PARTIDO1ºCOLOCADO[_n-1] == PARTIDO1ºCOLOCADO[_n]
egen double n_p_entr=count(DV) if DV == 0 & ANOELEIÇÃO>1975 & ANOELEIÇÃO<=1988, by(CódigoIBGE)
by CódigoIBGE PARTIDO1ºCOLOCADO, sort: g double percent_p_entr_75_88 = (n_p_entr/n_eleições)*100
mipolate percent_p_entr_75_88 CódigoIBGE, generate(percent_p_entr_75_88_m) groupwise by(CódigoIBGE)
label var percent_p_entr_75_88_m "Percentual Alternância 1975-1988"
sort(CódigoIBGE ESTADO ANOELEIÇÃO)
drop n_eleições DV n_p_entr percent_p_entr_75_88

/* esse indicador para os periodos 64-75/75-88 fica muito prejudicado pela falta de dados. A média de alternancia para o primeiro periodo fica muito elevado, ou seja, haveria
muitos partidos entrantes, o que só deve ocorrer por conta de 1. falta de dados para eleições; 2. mudança de regime em 64, o que faz com que os partidos quase sempre sejam entrant.
*/
********************************************************************************************************************************************************************************
********************************************************************************************************************************************************************************


****************************************** Ìndice em termos de % de votos:votações acirradas (2,5; 5; 10%)  ********************************************************************

** ELEIÇÕES ACIRRADAS CONSIDERANDO 2,5% DE DIFERENÇA ENTRE 1º E 2º
bysort CódigoIBGE: g float percent_votos = (VtosNomin1/TOTALVOTOSNOMINAIS)
bysort CódigoIBGE: g float percent_votos2º = (VotosOutro_1/TOTALVOTOSNOMINAIS)
bysort CódigoIBGE: g float percent_votos3º = (VotosOutro_2/TOTALVOTOSNOMINAIS)
bysort CódigoIBGE: g float percent_votos4º = (VotosOutro_3/TOTALVOTOSNOMINAIS)
bysort CódigoIBGE: g float percent_votos5º = (VotosOutro_4/TOTALVOTOSNOMINAIS)
bysort CódigoIBGE: g float percent_votos6º = (VotosOutro_5/TOTALVOTOSNOMINAIS)
g dif_1º_2º = percent_votos - percent_votos2º
g dif_1º_3º = percent_votos - percent_votos3º
g dif_1º_4º = percent_votos - percent_votos4º
g dif_1º_5º = percent_votos - percent_votos5º
g dif_1º_6º = percent_votos - percent_votos6º

g dum_dif25 = 1 if dif_1º_2º <= 0.025 & dif_1º_2º >= -0.025
replace dum_dif25 = 1 if dif_1º_3º <= 0.025 & dum_dif25 == 0 & dif_1º_3º >= -0.025
replace dum_dif25 = 1 if dif_1º_4º <= 0.025 & dum_dif25 == 0 & dif_1º_4º >= -0.025
replace dum_dif25 = 1 if dif_1º_5º <= 0.025 & dum_dif25 == 0 & dif_1º_5º >= -0.025
replace dum_dif25 = 1 if dif_1º_6º <= 0.025 & dum_dif25 == 0 & dif_1º_6º >= -0.025

egen double n_eleições=count(ANOELEIÇÃO) if percent_votos != ., by(CódigoIBGE)
bysort CódigoIBGE: egen soma_el_acir25 = sum(dum_dif25)
bysort CódigoIBGE: g pc_ele_acir_25 = (soma_el_acir25/n_eleições) * 100
drop dum_dif25 soma_el_acir25


** ELEIÇÕES ACIRRADAS 5%
g dum_dif5 = 1 if dif_1º_2º <= 0.05 & dif_1º_2º >= -0.05
replace dum_dif5 = 1 if dif_1º_3º <= 0.05 & dum_dif5 == 0 & dif_1º_3º >= -0.05
replace dum_dif5 = 1 if dif_1º_4º <= 0.05 & dum_dif5 == 0 & dif_1º_4º >= -0.05
replace dum_dif5 = 1 if dif_1º_5º <= 0.05 & dum_dif5 == 0 & dif_1º_5º >= -0.05
replace dum_dif5 = 1 if dif_1º_6º <= 0.05 & dum_dif5 == 0 & dif_1º_6º >= -0.05

bysort CódigoIBGE: egen soma_el_acir5 = sum(dum_dif5)
bysort CódigoIBGE: g pc_ele_acir_5 = (soma_el_acir5/n_eleições) * 100
drop dum_dif5 soma_el_acir5


** ELEIÇÕES ACIRRADAS 10%
g dum_dif10 = 1 if dif_1º_2º <= 0.10 & dif_1º_2º >= -0.10
replace dum_dif10 = 1 if dif_1º_3º <= 0.10 & dum_dif10 == 0 & dif_1º_3º >= -0.10
replace dum_dif10 = 1 if dif_1º_4º <= 0.10 & dum_dif10 == 0 & dif_1º_4º >= -0.10
replace dum_dif10 = 1 if dif_1º_5º <= 0.10 & dum_dif10 == 0 & dif_1º_5º >= -0.10
replace dum_dif10 = 1 if dif_1º_6º <= 0.10 & dum_dif10 == 0 & dif_1º_6º >= -0.10
bysort CódigoIBGE: egen soma_el_acir10 = sum(dum_dif10)
bysort CódigoIBGE: g pc_ele_acir_10 = (soma_el_acir10/n_eleições) * 100
drop dum_dif10 soma_el_acir10
drop n_eleições

/* considerando o parana, com 2,5% de diferença, perdemos 1129 observações (20,41% das observações do estado). Com 5%, perde-se 331 (5,98%). Com 10%, 23 observ (0,415%).
considerando SP, com 2,5% perdemos 2,132 observações (15,12%). Com 5%, perdemos 509 obs (4,98%). Com 10%, 60 obs (0,587%).
Lembrar que para o período ditatorial, é possível que a diferença entre 1º e demais colocados seja negativa, haja vista a possibilidade de candidatos com menos votos vencerem
Por isso coloquei a restrição de que para ser contada, a eleição precisa ter diferença maior que -0,025; -0,05; -0,1.

Vou usar o limite de 5%. Paraná é o estado com dados mais completos; com um limite mais rígido perde-se dados demais; com 10% o limite torna-se frouxo; a perda e observações
é próxima para os dois estados.
*/
******************************************************************************* Para antes de 1975: ****************************************************************************

egen double n_eleições=count(ANOELEIÇÃO) if percent_votos != . & ANOELEIÇÃO<=1975, by(CódigoIBGE)
sort(CódigoIBGE ESTADO ANOELEIÇÃO)
g dum_dif5 = 1 if dif_1º_2º <= 0.05 & ANOELEIÇÃO<=1975
replace dum_dif5 = 1 if dif_1º_3º <= 0.5 & dum_dif5 == 0 & dif_1º_3º >= -0.5 & ANOELEIÇÃO<=1975
replace dum_dif5 = 1 if dif_1º_4º <= 0.5 & dum_dif5 == 0 & dif_1º_4º >= -0.5 & ANOELEIÇÃO<=1975
replace dum_dif5 = 1 if dif_1º_5º <= 0.5 & dum_dif5 == 0 & dif_1º_5º >= -0.5 & ANOELEIÇÃO<=1975
replace dum_dif5 = 1 if dif_1º_6º <= 0.5 & dum_dif5 == 0 & dif_1º_6º >= -0.5 & ANOELEIÇÃO<=1975

bysort CódigoIBGE: egen soma_el_acir5 = sum(dum_dif5)
bysort CódigoIBGE: g pc_el_5_pré75 = (soma_el_acir5/n_eleições) * 100
mipolate pc_el_5_pré75 CódigoIBGE, generate(pc_el_5_pré75m) groupwise by(CódigoIBGE)
drop n_eleições dum_dif5 soma_el_acir5 pc_el_5_pré75

label variable pc_ele_acir_25 "% eleições dif 2,5%: 1947-2020"
label variable pc_ele_acir_5 "% eleições dif 5%: 1947-2020"
label variable pc_ele_acir_10 "% eleições dif 10%: 1947-2020"
label variable pc_el_5_pré75m "% eleições dif 5%: pré 1975"

******************************************************************************* Para depois de 1975: ****************************************************************************

egen double n_eleições=count(ANOELEIÇÃO) if percent_votos != . & ANOELEIÇÃO>1975, by(CódigoIBGE)
sort(CódigoIBGE ESTADO ANOELEIÇÃO)
g dum_dif5 = 1 if dif_1º_2º <= 0.05 & ANOELEIÇÃO>1975
replace dum_dif5 = 1 if dif_1º_3º <= 0.5 & dum_dif5 == 0 & dif_1º_3º >= -0.5 & ANOELEIÇÃO>1975
replace dum_dif5 = 1 if dif_1º_4º <= 0.5 & dum_dif5 == 0 & dif_1º_4º >= -0.5 & ANOELEIÇÃO>1975
replace dum_dif5 = 1 if dif_1º_5º <= 0.5 & dum_dif5 == 0 & dif_1º_5º >= -0.5 & ANOELEIÇÃO>1975
replace dum_dif5 = 1 if dif_1º_6º <= 0.5 & dum_dif5 == 0 & dif_1º_6º >= -0.5 & ANOELEIÇÃO>1975

bysort CódigoIBGE: egen soma_el_acir5 = sum(dum_dif5)
bysort CódigoIBGE: g pc_el_5_pós75 = (soma_el_acir5/n_eleições) * 100
mipolate pc_el_5_pós75 CódigoIBGE, generate(pc_el_5_pós75m) groupwise by(CódigoIBGE)
drop n_eleições dum_dif5 soma_el_acir5 pc_el_5_pós75
label variable pc_el_5_pós75m "% eleições dif 5%: pós 1975"

***************************************************************************** Período 1964-1975 ********************************************************************************
egen double n_eleições=count(ANOELEIÇÃO) if percent_votos != . & ANOELEIÇÃO>=1964 & ANOELEIÇÃO<=1975, by(CódigoIBGE)
sort(CódigoIBGE ESTADO ANOELEIÇÃO)
g dum_dif5 = 1 if dif_1º_2º <= 0.05 & ANOELEIÇÃO>=1964 & ANOELEIÇÃO<=1975
replace dum_dif5 = 1 if dif_1º_3º <= 0.5 & dum_dif5 == 0 & dif_1º_3º >= -0.5 & ANOELEIÇÃO>=1964 & ANOELEIÇÃO<=1975
replace dum_dif5 = 1 if dif_1º_4º <= 0.5 & dum_dif5 == 0 & dif_1º_4º >= -0.5 & ANOELEIÇÃO>=1964 & ANOELEIÇÃO<=1975
replace dum_dif5 = 1 if dif_1º_5º <= 0.5 & dum_dif5 == 0 & dif_1º_5º >= -0.5 & ANOELEIÇÃO>=1964 & ANOELEIÇÃO<=1975
replace dum_dif5 = 1 if dif_1º_6º <= 0.5 & dum_dif5 == 0 & dif_1º_6º >= -0.5 & ANOELEIÇÃO>=1964 & ANOELEIÇÃO<=1975

bysort CódigoIBGE: egen soma_el_acir5 = sum(dum_dif5) if dum_dif5!= . 
bysort CódigoIBGE: g pc_el_5_64_75 = (soma_el_acir5/n_eleições) * 100
mipolate pc_el_5_64_75 CódigoIBGE, generate(pc_el_5_64_75m) groupwise by(CódigoIBGE)
drop n_eleições dum_dif5 soma_el_acir5 pc_el_5_64_75
label variable pc_el_5_64_75m "% eleições dif 5%: 1964-1975"

***************************************************************************** Período 1975-1988 ********************************************************************************
egen double n_eleições=count(ANOELEIÇÃO) if percent_votos != . & ANOELEIÇÃO>1975 & ANOELEIÇÃO<=1988, by(CódigoIBGE)
sort(CódigoIBGE ESTADO ANOELEIÇÃO)
g dum_dif5 = 1 if dif_1º_2º <= 0.05 & ANOELEIÇÃO>1975 & ANOELEIÇÃO<=1988
replace dum_dif5 = 1 if dif_1º_3º <= 0.5 & dum_dif5 == 0 & dif_1º_3º >= -0.5 & ANOELEIÇÃO>1975 & ANOELEIÇÃO<=1988
replace dum_dif5 = 1 if dif_1º_4º <= 0.5 & dum_dif5 == 0 & dif_1º_4º >= -0.5 & ANOELEIÇÃO>1975 & ANOELEIÇÃO<=1988
replace dum_dif5 = 1 if dif_1º_5º <= 0.5 & dum_dif5 == 0 & dif_1º_5º >= -0.5 & ANOELEIÇÃO>1975 & ANOELEIÇÃO<=1988
replace dum_dif5 = 1 if dif_1º_6º <= 0.5 & dum_dif5 == 0 & dif_1º_6º >= -0.5 & ANOELEIÇÃO>1975 & ANOELEIÇÃO<=1988

bysort CódigoIBGE: egen soma_el_acir5 = sum(dum_dif5) if dum_dif5!= . 
bysort CódigoIBGE: g pc_el_5_75_88 = (soma_el_acir5/n_eleições) * 100
mipolate pc_el_5_75_88 CódigoIBGE, generate(pc_el_5_75_88m) groupwise by(CódigoIBGE)
drop n_eleições dum_dif5 soma_el_acir5 pc_el_5_75_88
label variable pc_el_5_75_88m "% eleições dif 5%: 1975-1988"

*** Analisando as médias para os dois estados, percebe-se que nos dois casos, as eleições se tornaram mais competitivas depois de 1975, um pouco mais para o caso de SP

** Juntando os antes e depois numa mesma variável:


*** Gerando um HHI com dados antes e depois do choque, por municípios:
bysort CódigoIBGE: g double HHI_fam_v = 0
bysort CódigoIBGE: replace HHI_fam_v = HHI_fam_pré if ANOELEIÇÃO < 1975
bysort CódigoIBGE: replace HHI_fam_v = HHI_fam_pós1 if ANOELEIÇÃO > 1975
label var HHI_fam_v "HHI famílias antes e depois 1975"

*** HHI_partido:
bysort CódigoIBGE: g double HHI_part_v = 0
bysort CódigoIBGE: replace HHI_part_v = HHI_part_pré75 if ANOELEIÇÃO < 1975
bysort CódigoIBGE: replace HHI_part_v = HHI_part_pós75c if ANOELEIÇÃO > 1975
label var HHI_part_v "HHI partidos antes e depois 1975"

*** Percentual competitividade, antes e depois:
bysort CódigoIBGE: g double compet_v = 0
bysort CódigoIBGE: replace  compet_v = pc_el_5_pré75m if ANOELEIÇÃO < 1975
bysort CódigoIBGE: replace compet_v = pc_el_5_pós75m if ANOELEIÇÃO > 1975
label var compet_v "% Competitividade antes e depois 1975"

*** Percentual alternância, antes e depois: 
bysort CódigoIBGE: g double altern_v = 0
bysort CódigoIBGE: replace  altern_v = percent_p_entr_pré75 if ANOELEIÇÃO < 1975
bysort CódigoIBGE: replace altern_v = percent_p_entr_pós75 if ANOELEIÇÃO > 1975
label var altern_v "% alternância antes e depois 1975"



*** Variáveis entre 1964 e 1988
**HHI fam
bysort CódigoIBGE: g double HHI_fam6488_v = 0
bysort CódigoIBGE: replace HHI_fam6488_v = HHI_fam_64_75 if ANOELEIÇÃO <= 1975
bysort CódigoIBGE: replace HHI_fam6488_v = HHI_fam_75_88 if ANOELEIÇÃO > 1975
label var HHI_fam6488_v "HHI famílias 1964-1988"

*** HHI_partido:
bysort CódigoIBGE: g double HHI_part6488_v = 0
bysort CódigoIBGE: replace HHI_part6488_v = HHI_part_64_75 if ANOELEIÇÃO <= 1975
bysort CódigoIBGE: replace HHI_part6488_v = HHI_part_75_88 if ANOELEIÇÃO > 1975
label var HHI_part6488_v "HHI partidos 1964-1988"

*** Percentual competitividade, antes e depois:
bysort CódigoIBGE: g double compet_6488v = 0
bysort CódigoIBGE: replace  compet_6488v = pc_el_5_64_75m if ANOELEIÇÃO <= 1975
bysort CódigoIBGE: replace compet_6488v = pc_el_5_75_88m if ANOELEIÇÃO > 1975
label var compet_6488v "% Competitividade 1964-1988"

*** Percentual alternância, antes e depois: 
bysort CódigoIBGE: g double altern_6488v = 0
bysort CódigoIBGE: replace  altern_6488v = percent_p_entr_64_75_m if ANOELEIÇÃO <= 1975
bysort CódigoIBGE: replace altern_6488v = percent_p_entr_75_88_m if ANOELEIÇÃO > 1975
label var altern_6488v "% alternância 1964-1988"
    
/*bysort CódigoIBGE: g double HHI_fam_v2 = 0
bysort CódigoIBGE: replace HHI_fam_v2 = HHI_fam_lim62 if ANOELEIÇÃO <= 1962
bysort CódigoIBGE: replace HHI_fam_v2 = HHI_fam_lim75 if ANOELEIÇÃO > 1962 & ANOELEIÇÃO <=1975
bysort CódigoIBGE: replace HHI_fam_v2 = HHI_fam_lim88 if ANOELEIÇÃO > 1975 & ANOELEIÇÃO < 1988
bysort CódigoIBGE: replace HHI_fam_v2 = HHI_fam_lim04 if ANOELEIÇÃO >= 1988 & ANOELEIÇÃO <=2004
bysort CódigoIBGE: replace HHI_fam_v2 = HHI_fam_lim20 if ANOELEIÇÃO > 2004 & ANOELEIÇÃO <=2020
label var HHI_fam_v2 "HHI famílias 47:62; 63:75; 76:87; 88:04; 05:20"
*/

drop dif_1º_2º dif_1º_3º dif_1º_4º dif_1º_5º dif_1º_6º percent_votos6º percent_votos5º percent_votos4º percent_votos3º percent_votos2º percent_votos HHI_fam_pós88r HHI_fam_pós88 HHI_fam_Ditad HHI_fam_pré64 nome_prefeito VOTOSOUTROCANDIDATO_14 VOTOSOUTROCANDIDATO_13 VOTOSOUTROCANDIDATO_12 VOTOSOUTROCANDIDATO_11 VOTOSOUTROCANDIDATO_10 VOTOSOUTROCANDIDATO_9 VOTOSOUTROCANDIDATO_8 VOTOSOUTROCANDIDATO_7 VOTOSOUTROCANDIDATO_6 VotosOutro_5 VotosOutro_4 VotosOutro_3 VotosOutro_2 VotosOutro_1 NOMEOUTROCANDIDATO_1 NOMEVICEPREFEITOELEITO PARTIDO1ºCOLOCADO NOME1ºCOLOCADO VtosNomin1 TOTALVOTOSNOMINAIS Votantes Eleitorado_int
drop HHI_fam HHI_fam_pré HHI_fam_pós HHI_fam_pós1 HHI_partidos HHI_part_pré75 HHI_part_pós75c HHI_part_pós75s HHI_part_64_75 HHI_part_75_88 percent_p_entrantes_m percent_p_entr_pré75_m percent_p_entr_pós75_m percent_p_entr_64_75_m percent_p_entr_75_88_m pc_ele_acir_25 pc_ele_acir_5 pc_ele_acir_10 pc_el_5_pré75m pc_el_5_pós75m pc_el_5_64_75m pc_el_5_75_88m

** criando covariada de coffee_area variando no tempo:  coffee_area1975 coffee_area1980 coffee_area1985
g coffee_area_v = 0
bysort CódigoIBGE: replace  coffee_area_v = coffee_area1970 if ANOELEIÇÃO < 1975
bysort CódigoIBGE: replace coffee_area_v = coffee_area1975 if ANOELEIÇÃO >= 1975 & ANOELEIÇÃO < 1980
bysort CódigoIBGE: replace coffee_area_v = coffee_area1980 if ANOELEIÇÃO >= 1980 & ANOELEIÇÃO < 1985
bysort CódigoIBGE: replace coffee_area_v = coffee_area1985 if ANOELEIÇÃO >= 1985

* covariada farms, variando no tempo: farms1960 farms1970 farms1975 farms1980 farms1985
g farms_v = 0
bysort CódigoIBGE: replace  farms_v = farms1960 if ANOELEIÇÃO < 1970
bysort CódigoIBGE: replace farms_v = farms1970 if ANOELEIÇÃO >= 1970 & ANOELEIÇÃO < 1975
bysort CódigoIBGE: replace farms_v = farms1975 if ANOELEIÇÃO >= 1975 & ANOELEIÇÃO < 1980
bysort CódigoIBGE: replace farms_v = farms1980 if ANOELEIÇÃO >= 1980 & ANOELEIÇÃO < 1985
bysort CódigoIBGE: replace farms_v = farms1985 if ANOELEIÇÃO >= 1985

* covariada farms_area, variando no tempo: area1960 area1970 area1975 area1980 area1985
g area_v = 0
bysort CódigoIBGE: replace  area_v = area1960 if ANOELEIÇÃO < 1970
bysort CódigoIBGE: replace area_v = area1970 if ANOELEIÇÃO >= 1970 & ANOELEIÇÃO < 1975
bysort CódigoIBGE: replace area_v = area1975 if ANOELEIÇÃO >= 1975 & ANOELEIÇÃO < 1980
bysort CódigoIBGE: replace area_v = area1980 if ANOELEIÇÃO >= 1980 & ANOELEIÇÃO < 1985
bysort CódigoIBGE: replace area_v = area1985 if ANOELEIÇÃO >= 1985

** Criação das dummies de tempo e de localidade:

bysort CódigoIBGE: g d_T  = 0
replace d_T = 1 if ANOELEIÇÃO > 1975
label var d_T "antes 1975 ==0; depois==1"

*d_PR:
bysort CódigoIBGE: g estado = 0
replace estado = 1 if ESTADO == "PR"
replace estado = 2 if ESTADO == "SP"
bysort CódigoIBGE: g d_PR = 0
replace d_PR = 1 if estado == 1
label var d_PR "PR==1; SP==0"
bysort CódigoIBGE: g eleição = 0
by CódigoIBGE, sort: gen neleição = _n


*** interações:
g PRcoffeetrees = d_PR*coffeetrees_perarea1975
label var PRcoffeetrees "d_PR*coffeetrees_perarea1975"
g Tcoffeetrees = d_T*coffeetrees_perarea1975
label var Tcoffeetrees "d_T*coffeetrees_perarea1975"
g TPR = d_T*d_PR
label var TPR "d_T*d_PR"
g TPRcoffeetrees = coffeetrees_perarea1975*d_T*d_PR
label var TPRcoffeetrees "coffeetrees_perarea1975*d_T*d_PR"
g PRcoffeemun = d_PR*coffee_mun1975
label var PRcoffeemun "d_PR*coffee_mun1975"
g Tcoffeemun = d_T*coffee_mun1975
label var Tcoffeemun "d_T*coffee_mun1975"
g TPRcoffeemun = d_T*d_PR*coffee_mun1975
label var TPRcoffeemun "d_T*d_PR*coffee_mun1975"

g PRHHIfam = d_PR*HHI_fam_v


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





******************************************************** POR MQ2E ***********************************************************************************************************


*****************************************************************************************************************************************************************************

** Indíce Governança Naritomi:
** coffeetrees/area, sem covariadas:
ivreg2 rescale_governanca (HHI_fam_86_20=coffeetrees_perarea1975) if ANOELEIÇÃO==2020, cluster(amc1960) first
** coffeetrees/area, com covariadas:
ivreg2 rescale_governanca (HHI_fam_86_20=coffeetrees_perarea1975) PopulaçãoestimadaMunic2019 ÁreaEmkm2 Nºtotalestabelecimentosagríco AreaTotalEstabelecimentosAgr TamanhoMédioEst dist_capital latitude longitude aluguel_1950 pop_tot_1950 pc_negros_1950 pc_protest_1950 pc_analf_1950 pc_empreg_agric_1950 pc_estrang_1950 gini1950 maize_area1970 wheat_area1970 soy_area1970 sugar_area1970 beans_area1970 anofundação if ANOELEIÇÃO==2020, cluster(amc1960) first

** coffeemun, sem covariadas:
ivreg2 rescale_governanca (HHI_fam_86_20=coffee_mun1975) if ANOELEIÇÃO==2020, cluster(amc1960) first
** coffeemun, com covariadas:
ivreg2 rescale_governanca (HHI_fam_86_20=coffee_mun1975) PopulaçãoestimadaMunic2019 ÁreaEmkm2 Nºtotalestabelecimentosagríco AreaTotalEstabelecimentosAgr TamanhoMédioEst dist_capital latitude longitude aluguel_1950 pop_tot_1950 pc_negros_1950 pc_protest_1950 pc_analf_1950 pc_empreg_agric_1950 pc_estrang_1950 gini1950 maize_area1970 wheat_area1970 soy_area1970 sugar_area1970 beans_area1970 anofundação if ANOELEIÇÃO==2020, cluster(amc1960) first

** ìndice Acesso à Justiça:
ivreg2 NoInstJusti (HHI_fam_86_20=coffeetrees_perarea1975) if ANOELEIÇÃO == 2020, cluster(amc1960) first
ivreg2 NoInstJusti (HHI_fam_86_20=coffeetrees_perarea1975) PopulaçãoestimadaMunic2019 ÁreaEmkm2 Nºtotalestabelecimentosagríco AreaTotalEstabelecimentosAgr TamanhoMédioEst dist_capital latitude longitude aluguel_1950 pop_tot_1950 pc_negros_1950 pc_protest_1950 pc_analf_1950 pc_empreg_agric_1950 pc_estrang_1950 gini1950 maize_area1970 wheat_area1970 soy_area1970 sugar_area1970 beans_area1970 anofundação if ANOELEIÇÃO == 2020, cluster(amc1960) first

ivreg2 NoInstJusti (HHI_fam_86_20=coffee_mun1975) if ANOELEIÇÃO==2020, cluster(amc1960) first
ivreg2 NoInstJusti (HHI_fam_86_20=coffee_mun1975) PopulaçãoestimadaMunic2019 ÁreaEmkm2 Nºtotalestabelecimentosagríco AreaTotalEstabelecimentosAgr TamanhoMédioEst dist_capital latitude longitude aluguel_1950 pop_tot_1950 pc_negros_1950 pc_protest_1950 pc_analf_1950 pc_empreg_agric_1950 pc_estrang_1950 gini1950 maize_area1970 wheat_area1970 soy_area1970 sugar_area1970 beans_area1970 anofundação if ANOELEIÇÃO==2020, cluster(amc1960) first

** Indicador Poder de facto:
ivreg2 GiniTerra (HHI_fam_86_20=coffeetrees_perarea1975) if ANOELEIÇÃO==2020, cluster(amc1960) first
ivreg2 GiniTerra (HHI_fam_86_20=coffeetrees_perarea1975) PopulaçãoestimadaMunic2019 ÁreaEmkm2 Nºtotalestabelecimentosagríco AreaTotalEstabelecimentosAgr TamanhoMédioEst dist_capital latitude longitude aluguel_1950 pop_tot_1950 pc_negros_1950 pc_protest_1950 pc_analf_1950 pc_empreg_agric_1950 pc_estrang_1950 gini1950 maize_area1970 wheat_area1970 soy_area1970 sugar_area1970 beans_area1970 anofundação if ANOELEIÇÃO==2020, cluster(amc1960) first

ivreg2 GiniTerra (HHI_fam_86_20=coffee_mun1975) if ANOELEIÇÃO==2020, cluster(amc1960) first
ivreg2 GiniTerra (HHI_fam_86_20=coffee_mun1975) PopulaçãoestimadaMunic2019 ÁreaEmkm2 Nºtotalestabelecimentosagríco AreaTotalEstabelecimentosAgr TamanhoMédioEst dist_capital latitude longitude aluguel_1950 pop_tot_1950 pc_negros_1950 pc_protest_1950 pc_analf_1950 pc_empreg_agric_1950 pc_estrang_1950 gini1950 maize_area1970 wheat_area1970 soy_area1970 sugar_area1970 beans_area1970 anofundação if ANOELEIÇÃO==2020, cluster(amc1960) first



** Mortalidade Infantil:
ivreg2 Tx_Mortalidade_Infantil (HHI_fam_86_20=coffeetrees_perarea1975) if ANOELEIÇÃO==2020, cluster(amc1960) first
ivreg2 Tx_Mortalidade_Infantil (HHI_fam_86_20=coffeetrees_perarea1975) PopulaçãoestimadaMunic2019 ÁreaEmkm2 Nºtotalestabelecimentosagríco AreaTotalEstabelecimentosAgr TamanhoMédioEst dist_capital latitude longitude aluguel_1950 pop_tot_1950 pc_negros_1950 pc_protest_1950 pc_analf_1950 pc_empreg_agric_1950 pc_estrang_1950 gini1950 maize_area1970 wheat_area1970 soy_area1970 sugar_area1970 beans_area1970 anofundação  if ANOELEIÇÃO==2020, cluster(amc1960) first

ivreg2 Tx_Mortalidade_Infantil (HHI_fam_86_20=coffee_mun1975) if ANOELEIÇÃO==2020, cluster(amc1960) first
ivreg2 Tx_Mortalidade_Infantil (HHI_fam_86_20=coffee_mun1975) PopulaçãoestimadaMunic2019 ÁreaEmkm2 Nºtotalestabelecimentosagríco AreaTotalEstabelecimentosAgr TamanhoMédioEst dist_capital latitude longitude aluguel_1950 pop_tot_1950 pc_negros_1950 pc_protest_1950 pc_analf_1950 pc_empreg_agric_1950 pc_estrang_1950 gini1950 maize_area1970 wheat_area1970 soy_area1970 sugar_area1970 beans_area1970 anofundação if ANOELEIÇÃO==2020, cluster(amc1960) first

** Coleta de Esgoto:
ivreg2 IN015_AEÍndicedecoletadee (HHI_fam_86_20=coffeetrees_perarea1975) if ANOELEIÇÃO==2020, cluster(amc1960) first
ivreg2 IN015_AEÍndicedecoletadee (HHI_fam_86_20=coffeetrees_perarea1975) PopulaçãoestimadaMunic2019 ÁreaEmkm2 Nºtotalestabelecimentosagríco AreaTotalEstabelecimentosAgr TamanhoMédioEst dist_capital latitude longitude aluguel_1950 pop_tot_1950 pc_negros_1950 pc_protest_1950 pc_analf_1950 pc_empreg_agric_1950 pc_estrang_1950 gini1950 maize_area1970 wheat_area1970 soy_area1970 sugar_area1970 beans_area1970 anofundação if ANOELEIÇÃO==2020, cluster(amc1960) first

ivreg2 IN015_AEÍndicedecoletadee (HHI_fam_86_20=coffee_mun1975) if ANOELEIÇÃO==2020, cluster(amc1960) first
ivreg2 IN015_AEÍndicedecoletadee (HHI_fam_86_20=coffee_mun1975) PopulaçãoestimadaMunic2019 ÁreaEmkm2 Nºtotalestabelecimentosagríco AreaTotalEstabelecimentosAgr TamanhoMédioEst dist_capital latitude longitude aluguel_1950 pop_tot_1950 pc_negros_1950 pc_protest_1950 pc_analf_1950 pc_empreg_agric_1950 pc_estrang_1950 gini1950 maize_area1970 wheat_area1970 soy_area1970 sugar_area1970 beans_area1970 anofundação if ANOELEIÇÃO==2020, cluster(amc1960) first

** Bibliotecas:
ivreg2 QuantidadeBibliotec (HHI_fam_86_20=coffeetrees_perarea1975) if ANOELEIÇÃO==2020, cluster(amc1960) first
ivreg2 QuantidadeBibliotec (HHI_fam_86_20=coffeetrees_perarea1975) PopulaçãoestimadaMunic2019 ÁreaEmkm2 Nºtotalestabelecimentosagríco AreaTotalEstabelecimentosAgr TamanhoMédioEst dist_capital latitude longitude aluguel_1950 pop_tot_1950 pc_negros_1950 pc_protest_1950 pc_analf_1950 pc_empreg_agric_1950 pc_estrang_1950 gini1950 maize_area1970 wheat_area1970 soy_area1970 sugar_area1970 beans_area1970 anofundação if ANOELEIÇÃO==2020, cluster(amc1960) first

ivreg2 QuantidadeBibliotec (HHI_fam_86_20=coffee_mun1975) if ANOELEIÇÃO==2020, cluster(amc1960) first
ivreg2 QuantidadeBibliotec (HHI_fam_86_20=coffee_mun1975) PopulaçãoestimadaMunic2019 ÁreaEmkm2 Nºtotalestabelecimentosagríco AreaTotalEstabelecimentosAgr TamanhoMédioEst dist_capital latitude longitude aluguel_1950 pop_tot_1950 pc_negros_1950 pc_protest_1950 pc_analf_1950 pc_empreg_agric_1950 pc_estrang_1950 gini1950 maize_area1970 wheat_area1970 soy_area1970 sugar_area1970 beans_area1970 anofundação if ANOELEIÇÃO==2020, cluster(amc1960) first

** Analfabetismo:
ivreg2 TaxadeAnalfabetismodaPopulaç (HHI_fam_86_20=coffeetrees_perarea1975) if ANOELEIÇÃO==2020, cluster(amc1960) first
ivreg2 TaxadeAnalfabetismodaPopulaç (HHI_fam_86_20=coffeetrees_perarea1975) PopulaçãoestimadaMunic2019 ÁreaEmkm2 Nºtotalestabelecimentosagríco AreaTotalEstabelecimentosAgr TamanhoMédioEst dist_capital latitude longitude aluguel_1950 pop_tot_1950 pc_negros_1950 pc_protest_1950 pc_analf_1950 pc_empreg_agric_1950 pc_estrang_1950 gini1950 maize_area1970 wheat_area1970 soy_area1970 sugar_area1970 beans_area1970 anofundação if ANOELEIÇÃO==2020, cluster(amc1960) first

ivreg2 TaxadeAnalfabetismodaPopulaç (HHI_fam_86_20=coffee_mun1975) if ANOELEIÇÃO==2020, cluster(amc1960) first
ivreg2 TaxadeAnalfabetismodaPopulaç (HHI_fam_86_20=coffee_mun1975) PopulaçãoestimadaMunic2019 ÁreaEmkm2 Nºtotalestabelecimentosagríco AreaTotalEstabelecimentosAgr TamanhoMédioEst dist_capital latitude longitude aluguel_1950 pop_tot_1950 pc_negros_1950 pc_protest_1950 pc_analf_1950 pc_empreg_agric_1950 pc_estrang_1950 gini1950 maize_area1970 wheat_area1970 soy_area1970 sugar_area1970 beans_area1970 anofundação if ANOELEIÇÃO==2020, cluster(amc1960) first

** PIB per capita:
ivreg2 PIBpercapita2018emR (HHI_fam_86_20=coffeetrees_perarea1975) if ANOELEIÇÃO==2020, cluster(amc1960) first
ivreg2 PIBpercapita2018emR (HHI_fam_86_20=coffeetrees_perarea1975) PopulaçãoestimadaMunic2019 ÁreaEmkm2 Nºtotalestabelecimentosagríco AreaTotalEstabelecimentosAgr TamanhoMédioEst dist_capital latitude longitude aluguel_1950 pop_tot_1950 pc_negros_1950 pc_protest_1950 pc_analf_1950 pc_empreg_agric_1950 pc_estrang_1950 gini1950 maize_area1970 wheat_area1970 soy_area1970 sugar_area1970 beans_area1970 anofundação if ANOELEIÇÃO==2020, cluster(amc1960) first

ivreg2 PIBpercapita2018emR (HHI_fam_86_20=coffee_mun1975) if ANOELEIÇÃO==2020, cluster(amc1960) first
ivreg2 PIBpercapita2018emR (HHI_fam_86_20=coffee_mun1975) PopulaçãoestimadaMunic2019 ÁreaEmkm2 Nºtotalestabelecimentosagríco AreaTotalEstabelecimentosAgr TamanhoMédioEst dist_capital latitude longitude aluguel_1950 pop_tot_1950 pc_negros_1950 pc_protest_1950 pc_analf_1950 pc_empreg_agric_1950 pc_estrang_1950 gini1950 maize_area1970 wheat_area1970 soy_area1970 sugar_area1970 beans_area1970 anofundação if ANOELEIÇÃO==2020, cluster(amc1960) first

/*
latitude longitude dist_capital ÁreaEmkm2 anofundação //  geograficas
pop_tot_1950 pc_analf_1950 pc_negros_1950 pc_protest_1950 pc_estrang_1950 pc_empreg_agric_1950 aluguel_1950 //  demograficas históricas
PopulaçãoestimadaMunic2019 TaxadeAnalfabetismodaPopulaç Tx_Mortalidade_Infantil //  demográficas
Nºtotalestabelecimentosagríco AreaTotalEstabelecimentosAgr TamanhoMédioEst //  agrícolas
gini1950 maize_area1970 wheat_area1970 soy_area1970 sugar_area1970 beans_area1970 /// agrícolas históricas
*/


ivreg2 rescale_governanca latitude longitude  ///
(HHI_fam_86_20=coffee_mun1975 latitude ) PopulaçãoestimadaMunic2019 Tx_Mortalidade_Infantil ///
 if ANOELEIÇÃO==2020 & d_PR==1, cluster(amc1960) first
 
ivreg2 rescale_governanca (HHI_fam_86_20=coffee_mun1975) /// 
 PopulaçãoestimadaMunic2019 Nºtotalestabelecimentosagríco latitude longitude anofundação ///
 if ANOELEIÇÃO==2020&d_PR==1, cluster(amc1960) first rf

ivreg2 NoInstJusti latitude longitude PopulaçãoestimadaMunic2019 ///
(HHI_fam_86_20=coffee_mun1975 latitude longitude PopulaçãoestimadaMunic2019)  ///
if ANOELEIÇÃO==2020 & d_PR==1, cluster(amc1960) first


ivreg2 GiniTerra  latitude longitude  ///
(HHI_fam_86_20=coffee_mun1975 latitude longitude ) ///
 if ANOELEIÇÃO==2020&d_PR==1, cluster(amc1960) first

ivreg2 PIBpercapita2018emR latitude longitude  ///
(HHI_fam_86_20=coffee_mun1975 latitude longitude ) ///
if ANOELEIÇÃO==2020&d_PR==1, cluster(amc1960) first


ivreg2 NoInstJusti (HHI_fam_86_20=coffee_mun1975) PopulaçãoestimadaMunic2019 ÁreaEmkm2 latitude longitude anofundação if ANOELEIÇÃO==2020&d_PR==1, cluster(amc1960) first rf

ivreg2 rescale_governanca (HHI_fam_86_20=coffee_mun1975) longitude dist_capital ÁreaEmkm2 anofundação Nºtotalestabelecimentosagríco TamanhoMédioEst PopulaçãoestimadaMunic2019 Tx_Mortalidade_Infantil if ANOELEIÇÃO==2020&d_PR==1, cluster(amc1960) first rf

ivreg2 GiniTerra (HHI_fam_86_20=coffee_mun1975) PopulaçãoestimadaMunic2019 Nºtotalestabelecimentosagríco latitude longitude anofundação if ANOELEIÇÃO==2020&d_PR==1, cluster(amc1960) first rf

*************

ivreg2 NoInstJusti (HHI_fam_75_20=coffee_mun1975) PopulaçãoestimadaMunic2019 ÁreaEmkm2 Nºtotalestabelecimentosagríco latitude longitude anofundação if ANOELEIÇÃO==2020&d_PR==1, cluster(amc1960) first rf

ivreg2 rescale_governanca (HHI_fam_75_20=coffee_mun1975) longitude dist_capital ÁreaEmkm2 anofundação Nºtotalestabelecimentosagríco TamanhoMédioEst PopulaçãoestimadaMunic2019 Tx_Mortalidade_Infantil if ANOELEIÇÃO==2020&d_PR==1, cluster(amc1960) first rf

ivreg2 GiniTerra (HHI_fam_75_20=coffee_mun1975) PopulaçãoestimadaMunic2019 Nºtotalestabelecimentosagríco latitude longitude anofundação if ANOELEIÇÃO==2020&d_PR==1, cluster(amc1960) first rf

*************

ivreg2 NoInstJusti (HHI_fam_00_20=coffee_mun1975) PopulaçãoestimadaMunic2019 ÁreaEmkm2 Nºtotalestabelecimentosagríco latitude longitude anofundação if ANOELEIÇÃO==2020&d_PR==1, cluster(amc1960) first rf

ivreg2 rescale_governanca (HHI_fam_00_20=coffee_mun1975) longitude dist_capital ÁreaEmkm2 anofundação Nºtotalestabelecimentosagríco TamanhoMédioEst PopulaçãoestimadaMunic2019 Tx_Mortalidade_Infantil if ANOELEIÇÃO==2020&d_PR==1, cluster(amc1960) first rf

ivreg2 GiniTerra (HHI_fam_00_20=coffee_mun1975) PopulaçãoestimadaMunic2019 Nºtotalestabelecimentosagríco latitude longitude anofundação if ANOELEIÇÃO==2020&d_PR==1, cluster(amc1960) first rf

*************

ivreg2 NoInstJusti (HHI_fam_86_97=coffee_mun1975) PopulaçãoestimadaMunic2019 ÁreaEmkm2 Nºtotalestabelecimentosagríco latitude longitude anofundação if ANOELEIÇÃO==2020&d_PR==1, cluster(amc1960) first rf

ivreg2 rescale_governanca (HHI_fam_86_97=coffee_mun1975) longitude dist_capital ÁreaEmkm2 anofundação Nºtotalestabelecimentosagríco TamanhoMédioEst PopulaçãoestimadaMunic2019 Tx_Mortalidade_Infantil if ANOELEIÇÃO==2020&d_PR==1, cluster(amc1960) first rf

ivreg2 GiniTerra (HHI_fam_86_97=coffee_mun1975) PopulaçãoestimadaMunic2019 Nºtotalestabelecimentosagríco latitude longitude anofundação if ANOELEIÇÃO==2020&d_PR==1, cluster(amc1960) first rf



ivreg2 rescale_governanca (HHI_fam_75_20=coffee_mun1975) PopulaçãoestimadaMunic2019 Nºtotalestabelecimentosagríco latitude longitude dist_capital if ANOELEIÇÃO==2020&d_PR==1, cluster(amc1960) first rf
ivreg2 NoInstJusti (HHI_fam_75_20=coffee_mun1975) PopulaçãoestimadaMunic2019 Nºtotalestabelecimentosagríco anofundação if ANOELEIÇÃO==2020&d_PR==1, cluster(amc1960) first rf
ivreg2 GiniTerra (HHI_fam_75_20=coffee_mun1975) Nºtotalestabelecimentosagríco AreaTotalEstabelecimentosAgr TamanhoMédioEst latitude dist_capital ÁreaEmkm2 if ANOELEIÇÃO==2020&d_PR==1, cluster(amc1960) first rf

