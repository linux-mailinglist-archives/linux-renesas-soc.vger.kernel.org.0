Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6AA02619AEE
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  4 Nov 2022 16:05:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232331AbiKDPFR (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 4 Nov 2022 11:05:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50194 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232333AbiKDPFF (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 4 Nov 2022 11:05:05 -0400
Received: from mail-qt1-x82b.google.com (mail-qt1-x82b.google.com [IPv6:2607:f8b0:4864:20::82b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8BCE9CE16
        for <linux-renesas-soc@vger.kernel.org>; Fri,  4 Nov 2022 08:05:01 -0700 (PDT)
Received: by mail-qt1-x82b.google.com with SMTP id c15so3166536qtw.8
        for <linux-renesas-soc@vger.kernel.org>; Fri, 04 Nov 2022 08:05:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=5kKj2HIKfebU1wqXRbpuIOe2X6eo5mH0qzyrObQvTos=;
        b=sjt+BRK/izOiDlqyY+3ss4dyirbPPCpyDLpqCrFgopvXlTcrlsrntZXGMBmKVScE1x
         zy9mAUXXMDlK8pltGBFbfPQOH9L4l05E4zyq/lszhpJwn9RZ/WAR2idTdveim26FEsZw
         2AkLzjPo4J/tA8+WgRQAttTnmxd37SWZ4nN5p7yHkm+KvhkP0Ki3Rv+0SsKVj3Ox11CN
         EVeM1qBpjqjQYHW9VBMjGHMg5OZWzMfn/eRcAcvPVsL6OCyeGHUdJpIwhXMsjeCHha1W
         XlC7yRI3AN3ftPcCzMp38iraa6G5YToZIEujaqv9Fw8xyAVH1+0AtX+LYORqZ773g3Yy
         FIkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=5kKj2HIKfebU1wqXRbpuIOe2X6eo5mH0qzyrObQvTos=;
        b=eAq1etehUbORLg5/0V7Je9BmCXcXBXeydSP8fovLCoM8t+8kbXki0/cYOoYsoBadyb
         /HFrkkTSIaJfdVAQPdh+kWr72DkrHKw1mGV2Ju7c8Hg2/l0lKRYu9kEGigd4wUfzJBdO
         01jiV23zQf5L9tao/vgVAFYfTrm+tWwNnuOVNFR+QKTUgojVLNjcDoPnt0Wx1lAwuVG5
         Zs6+wKhu2PiTA+ueKGopmyu6OAFo5OhdbQfwdLDf4SePwHYecuxUi15IL1aCfYpFdJBD
         /WCPCyIypQscC03kyolOUqW6axZme0l4xhfJJZ2Rn1gh6VihOkV0mayu177PreDiTsKz
         rOCg==
X-Gm-Message-State: ACrzQf3b/CloyLGiiFrnuM7mDDCV+WVRZpJYZejREQLbJ/XC5VOPc7jV
        dhPBhmKrpePD8BhxlVQiXlR4kw==
X-Google-Smtp-Source: AMsMyM5xZrX3byWS6ydTqCJhAAcQbZzJsuXLcwER9U389lqI1BK9+b+3daJ0HbJ9ZjWTEnni0viUog==
X-Received: by 2002:ac8:5849:0:b0:39a:8e35:1bfa with SMTP id h9-20020ac85849000000b0039a8e351bfamr28751605qth.573.1667574300664;
        Fri, 04 Nov 2022 08:05:00 -0700 (PDT)
Received: from ?IPV6:2601:586:5000:570:aad6:acd8:4ed9:299b? ([2601:586:5000:570:aad6:acd8:4ed9:299b])
        by smtp.gmail.com with ESMTPSA id 204-20020a3706d5000000b006eed094dcdasm3017414qkg.70.2022.11.04.08.04.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 04 Nov 2022 08:05:00 -0700 (PDT)
Message-ID: <dea44f32-e10f-0164-0175-4fe2e5d053a2@linaro.org>
Date:   Fri, 4 Nov 2022 11:04:59 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH 2/3] dt-bindings: pwm: rzg2l-gpt: Document renesas,poegs
 property
Content-Language: en-US
To:     Biju Das <biju.das.jz@bp.renesas.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     =?UTF-8?Q?Uwe_Kleine-K=c3=b6nig?= <u.kleine-koenig@pengutronix.de>,
        linux-pwm@vger.kernel.org, devicetree@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Chris Paterson <chris.paterson2@renesas.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        linux-renesas-soc@vger.kernel.org
References: <20221104145938.1782464-1-biju.das.jz@bp.renesas.com>
 <20221104145938.1782464-3-biju.das.jz@bp.renesas.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221104145938.1782464-3-biju.das.jz@bp.renesas.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On 04/11/2022 10:59, Biju Das wrote:
> RZ/G2L GPT IP supports output pin disable function by dead time
> error and detecting short-circuits between output pins.
> 
> Add documentation for the optional property renesas,poegs to
> link a pair of GPT IOs with POEG.
> 
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> ---
>  .../bindings/pwm/renesas,rzg2l-gpt.yaml       | 19 +++++++++++++++++++
>  1 file changed, 19 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/pwm/renesas,rzg2l-gpt.yaml b/Documentation/devicetree/bindings/pwm/renesas,rzg2l-gpt.yaml
> index 620d5ae4ae30..32f9deae89e5 100644
> --- a/Documentation/devicetree/bindings/pwm/renesas,rzg2l-gpt.yaml
> +++ b/Documentation/devicetree/bindings/pwm/renesas,rzg2l-gpt.yaml
> @@ -245,6 +245,24 @@ properties:
>    resets:
>      maxItems: 1
>  
> +  renesas,poegs:
> +    $ref: "/schemas/types.yaml#/definitions/phandle-array"

No need for quotes.

> +    items:

You miss here maxItems... but if you have just one item, then below
"items" should be " - items"

> +      items:
> +        - description: phandle to POEG instance that serves the output disable
> +        - description: An index identifying pair of GPT channels.
> +                       <0> - GPT channels 0 and 1
> +                       <1> - GPT channels 2 and 3
> +                       <2> - GPT channels 4 and 5
> +                       <3> - GPT channels 6 and 7
> +                       <4> - GPT channels 8 and 9
> +                       <5> - GPT channels 10 and 11
> +                       <6> - GPT channels 12 and 13
> +                       <7> - GPT channels 14 and 15

then this could bave enum or minimum/maximum. Can you try if these work?

> +    description:
> +      A list of phandle and channel index pair tuples to the POEGs that handle the
> +      output disable for the GPT channels.
> +
>  required:
>    - compatible
>    - reg
> @@ -375,4 +393,5 @@ examples:
>          power-domains = <&cpg>;
>          resets = <&cpg R9A07G044_GPT_RST_C>;
>          #pwm-cells = <2>;
> +        renesas,poegs = <&poeggd 4>;
>      };

Best regards,
Krzysztof

