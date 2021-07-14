Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8642D3C9303
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 14 Jul 2021 23:25:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235288AbhGNV1w (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 14 Jul 2021 17:27:52 -0400
Received: from mail-il1-f181.google.com ([209.85.166.181]:37397 "EHLO
        mail-il1-f181.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231891AbhGNV1w (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 14 Jul 2021 17:27:52 -0400
Received: by mail-il1-f181.google.com with SMTP id o8so3027095ilf.4;
        Wed, 14 Jul 2021 14:25:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=atn+pmb4LlUjPsNKyVhJos1DuhcFF2tTAcCtew7XOEs=;
        b=aGmlx+vYAX/CK9wY7RC9cTrdy3Ee3v7RSxrwaw1cDmEYsXz0OnN7xG5zSW2UkuPKRX
         jo+5ebR0eBIHYtkkyXc/4u8WsrelZ4Prk2CVyktCHkwGpb4cATMOxhZzBiE0rd8/0fQx
         4RWXtZBLI4PU8wCELJlYsMCNPjFDhydtvDcRAdCr+DMElG21jgrCKtVngtRrp59T3Vry
         6EkJioQMeTdT+HXvG4xjCeHuUmz/5a9+Q58Y27SHDLhTJXDURUCoMABSlif/ljRW82/F
         X9VWjTuunRm/UYt9iUp9SHR7RqeJW+BWRO4SYjiJKSdZNHbeJazRoMGK4IxPRbvn+Um+
         jQDw==
X-Gm-Message-State: AOAM533TbCufHdeLz6sYiIoWRyThZAkdRuPS8hzMGtxuzcNdp1gosBZO
        kIPuBErAiElDxiq1LSM38Q==
X-Google-Smtp-Source: ABdhPJxYU1d2BgAn1V/1k8q4VgwPBcqOtXMD09x0pu9ZPFlnCBcI8AgJIKCDXPHgVGkoL3uhDmzapQ==
X-Received: by 2002:a92:c504:: with SMTP id r4mr7732962ilg.131.1626297899765;
        Wed, 14 Jul 2021 14:24:59 -0700 (PDT)
Received: from robh.at.kernel.org ([64.188.179.248])
        by smtp.gmail.com with ESMTPSA id q1sm1961714ioi.42.2021.07.14.14.24.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Jul 2021 14:24:58 -0700 (PDT)
Received: (nullmailer pid 3552523 invoked by uid 1000);
        Wed, 14 Jul 2021 21:24:55 -0000
Date:   Wed, 14 Jul 2021 15:24:55 -0600
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
Subject: Re: [PATCH v3 09/11] dt-bindings: usb: renesas,usbhs: Document
 RZ/G2L bindings
Message-ID: <20210714212455.GA3547570@robh.at.kernel.org>
References: <20210630073013.22415-1-biju.das.jz@bp.renesas.com>
 <20210630073013.22415-10-biju.das.jz@bp.renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210630073013.22415-10-biju.das.jz@bp.renesas.com>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Wed, Jun 30, 2021 at 08:30:11AM +0100, Biju Das wrote:
> Document RZ/G2L (R9A07G044L) SoC bindings.
> 
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> Reviewed-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> ---
> v3:
>  * Updated the bindings as per the USBPHY control IP.
> ---
>  .../bindings/usb/renesas,usbhs.yaml           | 21 +++++++++++++++++--
>  1 file changed, 19 insertions(+), 2 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/usb/renesas,usbhs.yaml b/Documentation/devicetree/bindings/usb/renesas,usbhs.yaml
> index ad73339ffe1d..5562839bef8d 100644
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
> @@ -59,7 +61,7 @@ properties:
>        - description: USB 2.0 clock selector
>  
>    interrupts:
> -    maxItems: 1
> +    minItems: 1

maxItems: 4

>  
>    renesas,buswait:
>      $ref: /schemas/types.yaml#/definitions/uint32
> @@ -108,6 +110,21 @@ required:
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

If the first interrupt is the same on all devices, then this items 
list should be moved to the top level and just have a 'minItems: 4' 
here.


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
