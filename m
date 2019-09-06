Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 22979AB881
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  6 Sep 2019 14:54:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2404863AbfIFMyk (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 6 Sep 2019 08:54:40 -0400
Received: from mail.kernel.org ([198.145.29.99]:50276 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2404862AbfIFMyj (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 6 Sep 2019 08:54:39 -0400
Received: from mail-qt1-f180.google.com (mail-qt1-f180.google.com [209.85.160.180])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 09C7D2173E;
        Fri,  6 Sep 2019 12:54:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1567774478;
        bh=w26cLrekOjO1NDx0tjF+iXImKvXPay5u6douh3UTcSc=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=OzEZ52pNQXx2jfxi1p0Rz7AWzk2tshLGkAJv5Kwc2ZoNBxIIcTpg+KWIawTuunQyn
         uBEkMQgY8uKwNQu+G7kf/HlCicShOAXWIqqA45210f4YcY3x/XH/n/ECMMctXRa4vi
         zZcRT1BrKKQ4sMPROADQv66jLW6z/unYlxjgUqGY=
Received: by mail-qt1-f180.google.com with SMTP id g13so6452112qtj.4;
        Fri, 06 Sep 2019 05:54:37 -0700 (PDT)
X-Gm-Message-State: APjAAAUtgrJC0MlZZiBe4K0b9GyA0f0kYiUEe8YTQweu6MxyESZrmDDT
        autWJ4/WSbSrCZYJKtfNYCnpMTvonp0ClpuImQ==
X-Google-Smtp-Source: APXvYqzVbPCN340zI7CD/0EZC4in0AqbdQAYzhHjxdPokS0Z7DebCRDOhfJSzXAeSnDC4Peblf2p9+Ax+0DX28qiE6Y=
X-Received: by 2002:a0c:8a6d:: with SMTP id 42mr5290386qvu.138.1567774477116;
 Fri, 06 Sep 2019 05:54:37 -0700 (PDT)
MIME-Version: 1.0
References: <20190906111435.5706-1-horms+renesas@verge.net.au>
 <CAL_JsqLvU4=kaQ-nSwMuh4VXX67U5URZAPvVJohfKzQsQdFTrA@mail.gmail.com> <20190906114857.4mgunm4feehakc4u@verge.net.au>
In-Reply-To: <20190906114857.4mgunm4feehakc4u@verge.net.au>
From:   Rob Herring <robh+dt@kernel.org>
Date:   Fri, 6 Sep 2019 13:54:26 +0100
X-Gmail-Original-Message-ID: <CAL_Jsq+yp6vw=RoUb+-C3rX2322Y=8xD=wr8OYWxmbvq2SOuKg@mail.gmail.com>
Message-ID: <CAL_Jsq+yp6vw=RoUb+-C3rX2322Y=8xD=wr8OYWxmbvq2SOuKg@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: arm: renesas: Convert 'renesas,prr' to json-schema
To:     Simon Horman <horms@verge.net.au>
Cc:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        Mark Rutland <mark.rutland@arm.com>,
        devicetree@vger.kernel.org,
        "open list:MEDIA DRIVERS FOR RENESAS - FCP" 
        <linux-renesas-soc@vger.kernel.org>,
        "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" 
        <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Fri, Sep 6, 2019 at 12:49 PM Simon Horman <horms@verge.net.au> wrote:
>
> On Fri, Sep 06, 2019 at 12:21:58PM +0100, Rob Herring wrote:
> > On Fri, Sep 6, 2019 at 12:14 PM Simon Horman <horms+renesas@verge.net.au> wrote:
> > >
> > > Convert Renesas Product Register bindings documentation to json-schema.
> > >
> > > Signed-off-by: Simon Horman <horms+renesas@verge.net.au>
> > > ---
> > > Based on v5.3-rc1
> > > Tested using:
> > >   make dtbs_check DT_SCHEMA_FILES=Documentation/devicetree/bindings/arm/renesas,prr.yaml
> > > ---
> > >  .../devicetree/bindings/arm/renesas,prr.txt        | 20 ------------
> > >  .../devicetree/bindings/arm/renesas,prr.yaml       | 36 ++++++++++++++++++++++
> > >  2 files changed, 36 insertions(+), 20 deletions(-)
> > >  delete mode 100644 Documentation/devicetree/bindings/arm/renesas,prr.txt
> > >  create mode 100644 Documentation/devicetree/bindings/arm/renesas,prr.yaml
> > >
> > > diff --git a/Documentation/devicetree/bindings/arm/renesas,prr.txt b/Documentation/devicetree/bindings/arm/renesas,prr.txt
> > > deleted file mode 100644
> > > index 08e482e953ca..000000000000
> > > --- a/Documentation/devicetree/bindings/arm/renesas,prr.txt
> > > +++ /dev/null
> > > @@ -1,20 +0,0 @@
> > > -Renesas Product Register
> > > -
> > > -Most Renesas ARM SoCs have a Product Register or Boundary Scan ID Register that
> > > -allows to retrieve SoC product and revision information.  If present, a device
> > > -node for this register should be added.
> > > -
> > > -Required properties:
> > > -  - compatible: Must be one of:
> > > -    "renesas,prr"
> > > -    "renesas,bsid"
> > > -  - reg: Base address and length of the register block.
> > > -
> > > -
> > > -Examples
> > > ---------
> > > -
> > > -       prr: chipid@ff000044 {
> > > -               compatible = "renesas,prr";
> > > -               reg = <0 0xff000044 0 4>;
> > > -       };
> > > diff --git a/Documentation/devicetree/bindings/arm/renesas,prr.yaml b/Documentation/devicetree/bindings/arm/renesas,prr.yaml
> > > new file mode 100644
> > > index 000000000000..9df003041456
> > > --- /dev/null
> > > +++ b/Documentation/devicetree/bindings/arm/renesas,prr.yaml
> > > @@ -0,0 +1,36 @@
> > > +# SPDX-License-Identifier: GPL-2.0
> > > +%YAML 1.2
> > > +---
> > > +$id: http://devicetree.org/schemas/arm/renesas,prr.yaml#
> > > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > > +
> > > +title: Renesas Product Register
> > > +
> > > +maintainers:
> > > +  - Geert Uytterhoeven <geert+renesas@glider.be>
> > > +  - Magnus Damm <magnus.damm@gmail.com>
> > > +
> > > +description: |
> > > +  Most Renesas ARM SoCs have a Product Register or Boundary Scan ID
> > > +  Register that allows to retrieve SoC product and revision information.
> > > +  If present, a device node for this register should be added.
> > > +
> > > +properties:
> > > +  compatible:
> > > +    oneOf:
> > > +        - const: "renesas,prr"
> > > +        - const: "renesas,bsid"
> >
> > enum is better than oneOf+const and drop the quotes. oneOf/allOf/anyOf
> > result in terrible error messages.
>
> Thanks Rob,
>
> Like this?
>
>   compatible:
>     enum:
>       - renesas,prr
>       - renesas,bsid
>
> > > +  reg:
> > > +    items:
> > > +      - description: Base address and length of the register block.
> >
> > That's what 'reg' *always* is... Just 'maxItems: 1' is sufficient when
> > there is" only 1 entry.
>
> And this?
>
>   reg:
>     maxItems: 1

Yes, for both.
