Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id ADB632A0339
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 30 Oct 2020 11:48:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725948AbgJ3Ksd (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 30 Oct 2020 06:48:33 -0400
Received: from mail-oi1-f193.google.com ([209.85.167.193]:46664 "EHLO
        mail-oi1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726482AbgJ3Ksc (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 30 Oct 2020 06:48:32 -0400
Received: by mail-oi1-f193.google.com with SMTP id x1so6169289oic.13;
        Fri, 30 Oct 2020 03:48:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=o/a1Fg1l8jTDVjB4D1N/25wYLdlaFeX7TtKVbE5a6QU=;
        b=MNbNqKWaeycBfMaxfs6jaw6By+KU4zltvwRJkSq0T1j0gdpXHOYSNhkpx2UXtopcBr
         2Zu0dWaYcW4m/feTRAbvoxDHKGk44zdu/eW9schEKFU1hHEs8VrPDlLa1wLtz5UROleP
         ytedGPZbXZUEpaNQHxmkmqzlXB6+25GZbIgD9+JxPofVcK7zAZbrnW9WXnQ7V20jbCHa
         8uGphlESQC4eZUfyoApvINUZF/IjoDzxntLonSn37Sm3gQgIZjVh6KMj/lJ2q/drwbGz
         T4Rs/v9mwPEvPyQZef7BnZb6hJxV/ZivDbUp0fexufOWW0gHj4hT0Ap1zV0xG0Q/U6Rz
         7cag==
X-Gm-Message-State: AOAM5331PGhsco4iAhx/h6G9z3qMFxJjJAbqpO3fMLtGF42zlNy/9WdH
        dVny4LIJKJ19icKlxu5SnZzSP9XaekaWmtvtqdM=
X-Google-Smtp-Source: ABdhPJz6VOJFKEvyavQMgMiOs1PPCRImkfzYWVg19kSmpxLT/Yeaz/lHde0Miqty14Cx+GLfOtOvCsICUqXj+iFp8yE=
X-Received: by 2002:aca:c490:: with SMTP id u138mr1180705oif.54.1604054911030;
 Fri, 30 Oct 2020 03:48:31 -0700 (PDT)
MIME-Version: 1.0
References: <20201029105515.16309-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <CAMuHMdVGO+DEgsTr62nA+egU2etZA_vwE9GrOG1JPWBvv90UXg@mail.gmail.com> <CA+V-a8sagMFjaxxVUGMeqG5wdAWwT=oqOPHgTBZ7j0hPP1LcNw@mail.gmail.com>
In-Reply-To: <CA+V-a8sagMFjaxxVUGMeqG5wdAWwT=oqOPHgTBZ7j0hPP1LcNw@mail.gmail.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Fri, 30 Oct 2020 11:48:19 +0100
Message-ID: <CAMuHMdX_x9YkUv3DCZxW_sydX1NiQ=5EJjsgo9yQ7pZV-xC_+g@mail.gmail.com>
Subject: Re: [PATCH v2] clk: renesas: r8a774c0: Add RPC clocks
To:     "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Cc:     Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        linux-clk <linux-clk@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Biju Das <biju.das.jz@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Prabhakar,

On Fri, Oct 30, 2020 at 11:13 AM Lad, Prabhakar
<prabhakar.csengg@gmail.com> wrote:
> On Thu, Oct 29, 2020 at 2:29 PM Geert Uytterhoeven <geert@linux-m68k.org> wrote:
> > On Thu, Oct 29, 2020 at 11:55 AM Lad Prabhakar
> > <prabhakar.mahadev-lad.rj@bp.renesas.com> wrote:
> > > Describe the RPCSRC internal clock and the RPC[D2] clocks derived from it,
> > > as well as the RPC-IF module clock, in the RZ/G2E (R8A774C0) CPG/MSSR
> > > driver.
> >
> > Thanks for your patch!
> >
> > > Add new clk type CLK_TYPE_GEN3E3_RPCSRC to handle registering rpcsrc
> > > clock as the source for RPCSRC can be either PLL0/PLL1 and this depends
> > > on MD[1:4] pins where as compared to other R-Car Gen3 SoC's the RPCSRC
> > > clock source is always PLL1.
> > >
> > > MD[4] MD[3] MD[2] MD[1]
> > >   0     0     0    1     -> RPCSRC CLK source is PLL1
> > >   0     0     1    1     -> RPCSRC CLK source is PLL1
> > >   0     1     0    0     -> RPCSRC CLK source is PLL1
> > >   1     0     1    1     -> RPCSRC CLK source is PLL1
> > >   x     x     x    x     -> For any other values RPCSRC CLK source is PLL0
> >
> > AFAIU, the _initial values_ of the RPCCKCR bits depend on the MD pins.
> > They can still be changed at run-time, and might have been changed by
> > the bootloader before transferring control to Linux.
> >
> > > R-Car Gen3 manual Rev.2.20 has in-correct information related to
> > > determining the clock source for RPCSRC.
> >
> > Which part of the information is not correct?
> > Where can I find corrected information?
> > Is my understanding above incorrect, too?
> >
> R-Car Gen3 HW manual mentions the below statement (page 529, Rev.2.20 manual):
> [R-Car E3]
> When (MD4, MD3, MD2, MD1) = (0, 0, 0, 1) or (0, 1, 0, 0): DIV[2:0] =
> 011, DIV[4:3] = 00 (300 MHz PLL0)

That indeed doesn't match the values in the DIV[4:0] bits description.

> Confirming with internal team this should be below:
>
> When (MD4, MD3, MD2, MD1) = (0, 0, 0, 1) or (0, 1, 0, 0): DIV[2:0] =
> 011, DIV[4:3] = 00 (80 MHz PLL1)
>
> This should be fixed in the next version of the document, and when
> available I'll ask Chris P to send it across.

OK, that does match the bits.

> > > @@ -696,6 +717,22 @@ struct clk * __init rcar_gen3_cpg_clk_register(struct device *dev,
> > >                                                   cpg_rpcsrc_div_table,
> > >                                                   &cpg_lock);
> > >
> > > +       case CLK_TYPE_GEN3E3_RPCSRC:
> > > +               e3_rpcsrc_parent = cpg_rpcsrc_e3_get_parent(cpg_mode);
> >
> > This is not correct if the boot loader has changed the parent clock.
> >
> You mean by manually togelling the MD pins before we get into Linux ?

No, by writing to the RPCCKCR register.
Remember, the _initial_ values are determined by the MD pins.
They can still be changed.

E.g. on R-Car D3, I verified that changing PLL0CR.CKSEL at runtime
does work.  In the end, we decided to just look at MD12 instead (IIRC
because the CKSEL bit was removed from later documentation, but
Rev 2.20 documents it again ;-)

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
