Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4F911392D08
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 27 May 2021 13:47:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234012AbhE0LtB (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 27 May 2021 07:49:01 -0400
Received: from mail-ua1-f45.google.com ([209.85.222.45]:36433 "EHLO
        mail-ua1-f45.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233633AbhE0LtB (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 27 May 2021 07:49:01 -0400
Received: by mail-ua1-f45.google.com with SMTP id b1so32493uap.3;
        Thu, 27 May 2021 04:47:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=MsBQ4Q5uVxLNj8Ul/iePVuRBGV+cnzR1jbtuFYV4EZ0=;
        b=c0xvo/JwuuRRb2SXO15WqxPEdsAs5UT3RMNLcEvjd4ANfpvCYlIMqg9gYsTnCW5cv1
         B/hupkCskdlceEdUTfnUfdj5hjUanrgH5S4+8gzd18yNrE+aP1okhkYj6SqPLNw4x/gj
         ughhwUePLbr9/4F45vnytGCsn7x7UQmNLnyz0jaLZIZ2NUE5vw1pzjM+2z0RF4fBdAOc
         Um6juaAnnCmYi5gB3ilBCkI7eJ5Dn6BdSIg/iGgWKMLG9Su/OKFg3+6ZNGLl5ItDjGxh
         N3kHaqpRMRHLkW7MGGqwjznn1mB3XJTKBN6qPSu+M55O0iyiL/ZV7WtBB090iAwmq/+x
         2sug==
X-Gm-Message-State: AOAM5334IE3kxh0ucnirhq51BqIOcXkpe4rZpDpNPl5uO+9juDjlkuHh
        GKIkvLgpTVL04XK4dGfdWfbBlq3TyDjP1nzLb7K3CY40
X-Google-Smtp-Source: ABdhPJxtpCZMaXr7F6D5isqhbntEmor5OBA8Rb5CQorqKhpEyu5WxZJa8xiG/V/zm1UfZsM+AFHfaWPqHA8At/PLQmI=
X-Received: by 2002:ab0:2a8b:: with SMTP id h11mr1643377uar.4.1622116047643;
 Thu, 27 May 2021 04:47:27 -0700 (PDT)
MIME-Version: 1.0
References: <20210514192218.13022-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20210514192218.13022-5-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <CAMuHMdVOTfV9XBo0t0CxGU1=Zo3VjFioDaDU1rdX8Hb6Pvz-Zw@mail.gmail.com> <CA+V-a8to86aG-1eB38OfaydJ7U0g4p1x8biRfBSnOa1S2g3bvA@mail.gmail.com>
In-Reply-To: <CA+V-a8to86aG-1eB38OfaydJ7U0g4p1x8biRfBSnOa1S2g3bvA@mail.gmail.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Thu, 27 May 2021 13:47:15 +0200
Message-ID: <CAMuHMdXGVshtJ_YzGHtzhvXk5DZwcWbbM18E5Yo5rTMCrbO3Fw@mail.gmail.com>
Subject: Re: [PATCH 04/16] soc: renesas: Add ARCH_R9A07G044{L,LC} for the new
 RZ/G2{L,LC} SoC's
To:     "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Cc:     Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        Rob Herring <robh+dt@kernel.org>,
        Magnus Damm <magnus.damm@gmail.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>,
        Jiri Slaby <jirislaby@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        linux-clk <linux-clk@vger.kernel.org>,
        "open list:SERIAL DRIVERS" <linux-serial@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        Biju Das <biju.das.jz@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Prabhakar,

On Fri, May 21, 2021 at 7:21 PM Lad, Prabhakar
<prabhakar.csengg@gmail.com> wrote:
> On Fri, May 21, 2021 at 2:25 PM Geert Uytterhoeven <geert@linux-m68k.org> wrote:
> > On Fri, May 14, 2021 at 9:23 PM Lad Prabhakar
> > <prabhakar.mahadev-lad.rj@bp.renesas.com> wrote:
> > > Add ARCH_R9A07G044{L,LC} as a configuration symbol for the new Renesas
> > > RZ/G2{L,LC} SoC's.
> > >
> > > Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > > Reviewed-by: Biju Das <biju.das.jz@bp.renesas.com>
> >
> > Thanks for your patch!
> >
> > > --- a/drivers/soc/renesas/Kconfig
> > > +++ b/drivers/soc/renesas/Kconfig
> > > @@ -279,6 +279,16 @@ config ARCH_R8A774B1
> > >         help
> > >           This enables support for the Renesas RZ/G2N SoC.
> > >
> > > +config ARCH_R9A07G044L
> > > +       bool "ARM64 Platform support for RZ/G2L SoC"
> >
> > Please drop the "SoC", for consistency with other entries.
> >
> Oops will do that.
>
> > > +       help
> > > +         This enables support for the Renesas RZ/G2L SoC.
> > > +
> > > +config ARCH_R9A07G044LC
> > > +       bool "ARM64 Platform support for RZ/G2LC SoC"
> >
> > Likewise.
> >
> will do.
>
> > > +       help
> > > +         This enables support for the Renesas RZ/G2LC SoC.
> > > +
> > >  endif # ARM64
> >
> > Given LSI DEVID is the same, do we need both, or can we do with a
> > single ARCH_R9A07G044?
> >
> The reason behind adding separate configs was in case if we wanted to
> just build an image for RZ/G2L and not RZ/G2LC this would increase
> image size and also build unneeded dtb's.

How would it increase image size? I understand clock and pin control
are the same blocks.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
