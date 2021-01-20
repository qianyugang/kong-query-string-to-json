# kong url参数转换为json插件

## 说明

- **名称**：query-string-to-json
- **说明**：本插件主要作用是把url中的查询参数转换为特定参数的json字符串`params={}`并替换到原url中。
- **例如**：原有url为

    ```
    http://service-host.com?minitest?appkey=xxx&size=10&qq=11&ww=22
    ```
    
    经过kong代理，并使用本插件之后，请求会变为
    
    ```
    http://kong.com:8000?appkey=xxx&size=10&params=%7B%22qq%22%3A%2211%22%2C%22ww%22%3A%2222%22%7D
    ```
    
- **参数**：配置参数中`exclude_params_names`为不需要转换为json的参数。例如上例中的`appkey`和`size`参数，就没有转换为json。


## 使用

在配置完成 service 以及 route代理之后，可以添加本插件到需要的 service 或者 route上，例如：

```
curl -X POST http://192.168.1.5:8001/routes/1ed4443c-e677-4af4-b551-ad6fd99a55e1/plugins\
    --data "name=query-string-to-json"  \
    --data "config.exclude_params_names[]=size&config.exclude_params_names[]=appkey"
```



