Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 029B9F03D4
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  5 Nov 2019 18:08:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390181AbfKERH7 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 5 Nov 2019 12:07:59 -0500
Received: from mail.kernel.org ([198.145.29.99]:45180 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2387833AbfKERH7 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 5 Nov 2019 12:07:59 -0500
Received: from mail-qt1-f171.google.com (mail-qt1-f171.google.com [209.85.160.171])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 9F63A21D7D;
        Tue,  5 Nov 2019 17:07:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1572973678;
        bh=982pnP21u6SLHEwMF1WidZv9LQW97H7o7tJaYDJdzz8=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=0DSgrhZ2NAQhUICtqBtKwZHph/j5WuH2vsCL7/O/tCwFJfttlXO//skvCyIcr6fdd
         Q8tAcB47lt7ul0ex99vhOzzEr+FfuPk5P3fG+KSCRRyuYA7q31PBff6umt9ZGQnPMm
         P3/5t/FhJMZP3RezivC4wWbs0XUqdezmJOg8OjR8=
Received: by mail-qt1-f171.google.com with SMTP id r22so20259514qtt.2;
        Tue, 05 Nov 2019 09:07:58 -0800 (PST)
X-Gm-Message-State: APjAAAVp24RjoZLDVSW6uAQG13XPxpYCi5HoLiNG/nj+cMho7XWHpHQl
        K6xoOJJXWiH0FCh1SlXO469XK/f7M6OAKQlvPg==
X-Google-Smtp-Source: APXvYqz9/z2im9e76vhu3PDX2geLlkCL/9xOMZgc1KJo/mqie7zy7vcexLdTcRMCQUecwC+40LweB/fouXV5OHZ5gYU=
X-Received: by 2002:ac8:458c:: with SMTP id l12mr19273736qtn.300.1572973677688;
 Tue, 05 Nov 2019 09:07:57 -0800 (PST)
MIME-Version: 1.0
References: <1572886683-4919-1-git-send-email-fabrizio.castro@bp.renesas.com>
 <1572886683-4919-3-git-send-email-fabrizio.castro@bp.renesas.com>
 <CAL_JsqJ+xus0GDWb0Px6HKDBzOt1yjwCCkQrfMspubwG+LZOdQ@mail.gmail.com> <TY1PR01MB1770F97A73768451B2ED8A22C07E0@TY1PR01MB1770.jpnprd01.prod.outlook.com>
In-Reply-To: <TY1PR01MB1770F97A73768451B2ED8A22C07E0@TY1PR01MB1770.jpnprd01.prod.outlook.com>
From:   Rob Herring <robh+dt@kernel.org>
Date:   Tue, 5 Nov 2019 11:07:46 -0600
X-Gmail-Original-Message-ID: <CAL_JsqL6Nzr2oBh51PZnQfBUK1ggDcZUrLaSP2GvEycwFAwJZw@mail.gmail.com>
Message-ID: <CAL_JsqL6Nzr2oBh51PZnQfBUK1ggDcZUrLaSP2GvEycwFAwJZw@mail.gmail.com>
Subject: Re: [PATCH v2 2/4] dt-bindings: display: bridge: Repurpose lvds-encoder
To:     Fabrizio Castro <fabrizio.castro@bp.renesas.com>
Cc:     Neil Armstrong <narmstrong@baylibre.com>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Mark Rutland <mark.rutland@arm.com>,
        Andrzej Hajda <a.hajda@samsung.com>,
        Simon Horman <horms@verge.net.au>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Peter Rosin <peda@axentia.se>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "open list:MEDIA DRIVERS FOR RENESAS - FCP" 
        <linux-renesas-soc@vger.kernel.org>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        Jacopo Mondi <jacopo+renesas@jmondi.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Tue, Nov 5, 2019 at 3:33 AM Fabrizio Castro
<fabrizio.castro@bp.renesas.com> wrote:
>
> Hello Rob,
>
> Thank you for your feedback!
>
> > From: Rob Herring <robh+dt@kernel.org>
> > Sent: 04 November 2019 21:23
> > Subject: Re: [PATCH v2 2/4] dt-bindings: display: bridge: Repurpose lvds-encoder
> >
> > On Mon, Nov 4, 2019 at 10:58 AM Fabrizio Castro
> > <fabrizio.castro@bp.renesas.com> wrote:
> > >
> > > In an effort to repurpose lvds-encoder.c to also serve the
> > > function of LVDS decoders, we ended up defining a new "generic"
> > > compatible string, therefore adapt the dt-bindings to fit the
> > > new purpose. Also, convert the dt-bindings from .txt to .yaml
> > > while at it.
> >
> > "Also, ... while at it." is a sign for split into 2 patches.
>
> Will split into 2 patches
>
> >
> > > Signed-off-by: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
> > >
> > > ---
> > > v1->v2:
> > > * Converted to dt-schema as per Neil's comment
> > > ---
> > >  .../bindings/display/bridge/lvds-codec.yaml        | 117 +++++++++++++++++++++
> > >  .../bindings/display/bridge/lvds-transmitter.txt   |  66 ------------
> > >  2 files changed, 117 insertions(+), 66 deletions(-)
> > >  create mode 100644 Documentation/devicetree/bindings/display/bridge/lvds-codec.yaml
> > >  delete mode 100644 Documentation/devicetree/bindings/display/bridge/lvds-transmitter.txt
> > >
> > > diff --git a/Documentation/devicetree/bindings/display/bridge/lvds-codec.yaml
> > b/Documentation/devicetree/bindings/display/bridge/lvds-codec.yaml
> > > new file mode 100644
> > > index 0000000..ff79bc2
> > > --- /dev/null
> > > +++ b/Documentation/devicetree/bindings/display/bridge/lvds-codec.yaml
> > > @@ -0,0 +1,117 @@
> > > +# SPDX-License-Identifier: GPL-2.0
> > > +%YAML 1.2
> > > +---
> > > +$id: http://devicetree.org/schemas/display/bridge/lvds-codec.yaml#
> > > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > > +
> > > +title: Trasnparent LVDS encoders and LVDS decoders
> >
> > Typo
>
> Will fix
>
> >
> > > +
> > > +maintainers:
> > > +  - Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> > > +
> > > +description: |
> > > +  This binding supports transparent LVDS encoders and LVDS decoders that don't
> > > +  require any configuration.
> > > +
> > > +  LVDS is a physical layer specification defined in ANSI/TIA/EIA-644-A. Multiple
> > > +  incompatible data link layers have been used over time to transmit image data
> > > +  to LVDS panels. This binding targets devices compatible with the following
> > > +  specifications only.
> > > +
> > > +  [JEIDA] "Digital Interface Standards for Monitor", JEIDA-59-1999, February
> > > +  1999 (Version 1.0), Japan Electronic Industry Development Association (JEIDA)
> > > +  [LDI] "Open LVDS Display Interface", May 1999 (Version 0.95), National
> > > +  Semiconductor
> > > +  [VESA] "VESA Notebook Panel Standard", October 2007 (Version 1.0), Video
> > > +  Electronics Standards Association (VESA)
> > > +
> > > +  Those devices have been marketed under the FPD-Link and FlatLink brand names
> > > +  among others.
> > > +
> > > +properties:
> > > +  compatible:
> > > +    description: |
> > > +      Any encoder or decoder compatible with this generic binding, but with
> > > +      additional properties not listed here, must define its own binding and
> > > +      list a device specific compatible first followed by the generic compatible
> > > +    items:
> > > +      - enum:
> >
> > You can drop 'items' when there's only 1.
>
> Will drop
>
> >
> > > +        - lvds-encoder # for LVDS encoders
> > > +        - lvds-decoder # for LVDS decoders
> > > +
> > > +  ports:
> > > +    type: object
> > > +    description: |
> > > +      This device has two video ports. Their connections are modeled using the
> > > +      OF graph bindings specified in Documentation/devicetree/bindings/graph.txt
> > > +    properties:
> > > +      port@0:
> > > +        type: object
> > > +        description: |
> > > +          With LVDS encoders port 0 is for parallel input
> > > +          With LVDS decoders port 0 is for LVDS input
> > > +
> > > +      port@1:
> > > +        type: object
> > > +        description: |
> > > +          With LVDS encoders port 1 is for LVDS output
> > > +          With LVDS decoders port 1 is for parallel output
> >
> > port@* are required, right?
>
> Yes, port@0 and port@1 are both required, similarly to:
> Documentation/devicetree/bindings/display/st,stm32-dsi.yaml
> therefore I have put "ports" under "required", in a similar fashion.
> What's the right way of specifying this?

Same as any other property:

required:
  - port@0
  - port@1

At the correct level of course.

Rob
