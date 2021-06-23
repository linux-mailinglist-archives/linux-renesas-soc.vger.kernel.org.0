Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4F9A43B1C26
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 23 Jun 2021 16:13:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230274AbhFWOPd (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 23 Jun 2021 10:15:33 -0400
Received: from mail.kernel.org ([198.145.29.99]:52450 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230061AbhFWOPd (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 23 Jun 2021 10:15:33 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 134546113B;
        Wed, 23 Jun 2021 14:13:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1624457596;
        bh=2D9bXMvM+JmMYhWz55X1lQn63XVa0lNjGb8sbsPeUlI=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=e1NaCKVSyFS1N6pMZhNWdW9qczwx1qgT9qQOMG9kGt0vbXJmg7rnMN+Oo/pl+hbpw
         6f5EXxJCRsWEd4TvsXAm3wf+SmmWjh1bjRCqhZfcWc9kHglKc64Hit6Mp8c2XXev8D
         q+Swu+5mPd8Ty6gmBOVQvBH0An/BhT46xYDVkXnip3lztUJGZQYtJ7o42GtB7fwtek
         gS+b1Za7CUGdZHQD5z4WuaCOEI8uYdNppZLc7Fp+09K5Kw7Qh3SgAiho7wLmonlNyD
         n+Qmhw4BGETjGmXCpk2MiDPgM6wKtq0kvnW0n3NsLcpJzMn5Fqv+7CwaKQqv1diMjO
         qzwFnlGSXLTqw==
Received: by mail-ej1-f48.google.com with SMTP id hq39so4264636ejc.5;
        Wed, 23 Jun 2021 07:13:15 -0700 (PDT)
X-Gm-Message-State: AOAM531KI3O1XuNBur8aeIoMEKJtOAVK8MAP6qZjMf6+K3B07uTZXiVT
        tooON5N8JEVbeZGDOSbuQcB+hO0KnHf8SojH0w==
X-Google-Smtp-Source: ABdhPJxJXNM8p40jL+1hduziK5Lfzt6kOH+YKNP84M1NQTiMMnmsEQwdG6ThBH+2icXPIffhLBoOqvfAupbq/dOrDHM=
X-Received: by 2002:a17:906:1951:: with SMTP id b17mr233230eje.468.1624457594568;
 Wed, 23 Jun 2021 07:13:14 -0700 (PDT)
MIME-Version: 1.0
References: <20210621093943.12143-1-biju.das.jz@bp.renesas.com>
 <20210621093943.12143-2-biju.das.jz@bp.renesas.com> <20210622165851.GA3840386@robh.at.kernel.org>
 <OS0PR01MB5922ECC2B573F1F8E170744F86089@OS0PR01MB5922.jpnprd01.prod.outlook.com>
In-Reply-To: <OS0PR01MB5922ECC2B573F1F8E170744F86089@OS0PR01MB5922.jpnprd01.prod.outlook.com>
From:   Rob Herring <robh@kernel.org>
Date:   Wed, 23 Jun 2021 08:13:02 -0600
X-Gmail-Original-Message-ID: <CAL_JsqK_6_LUD-ffkDCuDEds2RiYftJfynZyPN4io3Lt3MnQ4g@mail.gmail.com>
Message-ID: <CAL_JsqK_6_LUD-ffkDCuDEds2RiYftJfynZyPN4io3Lt3MnQ4g@mail.gmail.com>
Subject: Re: [PATCH v2 01/11] dt-bindings: phy: renesas: Document RZ/G2L USB
 PHY Control bindings
To:     Biju Das <biju.das.jz@bp.renesas.com>
Cc:     Kishon Vijay Abraham I <kishon@ti.com>,
        Vinod Koul <vkoul@kernel.org>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        "linux-phy@lists.infradead.org" <linux-phy@lists.infradead.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Wed, Jun 23, 2021 at 7:38 AM Biju Das <biju.das.jz@bp.renesas.com> wrote:
>
> Hi Rob,
>
> Thanks for the feedback.
>
> > Subject: Re: [PATCH v2 01/11] dt-bindings: phy: renesas: Document RZ/G2L
> > USB PHY Control bindings
> >
> > On Mon, Jun 21, 2021 at 10:39:33AM +0100, Biju Das wrote:
> > > Add device tree binding document for RZ/G2L USB PHY control driver.
> > >
> > > Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> > > Reviewed-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > > ---
> > > V1->V2:
> > >  * Add clock properties
> > > ---
> > >  .../phy/renesas,rzg2l-usbphyctrl.yaml         | 65 +++++++++++++++++++
> > >  1 file changed, 65 insertions(+)
> > >  create mode 100644
> > > Documentation/devicetree/bindings/phy/renesas,rzg2l-usbphyctrl.yaml
> > >
> > > diff --git
> > > a/Documentation/devicetree/bindings/phy/renesas,rzg2l-usbphyctrl.yaml
> > > b/Documentation/devicetree/bindings/phy/renesas,rzg2l-usbphyctrl.yaml
> > > new file mode 100644
> > > index 000000000000..8e8ba43f595d
> > > --- /dev/null
> > > +++ b/Documentation/devicetree/bindings/phy/renesas,rzg2l-usbphyctrl.y
> > > +++ aml
> > > @@ -0,0 +1,65 @@
> > > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) %YAML 1.2
> > > +---
> > > +$id:
> > > +https://jpn01.safelinks.protection.outlook.com/?url=http%3A%2F%2Fdevi
> > > +cetree.org%2Fschemas%2Fphy%2Frenesas%2Crzg2l-usbphyctrl.yaml%23&amp;d
> > > +ata=04%7C01%7Cbiju.das.jz%40bp.renesas.com%7Cc6bbf5f6ce334eaa722a08d9
> > > +359f07ad%7C53d82571da1947e49cb4625a166a4a2a%7C0%7C0%7C637599779421910
> > > +039%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBT
> > > +iI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;sdata=Jcf6Om4DehifCe1KO1rmt5LxTB
> > > +6jtGoQLD1MoqWGM%2F0%3D&amp;reserved=0
> > > +$schema:
> > > +https://jpn01.safelinks.protection.outlook.com/?url=http%3A%2F%2Fdevi
> > > +cetree.org%2Fmeta-schemas%2Fcore.yaml%23&amp;data=04%7C01%7Cbiju.das.
> > > +jz%40bp.renesas.com%7Cc6bbf5f6ce334eaa722a08d9359f07ad%7C53d82571da19
> > > +47e49cb4625a166a4a2a%7C0%7C0%7C637599779421910039%7CUnknown%7CTWFpbGZ
> > > +sb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%
> > > +3D%7C1000&amp;sdata=LlqPRLf9%2BGrEdSapxCFhwxVKcXTVh9ECr%2FXPN0SIzi4%3
> > > +D&amp;reserved=0
> > > +
> > > +title: Renesas RZ/G2L USB2.0 PHY Control
> > > +
> > > +maintainers:
> > > +  - Biju Das <biju.das.jz@bp.renesas.com>
> > > +
> > > +description:
> > > +  The RZ/G2L USB2.0 PHY Control mainly controls reset and power down
> > > +of the
> > > +  USB/PHY.
> > > +
> > > +properties:
> > > +  compatible:
> > > +    items:
> > > +      - enum:
> > > +          - renesas,r9a07g044-usbphyctrl # RZ/G2{L,LC}
> > > +      - const: renesas,rzg2l-usbphyctrl
> > > +
> > > +  reg:
> > > +    maxItems: 1
> > > +
> > > +  clocks:
> > > +    maxItems: 1
> > > +
> > > +  resets:
> > > +    maxItems: 1
> > > +
> > > +  power-domains:
> > > +    maxItems: 1
> > > +
> > > +  '#phy-cells':
> > > +    # see phy-bindings.txt in the same directory
> > > +    const: 1
> > > +    description: |
> > > +      The phandle's argument in the PHY specifier is the phy reset
> > control bit
> > > +      of usb phy control.
> > > +      0 = Port 1 Phy reset
> > > +      1 = Port 2 Phy reset
> > > +    enum: [ 0, 1 ]
> >
> > You already have the const, so this doesn't do anything.
>
> OK, will take out const.

No, 'const' is correct. This is the value of '#phy-cells', not the
contents (we don't have a way to express schema for that).

> > > +required:
> > > +  - compatible
> > > +  - reg
> > > +  - clocks
> > > +  - '#phy-cells'
> > > +
> > > +additionalProperties: false
> > > +
> > > +examples:
> > > +  - |
> > > +    #include <dt-bindings/clock/r9a07g044-cpg.h>
> > > +
> > > +    usbphyctrl@11c40000 {
> >
> > usb-phy@...
>
> The IP is called USBPHY control. It mainly controls reset and power down of the USB2.0/PHY.

Sounds like it should be using the reset binding...

>
> So not sure usb-phy is right one here ? I prefer usb-phy-ctrl instead. Is it ok? Please let me know.

A node with #phy-cells should use the standard phy node names unless
it has other controls. As I said, this doesn't seem to be a phy, so
using #phy-cells here is what seems wrong.

> > > +        compatible = "renesas,r9a07g044-usbphyctrl",
> > > +                     "renesas,rzg2l-usbphyctrl";
> > > +        reg = <0x11c40000 0x10000>;
> > > +        clocks = <&cpg CPG_MOD R9A07G044_USB_PCLK>;
> > > +        resets = <&cpg R9A07G044_USB_PCLK>;
> > > +        power-domains = <&cpg>;

Also, are these all resources of the usbphyctrl block and not just
resources you happen to want in the driver? For example, the
power-domain should be the power island that this block resides in.

> > > +        #phy-cells = <1>;
> > > +    };
> > > --
> > > 2.17.1
> > >
> > >
