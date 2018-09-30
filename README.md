# PGISTOOL
Ferramenta de interação automática com shapefiles e PostgreSQL/PostGIS (python/librarys)

# Exemplos de chamadas de funções (batch):
```batch
CALL "C:\cpc_apps\pgistool\pgistool.exe" flagisolated temp 5432 temp postgres postgres D:\points.shp D:\lines.shp D:\areas.shp
CALL "C:\cpc_apps\pgistool\pgistool.exe" addvertexintersection temp 5432 temp postgres postgres D:\lines.shp D:\blade.shp
CALL "C:\cpc_apps\pgistool\pgistool.exe" extractdelzzero temp 5432 temp postgres postgres D:\l_curva_nivel.shp
```
