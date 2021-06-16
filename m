Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A25D63A9956
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 16 Jun 2021 13:33:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232217AbhFPLgE (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 16 Jun 2021 07:36:04 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:56190 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229503AbhFPLgD (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 16 Jun 2021 07:36:03 -0400
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 4E5A9F88;
        Wed, 16 Jun 2021 13:33:56 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1623843236;
        bh=9sGN/TjgzfusPBMorh0h9O3174ld/ClyunSZpH5CG8M=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=h/JdCI5d6Z6eoJMMiHLHyNsu88Mu6FhThagcsSk+ORkSSP37PEmoHUTl2mboARZRS
         9zUg+cdkwqd88oWkGzVA0ssaJml1fmY3BK6/UFd3NImvtt1LIEQP/rq143qvTiPXU6
         qjE0cAj7mLtBMHm32M1811NmGiP3VIaUCfXCSlnc=
Date:   Wed, 16 Jun 2021 14:33:35 +0300
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
Message-ID: <YMnhj3FeCm1MGvO7@pendragon.ideasonboard.com>
References: <20210611134642.24029-1-biju.das.jz@bp.renesas.com>
 <20210611134642.24029-3-biju.das.jz@bp.renesas.com>
 <CAMuHMdXpOGWLMXph9OGeZqZiy33O_y5z2XfAf0YzQgb4q_8+rA@mail.gmail.com>
 <CAMuHMdV=AcCgwJqiEoUyK9cDnyT-arOVSNFS5Z1xxXQ7PeZzkg@mail.gmail.com>
 <YMh3eD55uP3XfEFI@pendragon.ideasonboard.com>
 <CAMuHMdV46wrvUNwhQ11VVutHrw6SmpnQv4S1RiDoL+KKzkUrHA@mail.gmail.com>
 <YMh5jWeONR6s+bwU@pendragon.ideasonboard.com>
 <CAMuHMdXHN-ThgpED0wUcWQjWyinnxQC8Yp_st-CWGpUj6mGmxw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CAMuHMdXHN-ThgpED0wUcWQjWyinnxQC8Yp_st-CWGpUj6mGmxw@mail.gmail.com>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Geert,

On Tue, Jun 15, 2021 at 12:24:52PM +0200, Geert Uytterhoeven wrote:
> On Tue, Jun 15, 2021 at 11:57 AM Laurent Pinchart wrote:
> > On Tue, Jun 15, 2021 at 11:53:37AM +0200, Geert Uytterhoeven wrote:
> > > On Tue, Jun 15, 2021 at 11:49 AM Laurent Pinchart wrote:
> > > > On Tue, Jun 15, 2021 at 10:58:57AM +0200, Geert Uytterhoeven wrote:
> > > > > On Mon, Jun 14, 2021 at 2:26 PM Geert Uytterhoeven wrote:
> > > > > > On Fri, Jun 11, 2021 at 3:46 PM Biju Das wrote:
> > > > > > > Add clock entries for USB{0,1}.
> > > > > > >
> > > > > > > Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> > > > > > > Reviewed-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > > > > >
> > > > > > Thanks for your patch!
> > > > > >
> > > > > > > --- a/drivers/clk/renesas/r9a07g044-cpg.c
> > > > > > > +++ b/drivers/clk/renesas/r9a07g044-cpg.c
> > > > > > > @@ -88,6 +88,12 @@ static struct rzg2l_mod_clk r9a07g044_mod_clks[] = {
> > > > > > >         DEF_MOD("dmac",         R9A07G044_CLK_DMAC,
> > > > > > >                                 R9A07G044_CLK_P1,
> > > > > > >                                 0x52c, (BIT(0) | BIT(1)), (BIT(0) | BIT(1))),
> > > > > > > +       DEF_MOD("usb0",         R9A07G044_CLK_USB0,
> > > > > > > +                               R9A07G044_CLK_P1,
> > > > > > > +                               0x578, (BIT(0) | BIT(2) | BIT(3)), (BIT(0) | BIT(2) | BIT(3))),
> > > > > > > +       DEF_MOD("usb1",         R9A07G044_CLK_USB1,
> > > > > > > +                               R9A07G044_CLK_P1,
> > > > > > > +                               0x578, (BIT(1) | BIT(3)), (BIT(1) | BIT(3))),
> > > > > > >         DEF_MOD("scif0",        R9A07G044_CLK_SCIF0,
> > > > > > >                                 R9A07G044_CLK_P0,
> > > > > > >                                 0x584, BIT(0), BIT(0)),
> > > > > >
> > > > > > While the above matches the datasheet, I see a problem with the
> > > > > > implementation. As BIT(3) of the CPG_{CLKON,CLKMON,RST}_USB is shared by
> > > > > > the two USB2.0 channels, disabling USB_PCLK or asserting USB_PRESETN
> > > > > > will affect both channels.  So it looks like you need special handling
> > > > > > to make sure that doesn't happen while the other channel is in use.
> > > > > >
> > > > > > Or am I missing something?
> > > > >
> > > > > I'm getting the impression we do have to model the individual bits
> > > > > as separate clocks (and resets).  That would solve the problem with
> > > > > the shared USB_PCLK, as the clock framework will take care of keeping
> > > > > it enabled when at least one channel is in use.
> > > > >
> > > > > Besides USB, SDHI has 4 clock bits, which we definitely don't want
> > > > > to control together, as the card detect clock must not be stopped
> > > > > while suspended.
> > > > > However, the exception to the rule is Ethernet: each channel has
> > > > > 2 clocks, but only a single bit to control, so this needs a custom
> > > > > single-gate-for-dual-clock driver.
> > > >
> > > > Does it ? Can't the same clock be referenced twice in DT ?
> > >
> > > Yes, you can reference the same clock twice. But what's the point?
> > > If they're two different clocks, DT should reference two different
> > > clocks.  But the single bit should correspond to the ORed value of
> > > the two clock enable states.
> > >
> > > Or do you mean something different?
> >
> > If the device has two clock inputs, I'd model the two clocks separately
> > in the DT bindings. If those two clocks are gated by the same bit in an
> > SoC, we have two options to model the integration:
> >
> > - Create a driver that registers different clocks with the same gating
> >   bit. We'll have two clocks to reference in DT.
> 
> OK, that's what I suggested.
> 
> > - Model both clocks as a single clock in the clock driver, and reference
> >   that clock twice in DT. This is simpler, but only works if the
> >   consumer doesn't need to query the clock rate.
> 
> Modelling them as a single clock is how the current RZ/G2L clock
> driver would implement it. But why bother referencing it twice in DT?
> renesas,ether*.yaml (assuming the Ethernet block is compatible)
> documents a single clock only (ignoring optional refclk), and the driver
> doesn't care about the clock rate.

The idea here is that if the device has two clock inputs, its driver
could handle clocks without knowing that in some SoCs they are handled
by a single gate (or rather two gates with the same control signal).

-- 
Regards,

Laurent Pinchart
