Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E61BA5E5C64
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 22 Sep 2022 09:29:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229585AbiIVH3J (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 22 Sep 2022 03:29:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53714 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230498AbiIVH3E (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 22 Sep 2022 03:29:04 -0400
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com [IPv6:2a00:1450:4864:20::12b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 013F9D12C1
        for <linux-renesas-soc@vger.kernel.org>; Thu, 22 Sep 2022 00:29:03 -0700 (PDT)
Received: by mail-lf1-x12b.google.com with SMTP id z25so13253098lfr.2
        for <linux-renesas-soc@vger.kernel.org>; Thu, 22 Sep 2022 00:29:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date;
        bh=1507m4RgEB8G8apG9frqBRqsvM+IxF1zb1xDZKuTjik=;
        b=C5nysh2zDZrg+jTjXaipq/RO2w0zQPTnCDjvCuDyJJ+rsaO+QfNTlyAIqLHWK9QVNh
         jyGfsE8oMWxpqoeOcC4FmVpdgGrbbj8aSN80+1Z8Hi2XX8kvEShxE3V77B9k1aaEylKi
         MWny/zmL5x8iUzR2/GYOwI5zsibW/S5TUw+A2HT6emYVJ/f12PnC4oQp5S7a2fj0M56F
         GWmiqIInklUWbhinJRd9Wtg5vtvc0v5CpDefU7uxaXtEIEBFcyrUQlnUjSfW0tkUKmdu
         R7ijOCMam3XdPHq96OFJMzeGjnYLprO3f28zHDCpq5EeuVTcpWrAc2pUoJjuw7LaELlK
         iERQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=1507m4RgEB8G8apG9frqBRqsvM+IxF1zb1xDZKuTjik=;
        b=JAXFnqT/vF94ns31cX2EuNsp8/VoYkBnF+1Fqxtzzmj/X/vE2dSeqCVbv12BQhuRSq
         Cdfasq8Bfl0gZuAFn3EDgGgCLmrvD12y38BgQ/v0Smc7Ot7WUn8umR4M4Asfvd7qj5qZ
         Rsr7A8Im28OyjZDwd9goC62/OsT9+m76+QMss9BHulOdVTYQw9S+HZCv85HsuwecRAWs
         EDhEEzlndvE9XwHMMFN6IcUXNQXVjIOcSlCv0X0huXhC/UeUj0/Fg29wpKafVdENI1AJ
         Wzj3HsVYBcbhhxMHyLtrqG+8PnG4sbxA57haIT5yO1oh+j3/FzJpJIPU75eu4h/0klKp
         NlNA==
X-Gm-Message-State: ACrzQf3Cn2SnNzkeOtuJfXa5XxdMyvoiVHz/HEyZdiVZKO41mZlSS90C
        J1kRJ/iOMfo1YhpKWcoMiY3ngQ==
X-Google-Smtp-Source: AMsMyM7xYIDEG5UyAZ6DpX1g+zu6IgAcOFUXs7lxj4Ju3vGUs2aYZBGzxzwpgrLobKb6kp/wgJtMvg==
X-Received: by 2002:ac2:4db1:0:b0:497:838b:15d9 with SMTP id h17-20020ac24db1000000b00497838b15d9mr682181lfe.644.1663831741353;
        Thu, 22 Sep 2022 00:29:01 -0700 (PDT)
Received: from [192.168.0.21] (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id q14-20020a056512210e00b004972b0bb426sm796625lfr.257.2022.09.22.00.28.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 22 Sep 2022 00:29:00 -0700 (PDT)
Message-ID: <9b29ee3f-ed48-9d95-a262-7d9e23a20528@linaro.org>
Date:   Thu, 22 Sep 2022 09:28:59 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Subject: Re: [PATCH v2 2/8] dt-bindings: phy: renesas: Document Renesas
 Ethernet SERDES
Content-Language: en-US
To:     Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        kishon@ti.com, vkoul@kernel.org, davem@davemloft.net,
        edumazet@google.com, kuba@kernel.org, pabeni@redhat.com,
        richardcochran@gmail.com, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, geert+renesas@glider.be
Cc:     andrew@lunn.ch, linux-phy@lists.infradead.org,
        netdev@vger.kernel.org, devicetree@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org
References: <20220921084745.3355107-1-yoshihiro.shimoda.uh@renesas.com>
 <20220921084745.3355107-3-yoshihiro.shimoda.uh@renesas.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220921084745.3355107-3-yoshihiro.shimoda.uh@renesas.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-5.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On 21/09/2022 10:47, Yoshihiro Shimoda wrote:
> Document Renesas Etherent SERDES for R-Car S4-8 (r8a779f0).
> 
> Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
> ---
>  .../bindings/phy/renesas,ether-serdes.yaml    | 54 +++++++++++++++++++
>  1 file changed, 54 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/phy/renesas,ether-serdes.yaml
> 
> diff --git a/Documentation/devicetree/bindings/phy/renesas,ether-serdes.yaml b/Documentation/devicetree/bindings/phy/renesas,ether-serdes.yaml
> new file mode 100644
> index 000000000000..04d650244a6a
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/phy/renesas,ether-serdes.yaml

Filename based on compatible, so renesas,r8a779f0-ether-serdes.yaml

> @@ -0,0 +1,54 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/phy/renesas,ether-serdes.yaml#
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
> +    ethernet@e6880000 {

Hm, isn't this a phy?

> +            compatible = "renesas,r8a779f0-ether-serdes";
> +            reg = <0xe6444000 0xc00>;
> +            clocks = <&cpg CPG_MOD 1506>;
> +            power-domains = <&sysc R8A779F0_PD_ALWAYS_ON>;
> +            resets = <&cpg 1506>;
> +            #phy-cells = <1>;
> +    };

Best regards,
Krzysztof

