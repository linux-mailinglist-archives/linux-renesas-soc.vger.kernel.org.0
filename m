Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 949083CFFA5
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 20 Jul 2021 18:39:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234619AbhGTP6V (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 20 Jul 2021 11:58:21 -0400
Received: from mail.kernel.org ([198.145.29.99]:46754 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231237AbhGTP4U (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 20 Jul 2021 11:56:20 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 71A6F60FF2;
        Tue, 20 Jul 2021 16:36:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1626799018;
        bh=IhE15OCsZZL4VIDdohm7Hf2FnjxTKG9XEwbEiYaAZcg=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=eOl+ZoYsnu1HdOHKz68BDtopcnRYoKGN3rI+atFZfeRIwWcw1/grpDlLY6AZw2H5i
         Amt1EQ8ZMVJ3JiPwUz9j6diMQnehPPOI53BqCVojlCR9xJQ2NcWLEMknO0Fk48mO/6
         q5wEKTpXM5xUO/jbAipFFBEGjvKwJtsDuhy28scP9NBkfBZQYkiF70Tu/35hUoln4U
         8wWrpcyeotp1lt85VgiD2V2yEUiNR8HgG08iXOBYi91kfKpeSXcPZIdyUDHGkAE6Gg
         yG1MFbtyxVu1jnJEhS5eN8k9wboqhuAcXyDpddhuepASjjg1sUXbrKxZlaqQh5THVi
         VjU5wL7q1fxvQ==
Received: by mail-ed1-f46.google.com with SMTP id l26so29204300eda.10;
        Tue, 20 Jul 2021 09:36:58 -0700 (PDT)
X-Gm-Message-State: AOAM533a2lLKwDNwQvgQWPQP0tbqM6ee2Iumm0iHd6RTmg0fCI2Ul6ni
        TWGrzV0BlnwbyGZodBg7JOsv9khX9ZGNL3N8pQ==
X-Google-Smtp-Source: ABdhPJy8d09Q9NrycMU9Q826ITKi5kxOzUS11WCgwyOBHJFREiJj8GS1Dp8lXeHgAev7AEtvoW5pATtKwvPRScm9fDM=
X-Received: by 2002:aa7:ca54:: with SMTP id j20mr42161769edt.137.1626799017059;
 Tue, 20 Jul 2021 09:36:57 -0700 (PDT)
MIME-Version: 1.0
References: <20210719121938.6532-1-biju.das.jz@bp.renesas.com>
 <20210719121938.6532-4-biju.das.jz@bp.renesas.com> <1626708479.397199.1967264.nullmailer@robh.at.kernel.org>
 <OS0PR01MB5922E245F143076435A9000186E29@OS0PR01MB5922.jpnprd01.prod.outlook.com>
In-Reply-To: <OS0PR01MB5922E245F143076435A9000186E29@OS0PR01MB5922.jpnprd01.prod.outlook.com>
From:   Rob Herring <robh@kernel.org>
Date:   Tue, 20 Jul 2021 10:36:44 -0600
X-Gmail-Original-Message-ID: <CAL_JsqKPA5XUhWHBTtNEmA_aqHOyUt_woEB79WKgiFWRn7CT7g@mail.gmail.com>
Message-ID: <CAL_JsqKPA5XUhWHBTtNEmA_aqHOyUt_woEB79WKgiFWRn7CT7g@mail.gmail.com>
Subject: Re: [PATCH v4 03/10] dt-bindings: reset: Document RZ/G2L USBPHY
 Control bindings
To:     Biju Das <biju.das.jz@bp.renesas.com>
Cc:     Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Tue, Jul 20, 2021 at 5:26 AM Biju Das <biju.das.jz@bp.renesas.com> wrote:
>
> Hi Rob,
>
> > Subject: Re: [PATCH v4 03/10] dt-bindings: reset: Document RZ/G2L USBPHY
> > Control bindings
> >
> > On Mon, 19 Jul 2021 13:19:31 +0100, Biju Das wrote:
> > > Add device tree binding document for RZ/G2L USBPHY Control Device.
> > > It mainly controls reset and power down of the USB/PHY.
> > >
> > > Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> > > Reviewed-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > > Reviewed-by: Rob Herring <robh@kernel.org>
> > > ---
> > > v3->v4:
> > >   * Dropped reset reference.
> > >   * Added Rb-tag from Rob.
> > >  v3:
> > >   * New patch.
> > >   * Modelled USBPHY control from phy bindings to reset bindings, since
> > the
> > >     IP mainly contols the reset of USB PHY.
> > > ---
> > >  .../reset/renesas,rzg2l-usbphy-ctrl.yaml      | 65 +++++++++++++++++++
> > >  1 file changed, 65 insertions(+)
> > >  create mode 100644
> > > Documentation/devicetree/bindings/reset/renesas,rzg2l-usbphy-ctrl.yaml
> > >
> >
> > My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
> > on your patch (DT_CHECKER_FLAGS is new in v5.13):
> >
> > yamllint warnings/errors:
> >
> > dtschema/dtc warnings/errors:
> > Error: Documentation/devicetree/bindings/reset/renesas,rzg2l-usbphy-
> > ctrl.example.dts:25.30-31 syntax error FATAL ERROR: Unable to parse input
> > tree
> > make[1]: *** [scripts/Makefile.lib:380:
> > Documentation/devicetree/bindings/reset/renesas,rzg2l-usbphy-
> > ctrl.example.dt.yaml] Error 1
> > make[1]: *** Waiting for unfinished jobs....
> > make: *** [Makefile:1418: dt_binding_check] Error 2 \ndoc reference errors
> > (make refcheckdocs):
> >
> > See
> > https://jpn01.safelinks.protection.outlook.com/?url=https%3A%2F%2Fpatchwor
> > k.ozlabs.org%2Fpatch%2F1506961&amp;data=04%7C01%7Cbiju.das.jz%40bp.renesas
> > .com%7Cb02057306f9b4db2426008d94ac9ce37%7C53d82571da1947e49cb4625a166a4a2a
> > %7C0%7C0%7C637623052878040806%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAi
> > LCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;sdata=N4%2F9GofL
> > NWbtPDddI38ActeGRqtfxdNANC4T241Or1M%3D&amp;reserved=0
> >
> > This check can fail if there are any dependencies. The base for a patch
> > series is generally the most recent rc1.
>
> The dependency patch for the bot error is present on 5.14-rc2 but not on 5.14-rc1.

Ok, I've updated the base to rc2. Please note a dependency like that
(anything that's not the last rc1) next time.

Rob
