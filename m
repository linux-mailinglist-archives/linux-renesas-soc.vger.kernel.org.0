Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 58103547CBA
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 13 Jun 2022 00:20:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237087AbiFLWTw (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Sun, 12 Jun 2022 18:19:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38050 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237543AbiFLWSF (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sun, 12 Jun 2022 18:18:05 -0400
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com [IPv6:2a00:1450:4864:20::131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4E666522E0
        for <linux-renesas-soc@vger.kernel.org>; Sun, 12 Jun 2022 15:18:04 -0700 (PDT)
Received: by mail-lf1-x131.google.com with SMTP id y32so6209177lfa.6
        for <linux-renesas-soc@vger.kernel.org>; Sun, 12 Jun 2022 15:18:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ragnatech-se.20210112.gappssmtp.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=46m/yFN12v+/tGyvfx5NjV+uIzdQJx26Q/K1pY/PCVM=;
        b=DEQdHA++K5bzRgkn4QEjF3mEYmZqg3ywfL5osb/u10O4idon923aJWZMo9ynh7YPv7
         KBIcqoBVVRH/jseH0hSktXjDY1qY4h/H21tzc6/ijcrOqdNcpWeUZ03HP/CuCT5RyfXh
         rNPZj3uGM7tmHVWLJUoSijuBTXf62bHZNV62OB/lnY85Ukv6zdein3OeWEQO8I8weJkD
         hoFA4+Kj4YiVz9Cm5OhIAq4Ba49XaBCFiQty/cJTwh0GMFuEGg/EQVIk0QGR5EqMESXk
         O+PM+WB2rhr89x6B2sEZQV1O7hPUIVflHdArjGQy6V+CtsS842NxhKzv1DnM4/cKe4IH
         Bzng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=46m/yFN12v+/tGyvfx5NjV+uIzdQJx26Q/K1pY/PCVM=;
        b=7IvWJg9Z2MOYn5e9qmLpDUAatpJp6sWzUG1yoiy0fHi5aFtgKLetSn/dTk3J8m6sdW
         bATQgzV5OaXqhOAE8NI3HE3Q7i6Mmj5YKEHjKmWb15zCy3zWpCmlXwfOZ2izVc8YSTT9
         sWomDZNq+7RPf37L9vHl1hxiguodDJRy3poojK3umD/Ga+jEMF5vQXQx1UkbyAyA0Bbs
         aXNVNG18fOIPDQ/XBFIwaqwGdXr7PCTJd12ypDC2CEKlmYJDLGq2L005ZR9JxGidqxF7
         RW//CnD1iWdNynxtR/reve0hcbKdv7W875bTrgecHtpPpe5+f6Z6ECP4fAK2GdG7ao9F
         hQ6w==
X-Gm-Message-State: AOAM5332gm7qqIABCoC1jvafFRZ62O1BjOTJXhFetBrt1MCWqcnJpdVb
        XrVH2chq6Avb48Vw7gvwb/xLSw==
X-Google-Smtp-Source: ABdhPJzAEw8r+JXbUKN67FMRFiH/GJxkilOLXNvrrVydt2lmDCHxGH4yRZ0rjxLpI5VWEAwrFvmYLg==
X-Received: by 2002:a05:6512:1324:b0:478:e688:f1e2 with SMTP id x36-20020a056512132400b00478e688f1e2mr34237075lfu.12.1655072282384;
        Sun, 12 Jun 2022 15:18:02 -0700 (PDT)
Received: from localhost (h-85-24-188-65.A463.priv.bahnhof.se. [85.24.188.65])
        by smtp.gmail.com with ESMTPSA id b23-20020a196717000000b0047255d21142sm742305lfc.113.2022.06.12.15.18.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Jun 2022 15:18:02 -0700 (PDT)
Date:   Mon, 13 Jun 2022 00:18:01 +0200
From:   Niklas =?iso-8859-1?Q?S=F6derlund?= 
        <niklas.soderlund@ragnatech.se>
To:     Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc:     linux-renesas-soc@vger.kernel.org,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        Amit Kucheria <amitk@kernel.org>,
        Zhang Rui <rui.zhang@intel.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-pm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 2/2] dt-bindings: thermal: rcar-gen3-thermal: Add
 r8a779f0 support
Message-ID: <YqZmGQuEEks8Yl/N@oden.dyn.berto.se>
References: <20220610201701.7946-1-wsa+renesas@sang-engineering.com>
 <20220610201701.7946-2-wsa+renesas@sang-engineering.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220610201701.7946-2-wsa+renesas@sang-engineering.com>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Wolfram,

Thanks for your work.

On 2022-06-10 22:17:01 +0200, Wolfram Sang wrote:
> Add support for R-Car S4. The S4 IP differs a bit from its siblings in
> such way that it has 3 out of 4 TSC nodes for Linux and the interrupts
> are not routed to the INTC-AP but to the ECM.
> 
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Reviewed-by: Niklas S�derlund <niklas.soderlund+renesas@ragnatech.se>

> ---
> 
> Change since V2:
> * make interrupts not required for this SoC
> 
> Tested with:
> make dtbs_check DT_SCHEMA_FILES=thermal/rcar-gen3-thermal.yaml
> 
>  .../bindings/thermal/rcar-gen3-thermal.yaml   | 19 ++++++++++++++-----
>  1 file changed, 14 insertions(+), 5 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/thermal/rcar-gen3-thermal.yaml b/Documentation/devicetree/bindings/thermal/rcar-gen3-thermal.yaml
> index 72dc7eb27f8d..0f05f5c886c5 100644
> --- a/Documentation/devicetree/bindings/thermal/rcar-gen3-thermal.yaml
> +++ b/Documentation/devicetree/bindings/thermal/rcar-gen3-thermal.yaml
> @@ -8,9 +8,9 @@ $schema: http://devicetree.org/meta-schemas/core.yaml#
>  title: Renesas R-Car Gen3 Thermal Sensor
>  
>  description:
> -  On R-Car Gen3 SoCs, the thermal sensor controllers (TSC) control the thermal
> -  sensors (THS) which are the analog circuits for measuring temperature (Tj)
> -  inside the LSI.
> +  On most R-Car Gen3 and later SoCs, the thermal sensor controllers (TSC)
> +  control the thermal sensors (THS) which are the analog circuits for
> +  measuring temperature (Tj) inside the LSI.
>  
>  maintainers:
>    - Niklas S�derlund <niklas.soderlund@ragnatech.se>
> @@ -27,6 +27,7 @@ properties:
>        - renesas,r8a77965-thermal # R-Car M3-N
>        - renesas,r8a77980-thermal # R-Car V3H
>        - renesas,r8a779a0-thermal # R-Car V3U
> +      - renesas,r8a779f0-thermal # R-Car S4-8
>  
>    reg: true
>  
> @@ -79,8 +80,16 @@ else:
>          - description: TSC1 registers
>          - description: TSC2 registers
>          - description: TSC3 registers
> -  required:
> -    - interrupts
> +  if:
> +    not:
> +      properties:
> +        compatible:
> +          contains:
> +            enum:
> +              - renesas,r8a779f0-thermal
> +  then:
> +    required:
> +      - interrupts
>  
>  additionalProperties: false
>  
> -- 
> 2.35.1
> 

-- 
Kind Regards,
Niklas S�derlund
