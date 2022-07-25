Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 46B115807E0
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 26 Jul 2022 00:59:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231181AbiGYW7r (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 25 Jul 2022 18:59:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35126 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229764AbiGYW7q (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 25 Jul 2022 18:59:46 -0400
Received: from mail-oi1-f175.google.com (mail-oi1-f175.google.com [209.85.167.175])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4EECD1F2D5;
        Mon, 25 Jul 2022 15:59:45 -0700 (PDT)
Received: by mail-oi1-f175.google.com with SMTP id p132so15228774oif.9;
        Mon, 25 Jul 2022 15:59:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=eQye6nMifcFI6l5sNG6/+UqjksBPtUeGdHzPhsRcWME=;
        b=KQjiSYug/vGHtHb90Wk8o7L0infEhpx97AvYLGGdP630WDA0576cEttz7wyLXMk5zI
         Aa6kD3G/TGzJhHjwxEpQqzCyeREyWQJoCyQaeXh/Egsr54g0b+F7nht42W9bc/r7km7h
         nM+UI8n/vpueZwp30YU90oAIek79vQuPeUb2UlNYkAFvH4VXqkX7CfEbEBN7ehqRNF/b
         qMHd9tHzgNDrJaeQizLdXV5ejQ6K7MuGgztRV6hpyUNNVoGAhm3iS/UILX8EiuVEgN5z
         81YWMmZnm4nadC3ppERt9lDc5f4bKt2iO8g9XU9M5XpxNdrDJRkuBHIH7jjnkZbwi4aa
         Jf6w==
X-Gm-Message-State: AJIora/u5IAebJiRU2EHdQOAY9/5rzqunPRy5riqxwWAbxYF7n6q5Cvg
        HVbe5MiKW/3tWtqAWYrG6A==
X-Google-Smtp-Source: AGRyM1sOcviGyD2gIuK2p0c+uQ6+5qTpFqgE2Yzw8FlCovXBIQLSsdbF7CuA/OUYyKT2cui56djPUw==
X-Received: by 2002:a05:6808:170b:b0:335:1807:e4a2 with SMTP id bc11-20020a056808170b00b003351807e4a2mr6346991oib.89.1658789984465;
        Mon, 25 Jul 2022 15:59:44 -0700 (PDT)
Received: from robh.at.kernel.org ([64.188.179.248])
        by smtp.gmail.com with ESMTPSA id r20-20020a05687080d400b0010d677cb630sm6791935oab.6.2022.07.25.15.59.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Jul 2022 15:59:44 -0700 (PDT)
Received: (nullmailer pid 2909288 invoked by uid 1000);
        Mon, 25 Jul 2022 22:59:42 -0000
Date:   Mon, 25 Jul 2022 16:59:42 -0600
From:   Rob Herring <robh@kernel.org>
To:     Phil Edworthy <phil.edworthy@renesas.com>
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        linux-usb@vger.kernel.org, devicetree@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        linux-renesas-soc@vger.kernel.org,
        Biju Das <biju.das.jz@bp.renesas.com>
Subject: Re: [PATCH v2 1/2] dt-bindings: usb: renesas, usb3-peri: Document
 RZ/V2M r9a09g011 support
Message-ID: <20220725225942.GA2905299-robh@kernel.org>
References: <20220722123107.34122-1-phil.edworthy@renesas.com>
 <20220722123107.34122-2-phil.edworthy@renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220722123107.34122-2-phil.edworthy@renesas.com>
X-Spam-Status: No, score=-1.2 required=5.0 tests=BAYES_00,
        FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,
        SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Fri, Jul 22, 2022 at 01:31:06PM +0100, Phil Edworthy wrote:
> Document the RZ/V2M SoC bindings.
> The RZ/V2M SoC is a little different to the R-Car implementations.
> A few DRD related registers and bits have moved, there is a separate
> interrupt for DRD, an additional clock for register access and reset
> lines for DRD and USBP.
> 
> Signed-off-by: Phil Edworthy <phil.edworthy@renesas.com>
> Reviewed-by: Biju Das <biju.das.jz@bp.renesas.com>
> ---
> v2:
>  - SoCs other than rz/v2m must limit the number of clock/interrupt names
>  - Add "Battery Charging" and "Global Purpose Input" interrupts
> ---
>  .../bindings/usb/renesas,usb3-peri.yaml       | 91 ++++++++++++++++---
>  1 file changed, 76 insertions(+), 15 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/usb/renesas,usb3-peri.yaml b/Documentation/devicetree/bindings/usb/renesas,usb3-peri.yaml
> index 9fcf54b10b07..b1a3b32139c5 100644
> --- a/Documentation/devicetree/bindings/usb/renesas,usb3-peri.yaml
> +++ b/Documentation/devicetree/bindings/usb/renesas,usb3-peri.yaml
> @@ -11,27 +11,55 @@ maintainers:
>  
>  properties:
>    compatible:
> -    items:
> -      - enum:
> -          - renesas,r8a774a1-usb3-peri # RZ/G2M
> -          - renesas,r8a774b1-usb3-peri # RZ/G2N
> -          - renesas,r8a774c0-usb3-peri # RZ/G2E
> -          - renesas,r8a774e1-usb3-peri # RZ/G2H
> -          - renesas,r8a7795-usb3-peri  # R-Car H3
> -          - renesas,r8a7796-usb3-peri  # R-Car M3-W
> -          - renesas,r8a77961-usb3-peri # R-Car M3-W+
> -          - renesas,r8a77965-usb3-peri # R-Car M3-N
> -          - renesas,r8a77990-usb3-peri # R-Car E3
> -      - const: renesas,rcar-gen3-usb3-peri
> +    oneOf:
> +      - items:
> +          - enum:
> +              - renesas,r8a774a1-usb3-peri # RZ/G2M
> +              - renesas,r8a774b1-usb3-peri # RZ/G2N
> +              - renesas,r8a774c0-usb3-peri # RZ/G2E
> +              - renesas,r8a774e1-usb3-peri # RZ/G2H
> +              - renesas,r8a7795-usb3-peri  # R-Car H3
> +              - renesas,r8a7796-usb3-peri  # R-Car M3-W
> +              - renesas,r8a77961-usb3-peri # R-Car M3-W+
> +              - renesas,r8a77965-usb3-peri # R-Car M3-N
> +              - renesas,r8a77990-usb3-peri # R-Car E3
> +          - const: renesas,rcar-gen3-usb3-peri
> +
> +      - items:
> +          - enum:
> +              - renesas,r9a09g011-usb3-peri # RZ/V2M
> +          - const: renesas,rzv2m-usb3-peri
>  
>    reg:
>      maxItems: 1
>  
>    interrupts:
> -    maxItems: 1
> +    minItems: 1
> +    items:
> +      - description: Combined interrupt for DMA, SYS and ERR
> +      - description: Dual Role Device (DRD)
> +      - description: Battery Charging
> +      - description: Global Purpose Input
> +
> +  interrupt-names:
> +    minItems: 1
> +    items:
> +      - const: all_p
> +      - const: drd
> +      - const: bc
> +      - const: gpi
>  
>    clocks:
> -    maxItems: 1
> +    minItems: 1
> +    items:
> +      - description: Main clock
> +      - description: Register access clock
> +
> +  clock-names:
> +    minItems: 1
> +    items:
> +      - const: aclk
> +      - const: reg
>  
>    phys:
>      maxItems: 1
> @@ -43,7 +71,15 @@ properties:
>      maxItems: 1
>  
>    resets:
> -    maxItems: 1
> +    minItems: 1
> +    items:
> +      - description: Peripheral reset
> +      - description: DRD reset
> +
> +  reset-names:
> +    items:
> +      - const: aresetn_p
> +      - const: drd_reset
>  
>    usb-role-switch:
>      $ref: /schemas/types.yaml#/definitions/flag
> @@ -78,6 +114,31 @@ required:
>    - interrupts
>    - clocks
>  
> +allOf:
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            enum:
> +              - renesas,rzv2m-usb3-peri
> +    then:
> +      properties:
> +        clocks:
> +          minItems: 2
> +        clock-names:
> +          minItems: 2
> +        interrupts:
> +          minItems: 4
> +        interrupt-names:
> +          minItems: 4
> +        resets:
> +          minItems: 2
> +      required:
> +        - clock-names
> +        - interrupt-names
> +        - resets
> +        - reset-names
> +

Needs an 'else' clause with 'maxItems: 1' on various properties to keep 
the existing constraints.

Rob
