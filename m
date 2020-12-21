Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3C8142DFEF1
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 21 Dec 2020 18:29:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725878AbgLURWJ (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 21 Dec 2020 12:22:09 -0500
Received: from mail.kernel.org ([198.145.29.99]:60828 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725865AbgLURWJ (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 21 Dec 2020 12:22:09 -0500
X-Gm-Message-State: AOAM531uEysNefMpx4fVbcz2zyHwSKHT5UWHm9jRJ8tdK18rSzTCLGGW
        cQ2C5NnIDwXORJzlRZ+Mzgfi97R1nhT+gLBonA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1608571288;
        bh=p5L2uvw4Xw+mZGbmFeQMvwPwFMJocnpG1YnXWsC/ohg=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=AJhEeG3D0NCcWY94nRwWg0zaYAmvBrMIc2IbaEH2l4bQXK2Qa2qhdwcueWBnTjXJV
         duNCE9wz/I4BRX54iuAJ/PNZP/qIMAy1h+eGSYZwEkt66dwYNs6Hmzm4ndgOSg09sx
         8VwciqfN/zz8DS6Ty3fO0Yrfsh0JJVvyGxTii5vnzpo7mRFlVR+5iakkCpw/da5r3Y
         Or7VJW1FJyhjy5VCVpYtmUs9NgvxeLSz+sCO7qN74Tw1AJdk5YrAVO5HCoOJwmdnfU
         VssrjvVOrz0qRBE1c3JrFtaYlnQv5JlD/BfYkgXfVpEZiDipZAfHkvBmLm1t4S8y2j
         WDTYPCK6lnAEQ==
X-Google-Smtp-Source: ABdhPJxPmMLSn2dIoItk6K6RGiGZOaFEwhtsPT9myepBMIU4F8QBp+whNX0o/pIvd85eWVABdHjZUR2RaRzFyhLMM2k=
X-Received: by 2002:aed:2c63:: with SMTP id f90mr17171370qtd.31.1608571287494;
 Mon, 21 Dec 2020 09:21:27 -0800 (PST)
MIME-Version: 1.0
References: <20201216145231.1344317-1-geert+renesas@glider.be>
 <20201217235919.GA456454@robh.at.kernel.org> <CAMuHMdVO29He-KHDLp3S=2JyGwOT=tLcDCOw6MPqBvcBLdUCOw@mail.gmail.com>
 <CAL_JsqLcjhRgkTh=SNEpbq-uuv3LixJ3ivSw+TQvPdCCEtFYNw@mail.gmail.com> <CAMuHMdUqB9+3kKHe42nMHAzp5qrJbv2DbKh7fcPPw07R1yhcMA@mail.gmail.com>
In-Reply-To: <CAMuHMdUqB9+3kKHe42nMHAzp5qrJbv2DbKh7fcPPw07R1yhcMA@mail.gmail.com>
From:   Rob Herring <robh@kernel.org>
Date:   Mon, 21 Dec 2020 10:21:16 -0700
X-Gmail-Original-Message-ID: <CAL_Jsq+qBmmR8pOabb21JRVVXdHGT1c6xPbeGEmr+OBMjjkV2A@mail.gmail.com>
Message-ID: <CAL_Jsq+qBmmR8pOabb21JRVVXdHGT1c6xPbeGEmr+OBMjjkV2A@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: clk: versaclock5: Miscellaneous fixes and improvements:
To:     Geert Uytterhoeven <geert@linux-m68k.org>
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

On Sun, Dec 20, 2020 at 3:24 AM Geert Uytterhoeven <geert@linux-m68k.org> wrote:
>
> Hi Rob,
>
> On Fri, Dec 18, 2020 at 11:32 PM Rob Herring <robh@kernel.org> wrote:
> > On Fri, Dec 18, 2020 at 5:42 AM Geert Uytterhoeven <geert@linux-m68k.org> wrote:
> > > On Fri, Dec 18, 2020 at 12:59 AM Rob Herring <robh@kernel.org> wrote:
> > > > On Wed, Dec 16, 2020 at 03:52:31PM +0100, Geert Uytterhoeven wrote:
> > > > >   - Add reference to clock.yaml, and switch to unevaluatedProperties, to
> > > > >     stop complaining about the presence of "assigned-clock-rates" and
> > > > >     "assigned-clocks" in board DTS files,
>
> > > > > Fixes: 45c940184b501fc6 ("dt-bindings: clk: versaclock5: convert to yaml")
> > > > > Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> > > > > ---
> > > > > Notes:
> > > > >   1. The use of "idt,voltage-microvolts" (with trailing S) is a bit
> > > > >      unfortunate, as Documentation/devicetree/bindings/property-units.txt
> > > > >      suggests to not have the trailing edge.
> > > > >      Can we still fix the driver and bindings?  While this entered
> > > > >      uptstream in v5.9, there are no users in next-20201216.
> > > > >
> > > > >   2. Due to "clock-output-names" being part of
> > > > >      dt-schema/schemas/clock/clock.yaml, the presence of this property
> > > > >      does not trigger an error.  Adding "clock-output-names: false"
> > > > >      can fix that.  But given this property is deprecated, except for
> > > > >      very specific use cases, explicitly allowing it for those few use
> > > > >      cases would be better.
> > > > > ---
> > > > >  .../bindings/clock/idt,versaclock5.yaml       | 53 ++++++++++---------
> > > > >  1 file changed, 29 insertions(+), 24 deletions(-)
> > > > >
> > > > > diff --git a/Documentation/devicetree/bindings/clock/idt,versaclock5.yaml b/Documentation/devicetree/bindings/clock/idt,versaclock5.yaml
> > > > > index 2ac1131fd9222a86..14851e76f6342095 100644
> > > > > --- a/Documentation/devicetree/bindings/clock/idt,versaclock5.yaml
> > > > > +++ b/Documentation/devicetree/bindings/clock/idt,versaclock5.yaml
> > > > > @@ -33,6 +33,9 @@ description: |
> > > > >  maintainers:
> > > > >    - Luca Ceresoli <luca@lucaceresoli.net>
> > > > >
> > > > > +allOf:
> > > > > +  - $ref: clock.yaml#
> > > >
> > > > No, that's not right. clock.yaml is already applied unconditionally.
> > >
> > > But without that, it complains about unevaluatedProperties?
> >
> > By design. You can't have other properties outside your binding unless
> > you have a $ref to other schemas. Also, note that there's not a single
> > other ref to clock.yaml.
> >
> > > > You need to define assigned-clocks, etc. here just like 'clocks' and
> > > > define how many entries. Or convince me they should be allowed on any
> > > > node.
> > >
> > > They are handled by of_clk_set_defaults(), which is applied to all
> > > clock providers.
> >
> > What does that Linux implementation detail have to do with the bindings?
>
> I consider Linux the reference implementation.
> Is there any other real reference implementation? ;-)

No comment. ;)

> > The only other exception we have is pinctrl properties. They often
> > aren't that interesting unless you have more than one (maybe we should
> > only automatically allow the single case). That's maybe true in the
> > assigned-clocks case too. However the big difference I see is pinctrl
> > properties are almost always present whereas assign-clocks is more the
> > exception. So I think it's good to be explicit where they are used.
>
> The problem with the assigned-clock* properties is that the DT binding
> writer has no idea if they will be ever used or not.  These properties
> come into play at an even higher level than the pinctrl properties.
> While the DT binding writer usually[1] knows if there can be pinctrl
> properties or not, this is not the case for the assigned-clock*
> properties.  The former are expected and mandatory, the latter are
> optional, and are added only during the system integration phase, and
> may appear everywhere.
>
> So I think they should be allowed on any node.  Unless we decide
> assigned-clock* properties are a bad idea in general.

Okay, let's add them automatically I guess. We can at least make them
dependent on having a 'clocks' property.

Rob
