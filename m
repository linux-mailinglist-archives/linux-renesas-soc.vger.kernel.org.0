Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A265C691EC4
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 10 Feb 2023 13:01:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231963AbjBJMB1 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 10 Feb 2023 07:01:27 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33648 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231549AbjBJMB0 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 10 Feb 2023 07:01:26 -0500
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com [IPv6:2a00:1450:4864:20::32a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 872D934319
        for <linux-renesas-soc@vger.kernel.org>; Fri, 10 Feb 2023 04:01:25 -0800 (PST)
Received: by mail-wm1-x32a.google.com with SMTP id bg5-20020a05600c3c8500b003e00c739ce4so3880467wmb.5
        for <linux-renesas-soc@vger.kernel.org>; Fri, 10 Feb 2023 04:01:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=QmYEIB8KrKW3cTGNucQLIpq5xEhcRy52ps+CHHF2rNU=;
        b=mS7c+3f585HLLEal9khepFx94ipTA4PXqk1U7OFFknmgbTjOMXuIRX4fDGlifyRmmK
         vtdaw1MuQV5pUUimF5LlQ+uguZjxILxV+ICSWprHYqZAYrpeM3Lz+C1t/Nv8b+1r9inY
         9jtVvWfRS0KgvGyEgmOV9cai4kwJGO1PRk16PPdfOObGiVIcTIH6PgShE0yuUAJpecLQ
         qSip6oBXx/2G1+YRtZAvjP8VMkPrSR3SvxENacoHMqfJDxwCeAmwkZ80WYbieRvG/ifs
         iD5niK3IxeDeMb+5eq18lRCBy459BF+NjnBhtnmugYgaNAHcup+EuoZWz9AL6wfwge47
         6vzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=QmYEIB8KrKW3cTGNucQLIpq5xEhcRy52ps+CHHF2rNU=;
        b=NGGkgtwwA2ue9VBZ9ofyOCKvI4kn/A0pCdQRlymSjvKKLiBgktZcYxL3pj3ZkrEW6O
         KmI99Vem1JnE4TYeEp5Dkc+ifnwkykcR/TP3wh7s5hrUEHKa7ePu0qFxc8zyRxvDeDUP
         GDoz+Ad9AHeqNOXSnYsr/jCa/e9HjELSr3bE6wDQ1qAOGKyPoIUc+sDn2jszPa7zQU5j
         t8v1JhBKUkv1G2zlgLfHo9rP6Myy6wrsjy32XpkLxJcDa5tA4Jx9V52VSZZVhHyWo/zD
         /bwNE2dNWm6EkrGCLJTDIUae7detkhjYIch3hDirZ3J2/4RvThKB3T94FdrekgJwx5BR
         ZUEA==
X-Gm-Message-State: AO0yUKVukVGHRzjyw6oOYKIJ/VkMMWrKVTNx3GWXuyONvK67xH8sJKiJ
        I9iAPPE6dvtKPKIQIi+OFxiYQw==
X-Google-Smtp-Source: AK7set/ez76U2EuZthXspsPO3fkp0PVI0WuDaCS5K7oSHsbZtQRPUPIvrpCDrvIZU8lJYfhGbFSs3g==
X-Received: by 2002:a05:600c:4a8a:b0:3de:d9f:3025 with SMTP id b10-20020a05600c4a8a00b003de0d9f3025mr12984366wmp.0.1676030484050;
        Fri, 10 Feb 2023 04:01:24 -0800 (PST)
Received: from [192.168.1.109] ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id r18-20020a05600c459200b003db03725e86sm5538429wmo.8.2023.02.10.04.01.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 10 Feb 2023 04:01:23 -0800 (PST)
Message-ID: <f894aa27-0f14-5bc9-2eae-114fae7ef3b0@linaro.org>
Date:   Fri, 10 Feb 2023 13:01:01 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH net-next v3 4/6] dt-bindings: net: renesas,rzn1-gmac:
 Document RZ/N1 GMAC support
Content-Language: en-US
To:     =?UTF-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <clement.leger@bootlin.com>,
        Sergey Shtylyov <s.shtylyov@omp.ru>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>,
        Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        Giuseppe Cavallaro <peppe.cavallaro@st.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Jose Abreu <joabreu@synopsys.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Russell King <linux@armlinux.org.uk>,
        Wong Vee Khee <veekhee@apple.com>,
        Kurt Kanzenbach <kurt@linutronix.de>,
        Revanth Kumar Uppala <ruppala@nvidia.com>,
        Tan Tee Min <tee.min.tan@linux.intel.com>
Cc:     Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
        Herve Codina <herve.codina@bootlin.com>,
        =?UTF-8?Q?Miqu=c3=a8l_Raynal?= <miquel.raynal@bootlin.com>,
        Milan Stevanovic <milan.stevanovic@se.com>,
        Jimmy Lalande <jimmy.lalande@se.com>,
        Pascal Eberhard <pascal.eberhard@se.com>,
        Mohammad Athari Bin Ismail <mohammad.athari.ismail@intel.com>,
        Jon Hunter <jonathanh@nvidia.com>, netdev@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org
References: <20230209151632.275883-1-clement.leger@bootlin.com>
 <20230209151632.275883-5-clement.leger@bootlin.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230209151632.275883-5-clement.leger@bootlin.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-3.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On 09/02/2023 16:16, Clément Léger wrote:
> Add "renesas,rzn1-gmac" binding documentation which is compatible with
> "snps,dwmac" compatible driver but uses a custom PCS to communicate
> with the phy.
> 
> Signed-off-by: Clément Léger <clement.leger@bootlin.com>
> ---
>  .../bindings/net/renesas,rzn1-gmac.yaml       | 67 +++++++++++++++++++
>  1 file changed, 67 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/net/renesas,rzn1-gmac.yaml
> 
> diff --git a/Documentation/devicetree/bindings/net/renesas,rzn1-gmac.yaml b/Documentation/devicetree/bindings/net/renesas,rzn1-gmac.yaml
> new file mode 100644
> index 000000000000..029ce758a29c
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/net/renesas,rzn1-gmac.yaml
> @@ -0,0 +1,67 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/net/renesas,rzn1-gmac.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Renesas GMAC
> +
> +maintainers:
> +  - Clément Léger <clement.leger@bootlin.com>
> +
> +select:
> +  properties:
> +    compatible:
> +      contains:
> +        enum:
> +          - renesas,r9a06g032-gmac
> +          - renesas,rzn1-gmac
> +  required:
> +    - compatible
> +
> +allOf:
> +  - $ref: snps,dwmac.yaml#
> +
> +properties:
> +  compatible:
> +    items:
> +      - enum:
> +          - renesas,r9a06g032-gmac
> +      - const: renesas,rzn1-gmac
> +      - const: snps,dwmac

Thanks, looks good now.

> +
> +  pcs-handle:
> +    description:
> +      phandle pointing to a PCS sub-node compatible with
> +      renesas,rzn1-miic.yaml#
> +    $ref: /schemas/types.yaml#/definitions/phandle

you do not need ref here - it is coming from ethernet-controller.yaml
via snps,dwmac.yaml. You actually could drop entire property, but it can
also stay for the description.

> +
> +required:
> +  - compatible
> +
> +unevaluatedProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/clock/r9a06g032-sysctrl.h>
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> +
> +    ethernet@44000000 {
> +      compatible = "renesas,r9a06g032-gmac", "renesas,rzn1-gmac", "snps,dwmac";
> +      reg = <0x44000000 0x2000>;
> +      interrupt-parent = <&gic>;
> +      interrupts = <GIC_SPI 34 IRQ_TYPE_LEVEL_HIGH>,
> +             <GIC_SPI 36 IRQ_TYPE_LEVEL_HIGH>,

Please align with previous <


Best regards,
Krzysztof

