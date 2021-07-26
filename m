Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 916B23D6984
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 27 Jul 2021 00:28:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233258AbhGZVsH (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 26 Jul 2021 17:48:07 -0400
Received: from mail-il1-f169.google.com ([209.85.166.169]:35627 "EHLO
        mail-il1-f169.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232876AbhGZVsG (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 26 Jul 2021 17:48:06 -0400
Received: by mail-il1-f169.google.com with SMTP id k3so10462315ilu.2;
        Mon, 26 Jul 2021 15:28:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=WvABWR+id8JI6mFKNCOCSmYsuyn1aqKwrjc3vQZKHkA=;
        b=JZKydkfb+pmLqhNP3nVw5xLKvoda1IWuA8de7Z02aDM5+bMlUADAXL/jjGvRK2d3bO
         cqB5UPOQM6oadVmwbO83We8iSBa0UxdS9vlZHaMsfxraBHx4bQtGhXjT89AKewMvsk0R
         hsUcgQK2kX+gq7++W1Bb0F1UT+dSpmfBxoKA45z3bB9u+l/d0o8spUff8ADKcB7fOHMX
         kLH2OajqIhRjyNwq5MrPu02qvWEGIjRKsrhRxwJS1Vks58FJo0kFk+5FOZyVUv6OLPGr
         Ss9Wn50jxv8IDelbFIsN3gRxvFGC5bu4Zw+KJGBJK7M9UbnCyqWztvze2/5QR9myMUy8
         pw0w==
X-Gm-Message-State: AOAM532MPlrSkFTu41rc2FlfV9VSc8cQcA/yj6chebEOiYaZ5MI8UE5F
        oog9QXoXKe8uA0vBPocUSw==
X-Google-Smtp-Source: ABdhPJyBSojUTUlep1WXALG4h+Hu7/OjYnYxDIS2b2U2Khb4FzzLNwu9aKul65VF01z530WGYaFU0w==
X-Received: by 2002:a92:d302:: with SMTP id x2mr14526829ila.161.1627338514755;
        Mon, 26 Jul 2021 15:28:34 -0700 (PDT)
Received: from robh.at.kernel.org ([64.188.179.248])
        by smtp.gmail.com with ESMTPSA id u10sm726453iop.15.2021.07.26.15.28.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Jul 2021 15:28:33 -0700 (PDT)
Received: (nullmailer pid 987983 invoked by uid 1000);
        Mon, 26 Jul 2021 22:28:30 -0000
Date:   Mon, 26 Jul 2021 16:28:30 -0600
From:   Rob Herring <robh@kernel.org>
To:     Biju Das <biju.das.jz@bp.renesas.com>
Cc:     Kishon Vijay Abraham I <kishon@ti.com>,
        Vinod Koul <vkoul@kernel.org>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v4 06/10] dt-bindings: phy: renesas,usb2-phy: Document
 RZ/G2L phy bindings
Message-ID: <20210726222830.GB981051@robh.at.kernel.org>
References: <20210719121938.6532-1-biju.das.jz@bp.renesas.com>
 <20210719121938.6532-7-biju.das.jz@bp.renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210719121938.6532-7-biju.das.jz@bp.renesas.com>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Mon, Jul 19, 2021 at 01:19:34PM +0100, Biju Das wrote:
> Document USB phy bindings for RZ/G2L SoC.
> 
> RZ/G2L USB2.0 phy uses line ctrl register for OTG_ID pin changes. It uses
> a different OTG-BC interrupt bit for device recognition. Apart from this,
> the PHY reset is controlled by USBPHY control IP and Document reset is a
> required property.
> 
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> Reviewed-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> ---
> v3->v4:
>  * Removed second reset
>  * Added family specific compatible string.
> v2->v3
>  * Created a new compatible for RZ/G2L as per Geert's suggestion.
>  * Added resets required properties for RZ/G2L SoC.
> ---
>  .../bindings/phy/renesas,usb2-phy.yaml        | 19 +++++++++++++++++++
>  1 file changed, 19 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/phy/renesas,usb2-phy.yaml b/Documentation/devicetree/bindings/phy/renesas,usb2-phy.yaml
> index d5dc5a3cdceb..151158d7a224 100644
> --- a/Documentation/devicetree/bindings/phy/renesas,usb2-phy.yaml
> +++ b/Documentation/devicetree/bindings/phy/renesas,usb2-phy.yaml
> @@ -30,6 +30,11 @@ properties:
>                - renesas,usb2-phy-r8a77995 # R-Car D3
>            - const: renesas,rcar-gen3-usb2-phy
>  
> +      - items:
> +          - enum:
> +              - renesas,usb2-phy-r9a07g044 # RZ/G2{L,LC}
> +          - const: renesas,rzg2l-usb2-phy  # RZ/G2L family
> +
>    reg:
>      maxItems: 1
>  
> @@ -91,6 +96,20 @@ required:
>    - clocks
>    - '#phy-cells'
>  
> +allOf:
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            const: renesas,rzg2l-usb2-phy
> +    then:
> +      properties:
> +        resets:
> +          description: |
> +            USB/PHY reset associated with the port.

You don't need 'properties' part here. Just 'required'.

> +      required:
> +        - resets
> +
>  additionalProperties: false
>  
>  examples:
> -- 
> 2.17.1
> 
> 
