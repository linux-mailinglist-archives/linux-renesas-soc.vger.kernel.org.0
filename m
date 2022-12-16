Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EC0B164EEAE
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 16 Dec 2022 17:12:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232062AbiLPQM3 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 16 Dec 2022 11:12:29 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47732 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232664AbiLPQMD (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 16 Dec 2022 11:12:03 -0500
Received: from mail-ot1-f54.google.com (mail-ot1-f54.google.com [209.85.210.54])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 97D81419A9;
        Fri, 16 Dec 2022 08:10:52 -0800 (PST)
Received: by mail-ot1-f54.google.com with SMTP id p24-20020a0568301d5800b0066e6dc09be5so1618046oth.8;
        Fri, 16 Dec 2022 08:10:52 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LKmglVVorDgKarJabc50doLGeuJcZROKiOk2euhvNdk=;
        b=edBlcXc0UD61n9NlK3v0q3r3NKrT1GiwYIaRlX5THs8UpPLMQ/zX8xeSvvhRbNHU7b
         7FUMs25oYwm9EgP5EApIcN9g8tUGBE5QtFKDjjE3TUykozBQWwqI0VP/Yb4yTpVrwf5a
         a3Jau9IohJUNwAfMdjiSWVG9QlrEoC1Hkkkyc54Fg+ElTeWLbG9na2yjADGBWh15+TUr
         0Oix0YkAGQ1J06foRv3TsTMWdQ0l0vifFrc3bbhGt1LRyVjx7EiI+H+5KW9uz+sc/Vs8
         K2L9tD56tS7ywrRekLfEwwzsSKDEDS6o07OAjjvNM5IYtqcW4GGodnrmScbQvv1IAXld
         bC0A==
X-Gm-Message-State: ANoB5pkNZyd6O4CCr3o77xvtpk+mZvlXxiI6NK+2FtB6HiYQudegIEMJ
        ldf0gOw3quHe+WyKgJJ3tUzLenRhaA==
X-Google-Smtp-Source: AA0mqf5MAX9lrOy4Jxdxs2B98BYEOfxrXT0g31t0VHrSQd5I4QSouS6f3e4t9NRxQBVUVnp1WWzn3Q==
X-Received: by 2002:a05:6830:3809:b0:66e:7670:e684 with SMTP id bh9-20020a056830380900b0066e7670e684mr20093740otb.20.1671207052054;
        Fri, 16 Dec 2022 08:10:52 -0800 (PST)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id j7-20020a9d7387000000b0066c3ca7b12csm969797otk.61.2022.12.16.08.10.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Dec 2022 08:10:51 -0800 (PST)
Received: (nullmailer pid 2838833 invoked by uid 1000);
        Fri, 16 Dec 2022 16:10:51 -0000
Date:   Fri, 16 Dec 2022 10:10:51 -0600
From:   Rob Herring <robh@kernel.org>
To:     Biju Das <biju.das.jz@bp.renesas.com>
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        linux-usb@vger.kernel.org, devicetree@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
        linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH 04/16] dt-bindings: usb: renesas,usb-xhci: Document
 RZ/V2M support
Message-ID: <20221216161051.GA2837295-robh@kernel.org>
References: <20221212172804.1277751-1-biju.das.jz@bp.renesas.com>
 <20221212172804.1277751-5-biju.das.jz@bp.renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221212172804.1277751-5-biju.das.jz@bp.renesas.com>
X-Spam-Status: No, score=-1.4 required=5.0 tests=BAYES_00,
        FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H3,
        RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Mon, Dec 12, 2022 at 05:27:52PM +0000, Biju Das wrote:
> Document the RZ/V2M SoC bindings.
> The RZ/V2M SoC is a little different to the R-Car implementations.
> You can access the registers associated with the currently set DRD mode,
> therefore as part of init, we have to set the DRD mode to host.
> 
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> ---
>  .../bindings/usb/renesas,usb-xhci.yaml        | 41 +++++++++++++++++--
>  1 file changed, 37 insertions(+), 4 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/usb/renesas,usb-xhci.yaml b/Documentation/devicetree/bindings/usb/renesas,usb-xhci.yaml
> index 4c5efaf02308..ae678d249785 100644
> --- a/Documentation/devicetree/bindings/usb/renesas,usb-xhci.yaml
> +++ b/Documentation/devicetree/bindings/usb/renesas,usb-xhci.yaml
> @@ -10,9 +10,6 @@ maintainers:
>    - Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>    - Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
>  
> -allOf:
> -  - $ref: "usb-xhci.yaml"
> -
>  properties:
>    compatible:
>      oneOf:
> @@ -37,6 +34,11 @@ properties:
>                - renesas,xhci-r8a77965 # R-Car M3-N
>                - renesas,xhci-r8a77990 # R-Car E3
>            - const: renesas,rcar-gen3-xhci # R-Car Gen3 and RZ/G2
> +      - items:
> +          - enum:
> +              - renesas,r9a09g011-xhci # RZ/V2M
> +              - renesas,r9a09g055-xhci # RZ/V2MA
> +          - const: renesas,rzv2m-xhci  # RZ/{V2M, V2MA}
>  
>    reg:
>      maxItems: 1
> @@ -45,7 +47,16 @@ properties:
>      maxItems: 1
>  
>    clocks:
> -    maxItems: 1
> +    minItems: 1
> +    items:
> +      - description: Main clock for host
> +      - description: Register access clock
> +
> +  clock-names:
> +    minItems: 1
> +    items:
> +      - const: host_axi

Drop 'host_'

> +      - const: reg
>  
>    phys:
>      maxItems: 1
> @@ -68,6 +79,28 @@ required:
>    - power-domains
>    - resets
>  
> +allOf:
> +  - $ref: "usb-xhci.yaml"

Drop quotes since you are touching this.

With that,

Reviewed-by: Rob Herring <robh@kernel.org>

> +
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            enum:
> +              - renesas,rzv2m-xhci
> +    then:
> +      properties:
> +        clocks:
> +          minItems: 2
> +        clock-names:
> +          minItems: 2
> +      required:
> +        - clock-names
> +    else:
> +      properties:
> +        clocks:
> +          maxItems: 1
> +
>  unevaluatedProperties: false
>  
>  examples:
> -- 
> 2.25.1
> 
> 
