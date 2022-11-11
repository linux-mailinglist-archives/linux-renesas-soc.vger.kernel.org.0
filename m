Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DC3F3625565
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 11 Nov 2022 09:34:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232177AbiKKIef (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 11 Nov 2022 03:34:35 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56110 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230043AbiKKIed (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 11 Nov 2022 03:34:33 -0500
Received: from mail-lj1-x235.google.com (mail-lj1-x235.google.com [IPv6:2a00:1450:4864:20::235])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 93CE4654E9
        for <linux-renesas-soc@vger.kernel.org>; Fri, 11 Nov 2022 00:34:32 -0800 (PST)
Received: by mail-lj1-x235.google.com with SMTP id d20so3726151ljc.12
        for <linux-renesas-soc@vger.kernel.org>; Fri, 11 Nov 2022 00:34:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=7JFW4mvN1AURoSsZmRgLLi2tLS6XlxCoJXS1/xEyDoE=;
        b=MwIdtn+8EJEAE586Xkv0bO/u1uv1rDKqOPd6dK+G4I6+q4PM9eJ/I05d9X0/QG3I+E
         7DAbe+bQ7qyykJuOG5ChxNQvmSnmWqp9clO1cy10eZOznLbh3nTp+o+bHQACSTdTm4VN
         z2a+5DjXU5ygoNKefjJ6HpJeZLOPt0DzJLfYctt2xe5SoRw5QOER+IG12//sBuUB5BKG
         PDQr1Q3zPEqS2J1FCvzEhpqN1+/6N2bmND/yYfntXaRbwq9MZc7jvFrAOqoaEPMmBqYZ
         qu13MpQ4LbZ8PNI6rZQ9HdEBBhFIGItN+hGPgwW5r04oUW7e8e+ea7EZ3Gd1t7fjAU8s
         MyQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=7JFW4mvN1AURoSsZmRgLLi2tLS6XlxCoJXS1/xEyDoE=;
        b=3JLOwB9eVOURnkyerQB9HNxnSSVAUg8YB3LUPj0iZqgwLaO32YKToYg2hoKK2sRykO
         oN7s0dMx92gc5EJz4Jrw67NsDlF6BjKMpDueADOBjumgGxo5bvCdlsLa3NY+Co+5bPvi
         9DQ2+am2nkLTXRfCLNbUaPV2dlg51kMK/jBvk0kzFsuObtn7R/T209T0LY0tWEEFPIwT
         JLEWpa7TA9jT43VJyGP81ipA1TVzcAAD1Ha2vltW8eFKoW8WpZSdDCFMb2mGr9hZr7pf
         KeYdd0WO8QqkaI6Fkaonf02/JVUHe5XmvOd/hnylX9UKADUNPEezNHusOZvR/P3g4CNT
         klIw==
X-Gm-Message-State: ANoB5pkhcRUkEWlUfrFmVdTlaHljBeGmrfVcjTg9eNsf7QtghyrBoYxc
        JpTnLn4puuaCVitjhhQM/pujzw==
X-Google-Smtp-Source: AA0mqf5lWAXAN36+zQJdXBsor+6iKPt9VVhPNhbw5utgZthRRHmBOMAcg7OztIkKVJenarR0Cl+uQw==
X-Received: by 2002:a2e:b621:0:b0:276:762b:3499 with SMTP id s1-20020a2eb621000000b00276762b3499mr287777ljn.444.1668155670943;
        Fri, 11 Nov 2022 00:34:30 -0800 (PST)
Received: from [192.168.0.20] (088156142199.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.199])
        by smtp.gmail.com with ESMTPSA id u12-20020a05651220cc00b004a25bb4494fsm217073lfr.178.2022.11.11.00.34.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 11 Nov 2022 00:34:29 -0800 (PST)
Message-ID: <ae35fd75-64d3-3ab9-8cc0-3cbcc9c34b78@linaro.org>
Date:   Fri, 11 Nov 2022 09:34:29 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH v2 1/3] dt-bindings: arm: renesas: Document Renesas RZ/V2M
 System Configuration
Content-Language: en-US
To:     Biju Das <biju.das.jz@bp.renesas.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     Phil Edworthy <phil.edworthy@renesas.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
        Chris Paterson <chris.paterson2@renesas.com>,
        Fabrizio Castro <fabrizio.castro.jz@renesas.com>
References: <20221110162126.103437-1-biju.das.jz@bp.renesas.com>
 <20221110162126.103437-2-biju.das.jz@bp.renesas.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221110162126.103437-2-biju.das.jz@bp.renesas.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On 10/11/2022 17:21, Biju Das wrote:
> From: Phil Edworthy <phil.edworthy@renesas.com>
> 
> Add DT binding documentation for System Configuration (SYS) found on
> RZ/V2M SoC's.
> 
> SYS block contains the SYS_VERSION register which can be used to retrieve
> SoC version information.
> 
> Signed-off-by: Phil Edworthy <phil.edworthy@renesas.com>
> [biju: Updated the example ]
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> ---
> v1->v2:
>  * Moved the file from arm->soc/renesas
>  * Updated the path for binding file
>  * Updated the example
> ---
>  .../soc/renesas/renesas,rzv2m-sys.yaml        | 39 +++++++++++++++++++
>  1 file changed, 39 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/soc/renesas/renesas,rzv2m-sys.yaml
> 
> diff --git a/Documentation/devicetree/bindings/soc/renesas/renesas,rzv2m-sys.yaml b/Documentation/devicetree/bindings/soc/renesas/renesas,rzv2m-sys.yaml
> new file mode 100644
> index 000000000000..cc41747798e2
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/soc/renesas/renesas,rzv2m-sys.yaml

Filename should be based on the compatible. Pretty often some common
parts of both are fine (e.g. when file contains multiple compatibles),
but this very different then what I see below.

> @@ -0,0 +1,39 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: "http://devicetree.org/schemas/soc/renesas/renesas,rzv2m-sys.yaml#"
> +$schema: "http://devicetree.org/meta-schemas/core.yaml#"

Drop quotes from both.

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

If I get properly the purpose of the device, usually this is called
"system-controller". Use that as device node.

> +            compatible = "renesas,r9a09g011-sys";
> +            reg = <0xa3f03000 0x400>;

Use 4 spaces for example indentation.

> +    };

Best regards,
Krzysztof

