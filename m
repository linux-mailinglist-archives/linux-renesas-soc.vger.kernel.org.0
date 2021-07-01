Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 808B43B972C
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  1 Jul 2021 22:23:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232637AbhGAU0X (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 1 Jul 2021 16:26:23 -0400
Received: from mail-il1-f170.google.com ([209.85.166.170]:45027 "EHLO
        mail-il1-f170.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232113AbhGAU0X (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 1 Jul 2021 16:26:23 -0400
Received: by mail-il1-f170.google.com with SMTP id f12so1346222ils.11;
        Thu, 01 Jul 2021 13:23:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=Tdb5Fpc+C8F8W9NMoP6jeuYvv+Gdbc1zI9XctU+Md2U=;
        b=sjCt859nH3oJ6d8C1Y4aLJVSbG5FEuyoNFkybzQgMg773s5b0FvOFDPKFTnYwaN6sI
         1t6JIDrrjC3Jcgb6zPKIUrMoD3kzBNTDPRh5Pxex7SsOeRjR1BQF5ZsWTi5DHYsZ6gpV
         AznKVIXtgI9wsyQP5S35TRd6zPF/Qal6gBRrnDIau1Iq0NEufFh/PqiUisYvLK4rzQxw
         uuEJZwMU8tpoyjQILog7BGpMiNQ2so7uK0J4sCd7m1y7GsKUGGr5TwJoYmEK03oBDorS
         MKvtmMEFR6XmjzNGn5Ey/K3jM6jIhZOSTUztqAx3kunPqwhEwuEbMkhrOtOX9tcMTEm8
         gUDg==
X-Gm-Message-State: AOAM533Qc68BEOdAPxsmocSqPLiSXnitQ7bjmL2geUkYTnDcsn3v/qx2
        rojDY1aWjwP516dwJubBjI8xSt0Pug==
X-Google-Smtp-Source: ABdhPJxFJytNioq5NqwEKBxXvtw/thllMZUu2Uwid3lqSI1yvCnRbzz06cC7T8N2ljPG5R+33nMm3w==
X-Received: by 2002:a05:6e02:528:: with SMTP id h8mr872120ils.127.1625171031882;
        Thu, 01 Jul 2021 13:23:51 -0700 (PDT)
Received: from robh.at.kernel.org ([64.188.179.248])
        by smtp.gmail.com with ESMTPSA id e4sm471352iol.25.2021.07.01.13.23.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Jul 2021 13:23:51 -0700 (PDT)
Received: (nullmailer pid 2866244 invoked by uid 1000);
        Thu, 01 Jul 2021 20:23:48 -0000
Date:   Thu, 1 Jul 2021 14:23:48 -0600
From:   Rob Herring <robh@kernel.org>
To:     Biju Das <biju.das.jz@bp.renesas.com>
Cc:     Philipp Zabel <p.zabel@pengutronix.de>, devicetree@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v3 03/11] dt-bindings: reset: Document RZ/G2L USBPHY
 Control bindings
Message-ID: <20210701202348.GA2863189@robh.at.kernel.org>
References: <20210630073013.22415-1-biju.das.jz@bp.renesas.com>
 <20210630073013.22415-4-biju.das.jz@bp.renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210630073013.22415-4-biju.das.jz@bp.renesas.com>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Wed, Jun 30, 2021 at 08:30:05AM +0100, Biju Das wrote:
> Add device tree binding document for RZ/G2L USBPHY Control Device.
> It mainly controls reset and power down of the USB/PHY.
> 
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> Reviewed-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> ---
>  v3:
>   * New patch.
>   * Modelled USBPHY control from phy bindings to reset bindings, since the
>     IP mainly contols the reset of USB PHY.     
> ---
>  .../reset/renesas,rzg2l-usbphy-ctrl.yaml      | 66 +++++++++++++++++++
>  1 file changed, 66 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/reset/renesas,rzg2l-usbphy-ctrl.yaml
> 
> diff --git a/Documentation/devicetree/bindings/reset/renesas,rzg2l-usbphy-ctrl.yaml b/Documentation/devicetree/bindings/reset/renesas,rzg2l-usbphy-ctrl.yaml
> new file mode 100644
> index 000000000000..2a398c7ce7c8
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/reset/renesas,rzg2l-usbphy-ctrl.yaml
> @@ -0,0 +1,66 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/reset/renesas,rzg2l-usbphy-ctrl.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Renesas RZ/G2L USBPHY Control
> +
> +maintainers:
> +  - Biju Das <biju.das.jz@bp.renesas.com>
> +
> +description:
> +  The RZ/G2L USBPHY Control mainly controls reset and power down of the
> +  USB/PHY.
> +
> +properties:
> +  compatible:
> +    items:
> +      - enum:
> +          - renesas,r9a07g044-usbphy-ctrl # RZ/G2{L,LC}
> +      - const: renesas,rzg2l-usbphy-ctrl
> +
> +  reg:
> +    maxItems: 1
> +
> +  clocks:
> +    maxItems: 1
> +
> +  resets:
> +    maxItems: 1
> +
> +  power-domains:
> +    maxItems: 1
> +
> +  '#reset-cells':
> +    # see reset.txt in the same directory

Drop the reference. With that,

Reviewed-by: Rob Herring <robh@kernel.org>

> +    const: 1
> +    description: |
> +      The phandle's argument in the reset specifier is the PHY reset associated
> +      with the USB port.
> +      0 = Port 1 Phy reset
> +      1 = Port 2 Phy reset
> +
> +required:
> +  - compatible
> +  - reg
> +  - clocks
> +  - resets
> +  - power-domains
> +  - '#reset-cells'
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/clock/r9a07g044-cpg.h>
> +
> +    phyrst: usbphy-ctrl@11c40000 {
> +        compatible = "renesas,r9a07g044-usbphy-ctrl",
> +                     "renesas,rzg2l-usbphy-ctrl";
> +        reg = <0x11c40000 0x10000>;
> +        clocks = <&cpg CPG_MOD R9A07G044_USB_PCLK>;
> +        resets = <&cpg R9A07G044_USB_PRESETN>;
> +        power-domains = <&cpg>;
> +        #reset-cells = <1>;
> +    };
> -- 
> 2.17.1
> 
> 
