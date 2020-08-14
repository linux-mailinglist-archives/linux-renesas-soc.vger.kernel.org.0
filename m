Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D0C09244C0B
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 14 Aug 2020 17:25:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726812AbgHNPZg (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 14 Aug 2020 11:25:36 -0400
Received: from mail-ot1-f65.google.com ([209.85.210.65]:43004 "EHLO
        mail-ot1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726652AbgHNPZf (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 14 Aug 2020 11:25:35 -0400
Received: by mail-ot1-f65.google.com with SMTP id v21so7832799otj.9;
        Fri, 14 Aug 2020 08:25:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=skIVLAyvKMa0ooMTMPg8Y4Q1LXoIBirrRYMcwceQjTk=;
        b=L3mctKB1PRi2rpWDa0/WxbhOg2RBy1solSLWAB1fjcITbSV6OYAL6/C5lJy0j0Qd0c
         4vRmkm5x/zaAEm99lhFjZh2ccWU/WyeKLg9Y1tuNCGaS94sFZn9XeLK2OhRTGFtqSOnC
         RLc/LtAWQ/vc4BLyMcLXychW4XlDnJQaPEP2/feBivZjLLRQM+VjCR4FLeSNAN3A5Pyu
         sBnravA4yek0zIQoxEyB24z9R19laeVYmxsmvzPgNpPTDC+sBZbkownaOv7b1YsApUXn
         xsUfuBcopEiL6ohLJThUpE7fhW867EJ7xBT8wHs28XxEkST9SeBwpr6/AuPrLkhrr2dx
         t7eA==
X-Gm-Message-State: AOAM532UNu5215v47mFcZNRpoH1FxEqRjGvAw3qR/0VFfF7r5raj8C0t
        lcJ6vUI6rJgcb/7nJh9jkzFMD0e2z6A17ysyaM0j9sMWrBM=
X-Google-Smtp-Source: ABdhPJymFA5geQaFjcXCc0ybte3AFiZ24GktW5jXhgw1d3psf1WmdfHpZjbMqgmyRm4wioeEJto8RAwmMAXMi/vB8oQ=
X-Received: by 2002:a9d:1b62:: with SMTP id l89mr2226098otl.145.1597418734202;
 Fri, 14 Aug 2020 08:25:34 -0700 (PDT)
MIME-Version: 1.0
References: <1585333048-31828-1-git-send-email-kazuhiro.fujita.jg@renesas.com>
 <CAMuHMdW+u5r6zyxFJsVzj21BYDrKCr=Q6Ojk5VeN+mkhvXX9Jw@mail.gmail.com>
 <OSBPR01MB3590E3D12546BC6711CEB542AAC80@OSBPR01MB3590.jpnprd01.prod.outlook.com>
 <CAMuHMdXmfQ0x7mCZ-E7OPQFv2z-=mFDT20hJ2_JKax=OePB8eA@mail.gmail.com>
 <CA+V-a8vPn_z_j1Vwr_1F=dCw8H=g5UMWvWxgRqBeVR7dzHPz8Q@mail.gmail.com>
 <CAMuHMdWc9q9NjQuAuy5M=v_x=i8XxVg5JZHswjvPsgNzhHfO0w@mail.gmail.com> <CAMuHMdUyV58t3eihBJv2xex5gW1Oef37Jo3FHoJstU=SspmpHA@mail.gmail.com>
In-Reply-To: <CAMuHMdUyV58t3eihBJv2xex5gW1Oef37Jo3FHoJstU=SspmpHA@mail.gmail.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Fri, 14 Aug 2020 17:25:23 +0200
Message-ID: <CAMuHMdU0EiQuk_bWx1yrmbBTXg8mL-PeN2=P61xQ5Ucb5QmYYg@mail.gmail.com>
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
        Rob Landley <rob@landley.net>,
        John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Wed, Apr 15, 2020 at 2:36 PM Geert Uytterhoeven <geert@linux-m68k.org> wrote:
> On Thu, Apr 2, 2020 at 5:24 PM Geert Uytterhoeven <geert@linux-m68k.org> wrote:
> > On Thu, Apr 2, 2020 at 1:28 PM Lad, Prabhakar
> > <prabhakar.csengg@gmail.com> wrote:
> > > On Wed, Apr 1, 2020 at 1:43 PM Geert Uytterhoeven <geert@linux-m68k.org> wrote:
> > > > On Tue, Mar 31, 2020 at 5:58 PM Prabhakar Mahadev Lad
> > > > <prabhakar.mahadev-lad.rj@bp.renesas.com> wrote:
> > > > > > -----Original Message-----
> > > > > > From: Geert Uytterhoeven <geert@linux-m68k.org>
> > > > > > On Fri, Mar 27, 2020 at 7:17 PM Kazuhiro Fujita
> > > > > > <kazuhiro.fujita.jg@renesas.com> wrote:
> > > > > > > For SCIF and HSCIF interfaces the SCxSR register holds the status of
> > > > > > > data that is to be read next from SCxRDR register, But where as for
> > > > > > > SCIFA and SCIFB interfaces SCxSR register holds status of data that is
> > > > > > > previously read from SCxRDR register.
> > > > > > >
> > > > > > > This patch makes sure the status register is read depending on the port
> > > > > > > types so that errors are caught accordingly.
> > > > > > >
> > > > > > > Cc: <stable@vger.kernel.org>
> > > > > > > Signed-off-by: Kazuhiro Fujita <kazuhiro.fujita.jg@renesas.com>
> > > > > > > Signed-off-by: Hao Bui <hao.bui.yg@renesas.com>
> > > > > > > Signed-off-by: KAZUMI HARADA <kazumi.harada.rh@renesas.com>
> > > > > > > Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > > >
> > > > > > Nevertheless, this patch will need some testing on various hardware.
> > > > > > Do you have a test case to verify the broken/fixed behavior?
> > > > > >
> > > > > Agreed, its been tested on RZ/G2x & RZ/G1x  by doing a loopback test, configure one interface as CS8 mode(8-bits data, No parity) and other as CS7 mode (7-bits data, 1-bit Parity) and parity errors should be detected.
> > > >
> > > > This can easily be tested on the console.  Basic testing can even be
> > > > done with an unmodified kernel, as there is already a "parity error"
> > > > notice message in the driver.
> > > >
> > > > Enable even parity on the console:
> > > >
> > > > $ stty evenp
> > > >
> > > > (use "oddp" for odd parity, and invert all below)
> > > >
> > > > Typing e.g. a single "p" should trigger a parity error.
> > > > Typing "o" shouldn't.
> > > > Without this patch, no parity error is detected on SCIF.
> > > >
> > > > Likewise, pasting a sequence of "p" characters should trigger a lot of
> > > > parity errors, "o" shouldn't.
> > > > Without this patch, parity errors are detected on SCIF, except for the
> > > > first character.
> > > >
> > > > For more advanced testing, make the following change to the driver:
> > > >
> > > > - dev_notice(port->dev, "parity error\n");
> > > > + dev_notice(port->dev, "parity error for char 0x%02x hweight %u\n",
> > > > c, hweight8(c));
> > > >
> > > > Pasting an alternating sequence of "p" and "o" characters should trigger
> > > > parity errors for the "p" characters.
> > > > Without this patch, they are triggered for the "o" characters instead.
> > > >
> > > Thank you that makes life easier.
> > >
> > > > With this patch, the issues above are fixed on SCIF.
> > > > This has been verified on:
> > > >   1. SCIF on R-Car Gen 2,
> > > >   2. SCIF on R-Car Gen3
> > > >   3. SCIF on RZ/A1H,
> > > >   4. SCIF on RZ/A2M.
>
> > If I disable DMA for HSCIF1 in the .dtsi, parity errors are detected
> > as expected.
>
> So HSCIF on R-Car Gen3 is affected, and fixed by this patch.
>
> > Hence the driver does not support parity checking when DMA is enabled.
> > I also think it's not easy to add support for that, if possible at all.
> >
> > > > I haven't tested it yet on:
> > > >   1. SCIFB on SH/R-Mobile (needs wiring up),
>
> SCIFB on R-Mobile A1 is not affected, and works before/after, as expected.
>
> > > >   2. SCIFA, SCIFB, and HSCIF on R-Car Gen2 (needs wiring up),
>
> Same for SCIFA, SCIFB on R-Car M2-W.
>
> HSCIF on R-Car M2-W is affected, and fixed by this patch.
>
> This means the modern platforms we care about are handled fine, so
> Tested-by: Geert Uytterhoeven <geert+renesas@glider.be>
>
> That leaves us with testing on a few legacy platforms...
>
> > > >   3. (H)SCIF on R-Car Gen1 (remote boards unaccessible at the moment),
> > > >   4. SuperH (only remote Migo-R available, but unaccessible).
> > > >
> > > > I can test 1 and 2 (and perhaps 3 and 4) later, if needed.
> > > probably testing this on SuperH is gonna be a pain due to lack of
> > > hardware availability,
> > > (it needs to be tested on 19 platforms)
> > > how about #ifdef CONFIG_ARCH_RENESAS || CONFIG_H8300 and the fix ?
> >
> > I had a look at a few SuperH docs w.r.t. framing/parity error behavior:
> >   - SCIF(A) on SH7724: similar to R-Car Gen2,
> >   - H(SCIF) on SH7734: same as on R-Car Gen2,
> >   - SCIF on SH7751: conflict between status register ("to be read next")
> >     and flowchart ("read from").

FTR, I gave it a try on the SH7751R-based I-O DATA USL-5P aka Landisk:
SCIF is affected, and fixed by commit 3dc4db3662366306 ("serial: sh-sci:
Make sure status register SCxSR is read in correct sequence").

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
