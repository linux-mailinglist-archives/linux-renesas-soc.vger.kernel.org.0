Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B922B4E5088
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 23 Mar 2022 11:41:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243591AbiCWKnF (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 23 Mar 2022 06:43:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46216 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236222AbiCWKnE (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 23 Mar 2022 06:43:04 -0400
Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D352A6D1B4;
        Wed, 23 Mar 2022 03:41:34 -0700 (PDT)
Received: by mail-ej1-f48.google.com with SMTP id r13so1958609ejd.5;
        Wed, 23 Mar 2022 03:41:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=Almyyc1IrKf1zO+Kw8vUDsh6wUJc2+4bjOhxQbAJAVM=;
        b=hlOWAf6Oq7tFsyTJuvN4tvwht9VfkqrH+Ethwh5csZozPsIiER92eJV0Avk7NLw8fW
         rrrQcwgaBZB/xRz9DE6w4BG7cprDlidXYnjPsRdXcXPf7oA393RqjYQ6RR/8j+QPEIpk
         9OhdVR9uc70EF0Zuv13zyq8CeWbASj3p9svcHYDq5QyOSVcodpQHw1vpBbhIEGkVwC8v
         RJFaNrBfvmrNdhdOayrQzcGHxVhJ+S0/onqV2RS7BuH+YcNMt01fWWAD3fCb8eMvN26a
         8izqLGDWXqQy6vUsA7syciG1j+wRO+iF3/vb783YkaNzTaNsRwZPHfCYv23yLFOFMPna
         3iJw==
X-Gm-Message-State: AOAM530txvN9ui2OqW9RJy9sJWIai+0Fch28JGyHzmFilxaaXi3sQ54e
        QAV4Nm28ONDGxlLfsAzJ9ZXwokCQmqc=
X-Google-Smtp-Source: ABdhPJwIa6bE48WVeXssjbI2MwYz2RKFkBZESjJZuw58Kq+0+MIM0XkbuDIwWj+ZCutP0aiSmDwRmg==
X-Received: by 2002:a17:906:c0c8:b0:6d0:562c:2894 with SMTP id bn8-20020a170906c0c800b006d0562c2894mr31259441ejb.625.1648032092732;
        Wed, 23 Mar 2022 03:41:32 -0700 (PDT)
Received: from [192.168.0.17] (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.googlemail.com with ESMTPSA id bk1-20020a170906b0c100b006d47308d84dsm9652311ejb.33.2022.03.23.03.41.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 23 Mar 2022 03:41:32 -0700 (PDT)
Message-ID: <a51dec7d-4dfd-5603-3d34-a40b0fd9ec08@kernel.org>
Date:   Wed, 23 Mar 2022 11:41:31 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH 02/14] dt-bindings: arm: renesas: Document Renesas RZ/V2M
 System Configuration
Content-Language: en-US
To:     Phil Edworthy <phil.edworthy@renesas.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Rob Herring <robh+dt@kernel.org>
Cc:     linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
        Biju Das <biju.das.jz@bp.renesas.com>
References: <20220321154232.56315-1-phil.edworthy@renesas.com>
 <20220321154232.56315-3-phil.edworthy@renesas.com>
From:   Krzysztof Kozlowski <krzk@kernel.org>
In-Reply-To: <20220321154232.56315-3-phil.edworthy@renesas.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-1.4 required=5.0 tests=BAYES_00,
        FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
        NICE_REPLY_A,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On 21/03/2022 16:42, Phil Edworthy wrote:
> Add DT binding documentation for System Configuration (SYS) found on
> RZ/V2M SoC's.
> 
> SYS block contains the SYS_VERSION register which can be used to retrieve
> SoC version information.
> 
> Signed-off-by: Phil Edworthy <phil.edworthy@renesas.com>
> Reviewed-by: Biju Das <biju.das.jz@bp.renesas.com>

Could you send reviewed-by tags publicly? Maybe there was internal
review, maybe not and it was just copy-pasted to all submissions...

> ---
>  .../bindings/arm/renesas,rzv2m-sys.yaml       | 39 +++++++++++++++++++
>  1 file changed, 39 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/arm/renesas,rzv2m-sys.yaml
> 
> diff --git a/Documentation/devicetree/bindings/arm/renesas,rzv2m-sys.yaml b/Documentation/devicetree/bindings/arm/renesas,rzv2m-sys.yaml
> new file mode 100644
> index 000000000000..1a58906336b8
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/arm/renesas,rzv2m-sys.yaml
> @@ -0,0 +1,39 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: "http://devicetree.org/schemas/arm/renesas,rzv2m-sys.yaml#"
> +$schema: "http://devicetree.org/meta-schemas/core.yaml#"
> +
> +title: Renesas RZ/V2M System Configuration (SYS)
> +
> +maintainers:
> +  - Geert Uytterhoeven <geert+renesas@glider.be>
> +
> +description:
> +  The RZ/V2M System Configuration (SYS) performs system control of the LSI
> +  and supports the following functions,
> +  - LSI version
> +  - 34-bit address space access function
> +  - PCIe related settings
> +  - WDT stop control
> +  - Temperature sensor (TSU) monitor

Usually all these are separate devices, so what does it mean that SYS is
supporting these functions? Is it related to other Renesas System
Controllers? For example
Documentation/devicetree/bindings/power/renesas,apmu.yaml
?
Why one is in power and one in arm subdirectory? Maybe you should extend
existing one?

> +
> +properties:
> +  compatible:
> +    const: renesas,r9a09g011-sys
> +
> +  reg:
> +    maxItems: 1
> +
> +required:
> +  - compatible
> +  - reg
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    sysc: system-configuration@a3f03000 {
> +            compatible = "renesas,r9a09g011-sys";
> +            reg = <0 0xa3f03000 0 0x400>;

Did you actually test it (make dt_binding_check)? This looks wrong.

> +    };


Best regards,
Krzysztof
