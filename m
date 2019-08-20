Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A0FF696432
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 20 Aug 2019 17:23:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728682AbfHTPWy (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 20 Aug 2019 11:22:54 -0400
Received: from kirsty.vergenet.net ([202.4.237.240]:37416 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728277AbfHTPWy (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 20 Aug 2019 11:22:54 -0400
Received: from reginn.horms.nl (watermunt.horms.nl [80.127.179.77])
        by kirsty.vergenet.net (Postfix) with ESMTPA id 3760A25AD7E;
        Wed, 21 Aug 2019 01:22:52 +1000 (AEST)
Received: by reginn.horms.nl (Postfix, from userid 7100)
        id 1A08D9403FF; Tue, 20 Aug 2019 17:22:50 +0200 (CEST)
Date:   Tue, 20 Aug 2019 17:22:50 +0200
From:   Simon Horman <horms@verge.net.au>
To:     Magnus Damm <magnus.damm@gmail.com>
Cc:     linux-kernel <linux-kernel@vger.kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        devicetree@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Thomas Gleixner <tglx@linutronix.de>
Subject: Re: [PATCH 6/7] clocksource/drivers/sh_cmt: r8a7740 and sh73a0
 SoC-specific match
Message-ID: <20190820152249.kg3udh2aonjusbqk@verge.net.au>
References: <156345023791.5307.6113391102648394591.sendpatchset@octo>
 <156345032407.5307.16702422867507502597.sendpatchset@octo>
 <20190724111227.qaeq3d5mkeyvlkq3@verge.net.au>
 <CANqRtoTN3Ea6LK2BwdUevWOPRiquBWmw=foEDPMzsRut08QcPA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CANqRtoTN3Ea6LK2BwdUevWOPRiquBWmw=foEDPMzsRut08QcPA@mail.gmail.com>
Organisation: Horms Solutions BV
User-Agent: NeoMutt/20170113 (1.7.2)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Tue, Aug 20, 2019 at 09:34:13PM +0900, Magnus Damm wrote:
> Hi Simon,
> 
> On Wed, Jul 24, 2019 at 8:12 PM Simon Horman <horms@verge.net.au> wrote:
> >
> > On Thu, Jul 18, 2019 at 08:45:24PM +0900, Magnus Damm wrote:
> > > From: Magnus Damm <damm+renesas@opensource.se>
> > >
> > > Add SoC-specific matching for CMT1 on r8a7740 and sh73a0.
> > >
> > > This allows us to move away from the old DT bindings such as
> > >  - "renesas,cmt-48-sh73a0"
> > >  - "renesas,cmt-48-r8a7740"
> > >  - "renesas,cmt-48"
> > > in favour for the now commonly used format "renesas,<soc>-<device>"
> > >
> > > Signed-off-by: Magnus Damm <damm+renesas@opensource.se>
> >
> > Reviewed-by: Simon Horman <horms+renesas@verge.net.au>
> 
> Thanks!
> 
> > > ---
> > >
> > >  drivers/clocksource/sh_cmt.c |    8 ++++++++
> > >  1 file changed, 8 insertions(+)
> > >
> > > --- 0001/drivers/clocksource/sh_cmt.c
> > > +++ work/drivers/clocksource/sh_cmt.c 2019-07-18 19:29:06.005414716 +0900
> > > @@ -928,6 +928,14 @@ static const struct of_device_id sh_cmt_
> > >               .data = &sh_cmt_info[SH_CMT0_RCAR_GEN2]
> > >       },
> > >       {
> > > +             .compatible = "renesas,r8a7740-cmt1",
> > > +             .data = &sh_cmt_info[SH_CMT_48BIT]
> >
> > Perhaps as a follow-up SH_CMT_48BIT could be renamed.
> 
> I was actually considering implementing proper 48-bit support, and
> reworking those names might be a good idea at that point.

Sure, I don't think there is any urgency on updating the name :)
