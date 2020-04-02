Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2834D19C026
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  2 Apr 2020 13:28:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388012AbgDBL2V (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 2 Apr 2020 07:28:21 -0400
Received: from mail-ot1-f67.google.com ([209.85.210.67]:46783 "EHLO
        mail-ot1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388001AbgDBL2V (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 2 Apr 2020 07:28:21 -0400
Received: by mail-ot1-f67.google.com with SMTP id 111so2957796oth.13;
        Thu, 02 Apr 2020 04:28:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=2bgnm/uDYdJ1detYPhI27bQkF7tTu5YY9ijywxHgELg=;
        b=cmhoYbnDjQ0noiUH4NKgmI2exZ8QJ8k7PnsPhRMB2PpduNDdMZw3wu8S7lPprn6R7X
         aP4Y2Vxfd4F0srhHHtK0y9FFfm2ER6mdbi5RkxXTkabUrmYeoQ/5PF+Bn2OC1oxqxdgG
         Px3qvJy+mCpEqEVSj2wSI2Bm3SU9Yahc1Yu7VhjvCaBFYqglefOVCmVgPRhm82DkZZ9y
         iH1JxXBv1ucwsoNCEMljyhJZzIP0ro/2/rBxX1ZvBMYK493WvlU2Jz5VwZSA3GikeA+X
         2qmH5pv4fCTbkFiL/dcQRkTvQhllbdfCcVH69IXr+Xn5SKq0YDq6lf3tClccnK0xPXKl
         Lkpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=2bgnm/uDYdJ1detYPhI27bQkF7tTu5YY9ijywxHgELg=;
        b=aT5ei7YqdmdpHjXbkLdFJk/263KaFr3jTzZy2dD+/eemsYoYW+2XJSADyopejND4yw
         Wxt9asLSHbjveX89+l28zGeTNdnyVM0h5VbcwtSbOUBc46D49/09dq95HoV6X4Sr8U+3
         vOAQqUob0BUk7BO205+BhsNQ2zTO6AxauHtyuWNsvpEB/1W7RkEiuy5e5qRLeabWKIDg
         aDHmVwd2SQK6tjw+YdANtK7TGiLYu7ZlMIyDwlCSAH0rYR9ZQKG4XF57suDvKtFGx+Nh
         DexZdp8ZkRjqSkdMv3REN/88Jes61oVBRfDJhzIBLQt+m6m3p2aYOYVzemuLi8vtWCfJ
         a+tA==
X-Gm-Message-State: AGi0PuYZLPYaS8Yk9lhVa/5CupdTOOyK0y1NmsXLusBmYXePYuGuMGWc
        hse2JaJMxhjHl+b8WYI0thjwuAQtbE+dBzmRA8Y=
X-Google-Smtp-Source: APiQypLJSpXhoA6Ak+/dJnAb0ch+tzn79KYUCPw/2juatq28FHNuYiFUIkHu9IYlnlBPisvI0Iro/kiGCGeQnVYTijs=
X-Received: by 2002:a9d:895:: with SMTP id 21mr1850329otf.365.1585826899753;
 Thu, 02 Apr 2020 04:28:19 -0700 (PDT)
MIME-Version: 1.0
References: <1585333048-31828-1-git-send-email-kazuhiro.fujita.jg@renesas.com>
 <CAMuHMdW+u5r6zyxFJsVzj21BYDrKCr=Q6Ojk5VeN+mkhvXX9Jw@mail.gmail.com>
 <OSBPR01MB3590E3D12546BC6711CEB542AAC80@OSBPR01MB3590.jpnprd01.prod.outlook.com>
 <CAMuHMdXmfQ0x7mCZ-E7OPQFv2z-=mFDT20hJ2_JKax=OePB8eA@mail.gmail.com>
In-Reply-To: <CAMuHMdXmfQ0x7mCZ-E7OPQFv2z-=mFDT20hJ2_JKax=OePB8eA@mail.gmail.com>
From:   "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date:   Thu, 2 Apr 2020 12:27:53 +0100
Message-ID: <CA+V-a8vPn_z_j1Vwr_1F=dCw8H=g5UMWvWxgRqBeVR7dzHPz8Q@mail.gmail.com>
Subject: Re: [PATCH] serial: sh-sci: Make sure status register SCxSR is read
 in correct sequence
To:     Geert Uytterhoeven <geert@linux-m68k.org>
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
        Magnus Damm <magnus.damm@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Geert,

On Wed, Apr 1, 2020 at 1:43 PM Geert Uytterhoeven <geert@linux-m68k.org> wrote:
>
> Hi Prabhakar,
>
> On Tue, Mar 31, 2020 at 5:58 PM Prabhakar Mahadev Lad
> <prabhakar.mahadev-lad.rj@bp.renesas.com> wrote:
> > > -----Original Message-----
> > > From: Geert Uytterhoeven <geert@linux-m68k.org>
> > > On Fri, Mar 27, 2020 at 7:17 PM Kazuhiro Fujita
> > > <kazuhiro.fujita.jg@renesas.com> wrote:
> > > > For SCIF and HSCIF interfaces the SCxSR register holds the status of
> > > > data that is to be read next from SCxRDR register, But where as for
> > > > SCIFA and SCIFB interfaces SCxSR register holds status of data that is
> > > > previously read from SCxRDR register.
> > > >
> > > > This patch makes sure the status register is read depending on the port
> > > > types so that errors are caught accordingly.
> > > >
> > > > Cc: <stable@vger.kernel.org>
> > > > Signed-off-by: Kazuhiro Fujita <kazuhiro.fujita.jg@renesas.com>
> > > > Signed-off-by: Hao Bui <hao.bui.yg@renesas.com>
> > > > Signed-off-by: KAZUMI HARADA <kazumi.harada.rh@renesas.com>
> > > > Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> > > Nevertheless, this patch will need some testing on various hardware.
> > > Do you have a test case to verify the broken/fixed behavior?
> > >
> > Agreed, its been tested on RZ/G2x & RZ/G1x  by doing a loopback test, configure one interface as CS8 mode(8-bits data, No parity) and other as CS7 mode (7-bits data, 1-bit Parity) and parity errors should be detected.
>
> This can easily be tested on the console.  Basic testing can even be
> done with an unmodified kernel, as there is already a "parity error"
> notice message in the driver.
>
> Enable even parity on the console:
>
> $ stty evenp
>
> (use "oddp" for odd parity, and invert all below)
>
> Typing e.g. a single "p" should trigger a parity error.
> Typing "o" shouldn't.
> Without this patch, no parity error is detected on SCIF.
>
> Likewise, pasting a sequence of "p" characters should trigger a lot of
> parity errors, "o" shouldn't.
> Without this patch, parity errors are detected on SCIF, except for the
> first character.
>
> For more advanced testing, make the following change to the driver:
>
> - dev_notice(port->dev, "parity error\n");
> + dev_notice(port->dev, "parity error for char 0x%02x hweight %u\n",
> c, hweight8(c));
>
> Pasting an alternating sequence of "p" and "o" characters should trigger
> parity errors for the "p" characters.
> Without this patch, they are triggered for the "o" characters instead.
>
Thank you that makes life easier.

> With this patch, the issues above are fixed on SCIF.
> This has been verified on:
>   1. SCIF on R-Car Gen 2,
>   2. SCIF on R-Car Gen3
>   3. SCIF on RZ/A1H,
>   4. SCIF on RZ/A2M.
>
Thank you for the testing.

> However, I also tried this on HSCIF on R-Car Gen3, where I cannot
> trigger parity errors at all.
> Parabhakar: have you tried HSCIF on RZ/G1 and RZ/G2? Can you trigger
> parity errors on HSCIF?
>
I couldnt test this in RZ/Gx as the hscif interface is connected to
wifi, but I did manage to trigger this
on M3N following are the steps:
1: Set console as ttySC1 in booatargs
2: The login console will come up on both SC0&1
3: Login through SC0
4: Append securetty file: echo ttySC1 >> /etc/securetty
5: Login through SC1 (CN26 on M3N)
6:  And finally I repeated your steps using stty on SC1 (CN26) to
introduce parity error.

> This has been regression-tested on:
>   1. SCIFA on SH-Mobile AG5, R-Mobile A1, and R-Mobile APE6.
>
> I haven't tested it yet on:
>   1. SCIFB on SH/R-Mobile (needs wiring up),
>   2. SCIFA, SCIFB, and HSCIF on R-Car Gen2 (needs wiring up),
>   3. (H)SCIF on R-Car Gen1 (remote boards unaccessible at the moment),
>   4. SuperH (only remote Migo-R available, but unaccessible).
>
> I can test 1 and 2 (and perhaps 3 and 4) later, if needed.
probably testing this on SuperH is gonna be a pain due to lack of
hardware availability,
(it needs to be tested on 19 platforms)
how about #ifdef CONFIG_ARCH_RENESAS || CONFIG_H8300 and the fix ?

Cheers,
--Prabhakar

> Thanks!
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
