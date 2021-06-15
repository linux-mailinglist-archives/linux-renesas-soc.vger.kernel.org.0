Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 28C5A3A7B3A
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 15 Jun 2021 11:53:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231474AbhFOJzx (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 15 Jun 2021 05:55:53 -0400
Received: from mail-ua1-f47.google.com ([209.85.222.47]:42811 "EHLO
        mail-ua1-f47.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231379AbhFOJzx (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 15 Jun 2021 05:55:53 -0400
Received: by mail-ua1-f47.google.com with SMTP id e20so3256870ual.9;
        Tue, 15 Jun 2021 02:53:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=FEogTkNIdGRD1G+bYTsWF39qCTv6R9PBMHpopAATaCk=;
        b=aCJlhVH5Mo47++fUuzcEv4112rb2GExqDZRsJTv+v83xIuNqAY+KgCJjvZIAYcoDRW
         +06KLtNhO13nvqTcrSByEeoUMICL+kym4aBitbmYfsDow/OIe9jk2WHDSIdG3HBcmDt6
         QxLqroLt+lnPedTRT+fPF7MrGLiDAGA+pPhh6kbZBPC2StfXLYdbZ1A1HQcJnFE/Xpgq
         +H1CW/+oAAs6C2h5QW2FuoDvPQE470SWH2UDpZEE7MwOPRs1Rbe1itoHFL+I+6Eghh3V
         W1eKlzPl2iDAqw16SoaSDo6wO6uFlwESQFOZ0SXFh6NYuFeHH4DEetWzVU/iPYOy/RHp
         EuiA==
X-Gm-Message-State: AOAM530NeSE2kK5mXFzZOsdXVOmP8TIstR2LxqFzCZopxhpyX5rcIpHw
        6sZXqmnYFux5YdPDyksMnzrkTrdJNi4s5Gxk9GA=
X-Google-Smtp-Source: ABdhPJyuGsR9b7Vlb/qxOS+oyVMSLTKjnse6g7/6uhxyjcZL2rrEpoP+dHhXNYpYeiLydVbzR13M4sSw5FM8PCiKZtI=
X-Received: by 2002:ab0:63d9:: with SMTP id i25mr16830194uap.106.1623750828882;
 Tue, 15 Jun 2021 02:53:48 -0700 (PDT)
MIME-Version: 1.0
References: <20210611134642.24029-1-biju.das.jz@bp.renesas.com>
 <20210611134642.24029-3-biju.das.jz@bp.renesas.com> <CAMuHMdXpOGWLMXph9OGeZqZiy33O_y5z2XfAf0YzQgb4q_8+rA@mail.gmail.com>
 <CAMuHMdV=AcCgwJqiEoUyK9cDnyT-arOVSNFS5Z1xxXQ7PeZzkg@mail.gmail.com> <YMh3eD55uP3XfEFI@pendragon.ideasonboard.com>
In-Reply-To: <YMh3eD55uP3XfEFI@pendragon.ideasonboard.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Tue, 15 Jun 2021 11:53:37 +0200
Message-ID: <CAMuHMdV46wrvUNwhQ11VVutHrw6SmpnQv4S1RiDoL+KKzkUrHA@mail.gmail.com>
Subject: Re: [PATCH 2/6] drivers: clk: renesas: r9a07g044-cpg: Add USB clocks
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Biju Das <biju.das.jz@bp.renesas.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        linux-clk <linux-clk@vger.kernel.org>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Laurent,

On Tue, Jun 15, 2021 at 11:49 AM Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
> On Tue, Jun 15, 2021 at 10:58:57AM +0200, Geert Uytterhoeven wrote:
> > On Mon, Jun 14, 2021 at 2:26 PM Geert Uytterhoeven <geert@linux-m68k.org> wrote:
> > > On Fri, Jun 11, 2021 at 3:46 PM Biju Das <biju.das.jz@bp.renesas.com> wrote:
> > > > Add clock entries for USB{0,1}.
> > > >
> > > > Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> > > > Reviewed-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > >
> > > Thanks for your patch!
> > >
> > > > --- a/drivers/clk/renesas/r9a07g044-cpg.c
> > > > +++ b/drivers/clk/renesas/r9a07g044-cpg.c
> > > > @@ -88,6 +88,12 @@ static struct rzg2l_mod_clk r9a07g044_mod_clks[] = {
> > > >         DEF_MOD("dmac",         R9A07G044_CLK_DMAC,
> > > >                                 R9A07G044_CLK_P1,
> > > >                                 0x52c, (BIT(0) | BIT(1)), (BIT(0) | BIT(1))),
> > > > +       DEF_MOD("usb0",         R9A07G044_CLK_USB0,
> > > > +                               R9A07G044_CLK_P1,
> > > > +                               0x578, (BIT(0) | BIT(2) | BIT(3)), (BIT(0) | BIT(2) | BIT(3))),
> > > > +       DEF_MOD("usb1",         R9A07G044_CLK_USB1,
> > > > +                               R9A07G044_CLK_P1,
> > > > +                               0x578, (BIT(1) | BIT(3)), (BIT(1) | BIT(3))),
> > > >         DEF_MOD("scif0",        R9A07G044_CLK_SCIF0,
> > > >                                 R9A07G044_CLK_P0,
> > > >                                 0x584, BIT(0), BIT(0)),
> > >
> > > While the above matches the datasheet, I see a problem with the
> > > implementation. As BIT(3) of the CPG_{CLKON,CLKMON,RST}_USB is shared by
> > > the two USB2.0 channels, disabling USB_PCLK or asserting USB_PRESETN
> > > will affect both channels.  So it looks like you need special handling
> > > to make sure that doesn't happen while the other channel is in use.
> > >
> > > Or am I missing something?
> >
> > I'm getting the impression we do have to model the individual bits
> > as separate clocks (and resets).  That would solve the problem with
> > the shared USB_PCLK, as the clock framework will take care of keeping
> > it enabled when at least one channel is in use.
> >
> > Besides USB, SDHI has 4 clock bits, which we definitely don't want
> > to control together, as the card detect clock must not be stopped
> > while suspended.
> > However, the exception to the rule is Ethernet: each channel has
> > 2 clocks, but only a single bit to control, so this needs a custom
> > single-gate-for-dual-clock driver.
>
> Does it ? Can't the same clock be referenced twice in DT ?

Yes, you can reference the same clock twice. But what's the point?
If they're two different clocks, DT should reference two different
clocks.  But the single bit should correspond to the ORed value of
the two clock enable states.

Or do you mean something different?

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
