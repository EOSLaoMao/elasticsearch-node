# elasticsearch-node

## Create & Delete Indices Tempalte

```bash
# e.g.
./index-templates.sh --action create --dir ./templates --url http://localhost:9200
./index-templates.sh --action delete --dir ./templates --url http://localhost:9200
```

## Curator

Config elasticsearch url and log file path in `curator/config.yml`.  
**Notice: when set rollover cron job, use absolute path of Curator**

```bash
# create indices
curator --config ./curator/config.yml ./curator/create-index-actions.yml

# delete indices
curator --config ./curator/config.yml ./curator/delete-index-actions.yml

# rollover indices
curator --config ./curator/config.yml ./curator/rollover-index-actions.yml
```
