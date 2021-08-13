Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5D0983EBB98
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 13 Aug 2021 19:41:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230018AbhHMRmC (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 13 Aug 2021 13:42:02 -0400
Received: from mail-ot1-f43.google.com ([209.85.210.43]:44851 "EHLO
        mail-ot1-f43.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229535AbhHMRmB (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 13 Aug 2021 13:42:01 -0400
Received: by mail-ot1-f43.google.com with SMTP id l36-20020a0568302b24b0290517526ce5e3so5470087otv.11;
        Fri, 13 Aug 2021 10:41:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=2TZBO3T2iZJIYpJHpRRrAvvAkSKkpJbnYtsKTfDDnLw=;
        b=gIpgEiVAnsYwUF/QjzDbdFIeYU4MDLvFsfj3M6CfTMqsicqKvDsLaH9eHts5DD2djB
         9tTd94hfDapFKhjIKbxljXt3pfpYmnn6THEw9QvVCZpoyS49l2zkJLqiuR4QOmuYRiFn
         sr2v+ERXI02ca58muR7S19JtOKIgdAIfX9vPrBYE90hdhqexaBOHX5QrnpUCudLLp932
         GE4w89xQIpsk13Jyc/kJtz7GrxlvsUCGTDrOG1UC8rZbCw8TcGbaaPyR28YGvMAjC+tl
         agJa3+ZK5LjuwvquqboukJh31AG81MHJ1zC4HHkVvCAOvR435bxTUm1yGwBNtWlSmONy
         9S6g==
X-Gm-Message-State: AOAM530yLRA+92kkpvKEuBGoktw3cMAONb8UXxtxj2sr1HXR0uKffWx0
        vwXBRdSdkO1ZNBLeJhh3Jg==
X-Google-Smtp-Source: ABdhPJyQYPZnag/PNTpv2iSDIyPCEJiO9zjtAUj4qTjyGVSMthOU8Fo+blAYGAm8pKk+prMXe5Mwxg==
X-Received: by 2002:a9d:19d1:: with SMTP id k75mr2984751otk.355.1628876494358;
        Fri, 13 Aug 2021 10:41:34 -0700 (PDT)
Received: from robh.at.kernel.org (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id d2sm426598otl.32.2021.08.13.10.41.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Aug 2021 10:41:33 -0700 (PDT)
Received: (nullmailer pid 3737262 invoked by uid 1000);
        Fri, 13 Aug 2021 17:41:32 -0000
Date:   Fri, 13 Aug 2021 12:41:32 -0500
From:   Rob Herring <robh@kernel.org>
To:     Biju Das <biju.das.jz@bp.renesas.com>
Cc:     Ulf Hansson <ulf.hansson@linaro.org>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        linux-mmc@vger.kernel.org, devicetree@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v3 2/2] dt-bindings: mmc: renesas,sdhi: Document RZ/G2L
 bindings
Message-ID: <YRauzGwUUceTmlyG@robh.at.kernel.org>
References: <20210804161325.26996-1-biju.das.jz@bp.renesas.com>
 <20210804161325.26996-3-biju.das.jz@bp.renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210804161325.26996-3-biju.das.jz@bp.renesas.com>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Wed, Aug 04, 2021 at 05:13:25PM +0100, Biju Das wrote:
> Document RZ/G2L SDHI controller bindings.
> 
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> Reviewed-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> ---
> v2->v3:
>  * This patch depends up on the previous patch in this series.
> v1->v2:
>  * Fixed dtbs-check issue for RZ/A{1,2} platforms.
> ---
>  .../devicetree/bindings/mmc/renesas,sdhi.yaml | 54 +++++++++++++------
>  1 file changed, 37 insertions(+), 17 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/mmc/renesas,sdhi.yaml b/Documentation/devicetree/bindings/mmc/renesas,sdhi.yaml
> index 543eeb825dc3..e195ee5c0900 100644
> --- a/Documentation/devicetree/bindings/mmc/renesas,sdhi.yaml
> +++ b/Documentation/devicetree/bindings/mmc/renesas,sdhi.yaml
> @@ -44,19 +44,20 @@ properties:
>            - const: renesas,sdhi-mmc-r8a77470 # RZ/G1C (SDHI/MMC IP)
>        - items:
>            - enum:
> -              - renesas,sdhi-r8a774a1 # RZ/G2M
> -              - renesas,sdhi-r8a774b1 # RZ/G2N
> -              - renesas,sdhi-r8a774c0 # RZ/G2E
> -              - renesas,sdhi-r8a774e1 # RZ/G2H
> -              - renesas,sdhi-r8a7795  # R-Car H3
> -              - renesas,sdhi-r8a7796  # R-Car M3-W
> -              - renesas,sdhi-r8a77961 # R-Car M3-W+
> -              - renesas,sdhi-r8a77965 # R-Car M3-N
> -              - renesas,sdhi-r8a77970 # R-Car V3M
> -              - renesas,sdhi-r8a77980 # R-Car V3H
> -              - renesas,sdhi-r8a77990 # R-Car E3
> -              - renesas,sdhi-r8a77995 # R-Car D3
> -              - renesas,sdhi-r8a779a0 # R-Car V3U
> +              - renesas,sdhi-r8a774a1  # RZ/G2M
> +              - renesas,sdhi-r8a774b1  # RZ/G2N
> +              - renesas,sdhi-r8a774c0  # RZ/G2E
> +              - renesas,sdhi-r8a774e1  # RZ/G2H
> +              - renesas,sdhi-r8a7795   # R-Car H3
> +              - renesas,sdhi-r8a7796   # R-Car M3-W
> +              - renesas,sdhi-r8a77961  # R-Car M3-W+
> +              - renesas,sdhi-r8a77965  # R-Car M3-N
> +              - renesas,sdhi-r8a77970  # R-Car V3M
> +              - renesas,sdhi-r8a77980  # R-Car V3H
> +              - renesas,sdhi-r8a77990  # R-Car E3
> +              - renesas,sdhi-r8a77995  # R-Car D3
> +              - renesas,sdhi-r8a779a0  # R-Car V3U
> +              - renesas,sdhi-r9a07g044 # RZ/G2{L,LC}
>            - const: renesas,rcar-gen3-sdhi # R-Car Gen3 or RZ/G2
>  
>    reg:
> @@ -68,13 +69,11 @@ properties:
>  
>    clocks:
>      minItems: 1
> -    maxItems: 2
> +    maxItems: 4
>  
>    clock-names:
>      minItems: 1
> -    items:
> -      - const: core
> -      - const: cd
> +    maxItems: 4

The names need to be defined.

>  
>    dmas:
>      minItems: 4
> @@ -135,6 +134,8 @@ allOf:
>                - renesas,sdhi-r7s9210
>      then:
>        properties:
> +        clocks:
> +          maxItems: 2
>          clock-names:
>            items:
>              - const: core
> @@ -146,6 +147,25 @@ allOf:
>          sectioned off to be run by a separate second clock source to allow
>          the main core clock to be turned off to save power.
>  
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            const: renesas,sdhi-r9a07g044
> +    then:
> +      properties:
> +        clocks:
> +          items:
> +            - description: IMCLK, SDHI channel main clock1.
> +            - description: IMCLK2, SDHI channel main clock2. When this clock is
> +                           turned off, external SD card detection cannot be
> +                           detected.
> +            - description: CLK_HS, SDHI channel High speed clock which operates
> +                           4 times that of SDHI channel main clock1.
> +            - description: ACLK, SDHI channel bus clock.
> +      required:
> +        - resets
> +
>  required:
>    - compatible
>    - reg
> -- 
> 2.17.1
> 
> 
