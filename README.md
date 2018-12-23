# elasticsearch-node

## Create & Delete Indices Tempalte

If you want to customize mapping or setting of indices, just modify json files in the `templates` directory.

Running `index-tempate.sh` script to create or delete indice templates.

```bash 
# e.g.
./index-templates.sh --action create --dir ./templates --url http://localhost:9200
./index-templates.sh --action delete --dir ./templates --url http://localhost:9200
```

## Curator

[Curator](https://github.com/elastic/curator) is a great tool for indice management. Make sure you install the correct version of Curator, detail: [Version Compatibility](https://www.elastic.co/guide/en/elasticsearch/client/curator/current/version-compatibility.html)

Config elasticsearch url and log file path in `curator/config.yml`.  

```bash
# create indices
curator --config ./curator/config.yml ./curator/create-index-actions.yml

# delete indices
curator --config ./curator/config.yml ./curator/delete-index-actions.yml

# rollover indices
curator --config ./curator/config.yml ./curator/rollover-index-actions.yml
```
