Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 995573D698C
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 27 Jul 2021 00:30:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233660AbhGZVuJ (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 26 Jul 2021 17:50:09 -0400
Received: from mail-io1-f54.google.com ([209.85.166.54]:35480 "EHLO
        mail-io1-f54.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233348AbhGZVuJ (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 26 Jul 2021 17:50:09 -0400
Received: by mail-io1-f54.google.com with SMTP id y9so13853307iox.2;
        Mon, 26 Jul 2021 15:30:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=0CUfASdPcgc+7dcIK4FubYYfBLXisBtKwn64dA+QuXE=;
        b=ngW3BxUT7EyAku17r/xJmYbO+EiG2/gTH7rnjNc8pzIY+6/rpzOr9u/TALlpykK6L4
         1u6lvXBO9TjrP5/lxJko+DBnMk3q+YbUpkpBvrqIV+uEon6Zq7miJWuHf3Y04+2wJbWN
         x8OQHO1RMrro7n8TXhBxXVfwA8L2q+a3vLESoWl0DG2JXNGU62F1azBJGfA4keoDhNQU
         1lE22vwcsyokrxJUffW2CFOJneAwFvbBgoNnzGy3bOPOblSZye/8K4GQXDFxqBW7Ec1d
         91/yEtY7bcTcUm5pNeGY1wbUcFu3i1QpuaLO9aUZujmzg3VxqfkJJkYQtGEME4RFNQ71
         Yu1A==
X-Gm-Message-State: AOAM5314PFhBRZWkLuOZFt/2rAEZ+nn6YgCkn3t66g1qAReI9gdU1RJ9
        y8kl0dkS3rd3WVNRBtd70w==
X-Google-Smtp-Source: ABdhPJzv1dCnrv5erKiqYvhfzCzd01fFpBZ4TZMg+kQ/KhC5KNuM83gtiUN21PqWGjloql1pXYdy6A==
X-Received: by 2002:a02:cebb:: with SMTP id z27mr18570768jaq.72.1627338636162;
        Mon, 26 Jul 2021 15:30:36 -0700 (PDT)
Received: from robh.at.kernel.org ([64.188.179.248])
        by smtp.gmail.com with ESMTPSA id t24sm768033ioh.24.2021.07.26.15.30.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Jul 2021 15:30:35 -0700 (PDT)
Received: (nullmailer pid 991114 invoked by uid 1000);
        Mon, 26 Jul 2021 22:30:32 -0000
Date:   Mon, 26 Jul 2021 16:30:32 -0600
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
Subject: Re: [PATCH v4 09/10] dt-bindings: usb: renesas,usbhs: Document
 RZ/G2L bindings
Message-ID: <20210726223032.GA988259@robh.at.kernel.org>
References: <20210719121938.6532-1-biju.das.jz@bp.renesas.com>
 <20210719121938.6532-10-biju.das.jz@bp.renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210719121938.6532-10-biju.das.jz@bp.renesas.com>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Mon, Jul 19, 2021 at 01:19:37PM +0100, Biju Das wrote:
> Document RZ/G2L (R9A07G044L) SoC bindings.
> 
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> Reviewed-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> ---
> v3->v4:
>  * Added maxitems in interrupt property as per Rob's suggestion.
> v3:
>  * Updated the bindings as per the USBPHY control IP.
> ---
>  .../bindings/usb/renesas,usbhs.yaml           | 22 +++++++++++++++++--
>  1 file changed, 20 insertions(+), 2 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/usb/renesas,usbhs.yaml b/Documentation/devicetree/bindings/usb/renesas,usbhs.yaml
> index ad73339ffe1d..a85ad392d443 100644
> --- a/Documentation/devicetree/bindings/usb/renesas,usbhs.yaml
> +++ b/Documentation/devicetree/bindings/usb/renesas,usbhs.yaml
> @@ -17,7 +17,9 @@ properties:
>            - const: renesas,rza1-usbhs
>  
>        - items:
> -          - const: renesas,usbhs-r7s9210 # RZ/A2
> +          - enum:
> +              - renesas,usbhs-r7s9210   # RZ/A2
> +              - renesas,usbhs-r9a07g044 # RZ/G2{L,LC}
>            - const: renesas,rza2-usbhs
>  
>        - items:
> @@ -59,7 +61,8 @@ properties:
>        - description: USB 2.0 clock selector
>  
>    interrupts:
> -    maxItems: 1
> +    minItems: 1
> +    maxItems: 4
>  
>    renesas,buswait:
>      $ref: /schemas/types.yaml#/definitions/uint32
> @@ -108,6 +111,21 @@ required:
>    - clocks
>    - interrupts
>  
> +allOf:
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            const: renesas,usbhs-r9a07g044
> +    then:
> +      properties:
> +        interrupts:
> +          items:
> +            - description: U2P_IXL_INT
> +            - description: U2P_INT_DMA[0]
> +            - description: U2P_INT_DMA[1]
> +            - description: U2P_INT_DMAERR

else:
  properties:
    interrupts:
      maxItems: 1

> +
>  additionalProperties: false
>  
>  examples:
> -- 
> 2.17.1
> 
> 
