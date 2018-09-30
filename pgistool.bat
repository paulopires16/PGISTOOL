@echo off

REM Ferramenta de interacao com postgis

rem ------------------------------------------------------------------------------------------------------------

rem help                                                                                                        # print de todas as funcoes
rem helpbat                                                                                                     # cria o ficheiro pgistool.bat
rem postgisversion                                                                                              # versao completa do postgis
rem postgresqlversion                                                                                           # versao postgresql
rem dumpdatabase dbName portNumber schema userName passw backupdir                                              # faz o dump completo da base de dados para um ficheiro
rem restoredatabase dbName portNumber schema userName passw backupfile                                          # faz o restore de uma base de dados a partir de um ficheiro

rem createdatabase dbName portNumber schema userName passw                                                      # cria a database (dbName) na porta (portNumber) com o schema com determinado userName e passw    
rem dropdatabase dbName portNumber schema userName passw                                                        # elimina a database (dbName) na porta (portNumber) com o schema com determinado userName e passw    
rem dropallconndatabase dbName portNumber schema userName passw                                                 # fecha todas as conexoes a database (dbName) na porta (portNumber) com o schema com determinado userName e passw    
rem changeschemasrid dbName portNumber schema userName passw epsg                                               # transformacao de coordenadas de todas as tabelas dentro do schema
rem changetablesrid dbName portNumber schema table userName passw epsg                                          # transformacao de coordenadas de uma tabela

rem uploadshpFile dbName portNumber schema userName passw shpFileIn                                             # faz o upload de uma shp (shpFileIn) para a database (dbName) na porta (portNumber) com o schema com determinado userName e passw    
rem uploadshpdiretory dbName portNumber schema userName passw shpDirIn                                          # faz o upload das shp de uma diretoria (shpDirIn) para a database (dbName) na porta (portNumber) com o schema com determinado userName e passw    
rem downloadtable dbName portNumber schema userName passw tableName shpDirOut                                   # faz o download de uma tabela (tableName) para uma diretoria (shpDirOut) da database (dbName) na porta (portNumber) com o schema com determinado userName e passw    
rem downloadschema dbName portNumber schema userName passw shpDirOut                                            # faz o download de um schema (schema) para uma diretoria (shpDirOut) da database (dbName) na porta (portNumber) com o schema com determinado userName e passw    

rem line2linesegment dbName portNumber schema userName passw shpFile                                            # converte linhas em segmentos de linha
rem line2points dbName portNumber schema userName passw shpFile                                                 # converte linhas em pontos
 
rem polygon2line dbName portNumber schema userName passw shpFile                                                # converte poligonos em linhas
rem polygon2linesegment dbName portNumber schema userName passw shpFile                                         # converte poligonos segmentos de linha
rem polygon2points dbName portNumber schema userName passw shpFile                                              # converte poligonos em pontos
  
rem joinline dbName portNumber schema userName passw shpFile "field1,field2"                                    # junta todas as linhas ate aos cruzamentos/entroncamentos (opcao: juntar por atributos, se digitados)
rem centerline dbName portNumber schema userName passw shpFile                                                  # cria uma linha central relativamente a outras 2 linhas (auto-estrada) de uma shp (shpFile)
rem validgeom dbName portNumber schema userName passw shpFile 0                                                 # faz a validacao de todas as geometrias (empty geometries, self-intersection, invalid geometries) com relatorio (1) ou sem (0)

rem flagnotvalid dbName portNumber schema userName passw shpFile                                                # identifica as geometrias nao validas
rem flagopen dbName portNumber schema userName passw shpFile                                                    # identifica as geometrias abertas (ponto inicial não coincide com ponto final)
rem flagkink dbName portNumber schema userName passw shpFile angle                                              # identifica (pontos) Kinks e Kick backs com angulo menores que angle
rem flagdangle dbName portNumber schema userName passw shpFileLines shpFileAreas shpFilePoints                  # identifica (pontos) linhas (pontas) soltas
rem deldangle dbName portNumber schema userName passw shpFileLines shpFileflagdangle dist                       # elimina linhas (pontas) soltas com uma determinada distancia (dist)

rem deldupnode dbName portNumber schema userName passw shpFile                                                  # elimina vertices coincidentes de linhas ou poligonos
rem splitline dbName portNumber schema userName passw shpFileLines                                              # parte linhas nas intersecoes
rem addpoints2lines dbName portNumber schema userName passw shpFileLines shpFilePoints                       	# adiciona pontos que se intersetam com linhas a propria linha
rem splitlinesbyareas dbName portNumber schema userName passw shpFileLines shpFileAreas                         # parte linhas nas intersecoes com poligonos
rem splitlinesandareas dbName portNumber schema userName passw shpFileLines shpFileAreas                        # parte linhas e poligonos nas intersecoes
rem breakedge dbName portNumber schema userName passw shpFileAreas                                              # adiciona vertices em todos as intersecoes, valido para LineStrings e Polygons
rem linesdensify dbName portNumber schema userName passw shpFileLines dist                                      # densifica linhas segundo uma distancia (dist)

rem changedim dbName portNumber schema userName passw shpFileLines dim                                          # altera a dimensao das coordenadas para dim (XY|XYZ|XYM|XYZM)
rem roundprecision dbName portNumber schema userName passw shpFileLines precision                               # arredonta a precisao das coordenadas (x,y,z) segundo numero de casas decimais (precision: 0-8)
rem holesarea dbName portNumber schema userName passw shpFilePoly areavalue                                     # obtem os buracos (ordenados) dos polygonos cuja area < areavalue. Se areavalue = -1, obtem todos os buracos
rem delholesarea dbName portNumber schema userName passw shpFilePoly                                     		# remove os buracos (holes) dos Polygonos
rem flagholesarea dbName portNumber schema userName passw shpFilePoly areavalue                                 # identifica o vertice inicial (ponto) dos polygonos cuja area < areavalue

rem dellengthzero dbName portNumber schema userName passw shpFileLines                                          # elimina linhas de comprimento zero
rem delareazero dbName portNumber schema userName passw shpFileAreas                                            # elimina poligonos com area zero
rem extendlines2areas dbName portNumber schema userName passw shpFileLines shpFileAreas dist                    # extende as linhas segundo o azimute do ultimo segmento e uma determinada distancia (dist), se intersetadas com LineString ou Polygon
rem extendselflines dbName portNumber schema userName passw shpFileLines dist                                   # extende as linhas segundo o azimute do ultimo segmento e uma determinada distancia (dist), se intersetadas com LineString
rem lines2areasord dbName portNumber schema userName passw shpFileLines 0                                       # converte linhas em poligonos, caso existam linhas cuja intersacao formam poligonos

rem flagpointline dbName portNumber schema userName passw shpFilePoints shpFileLines dist option                # identifica pontos a uma distancia (dist) de linhas. Option(0): pontos a menos de distancia, Option(1): pontos a mais de distancia          
rem flagpointarea dbName portNumber schema userName passw shpFilePoints shpFileAreas                            # identifica pontos dentro de poligonos
rem delpointarea dbName portNumber schema userName passw shpFilePoints shpFileAreas                             # elimina pontos dentro de poligonos
rem flaglinearea dbName portNumber schema userName passw shpFileLines shpFileAreas                              # identifica (pontos) linhas dentro de poligonos
rem dellinearea dbName portNumber schema userName passw shpFileLines shpFileAreas                               # elimina linhas dentro de poligonos
rem flagendnodearea dbName portNumber schema userName passw shpFileLines shpFileAreas                           # identifica os pontos finais das linhas dentro dos poligonos
rem flagpointdistance dbName portNumber schema userName passw shpFilePoints dist                                # identifica os pontos a uma determinada distancia

rem flagloopline dbName portNumber schema userName passw shpFileLines                                           # identifica (pontos) as self-intersections em LineStrings
rem flaglooparea dbName portNumber schema userName passw shpFileAreas                                           # identifica (pontos) as self-intersections em Polygons

rem areaintersectarea dbName portNumber schema userName passw shpFileAreas1 shpFileAreas2                       # calcula as areas de intersecao entre duas shapefiles de Polygons
rem areawithinarea dbName portNumber schema userName passw shpFileAreas1 shpFileAreas2                          # calcula as areas da shapefile1 que estao completamente contidas dentro da shapefile2
rem areaselfintersectarea dbName portNumber schema userName passw shpFileAreas                                  # calcula as areas de intersecao numa mesma shapefile de Polygons
rem areaunionarea dbName portNumber schema userName passw shpFileAreas1 shpFileAreas2                           # calcula a uniao de areas
rem areaoverlaparea dbName portNumber schema userName passw shpFileAreas1 shpFileAreas2                         # calcula as areas em Overlap ou Contain e nao Touches
rem areadifferencearea dbName portNumber schema userName passw shpFileAreas1 shpFileAreas2                      # calcula a diferenca da shpFileAreas1 que não pertence a shpFileAreas2
rem areasymdifferencearea dbName portNumber schema userName passw shpFileAreas1 shpFileAreas2                   # calcula a diferenca da intersecao
rem areaselfunion dbName portNumber schema userName passw shpFileAreas                                          # calcula a uniao das areas que se intersetam
rem areawithoutlinedist dbName portNumber schema userName passw shpFileAreas shpFileLines dist                  # calcula as areas sem linhas numa determinada distancia

rem flaglinecrossesline dbName portNumber schema userName passw shpFileLines1 shpFileLines2                     # calcula os pontos de intersecao entre duas shapefiles de LineStrings
rem lineselfcrossesline dbName portNumber schema userName passw shpFileLines                                    # calcula os pontos de intersecao numa mesma shapefile de LineStrings
rem linecoincidentline dbName portNumber schema userName passw shpFileLines1 shpFileLines2                      # calcula as linhas coincidentes (edges) entre duas shapefiles de LineStrings
rem lineselfcoincidentline dbName portNumber schema userName passw shpFileLines                                 # calcula os linhas coincidentes (edges) numa mesma shapefile de LineStrings
rem lineintersectarea dbName portNumber schema userName passw shpFileLines shpFileAreas                         # calcula as linhas de intersecao entre uma shapefile de LineStrings e uma shapefile de Polygons
rem lineallinsidearea dbName portNumber schema userName passw shpFileLines shpFileAreas                         # identifica as linhas completamente contidas em Polygons
rem linealloutsidearea dbName portNumber schema userName passw shpFileLines shpFileAreas                        # identifica as linhas completamente fora de Polygons
rem linedifferencearea dbName portNumber schema userName passw shpFileLines shpFileAreas                        # calcula a diferenca das linhas na intersecao entre uma shapefile de LineStrings e uma shapefile de Polygons
rem linecrossesarea dbName portNumber schema userName passw shpFileLines shpFileAreas                           # calcula as linhas dentro das areas
rem linedifferenceline dbName portNumber schema userName passw shpFileLines1 shpFileLines2                    	# calcula as diferenca das linhas
rem linewithoutareadist dbName portNumber schema userName passw shpFileLines shpFileAreas dist                  # calcula as linhas sem areas numa determinada distancia

rem cleangeometries dbName portNumber schema userName passw shpFile                                             # remove geometrias nulas e geometrias duplicadas
rem polygonzmode dbName portNumber schema userName passw shpFile                                                # corrige a coordenada Z de um poligono com a moda de todos os Z desse poligono
rem snappoints2lines dbName portNumber schema userName passw shpFilePoints shpFileLines dist                    # snap pontos a linhas segundo uma distancia (cria vertices nas linhas)
rem snapdangles2points dbName portNumber schema userName passw shpFileLines shpFilePoints dist                  # snap linhas a pontos segundo uma distancia (altera ponto inicial/final da linha, matem Z)

rem multi2simple dbName portNumber schema userName passw shpFile                                                # converte multigeometrias em geometrias simples (pontos, linhas e poligonos)
rem flagminarea dbName portNumber schema userName passw shpFile    minarea                                      # assinala areas inferiores a um determinado valor (minarea)
rem delpointi dbName portNumber schema userName passw shpFilePoints dist                                        # elimina pontos intermedios a uma determinada distancia (dist)

rem flagpointintarea dbName portNumber schema userName passw shpFilePoints shpFileAreas                         # identifica pontos dentro de poligonos
rem flagpointextarea dbName portNumber schema userName passw shpFilePoints shpFileAreas                         # identifica pontos fora de poligonos
rem flagareawithoutpoint dbName portNumber schema userName passw shpFileAreas shpFilePoints                     # identifica areas sem pontos no seu interior
rem flagareawithpoint dbName portNumber schema userName passw shpFileAreas shpFilePoints                        # identifica areas com pontos no seu interior

rem snapslivers dbName portNumber schema userName passw shpFilePolygon dist                                     # faz o snap de slivers (eliminar slivers entre poligonos)
rem snapgaps dbName portNumber schema userName passw shpFilePolygon dist                                        # faz o snap de gaps (eliminar gaps entre poligonos)
rem normalizegeom dbName portNumber schema userName passw shpFilePolygonLine area angle pointdist nullarea      # remove spikes e normaliza geometrias com thresholds (area angle pointdist nullarea)

rem topolineclean dbName portNumber schema userName passw shpLines dist                                         # cria relacao topologica de linhas (sem undershots e overshoots), com distancia (distClean)
rem topolinecleansplit dbName portNumber schema userName passw shpLines dist                                    # cria relacao topologica de linhas (sem undershots e overshoots), com distancia (distClean) com corte nas intersecoes
rem topolinecleansimplify dbName portNumber schema userName passw shpLines distClean distSimplify               # cria relacao topologica de linhas (sem undershots e overshoots), com distancia (distClean) com corte nas intersecoes e simplificacao mediante distancia (distSimplify)

rem flagzcontour dbName portNumber schema userName passw shpLines minZ maxZ distZ                               # identifica pontos das curvas de nivel que nao se encontram dentro do intervalo em Z
rem flagzespeccontour dbName portNumber schema userName passw shpLines minZ maxZ distZ                          # identifica pontos das curvas de nivel que se encontram dentro do intervalo em Z
rem flagtincontour dbName portNumber schema userName passw shpLines distZ                                       # identifica pontos das curvas de nivel superiores a uma determinada distancia em Z (distZ)
rem flagtinspotcontour dbName portNumber schema userName passw shpLines shpPoints distZ                         # identifica erros nas curvas de nivel e pontos de cota
rem flagtinspotcrosstwice dbName portNumber schema userName passw shpLines shpPoints distZ                     	# identifica erros especificos nos pontos de cota (correr primeiro o joinline)

rem flatspotheigth dbName portNumber schema userName passw shpPoints                                            # arredonda a coordenada Z nos pontos cujo valor inteiro termina em 0 e o valor decimal <= 0.494
rem extractclosecontour dbName portNumber schema userName passw shpLines                                        # extrai as linhas fechadas e interiores
rem extractdelcontour dbName portNumber schema userName passw shpLines minZ maxZ distZ                          # extrai as linhas (apagas as linhas na shp original) cuja coordenada Z se encontram dentro do intervalo

rem flagisolated dbName portNumber schema userName passw shpPoints shpLines shpAreas                            # extrair geometrias isoladas

rem addvertexintersection dbName portNumber schema userName passw shpfile shpblade                            	# adiciona vertices nas intersecoes do elementos (aceita qualquer geometria)

rem extractdelzzero dbName portNumber schema userName passw shpfile 											# extrai geometrias (remove na origem) com todos os Z = 0
rem flagvertexzzero dbName portNumber schema userName passw shpfile  											# identifica os vertices (pontos) das geometrias com Z = 0
rem correctvertexzzero dbName portNumber schema userName passw shpfile  										# identifica os vertices (pontos) das geometrias com Z = 0 e corrige com a media do ponto anterior e ponto seguinte
rem extractdelvertexzzero dbName portNumber schema userName passw shpfile  										# extrai geometrias com algum vertice com Z = 0

rem movefeature dbName portNumber schema userName passw shpfile deltax deltay deltaz  							# move geometrias segundo um deltax deltay deltaz
rem movefeatureattr dbName portNumber schema userName passw shpfile fieldnamex fieldnamey fieldnamez  			# move geometrias segundo valor dos atributos
rem movefeatureattrz dbName portNumber schema userName passw shpfile fieldnamez  								# move geometrias segundo valor de um atributo
rem flagoutrangeattr dbName portNumber schema userName passw shpfile fieldname fieldvaluemin fielvaluemax  		# extrai geometrias cujo valor do atributo esta fora do intervalo

rem addzpointbypolygon dbName portNumber schema userName passw shpPoints shpAreas                            	# eleva a coordenada Z dos pontos com a media do Z das areas (intersecao)

rem movepoint2point dbName portNumber schema userName passw shpPoints1 shpPoints2 dist                          # move pontos para o ponto mais proximo que esteja a uma determinada distancia
rem movepoint2line dbName portNumber schema userName passw shpPoints shpLines dist                           	# move pontos para a linha mais proxima que esteja a uma determinada distancia
rem movepoint2polygon dbName portNumber schema userName passw shpPoints shpAreas dist                           # move pontos para a linha exterior das areas que estejam a uma determinada distancia

rem convergelines dbName portNumber schema userName passw shpfile dist                           				# procura e elimina linhas < dist, calcula ponto medio e converge restantes linhas ligadas a esses pequenos trocos
rem simplifytopology dbName portNumber schema userName passw shpfile dist                           			# simplifica poligonos segundo uma distancia (dist) preservando a relacao topologica entre os elementos
rem flagnull dbName portNumber schema userName passw shpfile attrib                           					# verifica a existencia de valores NULL ou '' ou ' ' em todos os atributos (sem attrib) ou apenas um (com attrib)

rem validmuros dbName portNumber schema userName passw shpmuros shpvias dist                          			# valida os muros em relacao as vias segundo uma distancia (+10, -10, etc)

rem removesliversgaps dbName portNumber schema userName passw shpfile areagaps								# remove overlaps e gaps entre poligonos. Gaps menores que areagaps.

rem ------------------------------------------------------------------------------------------------------------

REM EXECUTAVEL OPCAO FILEIN ...

rem CALL "C:\cpc_apps\pgistool\pgistool.exe" help
rem CALL "C:\cpc_apps\pgistool\pgistool.exe" helpbat
rem CALL "C:\cpc_apps\pgistool\pgistool.exe" postgisversion
rem CALL "C:\cpc_apps\pgistool\pgistool.exe" postgresqlversion
rem CALL "C:\cpc_apps\pgistool\pgistool.exe" dumpdatabase temp 5432 temp postgres postgres D:\temp
rem CALL "C:\cpc_apps\pgistool\pgistool.exe" restoredatabase temp 5432 temp postgres postgres D:\temp\temp.backup

rem CALL "C:\cpc_apps\pgistool\pgistool.exe" createdatabase temp 5432 temp postgres postgres
rem CALL "C:\cpc_apps\pgistool\pgistool.exe" dropdatabase temp 5432 postgres postgres
rem CALL "C:\cpc_apps\pgistool\pgistool.exe" dropallconndatabase temp 5432 postgres postgres
rem CALL "C:\cpc_apps\pgistool\pgistool.exe" changeschemasrid temp 5432 temp postgres postgres 20790
rem CALL "C:\cpc_apps\pgistool\pgistool.exe" changetablesrid temp 5432 temp lines_wgs84mil postgres postgres 4326

rem CALL "C:\cpc_apps\pgistool\pgistool.exe" uploadshpFile temp 5432 temp postgres postgres D:\temp\L_Estrada_estreita.shp
rem CALL "C:\cpc_apps\pgistool\pgistool.exe" uploadshpdiretory temp 5432 temp postgres postgres D:\temp
rem CALL "C:\cpc_apps\pgistool\pgistool.exe" downloadtable temp 5432 temp postgres postgres L_Estrada_estreita D:\temp
rem CALL "C:\cpc_apps\pgistool\pgistool.exe" downloadschema temp 5432 temp postgres postgres D:\temp

rem CALL "C:\cpc_apps\pgistool\pgistool.exe" line2linesegment temp 5432 temp postgres postgres D:\temp\lines.shp
rem CALL "C:\cpc_apps\pgistool\pgistool.exe" line2points temp 5432 temp postgres postgres D:\temp\lines.shp
               
rem CALL "C:\cpc_apps\pgistool\pgistool.exe" polygon2line temp 5432 temp postgres postgres D:\temp\areas.shp
rem CALL "C:\cpc_apps\pgistool\pgistool.exe" polygon2linesegment temp 5432 temp postgres postgres D:\temp\areas.shp
rem CALL "C:\cpc_apps\pgistool\pgistool.exe" polygon2points temp 5432 temp postgres postgres D:\temp\areas.shp

rem CALL "C:\cpc_apps\pgistool\pgistool.exe" joinline temp 5432 temp postgres postgres D:\temp\L_Curva_de_nivel.shp
rem CALL "C:\cpc_apps\pgistool\pgistool.exe" centerline temp 5432 temp postgres postgres D:\temp\L_Auto_estrada.shp
rem CALL "C:\cpc_apps\pgistool\pgistool.exe" validgeom temp 5432 temp postgres postgres D:\temp\A_Arvoredo_denso.shp 1

rem CALL "C:\cpc_apps\pgistool\pgistool.exe" flagnotvalid temp 5432 temp postgres postgres D:\temp\A_Arvoredo_denso.shp
rem CALL "C:\cpc_apps\pgistool\pgistool.exe" flagopen temp 5432 temp postgres postgres D:\temp\A_Arvoredo_denso.shp
rem CALL "C:\cpc_apps\pgistool\pgistool.exe" flagkink temp 5432 temp postgres postgres D:\temp\line.shp 10
rem CALL "C:\cpc_apps\pgistool\pgistool.exe" flagdangle temp 5432 temp postgres postgres D:\temp\lines.shp D:\temp\areas.shp D:\temp\points.shp
rem CALL "C:\cpc_apps\pgistool\pgistool.exe" deldangle temp 5432 temp postgres postgres D:\temp\lines.shp D:\temp\lines_flagdangle.shp 100

rem CALL "C:\cpc_apps\pgistool\pgistool.exe" deldupnode temp 5432 temp postgres postgres D:\temp\line.shp
rem CALL "C:\cpc_apps\pgistool\pgistool.exe" splitline temp 5432 temp postgres postgres D:\temp\lines.shp
rem CALL "C:\cpc_apps\pgistool\pgistool.exe" addpoints2lines temp 5432 temp postgres postgres D:\temp\lines.shp D:\temp\points.shp
rem CALL "C:\cpc_apps\pgistool\pgistool.exe" splitlinesbyareas temp 5432 temp postgres postgres D:\temp\lines.shp D:\temp\areas.shp
rem CALL "C:\cpc_apps\pgistool\pgistool.exe" splitlinesandareas temp 5432 temp postgres postgres D:\temp\lines.shp D:\temp\areas.shp
rem CALL "C:\cpc_apps\pgistool\pgistool.exe" breakedge temp 5432 temp postgres postgres D:\temp\areas.shp
rem CALL "C:\cpc_apps\pgistool\pgistool.exe" linesdensify temp 5432 temp postgres postgres D:\temp\lines.shp 500

rem CALL "C:\cpc_apps\pgistool\pgistool.exe" changedim temp 5432 temp postgres postgres D:\temp\A_Arvoredo_denso.shp XYZ
rem CALL "C:\cpc_apps\pgistool\pgistool.exe" roundprecision temp 5432 temp postgres postgres D:\temp\A_Arvoredo_denso.shp 3
rem CALL "C:\cpc_apps\pgistool\pgistool.exe" holesarea temp 5432 temp postgres postgres D:\temp\A_Arvoredo_denso.shp -1
rem CALL "C:\cpc_apps\pgistool\pgistool.exe" delholesarea temp 5432 temp postgres postgres D:\temp\A_Arvoredo_denso.shp
rem CALL "C:\cpc_apps\pgistool\pgistool.exe" flagholesarea temp 5432 temp postgres postgres D:\temp\A_Arvoredo_denso.shp

rem CALL "C:\cpc_apps\pgistool\pgistool.exe" dellengthzero temp 5432 temp postgres postgres D:\temp\lines.shp
rem CALL "C:\cpc_apps\pgistool\pgistool.exe" delareazero temp 5432 temp postgres postgres D:\temp\areas.shp
rem CALL "C:\cpc_apps\pgistool\pgistool.exe" extendlines2areas temp 5432 temp postgres postgres D:\temp\lines.shp D:\temp\areas.shp 3
rem CALL "C:\cpc_apps\pgistool\pgistool.exe" extendselflines temp 5432 temp postgres postgres D:\temp\l_hid_250.shp 3
rem CALL "C:\cpc_apps\pgistool\pgistool.exe" lines2areasord temp 5432 temp postgres postgres D:\temp\lines.shp
    
rem CALL "C:\cpc_apps\pgistool\pgistool.exe" flagpointline temp 5432 temp postgres postgres D:\temp\points.shp D:\temp\lines.shp 10 0
rem CALL "C:\cpc_apps\pgistool\pgistool.exe" flagpointarea temp 5432 temp postgres postgres D:\temp\points.shp D:\temp\areas.shp
rem CALL "C:\cpc_apps\pgistool\pgistool.exe" delpointarea temp 5432 temp postgres postgres D:\temp\points.shp D:\temp\areas.shp
rem CALL "C:\cpc_apps\pgistool\pgistool.exe" flaglinearea temp 5432 temp postgres postgres D:\temp\lines.shp D:\temp\areas.shp
rem CALL "C:\cpc_apps\pgistool\pgistool.exe" dellinearea temp 5432 temp postgres postgres D:\temp\lines.shp D:\temp\areas.shp
rem CALL "C:\cpc_apps\pgistool\pgistool.exe" flagendnodearea temp 5432 temp postgres postgres D:\temp\lines.shp D:\temp\areas.shp
rem CALL "C:\cpc_apps\pgistool\pgistool.exe" flagpointdistance temp 5432 temp postgres postgres D:\temp\points.shp 5

rem CALL "C:\cpc_apps\pgistool\pgistool.exe" flagloopline temp 5432 temp postgres postgres D:\temp\lines.shp
rem CALL "C:\cpc_apps\pgistool\pgistool.exe" flaglooparea temp 5432 temp postgres postgres D:\temp\areas.shp
rem CALL "C:\cpc_apps\pgistool\pgistool.exe" areaintersectarea temp 5432 temp postgres postgres D:\temp\areas1.shp D:\temp\areas2.shp
rem CALL "C:\cpc_apps\pgistool\pgistool.exe" areawithinarea temp 5432 temp postgres postgres D:\temp\areas1.shp D:\temp\areas2.shp
rem CALL "C:\cpc_apps\pgistool\pgistool.exe" areaselfintersectarea temp 5432 temp postgres postgres D:\temp\merge_polygons.shp
rem CALL "C:\cpc_apps\pgistool\pgistool.exe" areaunionarea temp 5432 temp postgres postgres D:\temp\areas1.shp D:\temp\areas2.shp
rem CALL "C:\cpc_apps\pgistool\pgistool.exe" areaoverlaparea temp 5432 temp postgres postgres D:\temp\areas1.shp D:\temp\areas2.shp
rem CALL "C:\cpc_apps\pgistool\pgistool.exe" areadifferencearea temp 5432 temp postgres postgres D:\temp\areas1.shp D:\temp\areas2.shp
rem CALL "C:\cpc_apps\pgistool\pgistool.exe" areasymdifferencearea temp 5432 temp postgres postgres D:\temp\areas1.shp D:\temp\areas2.shp
rem CALL "C:\cpc_apps\pgistool\pgistool.exe" areaselfunion temp 5432 temp postgres postgres D:\temp\areas.shp
rem CALL "C:\cpc_apps\pgistool\pgistool.exe" areawithoutlinedist temp 5432 temp postgres postgres D:\temp\areas.shp D:\temp\lines.shp

rem CALL "C:\cpc_apps\pgistool\pgistool.exe" flaglinecrossesline temp 5432 temp postgres postgres D:\temp\lines1.shp D:\temp\lines2.shp
rem CALL "C:\cpc_apps\pgistool\pgistool.exe" lineselfcrossesline temp 5432 temp postgres postgres D:\temp\merge_linestrings.shp
rem CALL "C:\cpc_apps\pgistool\pgistool.exe" linecoincidentline temp 5432 temp postgres postgres D:\temp\lines1.shp D:\temp\lines2.shp
rem CALL "C:\cpc_apps\pgistool\pgistool.exe" lineselfcoincidentline temp 5432 temp postgres postgres D:\temp\merge_linestrings.shp
rem CALL "C:\cpc_apps\pgistool\pgistool.exe" lineintersectarea temp 5432 temp postgres postgres D:\temp\lines.shp D:\temp\areas.shp
rem CALL "C:\cpc_apps\pgistool\pgistool.exe" lineallinsidearea temp 5432 temp postgres postgres D:\temp\lines.shp D:\temp\areas.shp
rem CALL "C:\cpc_apps\pgistool\pgistool.exe" linealloutsidearea temp 5432 temp postgres postgres D:\temp\lines.shp D:\temp\areas.shp
rem CALL "C:\cpc_apps\pgistool\pgistool.exe" linedifferencearea temp 5432 temp postgres postgres D:\temp\lines.shp D:\temp\areas.shp
rem CALL "C:\cpc_apps\pgistool\pgistool.exe" linecrossesarea temp 5432 temp postgres postgres D:\temp\lines.shp D:\temp\areas.shp
rem CALL "C:\cpc_apps\pgistool\pgistool.exe" linedifferenceline temp 5432 temp postgres postgres D:\temp\lines1.shp D:\temp\lines2.shp
rem CALL "C:\cpc_apps\pgistool\pgistool.exe" linewithoutareadist temp 5432 temp postgres postgres D:\temp\lines.shp D:\temp\areas.shp

rem CALL "C:\cpc_apps\pgistool\pgistool.exe" cleangeometries temp 5432 temp postgres postgres D:\temp\areas.shp
rem CALL "C:\cpc_apps\pgistool\pgistool.exe" polygonzmode temp 5432 temp postgres postgres D:\temp\areas.shp
rem CALL "C:\cpc_apps\pgistool\pgistool.exe" snappoints2lines temp 5432 temp postgres postgres D:\temp\points.shp D:\temp\lines.shp 3
rem CALL "C:\cpc_apps\pgistool\pgistool.exe" snapdangles2points temp 5432 temp postgres postgres D:\temp\lines.shp D:\temp\points.shp 0.01

rem CALL "C:\cpc_apps\pgistool\pgistool.exe" multi2simple temp 5432 temp postgres postgres D:\temp\multilines.shp
rem CALL "C:\cpc_apps\pgistool\pgistool.exe" flagminarea temp 5432 temp postgres postgres D:\temp\areas.shp 10
rem CALL "C:\cpc_apps\pgistool\pgistool.exe" delpointi temp 5432 temp postgres postgres D:\temp\points.shp 17.5

rem CALL "C:\cpc_apps\pgistool\pgistool.exe" snapslivers temp 5432 temp postgres postgres D:\temp\areas.shp 0.05

rem CALL "C:\cpc_apps\pgistool\pgistool.exe" flagpointintarea temp 5432 temp postgres postgres D:\temp\points.shp D:\temp\areas.shp
rem CALL "C:\cpc_apps\pgistool\pgistool.exe" flagpointextarea temp 5432 temp postgres postgres D:\temp\points.shp D:\temp\areas.shp
rem CALL "C:\cpc_apps\pgistool\pgistool.exe" flagareawithoutpoint temp 5432 temp postgres postgres D:\temp\areas.shp D:\temp\points.shp
rem CALL "C:\cpc_apps\pgistool\pgistool.exe" flagareawithpoint temp 5432 temp postgres postgres D:\temp\areas.shp D:\temp\points.shp

rem CALL "C:\cpc_apps\pgistool\pgistool.exe" snapslivers temp 5432 temp postgres postgres D:\temp\areas.shp 0.05
rem CALL "C:\cpc_apps\pgistool\pgistool.exe" snapgaps temp 5432 temp postgres postgres D:\temp\areas.shp 0.01
rem CALL "C:\cpc_apps\pgistool\pgistool.exe" normalizegeom temp 5432 temp postgres postgres D:\temp\areas.shp 0.5 0.5 0.005 0.0001

rem CALL "C:\cpc_apps\pgistool\pgistool.exe" topolineclean temp 5432 temp postgres postgres D:\temp\lines.shp 0.1
rem CALL "C:\cpc_apps\pgistool\pgistool.exe" topolinecleansplit temp 5432 temp postgres postgres D:\temp\lines.shp 0.1
rem CALL "C:\cpc_apps\pgistool\pgistool.exe" topolinecleansimplify temp 5432 temp postgres postgres D:\temp\lines.shp 0.1 1.0

rem CALL "C:\cpc_apps\pgistool\pgistool.exe" flagzcontour temp 5432 temp postgres postgres D:\temp\L_curva_nivel.shp -10 2010 20
rem CALL "C:\cpc_apps\pgistool\pgistool.exe" flagzespeccontour temp 5432 temp postgres postgres D:\temp\L_curva_nivel.shp -50 2050 100
rem CALL "C:\cpc_apps\pgistool\pgistool.exe" flagtincontour temp 5432 temp postgres postgres D:\temp\L_curva_nivel.shp 20
rem CALL "C:\cpc_apps\pgistool\pgistool.exe" flagtinspotcontour temp 5432 temp postgres postgres D:\temp\L_curva_nivel.shp D:\temp\P_pcota.shp 20
rem CALL "C:\cpc_apps\pgistool\pgistool.exe" flagtinspotcrosstwice temp 5432 temp postgres postgres D:\temp\L_curva_nivel.shp D:\temp\P_pcota.shp 20

rem CALL "C:\cpc_apps\pgistool\pgistool.exe" flatspotheigth temp 5432 temp postgres postgres D:\temp\P_Ponto_de_cota.shp
rem CALL "C:\cpc_apps\pgistool\pgistool.exe" extractclosecontour temp 5432 temp postgres postgres D:\temp\L_curva_nivel.shp
rem CALL "C:\cpc_apps\pgistool\pgistool.exe" extractdelcontour temp 5432 temp postgres postgres D:\temp\L_curva_nivel.shp -10 2010 20

rem CALL "C:\cpc_apps\pgistool\pgistool.exe" flagisolated temp 5432 temp postgres postgres D:\temp\points.shp D:\temp\lines.shp D:\temp\areas.shp
rem CALL "C:\cpc_apps\pgistool\pgistool.exe" addvertexintersection temp 5432 temp postgres postgres D:\temp\lines.shp D:\temp\blade.shp

rem CALL "C:\cpc_apps\pgistool\pgistool.exe" extractdelzzero temp 5432 temp postgres postgres D:\temp\l_curva_nivel.shp
rem CALL "C:\cpc_apps\pgistool\pgistool.exe" flagvertexzzero temp 5432 temp postgres postgres D:\temp\l_curva_nivel.shp
rem CALL "C:\cpc_apps\pgistool\pgistool.exe" correctvertexzzero temp 5432 temp postgres postgres D:\temp\l_curva_nivel.shp
rem CALL "C:\cpc_apps\pgistool\pgistool.exe" extractdelvertexzzero temp 5432 temp postgres postgres D:\temp\l_curva_nivel.shp

rem CALL "C:\cpc_apps\pgistool\pgistool.exe" movefeature temp 5432 temp postgres postgres D:\temp\l_curva_nivel.shp 10 10 10
rem CALL "C:\cpc_apps\pgistool\pgistool.exe" movefeatureattr temp 5432 temp postgres postgres D:\temp\l_curva_nivel.shp "deltax" "deltay" "deltaz"
rem CALL "C:\cpc_apps\pgistool\pgistool.exe" movefeatureattrz temp 5432 temp postgres postgres D:\temp\l_curva_nivel.shp "deltaz" 
rem CALL "C:\cpc_apps\pgistool\pgistool.exe" flagoutrangeattr temp 5432 temp postgres postgres D:\temp\L_Curva_de_nivel.shp "LEN" 0 10

rem call "C:\cpc_apps\pgistool\pgistool.exe" addzpointbypolygon temp 5432 temp postgres postgres D:\temp\P_Ruinas.shp D:\temp\A_Ruinas.shp

rem call "C:\cpc_apps\pgistool\pgistool.exe" movepoint2point temp 5432 temp postgres postgres D:\temp\point1.shp D:\temp\point2.shp 10
rem call "C:\cpc_apps\pgistool\pgistool.exe" movepoint2line temp 5432 temp postgres postgres D:\temp\p_tpn_export.shp D:\temp\l_constr.shp 10
rem call "C:\cpc_apps\pgistool\pgistool.exe" movepoint2polygon temp 5432 temp postgres postgres D:\temp\p_tpn_export.shp D:\temp\a_constr.shp 10

rem call "C:\cpc_apps\pgistool\pgistool.exe" convergelines temp 5432 temp postgres postgres D:\temp\l_vias_123.shp 1
rem call "C:\cpc_apps\pgistool\pgistool.exe" simplifytopology temp 5432 temp postgres postgres D:\temp\areas.shp 0.5
rem call "C:\cpc_apps\pgistool\pgistool.exe" flagnull temp 5432 temp postgres postgres D:\temp\areas.shp source

rem call "C:\cpc_apps\pgistool\pgistool.exe" validmuros temp 5432 temp postgres postgres D:\temp D:\temp\valida_muros.txt

rem call "C:\cpc_apps\pgistool\pgistool.exe" removesliversgaps temp 5432 temp postgres postgres D:\work\valid\a_vegetacao.shp 30

echo. 
pause
