Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 06EBC618DC3
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  4 Nov 2022 02:48:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230083AbiKDBsO (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 3 Nov 2022 21:48:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42954 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230047AbiKDBsN (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 3 Nov 2022 21:48:13 -0400
Received: from mail-qt1-x834.google.com (mail-qt1-x834.google.com [IPv6:2607:f8b0:4864:20::834])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BA8C023E9D
        for <linux-renesas-soc@vger.kernel.org>; Thu,  3 Nov 2022 18:48:12 -0700 (PDT)
Received: by mail-qt1-x834.google.com with SMTP id h21so2364185qtu.2
        for <linux-renesas-soc@vger.kernel.org>; Thu, 03 Nov 2022 18:48:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=pEswnYQHpO+Tmr3+kD8Xe7eiAlA8KITu0hUw/9KESMM=;
        b=U3oy+2Hvxdfe4VFd1klhGm9i63rhZGfklzBvM6XcVdk2Siv777zCUaioeiwO5EQuQq
         /28bYQBpydYX+7jgZIkW+5RpNYmMOaJPOnrp26wgpdl8F4i4WQxJhv0cazG9OLTjHflX
         sN7wDazIoxgHuIBRq8yKupOUnWm2IU6qRS4uHS+CqXwaphKZmTiJBSdVWFx+Bckjc8ES
         ENHv9DLk+HaU9F9byIRHG2wlJ/1YqGg2TY/HIAWXbFVwpi+GqszejUyzn66AfpUh+JB6
         Zsf+qLohii0xUZTxqfiyRGAKegMVtp6E+SD8poT2b8XR0ncvLLlh4eHo4ouSXIftfxcD
         LzQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=pEswnYQHpO+Tmr3+kD8Xe7eiAlA8KITu0hUw/9KESMM=;
        b=jRb9a2fSmc7IVfJfU2aCfyb5AdG2Q4nfWro2UINVlUii69Y938NARUce2xd9YKvtNt
         Fjd6rCby0IGECIFdI5n5vToiwGg8VrpyIwHY8nkBV794kp9+Vq3z3s3XeTqa5Od8VkLd
         lCBLoIEZV67IXhwcAghWi8iTkQei+ZxAr2E+ar9frWJUSorEgeTfqH/nBxTnZUvv28OS
         mpcURUDE1h31vf0iY75yugWN/kKaXruyQwSVMMRdNaeSHSpZYUG/5ot87EuPyWbUjZ41
         75oUnM67GVI/uExBZLRE2fWCWmGMvNAFEW7GNshvsKis8WrUID7ffZWp77fpThPsbcop
         wx3Q==
X-Gm-Message-State: ACrzQf1Xk2n6WVfYu58zaYQC47F0W1BxFpIXbONam59HaJqfT7OU4tcT
        eqH5YsxtpUa1Cm6DUT21TTflJA==
X-Google-Smtp-Source: AMsMyM6CWaZw0pdfeUjIV3azV2uEBg+2ulJVuWvR4FNE9GqCv/dyZTm79/bCo+Hz+C8p9EsJJXLC3A==
X-Received: by 2002:ac8:728b:0:b0:3a4:fb34:7dbc with SMTP id v11-20020ac8728b000000b003a4fb347dbcmr214797qto.544.1667526491897;
        Thu, 03 Nov 2022 18:48:11 -0700 (PDT)
Received: from ?IPV6:2601:586:5000:570:da2a:9e7e:ddb5:dfa1? ([2601:586:5000:570:da2a:9e7e:ddb5:dfa1])
        by smtp.gmail.com with ESMTPSA id x17-20020a05620a449100b006fa31bf2f3dsm1973043qkp.47.2022.11.03.18.48.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 03 Nov 2022 18:48:11 -0700 (PDT)
Message-ID: <7fcd798a-9cce-9453-1657-7be1abf3b97e@linaro.org>
Date:   Thu, 3 Nov 2022 21:48:10 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.1
Subject: Re: [PATCH 2/3] dt-bindings: i2c: renesas,rzv2m: Fix SoC specific
 string
Content-Language: en-US
To:     Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     Magnus Damm <magnus.damm@gmail.com>,
        Biju Das <biju.das.jz@bp.renesas.com>,
        Wolfram Sang <wsa@kernel.org>, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Jacopo Mondi <jacopo@jmondi.org>
References: <20221103230648.53748-1-fabrizio.castro.jz@renesas.com>
 <20221103230648.53748-3-fabrizio.castro.jz@renesas.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221103230648.53748-3-fabrizio.castro.jz@renesas.com>
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

On 03/11/2022 19:06, Fabrizio Castro wrote:
> s/renesas,i2c-r9a09g011/renesas,r9a09g011-i2c/g for consistency.
> 
> renesas,i2c-r9a09g011 is not actually used by the driver, therefore
> changing this doesn't cause any harm.

And what about other users of DTS? One chosen driver implementation
might not be enough...

> 
> Fixes: ba7a4d15e2c4 ("dt-bindings: i2c: Document RZ/V2M I2C controller")

You need to explain the bug - where is the issue, how it affects users.
Otherwise it is not a bug and there is nothing to fix.


> Signed-off-by: Fabrizio Castro <fabrizio.castro.jz@renesas.com>
> ---
>  Documentation/devicetree/bindings/i2c/renesas,rzv2m.yaml | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/i2c/renesas,rzv2m.yaml b/Documentation/devicetree/bindings/i2c/renesas,rzv2m.yaml
> index c46378efc123..92e899905ef8 100644
> --- a/Documentation/devicetree/bindings/i2c/renesas,rzv2m.yaml
> +++ b/Documentation/devicetree/bindings/i2c/renesas,rzv2m.yaml
> @@ -16,7 +16,7 @@ properties:
>    compatible:
>      items:
>        - enum:
> -          - renesas,i2c-r9a09g011  # RZ/V2M
> +          - renesas,r9a09g011-i2c  # RZ/V2M

No.

Deprecate instead old compatible. There are already users of it, at
least in kernel. Not sure about other OS/bootloaders/firmwares.

Best regards,
Krzysztof

