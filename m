Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id F09BB158B20
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 11 Feb 2020 09:15:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727857AbgBKIPO (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 11 Feb 2020 03:15:14 -0500
Received: from mail-ot1-f65.google.com ([209.85.210.65]:38902 "EHLO
        mail-ot1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727688AbgBKIPO (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 11 Feb 2020 03:15:14 -0500
Received: by mail-ot1-f65.google.com with SMTP id z9so9232613oth.5;
        Tue, 11 Feb 2020 00:15:14 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=KmW0O3LnLsxSEx5mSsn3yBdnjLfYpE0MC8ooH4ZjjKw=;
        b=L8Et7rpBPKlE8yhxdqUNJNgm41Kz2j5U49UXgA4ooWFrH0e4reqfa4mIxQOl8Wyy/j
         NJhfC6TxM7aUO8gCQCoQNNdg9wrgYIa4IAfxFHdGm0DXcVWQfDK9d64IOeqjZCScVsBL
         HDsrvR2IxCA0kalACn4x9ISGvSFyGv+COG/fS8WJhm2J81bze5Be43asCGKnWw4bcj51
         XiNez53G/ArftMEDlxXvX5uCmiybWAs9FhG742e2ztZTXUJpMb0YOCruhVpnEUJeT0RW
         CSS9Ob+kCr45BB82kWx7bXQBRpysHGJs1mXd2gLPE4+uLwGUQI0ncpFTCrjtszJERH6x
         rnNg==
X-Gm-Message-State: APjAAAXEdEmktm41ecgO2QsXiimDFLFnt+crmfYridHhKDzRGfiJIOKK
        muyFlrED9q5X7/aB6y2liDmYszLSOz9F7JhYgDQ=
X-Google-Smtp-Source: APXvYqwEcmEoNoNDBhoPpH3rDf95d6TYZ5IMsE/ydiUKbXXZLt6L0DPS+W4L0t7jNT1AbdX/CoQwZFbMvimTLVDaeII=
X-Received: by 2002:a9d:7984:: with SMTP id h4mr4357532otm.297.1581408913600;
 Tue, 11 Feb 2020 00:15:13 -0800 (PST)
MIME-Version: 1.0
References: <20200129161955.30562-1-erosca@de.adit-jv.com> <CAMuHMdWV0kkKq6sKOHsdz+FFGNHphzq_q7rvmYAL=U4fH2H3wQ@mail.gmail.com>
 <20200210205735.GB1347752@kroah.com>
In-Reply-To: <20200210205735.GB1347752@kroah.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Tue, 11 Feb 2020 09:15:02 +0100
Message-ID: <CAMuHMdUa0fUHZF03QCLsgvS8LSN_rGUQ1gPtotQ3uNGEHkCm6g@mail.gmail.com>
Subject: Re: [PATCH] serial: sh-sci: Support custom speed setting
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     Eugeniu Rosca <erosca@de.adit-jv.com>,
        "open list:SERIAL DRIVERS" <linux-serial@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Ulrich Hecht <uli+renesas@fpond.eu>,
        "George G . Davis" <george_davis@mentor.com>,
        Andrew Gabbasov <andrew_gabbasov@mentor.com>,
        Jiada Wang <jiada_wang@mentor.com>,
        Yuichi Kusakabe <yuichi.kusakabe@denso-ten.com>,
        Yasushi Asano <yasano@jp.adit-jv.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Jiri Slaby <jslaby@suse.com>,
        Fukui Yohhei <yohhei.fukui@denso-ten.com>,
        Torii Kenichi <torii.ken1@jp.fujitsu.com>,
        Magnus Damm <magnus.damm@gmail.com>,
        "Michael Kerrisk (man-pages)" <mtk.manpages@gmail.com>,
        linux-man@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Greg,

CC man

On Mon, Feb 10, 2020 at 9:57 PM Greg Kroah-Hartman
<gregkh@linuxfoundation.org> wrote:
> On Thu, Jan 30, 2020 at 01:32:50PM +0100, Geert Uytterhoeven wrote:
> > On Wed, Jan 29, 2020 at 5:20 PM Eugeniu Rosca <erosca@de.adit-jv.com> wrote:
> > > From: Torii Kenichi <torii.ken1@jp.fujitsu.com>
> > >
> > > This patch is necessary to use BT module and XM module with DENSO TEN
> > > development board.
> > >
> > > This patch supports ASYNC_SPD_CUST flag by ioctl(TIOCSSERIAL), enables
> > > custom speed setting with setserial(1).
> > >
> > > The custom speed is calculated from uartclk and custom_divisor.
> > > If custom_divisor is zero, custom speed setting is invalid.
> > >
> > > Signed-off-by: Torii Kenichi <torii.ken1@jp.fujitsu.com>
> > > [erosca: rebase against v5.5]
> > > Signed-off-by: Eugeniu Rosca <erosca@de.adit-jv.com>
> >
> > Thanks for your patch!
> >
> > While this seems to work fine[*], I have a few comments/questions:
> >   1. This feature seems to be deprecated:
> >
> >          sh-sci e6e68000.serial: setserial sets custom speed on
> > ttySC1. This is deprecated.
> >
> >   2. As the wanted speed is specified as a divider, the resulting speed
> >      may be off, cfr. the example for 57600 below.
> >      Note that the SCIF device has multiple clock inputs, and can do
> >      57600 perfectly if the right crystal has been fitted.
> >
> >  3. What to do with "[PATCH/RFC] serial: sh-sci: Update uartclk based
> >      on selected clock" (https://patchwork.kernel.org/patch/11103703/)?
> >      Combined with this, things become pretty complicated and
> >      unpredictable, as uartclk now always reflect the frequency of the
> >      last used base clock, which was the optimal one for the previously
> >      used speed....
> >
> > I think it would be easier if we just had an API to specify a raw speed.
> > Perhaps that already exists?
>
> Yes, see:
>         http://www.panix.com/~grante/arbitrary-baud.c

Thanks a lot!!
This must be one of the most guarded secrets of serial port programming ;-)

Implemented since 2006, commit edc6afc5496875a6 ("[PATCH] tty: switch to
ktermios and new framework"), not documented in today's man-pages.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
