Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0D14C3A79AE
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 15 Jun 2021 10:59:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230502AbhFOJBN (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 15 Jun 2021 05:01:13 -0400
Received: from mail-vs1-f45.google.com ([209.85.217.45]:44007 "EHLO
        mail-vs1-f45.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230455AbhFOJBM (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 15 Jun 2021 05:01:12 -0400
Received: by mail-vs1-f45.google.com with SMTP id s22so9369589vsl.10;
        Tue, 15 Jun 2021 01:59:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=izvYy7Sc0VI9xdiId3+4IwhNeyVRCCQq1Dzhvww+mfM=;
        b=Hxia41UHfkB817Zq32Oy3Bg4ZIbKmcj6gjXzZNxTFH8L0RFAfUFl7POkxe/qGRxqjb
         q86igcHb/YaZ7mTOuyP6MJe67VouhaATXNTCMLPq9Uhodbr2OGTGKiiFBfdd/sPuuIMo
         0FkG4jWYndeZas+6xNLpOatfTHeEJM15fbwFLl5/juIAwdd/i7BeW3eR5g4uTypOG/P/
         cddcGaYrPwTu68c++lVAwRkAAh/0k81vjXduKeX6nOA0saQQWC6GbbAmaAmygQxbSyyj
         GgOZHMX+zAraUespGb0LX7xvZjiRgqhIbxztLTCW4oz3PyxO++Ul5yCkxKUgTnizw7lX
         FLBA==
X-Gm-Message-State: AOAM5309obUo41Haddnk3M6W1wwcddddBlCoWqmTP0H2/DkIGjszzWbh
        XSZdTIFXv5b2DRQ7ccOJ+nOeonzJFE0MocRocCHuJ65J/TEcAg==
X-Google-Smtp-Source: ABdhPJwF15eJQMRbtDbtjpIe0EX758jxacGhS7hqIfuudsn8sr7nFD/sOCFLnGCByomrfdgQ7oH8A0kmeMCwY8tM2EU=
X-Received: by 2002:a67:efd6:: with SMTP id s22mr3860831vsp.3.1623747548208;
 Tue, 15 Jun 2021 01:59:08 -0700 (PDT)
MIME-Version: 1.0
References: <20210611134642.24029-1-biju.das.jz@bp.renesas.com>
 <20210611134642.24029-3-biju.das.jz@bp.renesas.com> <CAMuHMdXpOGWLMXph9OGeZqZiy33O_y5z2XfAf0YzQgb4q_8+rA@mail.gmail.com>
In-Reply-To: <CAMuHMdXpOGWLMXph9OGeZqZiy33O_y5z2XfAf0YzQgb4q_8+rA@mail.gmail.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Tue, 15 Jun 2021 10:58:57 +0200
Message-ID: <CAMuHMdV=AcCgwJqiEoUyK9cDnyT-arOVSNFS5Z1xxXQ7PeZzkg@mail.gmail.com>
Subject: Re: [PATCH 2/6] drivers: clk: renesas: r9a07g044-cpg: Add USB clocks
To:     Biju Das <biju.das.jz@bp.renesas.com>
Cc:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        linux-clk <linux-clk@vger.kernel.org>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Biju,

On Mon, Jun 14, 2021 at 2:26 PM Geert Uytterhoeven <geert@linux-m68k.org> wrote:
> On Fri, Jun 11, 2021 at 3:46 PM Biju Das <biju.das.jz@bp.renesas.com> wrote:
> > Add clock entries for USB{0,1}.
> >
> > Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> > Reviewed-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> Thanks for your patch!
>
> > --- a/drivers/clk/renesas/r9a07g044-cpg.c
> > +++ b/drivers/clk/renesas/r9a07g044-cpg.c
> > @@ -88,6 +88,12 @@ static struct rzg2l_mod_clk r9a07g044_mod_clks[] = {
> >         DEF_MOD("dmac",         R9A07G044_CLK_DMAC,
> >                                 R9A07G044_CLK_P1,
> >                                 0x52c, (BIT(0) | BIT(1)), (BIT(0) | BIT(1))),
> > +       DEF_MOD("usb0",         R9A07G044_CLK_USB0,
> > +                               R9A07G044_CLK_P1,
> > +                               0x578, (BIT(0) | BIT(2) | BIT(3)), (BIT(0) | BIT(2) | BIT(3))),
> > +       DEF_MOD("usb1",         R9A07G044_CLK_USB1,
> > +                               R9A07G044_CLK_P1,
> > +                               0x578, (BIT(1) | BIT(3)), (BIT(1) | BIT(3))),
> >         DEF_MOD("scif0",        R9A07G044_CLK_SCIF0,
> >                                 R9A07G044_CLK_P0,
> >                                 0x584, BIT(0), BIT(0)),
>
> While the above matches the datasheet, I see a problem with the
> implementation. As BIT(3) of the CPG_{CLKON,CLKMON,RST}_USB is shared by
> the two USB2.0 channels, disabling USB_PCLK or asserting USB_PRESETN
> will affect both channels.  So it looks like you need special handling
> to make sure that doesn't happen while the other channel is in use.
>
> Or am I missing something?

I'm getting the impression we do have to model the individual bits
as separate clocks (and resets).  That would solve the problem with
the shared USB_PCLK, as the clock framework will take care of keeping
it enabled when at least one channel is in use.

Besides USB, SDHI has 4 clock bits, which we definitely don't want
to control together, as the card detect clock must not be stopped
while suspended.
However, the exception to the rule is Ethernet: each channel has
2 clocks, but only a single bit to control, so this needs a custom
single-gate-for-dual-clock driver.

Perhaps merging the clock binding definitions and initial driver for
v5.14 was a bit premature...
Anyway, we'll have 6 rcs after v5.14-rc1 to get it right ;-)

What do you think?

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
