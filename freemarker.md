- interpolation: `${VAR}`
    + default value: `${(VAR)!DEFAULT_VALUE}` 对于对象属性，如果不加括号，只检测最后一层，前面几层不存在会报错
- FTL tag: `<# >`(pre-defined), `<@ >`(user-defined, like mixin, 单个出现必须闭合)
    + branch: `<#if CONDITION>`,`<#else CONDITION>`, `<#elseif CONDITION>` `</#if>`
        + existance: `<#if (VAR)?? >` 对于对象属性，如果不加括号，只检测最后一层，前面几层不存在会报错
    + loop:
    ```
        <#list SEQUENCE_VAR as LOOP_VAR>
            LOOP_BODY <#sep> ONLY_NOT_LAST_ITEM <#/sep>
            <#else>
            NO_ITEM_BODY
        </#list>
    ```

    ```
        <#list SEQUENCE_VAR>
            NO_LOOP_PART
            <#items as LOOP_VAR>
                LOOP_BODY
            </#items>
            NO_LOOP_PART
        <#list>
    ```
    + include: `<#include FILE_PATH>`
- Comment: `<#--  -->`
- builtin(method): `VAR?BUILIN_NAME`, `VAR?BUILIN_NAME(arg1, arg2)`
- function: `FUN(arg1, arg2)`
