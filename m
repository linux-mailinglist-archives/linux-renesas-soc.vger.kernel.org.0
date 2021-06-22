Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 47A4B3B0DA8
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 22 Jun 2021 21:31:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232651AbhFVTeN (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 22 Jun 2021 15:34:13 -0400
Received: from mail-io1-f49.google.com ([209.85.166.49]:33646 "EHLO
        mail-io1-f49.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232648AbhFVTeN (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 22 Jun 2021 15:34:13 -0400
Received: by mail-io1-f49.google.com with SMTP id a6so547802ioe.0;
        Tue, 22 Jun 2021 12:31:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=QZgxJXgn5Y2DpkFBSaFi4k8dTU93PFVQJE6zmHFjau4=;
        b=PaZUiMTu42taEDdG7dsGXa/fSA5dFR0MOFaK+ktssKx5ULky2HTT0a+dlH/mDi0wtQ
         OYVlCZKD67wp1hIIvUVWXC6UrI+pr+wXUTwWEEjQJbkZzMwzFIX5D4qt+OXRb6qkJpX8
         6zWHaIV+AyB2Txp19hL4jip2ir7cpj2sHOkpXOSbkYiLGNiJCECge99btnLjDh8bwFSf
         2sszyWbq4PavsZuIM+9ie858wKBp0hjD+A1dgOCLieTm76tOmzUoAvMQSqJhV6lRFDtD
         pJl5dARfF79iPxltt06jHP7U9CBoO8ax6tJWa+tW5nsw+DTrzThBC24Ll0SUnxWwVvdt
         4Nmg==
X-Gm-Message-State: AOAM533DnsvWMrWFftWXRV/mxaMA3+9nABcbtapvou9AqLLD2bT1+szf
        hn2dNUYGKGTrYwKyL+6toA==
X-Google-Smtp-Source: ABdhPJw6SiWA/jf03g0gNK+w7BBYikDFw0aI1RlLfrbrts4k6V8/L9ffrEMFEuwJNYm6nFZHSXg3mg==
X-Received: by 2002:a05:6602:334e:: with SMTP id c14mr4171425ioz.78.1624390246807;
        Tue, 22 Jun 2021 12:30:46 -0700 (PDT)
Received: from robh.at.kernel.org ([64.188.179.248])
        by smtp.gmail.com with ESMTPSA id j12sm8382090ilk.26.2021.06.22.12.30.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Jun 2021 12:30:45 -0700 (PDT)
Received: (nullmailer pid 4188805 invoked by uid 1000);
        Tue, 22 Jun 2021 19:30:43 -0000
Date:   Tue, 22 Jun 2021 13:30:43 -0600
From:   Rob Herring <robh@kernel.org>
To:     Biju Das <biju.das.jz@bp.renesas.com>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        linux-usb@vger.kernel.org, devicetree@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v2 06/11] dt-bindings: usb: generic-ohci: Document RZ/G2L
 SoC bindings
Message-ID: <20210622193043.GA4176942@robh.at.kernel.org>
References: <20210621093943.12143-1-biju.das.jz@bp.renesas.com>
 <20210621093943.12143-7-biju.das.jz@bp.renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210621093943.12143-7-biju.das.jz@bp.renesas.com>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Mon, Jun 21, 2021 at 10:39:38AM +0100, Biju Das wrote:
> Renesas RZ/G2L SoC has USBPHY Control and USB2.0 PHY module. We need to
> turn on both these phy modules before accessing host registers.
> 
> Apart from this, document the optional property dr_mode present on both
> RZ/G2 and R-Car Gen3 SoCs.
> 
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> Reviewed-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> ---
>  .../devicetree/bindings/usb/generic-ohci.yaml | 32 +++++++++++++++++--
>  1 file changed, 30 insertions(+), 2 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/usb/generic-ohci.yaml b/Documentation/devicetree/bindings/usb/generic-ohci.yaml
> index 0f5f6ea702d0..c0644fae5db9 100644
> --- a/Documentation/devicetree/bindings/usb/generic-ohci.yaml
> +++ b/Documentation/devicetree/bindings/usb/generic-ohci.yaml
> @@ -8,6 +8,26 @@ title: USB OHCI Controller Device Tree Bindings
>  
>  allOf:
>    - $ref: "usb-hcd.yaml"
> +  - if:
> +      properties:
> +        compatible:
> +            contains:
> +              const: renesas,r9a07g044-ohci
> +    then:
> +      properties:
> +        phys:
> +          maxItems: 2
> +        phy-names:
> +          items:
> +            - const: usbphyctrl
> +            - const: usb

Why can't your extra thing be last? Then you only need to set 
minItems/maxItems in the if/then schema.

Though this seems like an abuse of the phy binding. There's not 2 phys, 
right? Just some extra registers related to the phy? Can't it be hidden 
in your phy driver?

> +    else:
> +      properties:
> +        phys:
> +          maxItems: 1
> +        phy-names:
> +          items:
> +            - const: usb
>  
>  maintainers:
>    - Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> @@ -43,6 +63,7 @@ properties:
>                - brcm,bcm7435-ohci
>                - ibm,476gtr-ohci
>                - ingenic,jz4740-ohci
> +              - renesas,r9a07g044-ohci
>                - snps,hsdk-v1.0-ohci
>            - const: generic-ohci
>        - const: generic-ohci
> @@ -101,14 +122,21 @@ properties:
>        Overrides the detected port count
>  
>    phys:
> -    maxItems: 1
> +    minItems: 1
> +    maxItems: 2
>  
>    phy-names:
> -    const: usb
> +    minItems: 1
> +    maxItems: 2
>  
>    iommus:
>      maxItems: 1
>  
> +  dr_mode:
> +    enum:
> +      - host
> +      - otg
> +
>  required:
>    - compatible
>    - reg
> -- 
> 2.17.1
> 
> 
