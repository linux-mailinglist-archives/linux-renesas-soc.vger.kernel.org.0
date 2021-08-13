Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BD6873EBB92
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 13 Aug 2021 19:39:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230018AbhHMRkV (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 13 Aug 2021 13:40:21 -0400
Received: from mail-ot1-f53.google.com ([209.85.210.53]:33716 "EHLO
        mail-ot1-f53.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229841AbhHMRkU (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 13 Aug 2021 13:40:20 -0400
Received: by mail-ot1-f53.google.com with SMTP id 61-20020a9d0d430000b02903eabfc221a9so13015682oti.0;
        Fri, 13 Aug 2021 10:39:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=+u03hty9mA7Qza2lp8SVmmlD4ygr03fOgEqWh8ZIeRA=;
        b=GpSe1uTQR9DTxdh+ZL2L6ddwz+hOnuwsbjQWyIE+Otvx3pZGkpGFo1BGrMtMZWdsOm
         Af2lJzWQdZ8AkbHeXthBFnjJJ0WUUsYnHg81xH8Ba1eULOAgum5+pPsFs8GCyfD4UNce
         HoCTKtsm10VHIbrrI5C5y3Z1sYehHCA3rM0+S4N3YlWl5gMYclzNH6+XljdumqH6tpIO
         vevkX+DoQcSw6P0QMIKH2osxdhnV27BPfYb38af/lMg2+bsajiBPPMT5/Rky2lWWbUWc
         KQigRVc0Wh7GXEGEgqLA75hiMOjoI7ovptO2eqfdd7Avh2/9tu2X29hjiiog+l+lbZ+/
         pxvA==
X-Gm-Message-State: AOAM5302Ie2JztXV8ncxix5+7WJbR473j/CO74VqK/ln3KegyloOKkR5
        MhiBtwD8D/ajeUAxs9Vrzg==
X-Google-Smtp-Source: ABdhPJwowsIs1NjLOHD5qUWAyL+DDbQwrOQ5bLg4DWf6jzqyhWJ5lUAoV86QBfapoNRROcG+mhq0Lw==
X-Received: by 2002:a9d:5e5:: with SMTP id 92mr2952259otd.193.1628876391749;
        Fri, 13 Aug 2021 10:39:51 -0700 (PDT)
Received: from robh.at.kernel.org (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id b20sm427802otl.25.2021.08.13.10.39.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Aug 2021 10:39:51 -0700 (PDT)
Received: (nullmailer pid 3734567 invoked by uid 1000);
        Fri, 13 Aug 2021 17:39:50 -0000
Date:   Fri, 13 Aug 2021 12:39:50 -0500
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
Subject: Re: [PATCH v3 1/2] dt-bindings: mmc: renesas,sdhi: Fix dtbs-check
 warning
Message-ID: <YRauZkjqGnIi84cf@robh.at.kernel.org>
References: <20210804161325.26996-1-biju.das.jz@bp.renesas.com>
 <20210804161325.26996-2-biju.das.jz@bp.renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210804161325.26996-2-biju.das.jz@bp.renesas.com>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Wed, Aug 04, 2021 at 05:13:24PM +0100, Biju Das wrote:
> Fix dtbs-check warning pinctrl-names:0:'default' was expected
> for r8a77470-iwg23s-sbc.dts file.
> 
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> Reviewed-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> ---
> v3:
>  * New patch to fix the dtbs-check warnings
>  Ref:- https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20210804091940.23983-1-biju.das.jz@bp.renesas.com/
> ---
>  .../devicetree/bindings/mmc/renesas,sdhi.yaml | 65 ++++++++++++-------
>  1 file changed, 42 insertions(+), 23 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/mmc/renesas,sdhi.yaml b/Documentation/devicetree/bindings/mmc/renesas,sdhi.yaml
> index 677989bc5924..543eeb825dc3 100644
> --- a/Documentation/devicetree/bindings/mmc/renesas,sdhi.yaml
> +++ b/Documentation/devicetree/bindings/mmc/renesas,sdhi.yaml
> @@ -9,9 +9,6 @@ title: Renesas SDHI SD/MMC controller
>  maintainers:
>    - Wolfram Sang <wsa+renesas@sang-engineering.com>
>  
> -allOf:
> -  - $ref: "mmc-controller.yaml"
> -
>  properties:
>    compatible:
>      oneOf:
> @@ -104,14 +101,51 @@ properties:
>    pinctrl-1:
>      maxItems: 1
>  
> -  pinctrl-names:
> -    minItems: 1
> -    items:
> -      - const: default
> -      - const: state_uhs
> +  pinctrl-names: true
>  
>    max-frequency: true
>  
> +allOf:
> +  - $ref: "mmc-controller.yaml"
> +
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            const: renesas,sdhi-mmc-r8a77470
> +    then:
> +      properties:
> +        pinctrl-names:
> +          items:
> +            - const: state_uhs
> +    else:
> +      properties:
> +        pinctrl-names:
> +          minItems: 1
> +          items:
> +            - const: default
> +            - const: state_uhs
> +
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            enum:
> +              - renesas,sdhi-r7s72100
> +              - renesas,sdhi-r7s9210
> +    then:
> +      properties:
> +        clock-names:
> +          items:
> +            - const: core
> +            - const: cd

This is already defined in the main section, no need for it here.

> +      required:
> +        - clock-names
> +      description:
> +        The internal card detection logic that exists in these controllers is
> +        sectioned off to be run by a separate second clock source to allow
> +        the main core clock to be turned off to save power.
> +
>  required:
>    - compatible
>    - reg
> @@ -119,21 +153,6 @@ required:
>    - clocks
>    - power-domains
>  
> -if:
> -  properties:
> -    compatible:
> -      contains:
> -        enum:
> -          - renesas,sdhi-r7s72100
> -          - renesas,sdhi-r7s9210
> -then:
> -  required:
> -    - clock-names
> -  description:
> -    The internal card detection logic that exists in these controllers is
> -    sectioned off to be run by a separate second clock source to allow
> -    the main core clock to be turned off to save power.
> -
>  unevaluatedProperties: false
>  
>  examples:
> -- 
> 2.17.1
> 
> 
