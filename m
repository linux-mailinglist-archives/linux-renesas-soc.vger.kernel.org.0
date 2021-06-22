Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 01FF93B0AF6
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 22 Jun 2021 18:59:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230182AbhFVRBO (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 22 Jun 2021 13:01:14 -0400
Received: from mail-il1-f175.google.com ([209.85.166.175]:33742 "EHLO
        mail-il1-f175.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230076AbhFVRBO (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 22 Jun 2021 13:01:14 -0400
Received: by mail-il1-f175.google.com with SMTP id z1so9137294ils.0;
        Tue, 22 Jun 2021 09:58:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=LsZRslTqg7fuj2glyUnRDUtW0t7V3r4Eh+jP25psiYA=;
        b=cArNuoH4FXfC/kD0jl6+CVoSS5PaCVBtlPLNhI1oVocNOv3sqnMJPPcS8mDnl+Gtb3
         usyy2AifZBHDFSD7N3yI4k/vELCW3JoOixky2xopAfn6RrLZHspHd3pOuFm1iokdqWtW
         x+hrPmkRF7n/74P51ZwLCcHe4HjLE0jhKxJBhbNc0boEX56Rrwr9EQDgUHsUd8aDPs7R
         uey+G35NCGFBPToMWmmgI9tth94LQI45QTc6Ax+RT5irGMYmQmzIR9NsjUqz47QTwblW
         QnliDKD5VtuoIeTtRTj4WLS0TevLQLs+TmgEc2jacToh7HTRCs7bBgqcKkZ0/ZJsz/Qs
         1dbg==
X-Gm-Message-State: AOAM531lsTy2u+gug8XxjuLsTDxAuDky6agn360d62Y8oWTN7Tn0HS+d
        /XpvrUR13x00TTm3lAvYIA==
X-Google-Smtp-Source: ABdhPJzgjRJsYlROHHbtiBHKPUccSnwLseG1lY6GPKVUd6HQM/6j52GqK8QKMC64yih29uRWItX9wQ==
X-Received: by 2002:a92:3f01:: with SMTP id m1mr3416158ila.122.1624381137433;
        Tue, 22 Jun 2021 09:58:57 -0700 (PDT)
Received: from robh.at.kernel.org ([64.188.179.248])
        by smtp.gmail.com with ESMTPSA id k21sm360710ios.0.2021.06.22.09.58.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Jun 2021 09:58:56 -0700 (PDT)
Received: (nullmailer pid 3843418 invoked by uid 1000);
        Tue, 22 Jun 2021 16:58:51 -0000
Date:   Tue, 22 Jun 2021 10:58:51 -0600
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
Subject: Re: [PATCH v2 01/11] dt-bindings: phy: renesas: Document RZ/G2L USB
 PHY Control bindings
Message-ID: <20210622165851.GA3840386@robh.at.kernel.org>
References: <20210621093943.12143-1-biju.das.jz@bp.renesas.com>
 <20210621093943.12143-2-biju.das.jz@bp.renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210621093943.12143-2-biju.das.jz@bp.renesas.com>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Mon, Jun 21, 2021 at 10:39:33AM +0100, Biju Das wrote:
> Add device tree binding document for RZ/G2L USB PHY control driver.
> 
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> Reviewed-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> ---
> V1->V2:
>  * Add clock properties
> ---
>  .../phy/renesas,rzg2l-usbphyctrl.yaml         | 65 +++++++++++++++++++
>  1 file changed, 65 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/phy/renesas,rzg2l-usbphyctrl.yaml
> 
> diff --git a/Documentation/devicetree/bindings/phy/renesas,rzg2l-usbphyctrl.yaml b/Documentation/devicetree/bindings/phy/renesas,rzg2l-usbphyctrl.yaml
> new file mode 100644
> index 000000000000..8e8ba43f595d
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/phy/renesas,rzg2l-usbphyctrl.yaml
> @@ -0,0 +1,65 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/phy/renesas,rzg2l-usbphyctrl.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Renesas RZ/G2L USB2.0 PHY Control
> +
> +maintainers:
> +  - Biju Das <biju.das.jz@bp.renesas.com>
> +
> +description:
> +  The RZ/G2L USB2.0 PHY Control mainly controls reset and power down of the
> +  USB/PHY.
> +
> +properties:
> +  compatible:
> +    items:
> +      - enum:
> +          - renesas,r9a07g044-usbphyctrl # RZ/G2{L,LC}
> +      - const: renesas,rzg2l-usbphyctrl
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
> +  '#phy-cells':
> +    # see phy-bindings.txt in the same directory
> +    const: 1
> +    description: |
> +      The phandle's argument in the PHY specifier is the phy reset control bit
> +      of usb phy control.
> +      0 = Port 1 Phy reset
> +      1 = Port 2 Phy reset
> +    enum: [ 0, 1 ]

You already have the const, so this doesn't do anything.

> +
> +required:
> +  - compatible
> +  - reg
> +  - clocks
> +  - '#phy-cells'
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/clock/r9a07g044-cpg.h>
> +
> +    usbphyctrl@11c40000 {

usb-phy@...

> +        compatible = "renesas,r9a07g044-usbphyctrl",
> +                     "renesas,rzg2l-usbphyctrl";
> +        reg = <0x11c40000 0x10000>;
> +        clocks = <&cpg CPG_MOD R9A07G044_USB_PCLK>;
> +        resets = <&cpg R9A07G044_USB_PCLK>;
> +        power-domains = <&cpg>;
> +        #phy-cells = <1>;
> +    };
> -- 
> 2.17.1
> 
> 
