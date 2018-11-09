# CAS_INFE18_DWH

## Aufsetzen der ERP_Datenbank


### Achtung Update Schritt konnte aufgrund eines Fehlers nicht ausgeführt werden:

#### Fehler
0	1090	09:44:25	UPDATE order_details
 SET discount = -FLOOR(RAND()*(20-5+1)+5) WHERE RAND() < 0.1	Error Code: 1175. You are using safe update mode and you tried to update a table without a WHERE that uses a KEY column
 To disable safe mode, toggle the option in Preferences -> SQL Editor and reconnect.	0.000 sec
 
 
####Lösung:
 
 Follow the following steps before executing the UPDATE command: In MySQL Workbench

Go to Edit --> Preferences
Click "SQL Editor" tab and uncheck "Safe Updates" check box
Query --> Reconnect to Server // logout and then login
Now execute your SQL query
p.s., No need to restart the MySQL daemon!

## Welche Auswertungen sollten mit dem DWH ermöglicht werden?

 Grundsätzlich sollen die Kunden, Produkt und Bestlldaten in das DWH importiert werden.

* Welche Produkte wurden am meisten gekauft?
* Welche Produkte hatten den höchsten Umsatz?
* Welche Produkte haben die höchste Marge?
* Woher stammen die Kunden mit dem höchsten Umsatz? mit den meisten bezogenen Produkten?

## Implementierung des Prozesses in PDI

Es wurden verschiedene Transformationen erstellt welche den ETL-Prozess implementierne:

* CSV_EXport: Tranformation welche die Quelltabellen in csv schreiben
* Staging Import: Import der csv in die Staging area
* DWH import: Import in das DWH-Schema. Dabei werden auch der Transformationsteil des ETL Prozesses druchgeführt

## Exportieren der Tabellen in csv

Hierfür wurde eine PDI-Tranfsormation erstellt welche die benötigten Tabellen in eine csv-Datei schreiben. Die Output Pfade (C:\PDI\DWH\*.*) wurden so gewählt, dass die Tranformationen bei allen Projketbeteiligten ausgeführt werden können. Aufgrund der gemeinsamen Installation von PDI wurde der Ordner C:\PDI erstellt und kann für die Datenablage benutzt werden.
[[ADD Screenshot Transformation]]
[[ADD Screenshot Detailansicht]]







