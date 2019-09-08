Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 70109AD0F1
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  9 Sep 2019 00:14:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730990AbfIHWOa (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Sun, 8 Sep 2019 18:14:30 -0400
Received: from kirsty.vergenet.net ([202.4.237.240]:50510 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726626AbfIHWOa (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sun, 8 Sep 2019 18:14:30 -0400
Received: from penelope.horms.nl (195-23-252-147.net.novis.pt [195.23.252.147])
        by kirsty.vergenet.net (Postfix) with ESMTPA id A723525AF0E;
        Mon,  9 Sep 2019 08:14:27 +1000 (AEST)
Received: by penelope.horms.nl (Postfix, from userid 7100)
        id 27864E21127; Sun,  8 Sep 2019 14:06:17 +0200 (CEST)
Date:   Sun, 8 Sep 2019 13:06:17 +0100
From:   Simon Horman <horms@verge.net.au>
To:     Rob Herring <robh+dt@kernel.org>
Cc:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        Mark Rutland <mark.rutland@arm.com>,
        devicetree@vger.kernel.org,
        "open list:MEDIA DRIVERS FOR RENESAS - FCP" 
        <linux-renesas-soc@vger.kernel.org>,
        "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" 
        <linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCH] dt-bindings: arm: renesas: Convert 'renesas,prr' to
 json-schema
Message-ID: <20190908120616.3gnmhhpxhxfxpayp@verge.net.au>
References: <20190906111435.5706-1-horms+renesas@verge.net.au>
 <CAL_JsqLvU4=kaQ-nSwMuh4VXX67U5URZAPvVJohfKzQsQdFTrA@mail.gmail.com>
 <20190906114857.4mgunm4feehakc4u@verge.net.au>
 <CAL_Jsq+yp6vw=RoUb+-C3rX2322Y=8xD=wr8OYWxmbvq2SOuKg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAL_Jsq+yp6vw=RoUb+-C3rX2322Y=8xD=wr8OYWxmbvq2SOuKg@mail.gmail.com>
Organisation: Horms Solutions BV
User-Agent: NeoMutt/20170113 (1.7.2)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Fri, Sep 06, 2019 at 01:54:26PM +0100, Rob Herring wrote:
> On Fri, Sep 6, 2019 at 12:49 PM Simon Horman <horms@verge.net.au> wrote:
> >
> > On Fri, Sep 06, 2019 at 12:21:58PM +0100, Rob Herring wrote:
> > > On Fri, Sep 6, 2019 at 12:14 PM Simon Horman <horms+renesas@verge.net.au> wrote:
> > > >
> > > > Convert Renesas Product Register bindings documentation to json-schema.
> > > >
> > > > Signed-off-by: Simon Horman <horms+renesas@verge.net.au>
> > > > ---
> > > > Based on v5.3-rc1
> > > > Tested using:
> > > >   make dtbs_check DT_SCHEMA_FILES=Documentation/devicetree/bindings/arm/renesas,prr.yaml
> > > > ---
> > > >  .../devicetree/bindings/arm/renesas,prr.txt        | 20 ------------
> > > >  .../devicetree/bindings/arm/renesas,prr.yaml       | 36 ++++++++++++++++++++++
> > > >  2 files changed, 36 insertions(+), 20 deletions(-)
> > > >  delete mode 100644 Documentation/devicetree/bindings/arm/renesas,prr.txt
> > > >  create mode 100644 Documentation/devicetree/bindings/arm/renesas,prr.yaml
> > > >
> > > > diff --git a/Documentation/devicetree/bindings/arm/renesas,prr.txt b/Documentation/devicetree/bindings/arm/renesas,prr.txt
> > > > deleted file mode 100644
> > > > index 08e482e953ca..000000000000
> > > > --- a/Documentation/devicetree/bindings/arm/renesas,prr.txt
> > > > +++ /dev/null
> > > > @@ -1,20 +0,0 @@
> > > > -Renesas Product Register
> > > > -
> > > > -Most Renesas ARM SoCs have a Product Register or Boundary Scan ID Register that
> > > > -allows to retrieve SoC product and revision information.  If present, a device
> > > > -node for this register should be added.
> > > > -
> > > > -Required properties:
> > > > -  - compatible: Must be one of:
> > > > -    "renesas,prr"
> > > > -    "renesas,bsid"
> > > > -  - reg: Base address and length of the register block.
> > > > -
> > > > -
> > > > -Examples
> > > > ---------
> > > > -
> > > > -       prr: chipid@ff000044 {
> > > > -               compatible = "renesas,prr";
> > > > -               reg = <0 0xff000044 0 4>;
> > > > -       };
> > > > diff --git a/Documentation/devicetree/bindings/arm/renesas,prr.yaml b/Documentation/devicetree/bindings/arm/renesas,prr.yaml
> > > > new file mode 100644
> > > > index 000000000000..9df003041456
> > > > --- /dev/null
> > > > +++ b/Documentation/devicetree/bindings/arm/renesas,prr.yaml
> > > > @@ -0,0 +1,36 @@
> > > > +# SPDX-License-Identifier: GPL-2.0
> > > > +%YAML 1.2
> > > > +---
> > > > +$id: http://devicetree.org/schemas/arm/renesas,prr.yaml#
> > > > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > > > +
> > > > +title: Renesas Product Register
> > > > +
> > > > +maintainers:
> > > > +  - Geert Uytterhoeven <geert+renesas@glider.be>
> > > > +  - Magnus Damm <magnus.damm@gmail.com>
> > > > +
> > > > +description: |
> > > > +  Most Renesas ARM SoCs have a Product Register or Boundary Scan ID
> > > > +  Register that allows to retrieve SoC product and revision information.
> > > > +  If present, a device node for this register should be added.
> > > > +
> > > > +properties:
> > > > +  compatible:
> > > > +    oneOf:
> > > > +        - const: "renesas,prr"
> > > > +        - const: "renesas,bsid"
> > >
> > > enum is better than oneOf+const and drop the quotes. oneOf/allOf/anyOf
> > > result in terrible error messages.
> >
> > Thanks Rob,
> >
> > Like this?
> >
> >   compatible:
> >     enum:
> >       - renesas,prr
> >       - renesas,bsid
> >
> > > > +  reg:
> > > > +    items:
> > > > +      - description: Base address and length of the register block.
> > >
> > > That's what 'reg' *always* is... Just 'maxItems: 1' is sufficient when
> > > there is" only 1 entry.
> >
> > And this?
> >
> >   reg:
> >     maxItems: 1
> 
> Yes, for both.

Thanks, I have posted v2 with the changes you suggested.
