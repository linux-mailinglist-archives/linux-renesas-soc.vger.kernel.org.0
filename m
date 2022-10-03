Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B03325F2BD0
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  3 Oct 2022 10:29:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231395AbiJCI3z (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 3 Oct 2022 04:29:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59592 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231388AbiJCI3e (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 3 Oct 2022 04:29:34 -0400
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com [IPv6:2a00:1450:4864:20::42c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E99F666A49
        for <linux-renesas-soc@vger.kernel.org>; Mon,  3 Oct 2022 01:02:39 -0700 (PDT)
Received: by mail-wr1-x42c.google.com with SMTP id b4so8496316wrs.1
        for <linux-renesas-soc@vger.kernel.org>; Mon, 03 Oct 2022 01:02:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date;
        bh=kQgWgh00accM3mS2vAOocxp33pCuYAQUA0ZMfEAxp/g=;
        b=EP6IbO2wYVnN7PPG2eCRR4kE4H8BCZyTFBJsIRjEBTkqXnng+XoQPGoOB6tlnXA56N
         tErBonG/Jd2HO4PMk0ea/kNWhF9Et4iy7zrW3U/SgPSJtlzg+fmxlc2bmeyFuT65pHKa
         ZNdk/LhCRx4y7lcWLQn7ftP9phsywpKsbO5+1Lgx7pU4ztXyZdVYcyjZMrtzJDKgFDXR
         H6+dpT7bMhqbmq6nrdfdCQ38cHnByJBaxd1LhzT2NPMbaGh6saeraR3y0Zk0dap596x1
         MXGl/WvbegoDaWZ/7uXN1087hU/Cc2Ud3AbSFWWi6nOD3WOT5BKZf4smAjeGiCNoXKnP
         VP+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=kQgWgh00accM3mS2vAOocxp33pCuYAQUA0ZMfEAxp/g=;
        b=N3gPOyJHDuGluH2CqP27RTq69tFIDKzSumJzukEiwCG8IuzTiwoWic6Fdq5xSgPfbZ
         43OqqMXfhEou1EMgj1ytQ7gnWpaGVKcCkoTWHddAwy18zBp5y80bsbMMZfux3aYyUtYB
         7TuAH2N4VkzdUmROVQMqd4xysWmBbU2QyZ3cEBZ5HETiWdzbuE6RFPZrwobWlCuSAL06
         /Jo6ZlMkb9JCbfDUJP0y4AOG5eNIlKwbbG5cScYa2AlOZFWgP8crDnc0WJp6Ivk5NjsD
         xgu/Jsje1LVsiYGx1wpCukUF+uV4e48ifmqXwFt/X1HQViL8AmFeo/qZ5Tf5IhosvcFK
         +/iw==
X-Gm-Message-State: ACrzQf2JSpRgiYnLXLaXLm9IdVhUMo4OChx36Rn2hC7iJ7APJhU5eRpA
        8dWZ9IE22+mJmJN3IWtawDqOrHxuQ8jTGA==
X-Google-Smtp-Source: AMsMyM4zL3ViSL381IbyG5kQevPpemwG6p8u2HHe0S+30Z1XwlKw2jwVU3uDZO+Sb/H5qdUPdp8tuA==
X-Received: by 2002:a2e:a785:0:b0:26c:4e8c:5e79 with SMTP id c5-20020a2ea785000000b0026c4e8c5e79mr6439758ljf.396.1664783615565;
        Mon, 03 Oct 2022 00:53:35 -0700 (PDT)
Received: from [192.168.0.21] (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id n5-20020a0565120ac500b0048af3c090f8sm1357433lfu.13.2022.10.03.00.53.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 03 Oct 2022 00:53:34 -0700 (PDT)
Message-ID: <f8d68874-e3d9-887e-e9d4-0da72352c564@linaro.org>
Date:   Mon, 3 Oct 2022 09:53:33 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.0
Subject: Re: [PATCH RFC 4/8] dt-bindings: mfd: rzg2l-mtu3: Document RZ/G2UL
 MTU3 counter
Content-Language: en-US
To:     Biju Das <biju.das.jz@bp.renesas.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     Lee Jones <lee@kernel.org>, devicetree@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        linux-renesas-soc@vger.kernel.org
References: <20220926132114.60396-1-biju.das.jz@bp.renesas.com>
 <20220926132114.60396-5-biju.das.jz@bp.renesas.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220926132114.60396-5-biju.das.jz@bp.renesas.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.6 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On 26/09/2022 15:21, Biju Das wrote:
> Document 16-bit and 32-bit phase counting mode support on
> RZ/G2L MTU3 IP.
> 

Squash with previous. New devices are added complete, not artificially
split into multiple non-working components.

> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> ---
>  .../bindings/mfd/renesas,rzg2l-mtu3.yaml      | 35 +++++++++++++++++++
>  1 file changed, 35 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/mfd/renesas,rzg2l-mtu3.yaml b/Documentation/devicetree/bindings/mfd/renesas,rzg2l-mtu3.yaml
> index c1fae8e8d9f9..c4bcf28623d6 100644
> --- a/Documentation/devicetree/bindings/mfd/renesas,rzg2l-mtu3.yaml
> +++ b/Documentation/devicetree/bindings/mfd/renesas,rzg2l-mtu3.yaml
> @@ -192,6 +192,37 @@ properties:
>    "#size-cells":
>      const: 0
>  
> +patternProperties:
> +  "^counter@[1-2]+$":
> +    type: object

    additionalProperties: false

> +
> +    properties:
> +      compatible:
> +        const: renesas,rzg2l-mtu3-counter
> +
> +      reg:
> +        description: Identify counter channels.
> +        items:
> +          enum: [ 1, 2 ]
> +
> +      renesas,32bit-phase-counting:
> +        type: boolean
> +        description: Enable 32-bit phase counting mode.
> +
> +      renesas,ext-input-phase-clock-select:

I propose to drop "input". I understand you just select pins with clock?
If it is external clock, then why not using generic clock bindings?

> +        $ref: /schemas/types.yaml#/definitions/uint32
> +        enum: [ 0, 1 ]
> +        default: 1
> +        description: |
> +          Selects the external clock pin for phase counting mode.
> +            <0> : MTCLKA and MTCLKB are selected for the external phase clock.
> +            <1> : MTCLKC and MTCLKD are selected for the external phase clock
> +                  (default)
> +
> +    required:
> +      - compatible
> +      - reg
> +
>  required:
>    - compatible
>    - reg
> @@ -270,6 +301,10 @@ examples:
>        clocks = <&cpg CPG_MOD R9A07G044_MTU_X_MCK_MTU3>;
>        power-domains = <&cpg>;
>        resets = <&cpg R9A07G044_MTU_X_PRESET_MTU3>;

Blank line

> +      counter@1 {
> +        compatible = "renesas,rzg2l-mtu3-counter";
> +        reg = <1>;
> +      };
>      };
>  
>  ...

Best regards,
Krzysztof

