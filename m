Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 667E4606CA7
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 21 Oct 2022 02:50:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229882AbiJUAuM (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 20 Oct 2022 20:50:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35914 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229930AbiJUAuK (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 20 Oct 2022 20:50:10 -0400
Received: from mail-qv1-xf2c.google.com (mail-qv1-xf2c.google.com [IPv6:2607:f8b0:4864:20::f2c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6AEBC9B874
        for <linux-renesas-soc@vger.kernel.org>; Thu, 20 Oct 2022 17:50:05 -0700 (PDT)
Received: by mail-qv1-xf2c.google.com with SMTP id h10so850958qvq.7
        for <linux-renesas-soc@vger.kernel.org>; Thu, 20 Oct 2022 17:50:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=DNhuHakSL+A+C95nv/zMK27Kss6ODk0L9tiW1PQtBR0=;
        b=wLqcY/sjAMnkPEwBatGvm+Q2YSCvv6BJKkwbiMpB43S31G+TFf7qj8wChiLYEseF50
         iXsQyJOmqmwUAK7oSzuN1yuD0UHLdfTyRetLW+gAX9i4v245SE1H7K3COCQm6m7IbHv/
         0tfMrHEbUOqPyFJ5nyWtneshzJbebIaCz/QOvpzrun68S9Sh71LCc6N/EIEaSrlKMcyF
         3WQfTnNLsZYbUDsCymrGX06q3Gppz1JpS1dVqhAcn67bT/BrMjzex6qtcf2F7cNcF8Fx
         tyWTAPz5wsKbQX7AMsoBlod8BrLGHsdcr66nXBM1Nfj5odUPcAihLOqrVK3FuVMn6K2e
         VPAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=DNhuHakSL+A+C95nv/zMK27Kss6ODk0L9tiW1PQtBR0=;
        b=cI90nMHBMSF9ZQD8NZCBCSm3+FS+gQymTLLCFY1vOK8NgJW4ZQ1jt4770WEkpT/dLK
         o3iAzYf0QIs54kKeaiERIF1PP1qrNB2iph0Rgps/NzS7N/IECncisHLPovRXkOeR0VB+
         +tDiQVY8m5HGVps+n9I2ZQsYMtMvBRuxunvL3KZv7qB87ouZpynmgw7sLB3bJkeVKurs
         6U/Jj9FoeRv1Ko9YpuE3xDg8FfIvelzdU345gX29kKl+uwTuzvU6nAv1uHU0TPQ8RdAt
         MIdt6hDJEyRCThhf2fajZR0X3LAQzawMSMgE5DwtD8FtL2hHzPz/Xt8zeM6Iw/9QYBaa
         c0Mg==
X-Gm-Message-State: ACrzQf21VFN+K5W2z4TqPsSLhaM3QDbsXFKGyRySl6xzN+DHhcECKMJQ
        h/704E9qMhcjBYjrq8J7XkDck0AYtOHoFA==
X-Google-Smtp-Source: AMsMyM7swZnwLYLIkpvx9eQc6XXcJZPEDmpHNzly9yTXyyG2dSm5SDSgtDd75mPbfxF32tgdOipsBA==
X-Received: by 2002:ad4:5f4f:0:b0:4b1:db1e:6c01 with SMTP id p15-20020ad45f4f000000b004b1db1e6c01mr14267727qvg.100.1666313404703;
        Thu, 20 Oct 2022 17:50:04 -0700 (PDT)
Received: from [192.168.10.124] (pool-72-83-177-149.washdc.east.verizon.net. [72.83.177.149])
        by smtp.gmail.com with ESMTPSA id p6-20020a05620a132600b006ee7923c187sm8265946qkj.42.2022.10.20.17.50.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 20 Oct 2022 17:50:04 -0700 (PDT)
Message-ID: <2694afda-fe53-8f6c-85dd-390b42a39d93@linaro.org>
Date:   Thu, 20 Oct 2022 20:50:02 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.0
Subject: Re: [PATCH v2 1/2] dt-bindings: phy: renesas: Document Renesas
 Ethernet SERDES
Content-Language: en-US
To:     Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        kishon@ti.com, vkoul@kernel.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org
Cc:     linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org
References: <20221019083449.933005-1-yoshihiro.shimoda.uh@renesas.com>
 <20221019083449.933005-2-yoshihiro.shimoda.uh@renesas.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221019083449.933005-2-yoshihiro.shimoda.uh@renesas.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On 19/10/2022 04:34, Yoshihiro Shimoda wrote:
> Document Renesas Etherent SERDES for R-Car S4-8 (r8a779f0).
> 
> Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
> ---
>  .../phy/renesas,r8a779f0-ether-serdes.yaml    | 54 +++++++++++++++++++
>  1 file changed, 54 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/phy/renesas,r8a779f0-ether-serdes.yaml
> 
> diff --git a/Documentation/devicetree/bindings/phy/renesas,r8a779f0-ether-serdes.yaml b/Documentation/devicetree/bindings/phy/renesas,r8a779f0-ether-serdes.yaml
> new file mode 100644
> index 000000000000..ea392cd6e947
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/phy/renesas,r8a779f0-ether-serdes.yaml
> @@ -0,0 +1,54 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/phy/renesas,r8a779f0-ether-serdes.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Renesas Ethernet SERDES
> +
> +maintainers:
> +  - Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
> +
> +properties:
> +  compatible:
> +    const: renesas,r8a779f0-ether-serdes
> +
> +  reg:
> +    maxItems: 1
> +
> +  clocks:
> +    maxItems: 1
> +
> +  resets:
> +    maxItems: 1
> +
> +  power-domains:
> +    maxItems: 1
> +
> +  '#phy-cells':
> +    description: Port number of SERDES.
> +    const: 1
> +
> +required:
> +  - compatible
> +  - reg
> +  - clocks
> +  - resets
> +  - power-domains
> +  - '#phy-cells'
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/clock/r8a779f0-cpg-mssr.h>
> +    #include <dt-bindings/power/r8a779f0-sysc.h>
> +
> +    serdes@e6444000 {

Phy devices are usually named "phy" and you use it as a phy device. As
serdes I guess you refer to actual hardware implementation, but still
the role is phy, isn't it?

> +            compatible = "renesas,r8a779f0-ether-serdes";

Use 4 spaces for example indentation.

> +            reg = <0xe6444000 0xc00>;
> +            clocks = <&cpg CPG_MOD 1506>;
> +            power-domains = <&sysc R8A779F0_PD_ALWAYS_ON>;
> +            resets = <&cpg 1506>;
> +            #phy-cells = <1>;
> +    };

Best regards,
Krzysztof

