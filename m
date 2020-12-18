Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 068332DE21E
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 18 Dec 2020 12:43:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726256AbgLRLmw (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 18 Dec 2020 06:42:52 -0500
Received: from mail-ot1-f41.google.com ([209.85.210.41]:45642 "EHLO
        mail-ot1-f41.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725710AbgLRLmw (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 18 Dec 2020 06:42:52 -0500
Received: by mail-ot1-f41.google.com with SMTP id h18so1594032otq.12;
        Fri, 18 Dec 2020 03:42:36 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=hspCpWkXqd6IcgOQp9Fs7ymkdUd3LEicCVc4QESQhZQ=;
        b=GEbIR59+qu+XtsJzQtsINYzI1uXUykUY9a/ALL45CHRdTYYWoFbv3stzX8Dm7E+i13
         CWs1UNddggNp6XWxbFMYziW2wW0Wywo7KQKkt6Y2ZxTB2FTopsdDil/98YQbwAvzMPdn
         BhtrQXBaXI3akDFSLfwz0gG61HnmnqzprhmpajjUaQ7Wr8I+nqg4xafUc8QcptyYlcEW
         dmQalHtiV4jtq8mpKqZvsjBJmqRuVm2+QyiGebndhTkufu7b42xQO6J7nWe2Imvytq2U
         GnBBbg0xpGRfvD+7md1OapmnJT6xF3bymY8JS9TjhGgvxNOY5GvQOwSMX8iXjRSNZW3O
         FK9w==
X-Gm-Message-State: AOAM5323K3QMrdJgY1x8vS1ejlZSzNcGcTQYqtdo0PNlGa4bHhk8xuHy
        glhp62hmotakdbWqWsw/MYATaSmJITj1F4Gvj5o=
X-Google-Smtp-Source: ABdhPJx3TFZxpMf8dvYUErvuGCH1MqJNhv78Sa50rDyIcFpCDau27vV7e3Lg9WjxQDJZ/8wNqgPT89ge177NB+i6UKw=
X-Received: by 2002:a05:6830:1f5a:: with SMTP id u26mr2481735oth.250.1608291731258;
 Fri, 18 Dec 2020 03:42:11 -0800 (PST)
MIME-Version: 1.0
References: <20201216145231.1344317-1-geert+renesas@glider.be> <20201217235919.GA456454@robh.at.kernel.org>
In-Reply-To: <20201217235919.GA456454@robh.at.kernel.org>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Fri, 18 Dec 2020 12:42:00 +0100
Message-ID: <CAMuHMdVO29He-KHDLp3S=2JyGwOT=tLcDCOw6MPqBvcBLdUCOw@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: clk: versaclock5: Miscellaneous fixes and improvements:
To:     Rob Herring <robh@kernel.org>
Cc:     Luca Ceresoli <luca@lucaceresoli.net>,
        Adam Ford <aford173@gmail.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        linux-clk <linux-clk@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Rob,

On Fri, Dec 18, 2020 at 12:59 AM Rob Herring <robh@kernel.org> wrote:
> On Wed, Dec 16, 2020 at 03:52:31PM +0100, Geert Uytterhoeven wrote:
> >   - Add reference to clock.yaml, and switch to unevaluatedProperties, to
> >     stop complaining about the presence of "assigned-clock-rates" and
> >     "assigned-clocks" in board DTS files,
> >   - Fix typo in "idt,voltage-microvolts" property name, to match example
> >     and driver code,
> >   - Add missing reference for "idt,voltage-microvolts",
> >   - Add missing "additionalProperties: false" for subnodes, to catch
> >     typos in properties,
> >   - There is no reason to wrap the (single) if condition in an allOf
> >     block,
>
> True, but more future proof with it and unnecessary churn IMO.

OK, I'll drop that part.

> >   - Fix obsolete property names in example.
> >
> > Fixes: 45c940184b501fc6 ("dt-bindings: clk: versaclock5: convert to yaml")
> > Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> > ---
> > Notes:
> >   1. The use of "idt,voltage-microvolts" (with trailing S) is a bit
> >      unfortunate, as Documentation/devicetree/bindings/property-units.txt
> >      suggests to not have the trailing edge.
> >      Can we still fix the driver and bindings?  While this entered
> >      uptstream in v5.9, there are no users in next-20201216.
> >
> >   2. Due to "clock-output-names" being part of
> >      dt-schema/schemas/clock/clock.yaml, the presence of this property
> >      does not trigger an error.  Adding "clock-output-names: false"
> >      can fix that.  But given this property is deprecated, except for
> >      very specific use cases, explicitly allowing it for those few use
> >      cases would be better.
> > ---
> >  .../bindings/clock/idt,versaclock5.yaml       | 53 ++++++++++---------
> >  1 file changed, 29 insertions(+), 24 deletions(-)
> >
> > diff --git a/Documentation/devicetree/bindings/clock/idt,versaclock5.yaml b/Documentation/devicetree/bindings/clock/idt,versaclock5.yaml
> > index 2ac1131fd9222a86..14851e76f6342095 100644
> > --- a/Documentation/devicetree/bindings/clock/idt,versaclock5.yaml
> > +++ b/Documentation/devicetree/bindings/clock/idt,versaclock5.yaml
> > @@ -33,6 +33,9 @@ description: |
> >  maintainers:
> >    - Luca Ceresoli <luca@lucaceresoli.net>
> >
> > +allOf:
> > +  - $ref: clock.yaml#
>
> No, that's not right. clock.yaml is already applied unconditionally.

But without that, it complains about unevaluatedProperties?

> You need to define assigned-clocks, etc. here just like 'clocks' and
> define how many entries. Or convince me they should be allowed on any
> node.

They are handled by of_clk_set_defaults(), which is applied to all
clock providers.

> > @@ -73,40 +76,42 @@ patternProperties:
> >          $ref: /schemas/types.yaml#/definitions/uint32
> >          minimum: 0
> >          maximum: 6
> > -      idt,voltage-microvolt:
> > +      idt,voltage-microvolts:
>
> Can we fix the driver? No in tree users...

I think so.  Will do so.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
