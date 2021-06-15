Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3B54F3A7B1E
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 15 Jun 2021 11:49:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231561AbhFOJvJ (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 15 Jun 2021 05:51:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58580 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231380AbhFOJvH (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 15 Jun 2021 05:51:07 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4956AC061574;
        Tue, 15 Jun 2021 02:49:03 -0700 (PDT)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id B357D436;
        Tue, 15 Jun 2021 11:49:01 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1623750541;
        bh=2O5bHa7no7GiMMkWJ1EnLf+s8ECdLbBlDrujHAC/4kA=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=wYRveDIrhd+2xNAbkJ8ATpB+YMbvCPLEXv3+5UHSR+ljVGG/V/9L0qw7c0QDVG/R/
         zy2ZUTPqeGXhqPUW5R4886OrGuln3bT+PoX9ev1SUixNoRSDCn4e0uDkjePAYM3GRK
         REQsOrUvNoI5WN1kX5FiJoCgMz5G/Xr47prIZcso=
Date:   Tue, 15 Jun 2021 12:48:40 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     Biju Das <biju.das.jz@bp.renesas.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        linux-clk <linux-clk@vger.kernel.org>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: Re: [PATCH 2/6] drivers: clk: renesas: r9a07g044-cpg: Add USB clocks
Message-ID: <YMh3eD55uP3XfEFI@pendragon.ideasonboard.com>
References: <20210611134642.24029-1-biju.das.jz@bp.renesas.com>
 <20210611134642.24029-3-biju.das.jz@bp.renesas.com>
 <CAMuHMdXpOGWLMXph9OGeZqZiy33O_y5z2XfAf0YzQgb4q_8+rA@mail.gmail.com>
 <CAMuHMdV=AcCgwJqiEoUyK9cDnyT-arOVSNFS5Z1xxXQ7PeZzkg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CAMuHMdV=AcCgwJqiEoUyK9cDnyT-arOVSNFS5Z1xxXQ7PeZzkg@mail.gmail.com>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Geert,

On Tue, Jun 15, 2021 at 10:58:57AM +0200, Geert Uytterhoeven wrote:
> On Mon, Jun 14, 2021 at 2:26 PM Geert Uytterhoeven <geert@linux-m68k.org> wrote:
> > On Fri, Jun 11, 2021 at 3:46 PM Biju Das <biju.das.jz@bp.renesas.com> wrote:
> > > Add clock entries for USB{0,1}.
> > >
> > > Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> > > Reviewed-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> >
> > Thanks for your patch!
> >
> > > --- a/drivers/clk/renesas/r9a07g044-cpg.c
> > > +++ b/drivers/clk/renesas/r9a07g044-cpg.c
> > > @@ -88,6 +88,12 @@ static struct rzg2l_mod_clk r9a07g044_mod_clks[] = {
> > >         DEF_MOD("dmac",         R9A07G044_CLK_DMAC,
> > >                                 R9A07G044_CLK_P1,
> > >                                 0x52c, (BIT(0) | BIT(1)), (BIT(0) | BIT(1))),
> > > +       DEF_MOD("usb0",         R9A07G044_CLK_USB0,
> > > +                               R9A07G044_CLK_P1,
> > > +                               0x578, (BIT(0) | BIT(2) | BIT(3)), (BIT(0) | BIT(2) | BIT(3))),
> > > +       DEF_MOD("usb1",         R9A07G044_CLK_USB1,
> > > +                               R9A07G044_CLK_P1,
> > > +                               0x578, (BIT(1) | BIT(3)), (BIT(1) | BIT(3))),
> > >         DEF_MOD("scif0",        R9A07G044_CLK_SCIF0,
> > >                                 R9A07G044_CLK_P0,
> > >                                 0x584, BIT(0), BIT(0)),
> >
> > While the above matches the datasheet, I see a problem with the
> > implementation. As BIT(3) of the CPG_{CLKON,CLKMON,RST}_USB is shared by
> > the two USB2.0 channels, disabling USB_PCLK or asserting USB_PRESETN
> > will affect both channels.  So it looks like you need special handling
> > to make sure that doesn't happen while the other channel is in use.
> >
> > Or am I missing something?
> 
> I'm getting the impression we do have to model the individual bits
> as separate clocks (and resets).  That would solve the problem with
> the shared USB_PCLK, as the clock framework will take care of keeping
> it enabled when at least one channel is in use.
> 
> Besides USB, SDHI has 4 clock bits, which we definitely don't want
> to control together, as the card detect clock must not be stopped
> while suspended.
> However, the exception to the rule is Ethernet: each channel has
> 2 clocks, but only a single bit to control, so this needs a custom
> single-gate-for-dual-clock driver.

Does it ? Can't the same clock be referenced twice in DT ?

> Perhaps merging the clock binding definitions and initial driver for
> v5.14 was a bit premature...
> Anyway, we'll have 6 rcs after v5.14-rc1 to get it right ;-)
> 
> What do you think?

-- 
Regards,

Laurent Pinchart
