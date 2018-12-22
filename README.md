# PGISTOOL
Ferramenta de interação automática com shapefiles e PostgreSQL/PostGIS (python/librarys)

# Exemplos de chamadas de funções (batch):
```batch
CALL "C:\cpc_apps\pgistool\pgistool.exe" extractdelzzero D:\l_curva_nivel.shp
CALL "C:\cpc_apps\pgistool\pgistool.exe" addvertexintersection D:\lines.shp D:\blade.shp
CALL "C:\cpc_apps\pgistool\pgistool.exe" flagisolated D:\points.shp D:\lines.shp D:\areas.shp
```
