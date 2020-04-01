Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 44D5119ABE7
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  1 Apr 2020 14:43:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732438AbgDAMnn (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 1 Apr 2020 08:43:43 -0400
Received: from mail-ot1-f66.google.com ([209.85.210.66]:40614 "EHLO
        mail-ot1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732396AbgDAMnn (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 1 Apr 2020 08:43:43 -0400
Received: by mail-ot1-f66.google.com with SMTP id r19so19880795otn.7;
        Wed, 01 Apr 2020 05:43:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=1vh+DX2tAhYs6+PDevSpb/NO4sCDEVuknd0dV8w8BSo=;
        b=dHejEFlOZZqs9L6Gk64zWthaUn5ws44bC4Y++S+HOLsbPSU0m9j0ffl5rbC2bU+n2Q
         moZEcPFkQ7HvijhIKiy4DYif4Su7gusLcWgfMqwEf0MyMcoz4kxe3GXjY54ja03BWPVW
         JN9sRE1QTnW0fBIJ68QOTUQ4je6VOZU08EABs1tKnS/1J42myYjY545/gNoeNzYFW2za
         M3F+AwTJGqEf/3fpgtFHcBsS2px/1da6hrPDjRRXNzrn159b9HCPfuoEd3A70Zeq4l8D
         3U3LCpTs9+a07n+oHNj+gBjj1Jd/A4N9haS76mXU0M5LTv9bNKB9q62zJ7iRjcjaqg6B
         IWYw==
X-Gm-Message-State: ANhLgQ2Q+YlShRaBBJ9luL1wFyrG8WcRAZH6pVE1kbL9RHqa9aQ5TYTn
        LWUfX0yJC9isLgwcj2Wg/0Kwgp/FuM1YCj7y47g=
X-Google-Smtp-Source: ADFU+vtUz+RY34REyRl5kqWjcWR1CgcXAs9LuKt2og/SMgqD/vMvp/yuphIzJ2k9nfoyLINce3qtBY5U6892Ch95JjQ=
X-Received: by 2002:a9d:7590:: with SMTP id s16mr16595986otk.250.1585745022432;
 Wed, 01 Apr 2020 05:43:42 -0700 (PDT)
MIME-Version: 1.0
References: <1585333048-31828-1-git-send-email-kazuhiro.fujita.jg@renesas.com>
 <CAMuHMdW+u5r6zyxFJsVzj21BYDrKCr=Q6Ojk5VeN+mkhvXX9Jw@mail.gmail.com> <OSBPR01MB3590E3D12546BC6711CEB542AAC80@OSBPR01MB3590.jpnprd01.prod.outlook.com>
In-Reply-To: <OSBPR01MB3590E3D12546BC6711CEB542AAC80@OSBPR01MB3590.jpnprd01.prod.outlook.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Wed, 1 Apr 2020 14:43:31 +0200
Message-ID: <CAMuHMdXmfQ0x7mCZ-E7OPQFv2z-=mFDT20hJ2_JKax=OePB8eA@mail.gmail.com>
Subject: Re: [PATCH] serial: sh-sci: Make sure status register SCxSR is read
 in correct sequence
To:     Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Cc:     Kazuhiro Fujita <kazuhiro.fujita.jg@renesas.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jiri Slaby <jslaby@suse.com>,
        "open list:SERIAL DRIVERS" <linux-serial@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Prabhakar <prabhakar.csengg@gmail.com>,
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

Hi Prabhakar,

On Tue, Mar 31, 2020 at 5:58 PM Prabhakar Mahadev Lad
<prabhakar.mahadev-lad.rj@bp.renesas.com> wrote:
> > -----Original Message-----
> > From: Geert Uytterhoeven <geert@linux-m68k.org>
> > On Fri, Mar 27, 2020 at 7:17 PM Kazuhiro Fujita
> > <kazuhiro.fujita.jg@renesas.com> wrote:
> > > For SCIF and HSCIF interfaces the SCxSR register holds the status of
> > > data that is to be read next from SCxRDR register, But where as for
> > > SCIFA and SCIFB interfaces SCxSR register holds status of data that is
> > > previously read from SCxRDR register.
> > >
> > > This patch makes sure the status register is read depending on the port
> > > types so that errors are caught accordingly.
> > >
> > > Cc: <stable@vger.kernel.org>
> > > Signed-off-by: Kazuhiro Fujita <kazuhiro.fujita.jg@renesas.com>
> > > Signed-off-by: Hao Bui <hao.bui.yg@renesas.com>
> > > Signed-off-by: KAZUMI HARADA <kazumi.harada.rh@renesas.com>
> > > Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

> > Nevertheless, this patch will need some testing on various hardware.
> > Do you have a test case to verify the broken/fixed behavior?
> >
> Agreed, its been tested on RZ/G2x & RZ/G1x  by doing a loopback test, configure one interface as CS8 mode(8-bits data, No parity) and other as CS7 mode (7-bits data, 1-bit Parity) and parity errors should be detected.

This can easily be tested on the console.  Basic testing can even be
done with an unmodified kernel, as there is already a "parity error"
notice message in the driver.

Enable even parity on the console:

$ stty evenp

(use "oddp" for odd parity, and invert all below)

Typing e.g. a single "p" should trigger a parity error.
Typing "o" shouldn't.
Without this patch, no parity error is detected on SCIF.

Likewise, pasting a sequence of "p" characters should trigger a lot of
parity errors, "o" shouldn't.
Without this patch, parity errors are detected on SCIF, except for the
first character.

For more advanced testing, make the following change to the driver:

- dev_notice(port->dev, "parity error\n");
+ dev_notice(port->dev, "parity error for char 0x%02x hweight %u\n",
c, hweight8(c));

Pasting an alternating sequence of "p" and "o" characters should trigger
parity errors for the "p" characters.
Without this patch, they are triggered for the "o" characters instead.

With this patch, the issues above are fixed on SCIF.
This has been verified on:
  1. SCIF on R-Car Gen 2,
  2. SCIF on R-Car Gen3
  3. SCIF on RZ/A1H,
  4. SCIF on RZ/A2M.

However, I also tried this on HSCIF on R-Car Gen3, where I cannot
trigger parity errors at all.
Parabhakar: have you tried HSCIF on RZ/G1 and RZ/G2? Can you trigger
parity errors on HSCIF?

This has been regression-tested on:
  1. SCIFA on SH-Mobile AG5, R-Mobile A1, and R-Mobile APE6.

I haven't tested it yet on:
  1. SCIFB on SH/R-Mobile (needs wiring up),
  2. SCIFA, SCIFB, and HSCIF on R-Car Gen2 (needs wiring up),
  3. (H)SCIF on R-Car Gen1 (remote boards unaccessible at the moment),
  4. SuperH (only remote Migo-R available, but unaccessible).

I can test 1 and 2 (and perhaps 3 and 4) later, if needed.
Thanks!

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
