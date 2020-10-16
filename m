Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 68E4928FFA8
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 16 Oct 2020 10:02:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2404979AbgJPICB (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 16 Oct 2020 04:02:01 -0400
Received: from relay8-d.mail.gandi.net ([217.70.183.201]:38409 "EHLO
        relay8-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2404892AbgJPICA (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 16 Oct 2020 04:02:00 -0400
X-Originating-IP: 93.34.118.233
Received: from uno.localdomain (93-34-118-233.ip49.fastwebnet.it [93.34.118.233])
        (Authenticated sender: jacopo@jmondi.org)
        by relay8-d.mail.gandi.net (Postfix) with ESMTPSA id 22A9E1BF210;
        Fri, 16 Oct 2020 08:01:56 +0000 (UTC)
Date:   Fri, 16 Oct 2020 12:01:42 +0200
From:   Jacopo Mondi <jacopo@jmondi.org>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     Sergei Shtylyov <sergei.shtylyov@gmail.com>,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 4/6] clk: renesas: r8a779a0: Add VIN[00-31] clocks
Message-ID: <20201016100142.c6fg4xltz5m6dbjp@uno.localdomain>
References: <20201014094443.11070-1-jacopo+renesas@jmondi.org>
 <20201014094443.11070-5-jacopo+renesas@jmondi.org>
 <0de062e4-0385-444b-1abc-881c313a6479@gmail.com>
 <20201015093227.y3n5ohzuydg2fe3t@uno.localdomain>
 <CAMuHMdVNmQ6f09M8Hkrq0xuMNtQM4RGDOrmPENNRcWz36gZXgA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CAMuHMdVNmQ6f09M8Hkrq0xuMNtQM4RGDOrmPENNRcWz36gZXgA@mail.gmail.com>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Geert,

On Thu, Oct 15, 2020 at 06:30:03PM +0200, Geert Uytterhoeven wrote:
> Hi Jacopo,
>
> On Thu, Oct 15, 2020 at 9:32 AM Jacopo Mondi <jacopo@jmondi.org> wrote:
> > On Wed, Oct 14, 2020 at 09:55:32PM +0300, Sergei Shtylyov wrote:
> > > On 10/14/20 12:44 PM, Jacopo Mondi wrote:
> > > > Add clock definitions of the VIN instances for R-Car V3U.
> > > >
> > > > Signed-off-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
> > > >
> > > > ---
> > > > Clocks at indexes 730 and 731 are named 'vin0' and 'vin1'.
> > > > I assumed it's a typographic error and renamed them 'vin00' and 'vin01'

Add this to the list of things which not exactly clear in the current
documentation

> > > > ---
> > > >  drivers/clk/renesas/r8a779a0-cpg-mssr.c | 32 +++++++++++++++++++++++++
> > > >  1 file changed, 32 insertions(+)
> > > >
> > > > diff --git a/drivers/clk/renesas/r8a779a0-cpg-mssr.c b/drivers/clk/renesas/r8a779a0-cpg-mssr.c
> > > > index bd54a28c50ee..2a00eb82013f 100644
> > > > --- a/drivers/clk/renesas/r8a779a0-cpg-mssr.c
> > > > +++ b/drivers/clk/renesas/r8a779a0-cpg-mssr.c
> > > > @@ -149,6 +149,38 @@ static const struct mssr_mod_clk r8a779a0_mod_clks[] __initconst = {
> > > >     DEF_MOD("scif1",        703,    R8A779A0_CLK_S1D8),
> > > >     DEF_MOD("scif3",        704,    R8A779A0_CLK_S1D8),
> > > >     DEF_MOD("scif4",        705,    R8A779A0_CLK_S1D8),
> > > > +   DEF_MOD("vin00",        730,    R8A779A0_CLK_S1D1),
> > > > +   DEF_MOD("vin01",        731,    R8A779A0_CLK_S1D1),
> > > > +   DEF_MOD("vin02",        800,    R8A779A0_CLK_S1D1),
> > > > +   DEF_MOD("vin03",        801,    R8A779A0_CLK_S1D1),
> > > > +   DEF_MOD("vin04",        802,    R8A779A0_CLK_S1D1),
> > > > +   DEF_MOD("vin05",        803,    R8A779A0_CLK_S1D1),
> > > > +   DEF_MOD("vin06",        804,    R8A779A0_CLK_S1D1),
> > > > +   DEF_MOD("vin07",        805,    R8A779A0_CLK_S1D1),
> > > > +   DEF_MOD("vin10",        806,    R8A779A0_CLK_S1D1),
> > > > +   DEF_MOD("vin11",        807,    R8A779A0_CLK_S1D1),
> > > > +   DEF_MOD("vin12",        808,    R8A779A0_CLK_S1D1),
> > > > +   DEF_MOD("vin13",        809,    R8A779A0_CLK_S1D1),
> > > > +   DEF_MOD("vin14",        810,    R8A779A0_CLK_S1D1),
> > > > +   DEF_MOD("vin15",        811,    R8A779A0_CLK_S1D1),
> > > > +   DEF_MOD("vin16",        812,    R8A779A0_CLK_S1D1),
> > > > +   DEF_MOD("vin17",        813,    R8A779A0_CLK_S1D1),
> > > > +   DEF_MOD("vin20",        814,    R8A779A0_CLK_S1D1),
> > > > +   DEF_MOD("vin21",        815,    R8A779A0_CLK_S1D1),
> > > > +   DEF_MOD("vin22",        816,    R8A779A0_CLK_S1D1),
> > > > +   DEF_MOD("vin23",        817,    R8A779A0_CLK_S1D1),
> > > > +   DEF_MOD("vin24",        818,    R8A779A0_CLK_S1D1),
> > > > +   DEF_MOD("vin25",        819,    R8A779A0_CLK_S1D1),
> > > > +   DEF_MOD("vin26",        820,    R8A779A0_CLK_S1D1),
> > > > +   DEF_MOD("vin27",        821,    R8A779A0_CLK_S1D1),
> > > > +   DEF_MOD("vin30",        822,    R8A779A0_CLK_S1D1),
> > > > +   DEF_MOD("vin31",        823,    R8A779A0_CLK_S1D1),
> > > > +   DEF_MOD("vin32",        824,    R8A779A0_CLK_S1D1),
> > > > +   DEF_MOD("vin33",        825,    R8A779A0_CLK_S1D1),
> > > > +   DEF_MOD("vin34",        826,    R8A779A0_CLK_S1D1),
> > > > +   DEF_MOD("vin35",        827,    R8A779A0_CLK_S1D1),
> > > > +   DEF_MOD("vin36",        828,    R8A779A0_CLK_S1D1),
> > > > +   DEF_MOD("vin37",        829,    R8A779A0_CLK_S1D1),
> >
> > >    The subject says VIN[0-31]?
> >
> > There are 32 VIN instances (hence the [0-31] in the subject), grouped
> > in 4 units of 8 channels each.
> >
> > I can drop the [0-31] in the subject if it's confusing.
>
> The VIN naming in the R-Car V3U documentation is very confusing.
> E.g. all of the following are used, and refer to the same channel:
>   1. VIN37,
>   2. VIN31,
>   3. vin3 ch7.
>
> Looks good to me, but I cannot verify the parent clocks

I got them from the downstream driver, as they're not documented.

> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Thanks
  j

>
> Gr{oetje,eeting}s,
>
>                         Geert
>
> --
> Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org
>
> In personal conversations with technical people, I call myself a hacker. But
> when I'm talking to journalists I just say "programmer" or something like that.
>                                 -- Linus Torvalds
