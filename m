Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 59A532DEBA4
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 18 Dec 2020 23:33:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726143AbgLRWd1 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 18 Dec 2020 17:33:27 -0500
Received: from mail.kernel.org ([198.145.29.99]:47126 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725836AbgLRWd1 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 18 Dec 2020 17:33:27 -0500
X-Gm-Message-State: AOAM531xGHH4uwPJQabwPyW9wqjpKqR3SpZTlqrH3stFxMKqpSGLXz2N
        u6IIndsTmuJ6bCWvCJS90JKihhQyIVj9I75+HA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1608330766;
        bh=9fdx5WlqMP3pT3GHHMBYbo7LX62Ad+VX0C8DiUhWuF8=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=fjb93JuE7gZk/1mLUbBUqoWkM1ddVOz4+IKaYcWM09nDcxqP/P0tTObKXz49JA+DH
         cm4Ohb7fnx7P+ohBgeU/TgWMfbThBgs+8NNwlzZoza+yOAvt7QKAkyL4wGFtj+/JQ3
         hlBnN8b5RvwFaUuL9bEKapgt6DEiXTYn5Pyu+mGOCNB43jz3bxuc367jv1HffU/CQ4
         ejwejW5MNsvPE5GP6q0QHrAE/HUN6SkBPnWVgKX8pyOZpoiOKC88gIX+7y0aaizQvs
         qoxf+750lIQKl5jCFE+Mc6OWClXlCWjf4YzEa9qqZ0AOOWIiHQjmZkOYzd8ggorbaJ
         0cYsIer0ckhZg==
X-Google-Smtp-Source: ABdhPJzOETG31WDEzknD8yJ8gpRVCi3kctdvpVOk4NcK0WFHXzCWvcU10Xdus/e6nXonbdeA3CiKSpG+AcAQl4R0/g8=
X-Received: by 2002:a17:906:1197:: with SMTP id n23mr6097055eja.359.1608330765040;
 Fri, 18 Dec 2020 14:32:45 -0800 (PST)
MIME-Version: 1.0
References: <20201216145231.1344317-1-geert+renesas@glider.be>
 <20201217235919.GA456454@robh.at.kernel.org> <CAMuHMdVO29He-KHDLp3S=2JyGwOT=tLcDCOw6MPqBvcBLdUCOw@mail.gmail.com>
In-Reply-To: <CAMuHMdVO29He-KHDLp3S=2JyGwOT=tLcDCOw6MPqBvcBLdUCOw@mail.gmail.com>
From:   Rob Herring <robh@kernel.org>
Date:   Fri, 18 Dec 2020 16:32:32 -0600
X-Gmail-Original-Message-ID: <CAL_JsqLcjhRgkTh=SNEpbq-uuv3LixJ3ivSw+TQvPdCCEtFYNw@mail.gmail.com>
Message-ID: <CAL_JsqLcjhRgkTh=SNEpbq-uuv3LixJ3ivSw+TQvPdCCEtFYNw@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: clk: versaclock5: Miscellaneous fixes and improvements:
To:     Geert Uytterhoeven <geert@linux-m68k.org>
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

On Fri, Dec 18, 2020 at 5:42 AM Geert Uytterhoeven <geert@linux-m68k.org> wrote:
>
> Hi Rob,
>
> On Fri, Dec 18, 2020 at 12:59 AM Rob Herring <robh@kernel.org> wrote:
> > On Wed, Dec 16, 2020 at 03:52:31PM +0100, Geert Uytterhoeven wrote:
> > >   - Add reference to clock.yaml, and switch to unevaluatedProperties, to
> > >     stop complaining about the presence of "assigned-clock-rates" and
> > >     "assigned-clocks" in board DTS files,
> > >   - Fix typo in "idt,voltage-microvolts" property name, to match example
> > >     and driver code,
> > >   - Add missing reference for "idt,voltage-microvolts",
> > >   - Add missing "additionalProperties: false" for subnodes, to catch
> > >     typos in properties,
> > >   - There is no reason to wrap the (single) if condition in an allOf
> > >     block,
> >
> > True, but more future proof with it and unnecessary churn IMO.
>
> OK, I'll drop that part.
>
> > >   - Fix obsolete property names in example.
> > >
> > > Fixes: 45c940184b501fc6 ("dt-bindings: clk: versaclock5: convert to yaml")
> > > Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> > > ---
> > > Notes:
> > >   1. The use of "idt,voltage-microvolts" (with trailing S) is a bit
> > >      unfortunate, as Documentation/devicetree/bindings/property-units.txt
> > >      suggests to not have the trailing edge.
> > >      Can we still fix the driver and bindings?  While this entered
> > >      uptstream in v5.9, there are no users in next-20201216.
> > >
> > >   2. Due to "clock-output-names" being part of
> > >      dt-schema/schemas/clock/clock.yaml, the presence of this property
> > >      does not trigger an error.  Adding "clock-output-names: false"
> > >      can fix that.  But given this property is deprecated, except for
> > >      very specific use cases, explicitly allowing it for those few use
> > >      cases would be better.
> > > ---
> > >  .../bindings/clock/idt,versaclock5.yaml       | 53 ++++++++++---------
> > >  1 file changed, 29 insertions(+), 24 deletions(-)
> > >
> > > diff --git a/Documentation/devicetree/bindings/clock/idt,versaclock5.yaml b/Documentation/devicetree/bindings/clock/idt,versaclock5.yaml
> > > index 2ac1131fd9222a86..14851e76f6342095 100644
> > > --- a/Documentation/devicetree/bindings/clock/idt,versaclock5.yaml
> > > +++ b/Documentation/devicetree/bindings/clock/idt,versaclock5.yaml
> > > @@ -33,6 +33,9 @@ description: |
> > >  maintainers:
> > >    - Luca Ceresoli <luca@lucaceresoli.net>
> > >
> > > +allOf:
> > > +  - $ref: clock.yaml#
> >
> > No, that's not right. clock.yaml is already applied unconditionally.
>
> But without that, it complains about unevaluatedProperties?

By design. You can't have other properties outside your binding unless
you have a $ref to other schemas. Also, note that there's not a single
other ref to clock.yaml.

> > You need to define assigned-clocks, etc. here just like 'clocks' and
> > define how many entries. Or convince me they should be allowed on any
> > node.
>
> They are handled by of_clk_set_defaults(), which is applied to all
> clock providers.

What does that Linux implementation detail have to do with the bindings?

The only other exception we have is pinctrl properties. They often
aren't that interesting unless you have more than one (maybe we should
only automatically allow the single case). That's maybe true in the
assigned-clocks case too. However the big difference I see is pinctrl
properties are almost always present whereas assign-clocks is more the
exception. So I think it's good to be explicit where they are used.

Rob
