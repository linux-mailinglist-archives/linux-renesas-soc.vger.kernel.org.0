Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6362A19C5C3
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  2 Apr 2020 17:24:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388902AbgDBPYp (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 2 Apr 2020 11:24:45 -0400
Received: from mail-oi1-f196.google.com ([209.85.167.196]:40937 "EHLO
        mail-oi1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388234AbgDBPYo (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 2 Apr 2020 11:24:44 -0400
Received: by mail-oi1-f196.google.com with SMTP id y71so3092208oia.7;
        Thu, 02 Apr 2020 08:24:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=zQv0tEEaOEwpKWMP6cGRSQ98944hkt2BkShYLbjg0cs=;
        b=ag7QWpc3EU6c026BacuBaOOrMjXGni60GdIXQ8gPUqM65oA0qsjk2FLzfN7wZHOtPh
         Ip1Z+aAccznt9zUk+qVh6FyHwzAaEo1voYe92SS6cU3oq02VfaBDH2Ky4JD4dwgadOzL
         RRRZSyOTzL6LMEz0x4845M84fxDU8psMCrFji5eANXwGQxcCyU1LoV+9+Az/qPdT98XK
         2UTe0B5Rc19hmI1CnO38Tog9yh3Z3uWwDz7yXwK9jHtJ6axQI/HmWNmUEioHiYR/NqwM
         QnkdyY3+spEU2tKl271W/Y9iYU6LzG+gqJHIiuai+gXE0qgEWjO2hfwh80hoBzXNKoFC
         I1fg==
X-Gm-Message-State: AGi0PuZ4h6FUQ6K6GqCLiuEJtXwrTJH9fPsqfDbKmCqJw2iKAcVzwbEr
        VXLd6y26lY+Ljy4rsulRDdPorTcd1AOHOwPA7corWdKc
X-Google-Smtp-Source: APiQypJEZtWin1ZmfsPWq7swhsxnOwLe/GWmL+RQy8ppLnp440YDhSJaCZAuBKMBI97juGfUdGHw5Ju12Wj7WUksh6g=
X-Received: by 2002:aca:cdd1:: with SMTP id d200mr2526518oig.153.1585841083482;
 Thu, 02 Apr 2020 08:24:43 -0700 (PDT)
MIME-Version: 1.0
References: <1585333048-31828-1-git-send-email-kazuhiro.fujita.jg@renesas.com>
 <CAMuHMdW+u5r6zyxFJsVzj21BYDrKCr=Q6Ojk5VeN+mkhvXX9Jw@mail.gmail.com>
 <OSBPR01MB3590E3D12546BC6711CEB542AAC80@OSBPR01MB3590.jpnprd01.prod.outlook.com>
 <CAMuHMdXmfQ0x7mCZ-E7OPQFv2z-=mFDT20hJ2_JKax=OePB8eA@mail.gmail.com> <CA+V-a8vPn_z_j1Vwr_1F=dCw8H=g5UMWvWxgRqBeVR7dzHPz8Q@mail.gmail.com>
In-Reply-To: <CA+V-a8vPn_z_j1Vwr_1F=dCw8H=g5UMWvWxgRqBeVR7dzHPz8Q@mail.gmail.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Thu, 2 Apr 2020 17:24:31 +0200
Message-ID: <CAMuHMdWc9q9NjQuAuy5M=v_x=i8XxVg5JZHswjvPsgNzhHfO0w@mail.gmail.com>
Subject: Re: [PATCH] serial: sh-sci: Make sure status register SCxSR is read
 in correct sequence
To:     "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Cc:     Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        Kazuhiro Fujita <kazuhiro.fujita.jg@renesas.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jiri Slaby <jslaby@suse.com>,
        "open list:SERIAL DRIVERS" <linux-serial@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Hao Bui <hao.bui.yg@renesas.com>,
        KAZUMI HARADA <kazumi.harada.rh@renesas.com>,
        Sasha Levin <sashal@kernel.org>,
        Chris Brandt <Chris.Brandt@renesas.com>,
        Magnus Damm <magnus.damm@gmail.com>,
        Linux-sh list <linux-sh@vger.kernel.org>,
        Rob Landley <rob@landley.net>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Prabhakar,

On Thu, Apr 2, 2020 at 1:28 PM Lad, Prabhakar
<prabhakar.csengg@gmail.com> wrote:
> On Wed, Apr 1, 2020 at 1:43 PM Geert Uytterhoeven <geert@linux-m68k.org> wrote:
> > On Tue, Mar 31, 2020 at 5:58 PM Prabhakar Mahadev Lad
> > <prabhakar.mahadev-lad.rj@bp.renesas.com> wrote:
> > > > -----Original Message-----
> > > > From: Geert Uytterhoeven <geert@linux-m68k.org>
> > > > On Fri, Mar 27, 2020 at 7:17 PM Kazuhiro Fujita
> > > > <kazuhiro.fujita.jg@renesas.com> wrote:
> > > > > For SCIF and HSCIF interfaces the SCxSR register holds the status of
> > > > > data that is to be read next from SCxRDR register, But where as for
> > > > > SCIFA and SCIFB interfaces SCxSR register holds status of data that is
> > > > > previously read from SCxRDR register.
> > > > >
> > > > > This patch makes sure the status register is read depending on the port
> > > > > types so that errors are caught accordingly.
> > > > >
> > > > > Cc: <stable@vger.kernel.org>
> > > > > Signed-off-by: Kazuhiro Fujita <kazuhiro.fujita.jg@renesas.com>
> > > > > Signed-off-by: Hao Bui <hao.bui.yg@renesas.com>
> > > > > Signed-off-by: KAZUMI HARADA <kazumi.harada.rh@renesas.com>
> > > > > Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> >
> > > > Nevertheless, this patch will need some testing on various hardware.
> > > > Do you have a test case to verify the broken/fixed behavior?
> > > >
> > > Agreed, its been tested on RZ/G2x & RZ/G1x  by doing a loopback test, configure one interface as CS8 mode(8-bits data, No parity) and other as CS7 mode (7-bits data, 1-bit Parity) and parity errors should be detected.
> >
> > This can easily be tested on the console.  Basic testing can even be
> > done with an unmodified kernel, as there is already a "parity error"
> > notice message in the driver.
> >
> > Enable even parity on the console:
> >
> > $ stty evenp
> >
> > (use "oddp" for odd parity, and invert all below)
> >
> > Typing e.g. a single "p" should trigger a parity error.
> > Typing "o" shouldn't.
> > Without this patch, no parity error is detected on SCIF.
> >
> > Likewise, pasting a sequence of "p" characters should trigger a lot of
> > parity errors, "o" shouldn't.
> > Without this patch, parity errors are detected on SCIF, except for the
> > first character.
> >
> > For more advanced testing, make the following change to the driver:
> >
> > - dev_notice(port->dev, "parity error\n");
> > + dev_notice(port->dev, "parity error for char 0x%02x hweight %u\n",
> > c, hweight8(c));
> >
> > Pasting an alternating sequence of "p" and "o" characters should trigger
> > parity errors for the "p" characters.
> > Without this patch, they are triggered for the "o" characters instead.
> >
> Thank you that makes life easier.
>
> > With this patch, the issues above are fixed on SCIF.
> > This has been verified on:
> >   1. SCIF on R-Car Gen 2,
> >   2. SCIF on R-Car Gen3
> >   3. SCIF on RZ/A1H,
> >   4. SCIF on RZ/A2M.
> >
> Thank you for the testing.
>
> > However, I also tried this on HSCIF on R-Car Gen3, where I cannot
> > trigger parity errors at all.
> > Parabhakar: have you tried HSCIF on RZ/G1 and RZ/G2? Can you trigger
> > parity errors on HSCIF?
> >
> I couldnt test this in RZ/Gx as the hscif interface is connected to
> wifi, but I did manage to trigger this
> on M3N following are the steps:
> 1: Set console as ttySC1 in booatargs
> 2: The login console will come up on both SC0&1
> 3: Login through SC0
> 4: Append securetty file: echo ttySC1 >> /etc/securetty
> 5: Login through SC1 (CN26 on M3N)
> 6:  And finally I repeated your steps using stty on SC1 (CN26) to
> introduce parity error.

Interesting, as I decided to pick up an M3-N target, too ;-)

Then I realized you used ttySC1 as the console, so DMA is disabled.
I just used the existing getty I have running on the second serial port,
which had DMA enabled, and no parity errors were triggered, as
sci_receive_chars() is never called.
If I disable DMA for HSCIF1 in the .dtsi, parity errors are detected
as expected.

Hence the driver does not support parity checking when DMA is enabled.
I also think it's not easy to add support for that, if possible at all.

> > I haven't tested it yet on:
> >   1. SCIFB on SH/R-Mobile (needs wiring up),
> >   2. SCIFA, SCIFB, and HSCIF on R-Car Gen2 (needs wiring up),
> >   3. (H)SCIF on R-Car Gen1 (remote boards unaccessible at the moment),
> >   4. SuperH (only remote Migo-R available, but unaccessible).
> >
> > I can test 1 and 2 (and perhaps 3 and 4) later, if needed.
> probably testing this on SuperH is gonna be a pain due to lack of
> hardware availability,
> (it needs to be tested on 19 platforms)
> how about #ifdef CONFIG_ARCH_RENESAS || CONFIG_H8300 and the fix ?

I had a look at a few SuperH docs w.r.t. framing/parity error behavior:
  - SCIF(A) on SH7724: similar to R-Car Gen2,
  - H(SCIF) on SH7734: same as on R-Car Gen2,
  - SCIF on SH7751: conflict between status register ("to be read next")
    and flowchart ("read from").

Let's wait a bit, we're in the middle of the merge window anyway.
Probably we can get it tested on SuperH during the coming weeks.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
