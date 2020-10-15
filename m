Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7482D28EDC3
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 15 Oct 2020 09:32:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727321AbgJOHcr (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 15 Oct 2020 03:32:47 -0400
Received: from relay8-d.mail.gandi.net ([217.70.183.201]:45769 "EHLO
        relay8-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726103AbgJOHcq (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 15 Oct 2020 03:32:46 -0400
X-Originating-IP: 93.34.118.233
Received: from uno.localdomain (93-34-118-233.ip49.fastwebnet.it [93.34.118.233])
        (Authenticated sender: jacopo@jmondi.org)
        by relay8-d.mail.gandi.net (Postfix) with ESMTPSA id ABE6D1BF205;
        Thu, 15 Oct 2020 07:32:43 +0000 (UTC)
Date:   Thu, 15 Oct 2020 11:32:27 +0200
From:   Jacopo Mondi <jacopo@jmondi.org>
To:     Sergei Shtylyov <sergei.shtylyov@gmail.com>
Cc:     Jacopo Mondi <jacopo+renesas@jmondi.org>,
        linux-renesas-soc@vger.kernel.org, geert+renesas@glider.be,
        laurent.pinchart@ideasonboard.com, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 4/6] clk: renesas: r8a779a0: Add VIN[00-31] clocks
Message-ID: <20201015093227.y3n5ohzuydg2fe3t@uno.localdomain>
References: <20201014094443.11070-1-jacopo+renesas@jmondi.org>
 <20201014094443.11070-5-jacopo+renesas@jmondi.org>
 <0de062e4-0385-444b-1abc-881c313a6479@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <0de062e4-0385-444b-1abc-881c313a6479@gmail.com>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Sergei,

On Wed, Oct 14, 2020 at 09:55:32PM +0300, Sergei Shtylyov wrote:
> On 10/14/20 12:44 PM, Jacopo Mondi wrote:
>
> > Add clock definitions of the VIN instances for R-Car V3U.
> >
> > Signed-off-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
> >
> > ---
> > Clocks at indexes 730 and 731 are named 'vin0' and 'vin1'.
> > I assumed it's a typographic error and renamed them 'vin00' and 'vin01'
> > ---
> >  drivers/clk/renesas/r8a779a0-cpg-mssr.c | 32 +++++++++++++++++++++++++
> >  1 file changed, 32 insertions(+)
> >
> > diff --git a/drivers/clk/renesas/r8a779a0-cpg-mssr.c b/drivers/clk/renesas/r8a779a0-cpg-mssr.c
> > index bd54a28c50ee..2a00eb82013f 100644
> > --- a/drivers/clk/renesas/r8a779a0-cpg-mssr.c
> > +++ b/drivers/clk/renesas/r8a779a0-cpg-mssr.c
> > @@ -149,6 +149,38 @@ static const struct mssr_mod_clk r8a779a0_mod_clks[] __initconst = {
> >  	DEF_MOD("scif1",	703,	R8A779A0_CLK_S1D8),
> >  	DEF_MOD("scif3",	704,	R8A779A0_CLK_S1D8),
> >  	DEF_MOD("scif4",	705,	R8A779A0_CLK_S1D8),
> > +	DEF_MOD("vin00",	730,	R8A779A0_CLK_S1D1),
> > +	DEF_MOD("vin01",	731,	R8A779A0_CLK_S1D1),
> > +	DEF_MOD("vin02",	800,	R8A779A0_CLK_S1D1),
> > +	DEF_MOD("vin03",	801,	R8A779A0_CLK_S1D1),
> > +	DEF_MOD("vin04",	802,	R8A779A0_CLK_S1D1),
> > +	DEF_MOD("vin05",	803,	R8A779A0_CLK_S1D1),
> > +	DEF_MOD("vin06",	804,	R8A779A0_CLK_S1D1),
> > +	DEF_MOD("vin07",	805,	R8A779A0_CLK_S1D1),
> > +	DEF_MOD("vin10",	806,	R8A779A0_CLK_S1D1),
> > +	DEF_MOD("vin11",	807,	R8A779A0_CLK_S1D1),
> > +	DEF_MOD("vin12",	808,	R8A779A0_CLK_S1D1),
> > +	DEF_MOD("vin13",	809,	R8A779A0_CLK_S1D1),
> > +	DEF_MOD("vin14",	810,	R8A779A0_CLK_S1D1),
> > +	DEF_MOD("vin15",	811,	R8A779A0_CLK_S1D1),
> > +	DEF_MOD("vin16",	812,	R8A779A0_CLK_S1D1),
> > +	DEF_MOD("vin17",	813,	R8A779A0_CLK_S1D1),
> > +	DEF_MOD("vin20",	814,	R8A779A0_CLK_S1D1),
> > +	DEF_MOD("vin21",	815,	R8A779A0_CLK_S1D1),
> > +	DEF_MOD("vin22",	816,	R8A779A0_CLK_S1D1),
> > +	DEF_MOD("vin23",	817,	R8A779A0_CLK_S1D1),
> > +	DEF_MOD("vin24",	818,	R8A779A0_CLK_S1D1),
> > +	DEF_MOD("vin25",	819,	R8A779A0_CLK_S1D1),
> > +	DEF_MOD("vin26",	820,	R8A779A0_CLK_S1D1),
> > +	DEF_MOD("vin27",	821,	R8A779A0_CLK_S1D1),
> > +	DEF_MOD("vin30",	822,	R8A779A0_CLK_S1D1),
> > +	DEF_MOD("vin31",	823,	R8A779A0_CLK_S1D1),
> > +	DEF_MOD("vin32",	824,	R8A779A0_CLK_S1D1),
> > +	DEF_MOD("vin33",	825,	R8A779A0_CLK_S1D1),
> > +	DEF_MOD("vin34",	826,	R8A779A0_CLK_S1D1),
> > +	DEF_MOD("vin35",	827,	R8A779A0_CLK_S1D1),
> > +	DEF_MOD("vin36",	828,	R8A779A0_CLK_S1D1),
> > +	DEF_MOD("vin37",	829,	R8A779A0_CLK_S1D1),

There are 32 VIN instances (hence the [0-31] in the subject), grouped
in 4 units of 8 channels each.

I can drop the [0-31] in the subject if it's confusing.

>
>    The subject says VIN[0-31]?
>
> [...]
>
> MBR, Sergei
