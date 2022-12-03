Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BC8E3641694
	for <lists+linux-renesas-soc@lfdr.de>; Sat,  3 Dec 2022 13:13:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229611AbiLCMNa (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Sat, 3 Dec 2022 07:13:30 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57438 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229448AbiLCMN3 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sat, 3 Dec 2022 07:13:29 -0500
Received: from mail-lj1-x235.google.com (mail-lj1-x235.google.com [IPv6:2a00:1450:4864:20::235])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 30BE71836A
        for <linux-renesas-soc@vger.kernel.org>; Sat,  3 Dec 2022 04:13:28 -0800 (PST)
Received: by mail-lj1-x235.google.com with SMTP id bn5so8240839ljb.2
        for <linux-renesas-soc@vger.kernel.org>; Sat, 03 Dec 2022 04:13:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=uTLYaWLVJ3C0TmmrxY/Wlk5QB4gl21jsIw90UM9GCgw=;
        b=TnNs9TwiVoGP6+Qg+OkyabJ+bgPHJieiTBkcYu9dRVC7i7WSf/fLJTmB5udj48+2U1
         zfcETkFb6ZtHlxR244bg38LCsPI4tBoriYkymcYllJA3WzhHh6gA90CumAWcuJ6IqdJw
         /MwXajb+AfCNJQeKsj62EiNwaz86Bcz/ILQqrt3qXXnjRMYXzUAex5avXCUwn+pHRG6A
         Y1t1UDahXHcinAPAHqqln/psjNoTLBVZH4GLHX7DIsvyE+Bxq/t+N3kuqZxML5odrYp3
         xS+ZpJe5ctync7cXMXCTYjw3J8Sm5pL9ZszMY/SxE3ihtIxsfijlj71faNqcwRvRCgia
         FUQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=uTLYaWLVJ3C0TmmrxY/Wlk5QB4gl21jsIw90UM9GCgw=;
        b=hq40Z8ldPrnDhGTXZnWlCDt3lwIt2lj4EcuZDy51QFeAy4VNaRRJEznf3R2PDs/GG1
         X404NSzK5lkSabGVdHvEufPwzLFkbNT/e/I43lZb8NqY0ZdgHyQJDh4f+8NO7IVNEK9Q
         HJx/PlEgq/czrEUfB9ReUJnpzhZVyb/XuuefwHpM7yQP4fZw54wAVMCUnfctMd8fVdun
         UBWhvlDlN/AML3vBj5EoN049cCF8V5Xh2Wv23Iyiur+OVBjA7SvwwVkmDSZJzdoFPbxi
         /lLWM3udd6SyO31BgA5K90HTxjypTkc0yTtY2J0IWe/4Q+8msK6F9NwGWl9i8Qbp7dAG
         qCvw==
X-Gm-Message-State: ANoB5pmZU0iYs+n697v+eUD8MI5Ymxpwt7M/Td4Tg0t8ZMr01VUsQMQq
        3PoX1I7g0UM695S0OZmrrMqMuw==
X-Google-Smtp-Source: AA0mqf6qff40XMjznJ0Uc00ZtXlqwql+i8LRDjdpsFjDBTZPaIiihrY4OqHpg8vJFPboQPskLEyh4A==
X-Received: by 2002:a05:651c:213:b0:277:e01:610e with SMTP id y19-20020a05651c021300b002770e01610emr22567717ljn.181.1670069606462;
        Sat, 03 Dec 2022 04:13:26 -0800 (PST)
Received: from [192.168.0.20] (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
        by smtp.gmail.com with ESMTPSA id j15-20020a05651231cf00b004b4b0a68f67sm1380403lfe.185.2022.12.03.04.13.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 03 Dec 2022 04:13:26 -0800 (PST)
Message-ID: <b105572c-96fe-dbad-c435-43233cfb25a7@linaro.org>
Date:   Sat, 3 Dec 2022 13:13:24 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [PATCH 1/2] dt-bindings: sound: ti,pcm3168a: Convert to
 json-schema
Content-Language: en-US
To:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Damien Horsley <Damien.Horsley@imgtec.com>,
        Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc:     alsa-devel@alsa-project.org, devicetree@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org
References: <cover.1669980383.git.geert+renesas@glider.be>
 <9f2a2474ec71dcc2a76e868295202a8c425a5d41.1669980383.git.geert+renesas@glider.be>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <9f2a2474ec71dcc2a76e868295202a8c425a5d41.1669980383.git.geert+renesas@glider.be>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On 02/12/2022 13:55, Geert Uytterhoeven wrote:
> Convert the Texas Instruments PCM3168A Audio Codec Device Tree binding
> documentation to json-schema.
> 
> Add missing properties.
> Drop unneeded pinctrl properties from example.

Thank you for your patch. There is something to discuss/improve.

> +description:
> +  The Texas Instruments PCM3168A is a 24-bit Multi-channel Audio CODEC with
> +  96/192kHz sampling rate, supporting both SPI and I2C bus access.
> +
> +properties:
> +  compatible:
> +    const: ti,pcm3168a
> +
> +  reg:
> +    maxItems: 1
> +
> +  clocks:
> +    items:
> +      - description: System clock input
> +
> +  clock-names:
> +    items:
> +      - const: scki
> +
> +  reset-gpios:
> +    items:
> +      - description: |
> +          GPIO line connected to the active-low RST pin of the codec.
> +            RST = low: device power-down
> +            RST = high: device is enabled
> +
> +  "#sound-dai-cells":
> +    enum: [0, 1]

This is a bit unexpected. Looking at DTSes:
1. I see in ulcb-kf.dtsi with cells==0, but two endpoints. The dai cells
seem unused? In such case shall dai-cells be skipped if we have endpoints?

2. in k3-j721e-common-proc-board.dts has cells=1, but user's phandle
does not have an argument, so practically it is ==0? The user -
sound/soc/ti/j721e-evm.c - just gets the node and does not use cells,
right? So even though dai-cells==1, it does not matter, because user
gets its own parsing?

3. The pcm3168a driver also does not have any xlate function, but it
registers to DAIs, so all uses should be with cells==1 to select proper
DAI...


> +
> +  VDD1-supply:
> +    description: Digital power supply regulator 1 (+3.3V)
> +
> +  VDD2-supply:
> +    description: Digital power supply regulator 2 (+3.3V)
> +
> +  VCCAD1-supply:
> +    description: ADC power supply regulator 1 (+5V)
> +
> +  VCCAD2-supply:
> +    description: ADC power supply regulator 2 (+5V)
> +
> +  VCCDA1-supply:
> +    description: DAC power supply regulator 1 (+5V)
> +
> +  VCCDA2-supply:
> +    description: DAC power supply regulator 2 (+5V)
> +
> +  ports:
> +    $ref: /schemas/graph.yaml#/properties/ports
> +    properties:
> +      port@0:
> +        $ref: audio-graph-port.yaml#
> +        description: Audio input port.

unevaluatedProperties: false

> +
> +      port@1:
> +        $ref: audio-graph-port.yaml#
> +        description: Audio output port.

unevaluatedProperties: false


> +
> +required:
> +  - compatible
> +  - reg
> +  - clocks
> +  - clock-names
> +  - VDD1-supply
> +  - VDD2-supply
> +  - VCCAD1-supply
> +  - VCCAD2-supply
> +  - VCCDA1-supply
> +  - VCCDA2-supply
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/gpio/gpio.h>
> +
> +    i2c {
> +        #address-cells = <1>;
> +        #size-cells = <0>;
> +
> +        pcm3168a: audio-codec@44 {
> +            compatible = "ti,pcm3168a";
> +            reg = <0x44>;
> +            reset-gpios = <&gpio0 4 GPIO_ACTIVE_LOW>;
> +            clocks = <&clk_core 42>;
> +            clock-names = "scki";
> +            VDD1-supply = <&supply3v3>;
> +            VDD2-supply = <&supply3v3>;
> +            VCCAD1-supply = <&supply5v0>;
> +            VCCAD2-supply = <&supply5v0>;
> +            VCCDA1-supply = <&supply5v0>;
> +            VCCDA2-supply = <&supply5v0>;

Can you extend the example with dai cells or with endpoints (or both,
depending on my previous comment...)

> +        };
> +    };

Best regards,
Krzysztof

