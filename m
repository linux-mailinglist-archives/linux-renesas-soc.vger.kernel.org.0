Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EDE7A5F1210
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 30 Sep 2022 21:03:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229730AbiI3TDQ (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 30 Sep 2022 15:03:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59484 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229531AbiI3TDP (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 30 Sep 2022 15:03:15 -0400
Received: from mail-oi1-f179.google.com (mail-oi1-f179.google.com [209.85.167.179])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DA0DB1C2F9A;
        Fri, 30 Sep 2022 12:03:13 -0700 (PDT)
Received: by mail-oi1-f179.google.com with SMTP id c81so5666587oif.3;
        Fri, 30 Sep 2022 12:03:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date;
        bh=0OHRs5zenWXKZ1mt9K0xoOp0gIqwP3kYjlgWnaLm514=;
        b=4L6QM8smJruOY62z3fbNooQBRPWRZO/XEk+kWdUtbD/+U+nDsW5ArbwQ1TLqp2fwjZ
         kqRXd4wPZk5uRLTwFcIftOhQQ51rvr+gPitQYfujM0j3zRrRZuqtHsZ/vYuSES4wIriY
         xYDkihSXGWXsV702Uv0HvJelD8AO5/jIUsd7+5Q52Uxq0ARbPfyfFijbpIGJIBJycH/V
         QSFT7pL/IBdYpCmlsU40O1g2Wu8IeBLNPgOf0YpGiDzZdG8/kqJkFoQg4F0IkUKnXuFm
         dLlx6gA3uV5sYxeiuHWjh4NY3ITlS2RXIJEB0idno6IzLaECfoWJ1zN1VN7n7zP6WYOg
         QxNw==
X-Gm-Message-State: ACrzQf36zSRfYTm0t7+zFifj0oIGFd+Ju94xeayhJYEBSv70OJfiMYAv
        MK1zdbrJ9f5W+TlO9w6rR1mJDMPUXg==
X-Google-Smtp-Source: AMsMyM7EfcIivELmyIQujTJYUJ+dTRBPTGhVbKHalYXz8LgLrC20OmjVDMR0DpQIwVnNYSNSp1x4FA==
X-Received: by 2002:aca:5808:0:b0:350:9790:7fe with SMTP id m8-20020aca5808000000b00350979007femr10435006oib.79.1664564593017;
        Fri, 30 Sep 2022 12:03:13 -0700 (PDT)
Received: from macbook.herring.priv (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id eq24-20020a056870a91800b0011d02a3fa63sm904746oab.14.2022.09.30.12.03.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Sep 2022 12:03:12 -0700 (PDT)
Received: (nullmailer pid 655951 invoked by uid 1000);
        Fri, 30 Sep 2022 19:03:11 -0000
Date:   Fri, 30 Sep 2022 14:03:11 -0500
From:   Rob Herring <robh@kernel.org>
To:     Biju Das <biju.das.jz@bp.renesas.com>
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Lee Jones <lee@kernel.org>, devicetree@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH RFC 2/7] dt-bindings: mfd: rzg2l-mtu3: Document RZ/G2L
 MTU3 counter
Message-ID: <20220930190311.GA651384-robh@kernel.org>
References: <20220929103043.1228235-1-biju.das.jz@bp.renesas.com>
 <20220929103043.1228235-3-biju.das.jz@bp.renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220929103043.1228235-3-biju.das.jz@bp.renesas.com>
X-Spam-Status: No, score=-1.1 required=5.0 tests=BAYES_00,
        FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,
        SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Thu, Sep 29, 2022 at 11:30:38AM +0100, Biju Das wrote:
> Document 16-bit and 32-bit phase counting mode support on
> RZ/G2L MTU3 IP.
> 
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> ---
>  * Updated commit header.
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
> +        $ref: /schemas/types.yaml#/definitions/uint32
> +        enum: [ 0, 1 ]
> +        default: 1
> +        description: |
> +          Selects the external clock pin for phase counting mode.
> +            <0> : MTCLKA and MTCLKB are selected for the external phase clock.
> +            <1> : MTCLKC and MTCLKD are selected for the external phase clock
> +                  (default)

Why do these belong in DT?


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
> +      counter@1 {
> +        compatible = "renesas,rzg2l-mtu3-counter";
> +        reg = <1>;
> +      };
>      };
>  
>  ...
> -- 
> 2.25.1
> 
> 
