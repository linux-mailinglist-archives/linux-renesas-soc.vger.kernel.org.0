Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7081C36E9D1
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 29 Apr 2021 13:50:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231168AbhD2Lvn (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 29 Apr 2021 07:51:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33440 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230148AbhD2Lvn (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 29 Apr 2021 07:51:43 -0400
Received: from mail-lj1-x22d.google.com (mail-lj1-x22d.google.com [IPv6:2a00:1450:4864:20::22d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9CE71C06138B
        for <linux-renesas-soc@vger.kernel.org>; Thu, 29 Apr 2021 04:50:55 -0700 (PDT)
Received: by mail-lj1-x22d.google.com with SMTP id u20so76088628lja.13
        for <linux-renesas-soc@vger.kernel.org>; Thu, 29 Apr 2021 04:50:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ragnatech-se.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=QbV9mTyD42bo/dpHFpHqakNWNtWCQvi60EoTsZsbGw8=;
        b=DXKumTyyvzPO2HCQACI3zeye0dmAMdnOz6A8wDV/d97DFlUaNzSdQADTx7AEjMInLp
         2+gNJTCZoyuRZ4h0cOpjjm2A/5TxLZFeVu8Gw//CS84D9WX/FZvQ+fe/ypmLdum7I64a
         hhp83NNbshVvpFXC7ev6l6kDUP5TmotmQ/79/n+svQtYLkGrWR0oJLHg1nOs6kG1XhEv
         gegr9V5HfZNZ6BboGiB7YZTpH2UiytbgVQs0ghDPF5vAR17IvAgGKEr/k8UrSKue4xJQ
         nWK1OoOR79RagUZgXDa1smewOdoduYZ+PiAc1JGNhU23vaHnRPXVbDPn+54kDfatkmhu
         l1eA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=QbV9mTyD42bo/dpHFpHqakNWNtWCQvi60EoTsZsbGw8=;
        b=qKFtSHTJT3rtOYVl4+OBisbo8GZvdPwS4SVCl/fEeSauSI3skh1Zt6djM8HpXM3znf
         Tt2Q86dxd6/E70iUbG9ntlaPsDUm7ZA+Ppr7CbBZtOl3Sr5oliuYYCQip7H1/C3xWyO9
         rFpumLKvVAEIrh5ZqT9OGpRPaubUiORU+v6kQX2BzkOy704uFHp3/jVKgb/FsPSl5bgy
         OGUWM8dRpFca9rxMuWm/hii7zlK200F+vKPtZvgD2pOoMyRyz6t31jviZA15UQC/CPw6
         SJX9raDvNXWhlcRmIEJAu1tjYCBZaz4PCnofnETEgP6nBZLL4vjwDpD2XM2Kj12BzGkr
         o9pw==
X-Gm-Message-State: AOAM530tvAcgX5IUAwldSc87/MwOKAB4ScvT6UyvY36dTJWk1efzSZqj
        ZRH5klyfFArIgaALnVgBSrApbiK9FNBpsi2W
X-Google-Smtp-Source: ABdhPJzex67EitQ3DNthRoRNTn4wWExMlFz4wuNhZfD8CHIJvFrmF6nX8y336Obt/uQGhkgvZ7sL4w==
X-Received: by 2002:a2e:9785:: with SMTP id y5mr23807368lji.56.1619697053961;
        Thu, 29 Apr 2021 04:50:53 -0700 (PDT)
Received: from localhost (h-209-203.A463.priv.bahnhof.se. [155.4.209.203])
        by smtp.gmail.com with ESMTPSA id c11sm491650lfb.134.2021.04.29.04.50.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Apr 2021 04:50:53 -0700 (PDT)
Date:   Thu, 29 Apr 2021 13:50:53 +0200
From:   Niklas =?iso-8859-1?Q?S=F6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     Wolfram Sang <wsa+renesas@sang-engineering.com>,
        linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH renesas-drivers] dt-bindings: misc: Fix logic analyzer
 bindings
Message-ID: <YIqdnZ1XqCaVR0HS@oden.dyn.berto.se>
References: <8194aceb415e0585c0224bca0f5cbf3447105e99.1619688572.git.geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <8194aceb415e0585c0224bca0f5cbf3447105e99.1619688572.git.geert+renesas@glider.be>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Geert,

Thanks for your work.

On 2021-04-29 11:30:37 +0200, Geert Uytterhoeven wrote:
> When running "make dt_binding_check":
> 
>     Documentation/devicetree/bindings/misc/gpio-logic-analyzer.yaml: properties:required: ['compatible', 'probe-gpios'] is not of type 'object', 'boolean'
>     Documentation/devicetree/bindings/misc/gpio-logic-analyzer.yaml: properties: {'enum': ['$ref', 'additionalItems', 'additionalProperties', 'allOf', 'anyOf', 'const', 'contains', 'default', 'dependencies', 'deprecated', 'description', 'else', 'enum', 'if', 'items', 'maxItems', 'maximum', 'minItems', 'minimum', 'multipleOf', 'not', 'oneOf', 'pattern', 'patternProperties', 'properties', 'propertyNames', 'required', 'then', 'unevaluatedProperties']} is not allowed for 'required'
>       SCHEMA  Documentation/devicetree/bindings/processed-schema-examples.json
>     Documentation/devicetree/bindings/misc/gpio-logic-analyzer.yaml: ignoring, error in schema: properties: required
>     warning: no schema found in file: Documentation/devicetree/bindings/misc/gpio-logic-analyzer.yaml
> 
> and:
> 
>     Error: Documentation/devicetree/bindings/misc/gpio-logic-analyzer.example.dts:22.42-43 syntax error
>     FATAL ERROR: Unable to parse input tree
> 
> Fix this by correcting the indentation of the "required" block, and
> adding the missing include.
> 
> Fixes: 1c8e77fc12417023 ("misc: add simple logic analyzer using polling")
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Reviewed-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>

> ---
>  .../devicetree/bindings/misc/gpio-logic-analyzer.yaml      | 7 ++++---
>  1 file changed, 4 insertions(+), 3 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/misc/gpio-logic-analyzer.yaml b/Documentation/devicetree/bindings/misc/gpio-logic-analyzer.yaml
> index e664cec85a72facd..5516f95b72d53ff1 100644
> --- a/Documentation/devicetree/bindings/misc/gpio-logic-analyzer.yaml
> +++ b/Documentation/devicetree/bindings/misc/gpio-logic-analyzer.yaml
> @@ -22,14 +22,15 @@ properties:
>      description:
>        names used to distinguish the probes
>  
> -  required:
> -    - compatible
> -    - probe-gpios
> +required:
> +  - compatible
> +  - probe-gpios
>  
>  additionalProperties: false
>  
>  examples:
>    - |
> +    #include <dt-bindings/gpio/gpio.h>
>      i2c-analyzer {
>              compatible = "gpio-logic-analyzer";
>  
> -- 
> 2.25.1
> 

-- 
Regards,
Niklas Söderlund
