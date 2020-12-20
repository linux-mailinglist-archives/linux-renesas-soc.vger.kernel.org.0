Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 229322DF500
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 20 Dec 2020 11:25:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727025AbgLTKZB (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Sun, 20 Dec 2020 05:25:01 -0500
Received: from mail-ot1-f51.google.com ([209.85.210.51]:45588 "EHLO
        mail-ot1-f51.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727010AbgLTKZB (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sun, 20 Dec 2020 05:25:01 -0500
Received: by mail-ot1-f51.google.com with SMTP id n42so351729ota.12;
        Sun, 20 Dec 2020 02:24:45 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=p6eJ7M6+DgSPuaY8dPwpUBQ01OeOw+6vtTkrgGAnxVQ=;
        b=orY4IuBnBI6HAMYkE2qzVQKmez4eLTC/1DuRQmkZ8McBRKI7+oAklchogo92ObRdH2
         dL+C+W9vcVCjnHfXikxOmx2/2CXAiAWT8+p9roGdZu1y+HTqllX+bDlNrPtaLMBhevyG
         ZlE1nmSTsg5g/0mNX0rZVo/aBP5KrEtjCaAYSHgDIDFUVf0QSyDBgorFeiYS1dsjXkKh
         YLDPt3KaNjt9//4wxlm9taU5yAX+zYlQ19WTwiWuTFHW6wM7r6GRSwh8b0CinaDy09NE
         NvQjj3G1zNdS/nRkVjHnIs98EBd2bq0cpgNk6LeZNvnU/J9OuwGkPGQnIfgv1NmQAIbr
         Ua/Q==
X-Gm-Message-State: AOAM532GFg46gertZ1iEVbaH4Siqk6hFfOwAjdFuOKN/pTdcRcfz/7hc
        C9d0uvP2DVfKOzfcEs5FK6IMxvEblr2b2k4ntH4=
X-Google-Smtp-Source: ABdhPJx+D+n1DhtltwSt2EvZ4jH5IiWww/7AaN7ZepCvZFfANG/t+CGjCPWLbIuvBWyl3ZMRXEFWkcFd/jv1x5mGU4Q=
X-Received: by 2002:a05:6830:210a:: with SMTP id i10mr8547368otc.145.1608459860225;
 Sun, 20 Dec 2020 02:24:20 -0800 (PST)
MIME-Version: 1.0
References: <20201216145231.1344317-1-geert+renesas@glider.be>
 <20201217235919.GA456454@robh.at.kernel.org> <CAMuHMdVO29He-KHDLp3S=2JyGwOT=tLcDCOw6MPqBvcBLdUCOw@mail.gmail.com>
 <CAL_JsqLcjhRgkTh=SNEpbq-uuv3LixJ3ivSw+TQvPdCCEtFYNw@mail.gmail.com>
In-Reply-To: <CAL_JsqLcjhRgkTh=SNEpbq-uuv3LixJ3ivSw+TQvPdCCEtFYNw@mail.gmail.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Sun, 20 Dec 2020 11:24:08 +0100
Message-ID: <CAMuHMdUqB9+3kKHe42nMHAzp5qrJbv2DbKh7fcPPw07R1yhcMA@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: clk: versaclock5: Miscellaneous fixes and improvements:
To:     Rob Herring <robh@kernel.org>
Cc:     Luca Ceresoli <luca@lucaceresoli.net>,
        Adam Ford <aford173@gmail.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        linux-clk <linux-clk@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Rob,

On Fri, Dec 18, 2020 at 11:32 PM Rob Herring <robh@kernel.org> wrote:
> On Fri, Dec 18, 2020 at 5:42 AM Geert Uytterhoeven <geert@linux-m68k.org> wrote:
> > On Fri, Dec 18, 2020 at 12:59 AM Rob Herring <robh@kernel.org> wrote:
> > > On Wed, Dec 16, 2020 at 03:52:31PM +0100, Geert Uytterhoeven wrote:
> > > >   - Add reference to clock.yaml, and switch to unevaluatedProperties, to
> > > >     stop complaining about the presence of "assigned-clock-rates" and
> > > >     "assigned-clocks" in board DTS files,

> > > > Fixes: 45c940184b501fc6 ("dt-bindings: clk: versaclock5: convert to yaml")
> > > > Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> > > > ---
> > > > Notes:
> > > >   1. The use of "idt,voltage-microvolts" (with trailing S) is a bit
> > > >      unfortunate, as Documentation/devicetree/bindings/property-units.txt
> > > >      suggests to not have the trailing edge.
> > > >      Can we still fix the driver and bindings?  While this entered
> > > >      uptstream in v5.9, there are no users in next-20201216.
> > > >
> > > >   2. Due to "clock-output-names" being part of
> > > >      dt-schema/schemas/clock/clock.yaml, the presence of this property
> > > >      does not trigger an error.  Adding "clock-output-names: false"
> > > >      can fix that.  But given this property is deprecated, except for
> > > >      very specific use cases, explicitly allowing it for those few use
> > > >      cases would be better.
> > > > ---
> > > >  .../bindings/clock/idt,versaclock5.yaml       | 53 ++++++++++---------
> > > >  1 file changed, 29 insertions(+), 24 deletions(-)
> > > >
> > > > diff --git a/Documentation/devicetree/bindings/clock/idt,versaclock5.yaml b/Documentation/devicetree/bindings/clock/idt,versaclock5.yaml
> > > > index 2ac1131fd9222a86..14851e76f6342095 100644
> > > > --- a/Documentation/devicetree/bindings/clock/idt,versaclock5.yaml
> > > > +++ b/Documentation/devicetree/bindings/clock/idt,versaclock5.yaml
> > > > @@ -33,6 +33,9 @@ description: |
> > > >  maintainers:
> > > >    - Luca Ceresoli <luca@lucaceresoli.net>
> > > >
> > > > +allOf:
> > > > +  - $ref: clock.yaml#
> > >
> > > No, that's not right. clock.yaml is already applied unconditionally.
> >
> > But without that, it complains about unevaluatedProperties?
>
> By design. You can't have other properties outside your binding unless
> you have a $ref to other schemas. Also, note that there's not a single
> other ref to clock.yaml.
>
> > > You need to define assigned-clocks, etc. here just like 'clocks' and
> > > define how many entries. Or convince me they should be allowed on any
> > > node.
> >
> > They are handled by of_clk_set_defaults(), which is applied to all
> > clock providers.
>
> What does that Linux implementation detail have to do with the bindings?

I consider Linux the reference implementation.
Is there any other real reference implementation? ;-)

> The only other exception we have is pinctrl properties. They often
> aren't that interesting unless you have more than one (maybe we should
> only automatically allow the single case). That's maybe true in the
> assigned-clocks case too. However the big difference I see is pinctrl
> properties are almost always present whereas assign-clocks is more the
> exception. So I think it's good to be explicit where they are used.

The problem with the assigned-clock* properties is that the DT binding
writer has no idea if they will be ever used or not.  These properties
come into play at an even higher level than the pinctrl properties.
While the DT binding writer usually[1] knows if there can be pinctrl
properties or not, this is not the case for the assigned-clock*
properties.  The former are expected and mandatory, the latter are
optional, and are added only during the system integration phase, and
may appear everywhere.

So I think they should be allowed on any node.  Unless we decide
assigned-clock* properties are a bad idea in general.

[1] Unless the bindings are written initially for an IP core in an SoC
    that doesn't have pinctrl for the related pins, and the IP core is
    reused later in an SoC that does have pinctrl.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
