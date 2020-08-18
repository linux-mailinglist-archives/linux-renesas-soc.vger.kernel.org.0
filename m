Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1CBD02488D0
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 18 Aug 2020 17:12:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726970AbgHRPME (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 18 Aug 2020 11:12:04 -0400
Received: from mail-ot1-f68.google.com ([209.85.210.68]:46630 "EHLO
        mail-ot1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727086AbgHRPL7 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 18 Aug 2020 11:11:59 -0400
Received: by mail-ot1-f68.google.com with SMTP id v6so16482419ota.13;
        Tue, 18 Aug 2020 08:11:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=6kmcrv3AWgeL5GASuumHID1J80/7f/2Nd8wXtc+yqsk=;
        b=Qw7YpYmkimNsRV2kR9VPobBgYBx1Ku5BrR8aWxhr+qImMy5HZLwYvdH/q9Vo9m3QJh
         TjPW0yNK6LEEfImOnnJGk/MgzVx8prcykDOqH5EA3xrYwg1QudRLY3+eNwgzKS4XskrM
         JjHVpHIUqmwo3BRXn6JsSLMTuQs4uDZUUpXf9V2zn9IHkXfQf0/KYDVXhPkTWJxKqWtx
         gFEUwrMmZP5rHjpXL517jxAz4yg65oDvc1huCqTnq7/W1ARoCdHcHm/I9g//rG/HDKNy
         jmwFJfeEE18WYLr67XLaFGyYhGcEeNi2U0QZh2KMOU5K+I+5sYlMDNfPVH/dKsEvSXmY
         MFOA==
X-Gm-Message-State: AOAM533B/phgYmr3WiQfKInXEYwkIqwhwQ+3EF4d1vjkziRWOynDKuKz
        toVcVqUup/bYyi0X8Mo+liKDB0UKrysgovAdvVIhO/4G
X-Google-Smtp-Source: ABdhPJyCJEiEzbOVS0E0L0rs0hzE6iVl1bOVVFiVv37MJJcP/TMt57Xw4eyPHeYzFEfLyNQfXy6VZozkUSHg8HpL0Og=
X-Received: by 2002:a9d:1b62:: with SMTP id l89mr14982071otl.145.1597763517415;
 Tue, 18 Aug 2020 08:11:57 -0700 (PDT)
MIME-Version: 1.0
References: <1585333048-31828-1-git-send-email-kazuhiro.fujita.jg@renesas.com>
 <CAMuHMdW+u5r6zyxFJsVzj21BYDrKCr=Q6Ojk5VeN+mkhvXX9Jw@mail.gmail.com>
 <OSBPR01MB3590E3D12546BC6711CEB542AAC80@OSBPR01MB3590.jpnprd01.prod.outlook.com>
 <CAMuHMdXmfQ0x7mCZ-E7OPQFv2z-=mFDT20hJ2_JKax=OePB8eA@mail.gmail.com>
 <CA+V-a8vPn_z_j1Vwr_1F=dCw8H=g5UMWvWxgRqBeVR7dzHPz8Q@mail.gmail.com>
 <CAMuHMdWc9q9NjQuAuy5M=v_x=i8XxVg5JZHswjvPsgNzhHfO0w@mail.gmail.com>
 <CAMuHMdUyV58t3eihBJv2xex5gW1Oef37Jo3FHoJstU=SspmpHA@mail.gmail.com>
 <CAMuHMdU0EiQuk_bWx1yrmbBTXg8mL-PeN2=P61xQ5Ucb5QmYYg@mail.gmail.com>
 <OSBPR01MB50485F5DA2F82E455DCA6B56AA5E0@OSBPR01MB5048.jpnprd01.prod.outlook.com>
 <b384543f-c80d-aa63-63a6-1b5dbc47885d@landley.net>
In-Reply-To: <b384543f-c80d-aa63-63a6-1b5dbc47885d@landley.net>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Tue, 18 Aug 2020 17:11:46 +0200
Message-ID: <CAMuHMdXH03ec-F8JC7L7mobLddhoUEbdEuOtdDHvMDsR+WJWPg@mail.gmail.com>
Subject: SCI on R2D+ (was: Re: [PATCH] serial: sh-sci: Make sure status
 register SCxSR is read in correct sequence)
To:     Rob Landley <rob@landley.net>
Cc:     Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Magnus Damm <magnus.damm@gmail.com>,
        Linux-sh list <linux-sh@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Rob,

On Mon, Aug 17, 2020 at 5:09 AM Rob Landley <rob@landley.net> wrote:
> On 8/16/20 11:22 AM, Prabhakar Mahadev Lad wrote:
> >> FTR, I gave it a try on the SH7751R-based I-O DATA USL-5P aka Landisk:
> >> SCIF is affected, and fixed by commit 3dc4db3662366306 ("serial: sh-sci:
> >> Make sure status register SCxSR is read in correct sequence").
> >>
> > Thank you Geert.
> >
> > Cheers,
> > Prabhakar
>
> Did we ever figure out how to get linux to talk to the _first_ serial port on
> the qemu-system-sh4 r2d board? I'm still doing:
>
>   qemu-system-sh4 -M r2d -serial null -serial mon:stdio
>
> Because I can only get a working console on the _second_ serial port. (SCI vs
> SCIF I think?)

Because the SCI is wired to an SPI bus?
See:
    arch/sh/boards/mach-r2d/setup.c:spi_sh_sci_device()
    arch/sh/kernel/cpu/sh4/setup-sh7750.c:plat_early_device_setup()

To enable support for that:
    CONFIG_SPI=y
    CONFIG_SPI_SH_SCI=y
    CONFIG_RTC_CLASS=y
    CONFIG_RTC_DRV_R9701=y

However, QEMU doesn't support that mode:

    rtc-r9701 spi0.0: cannot read RTC register

Couldn't try on the remote physical R2D+. Will try when it becomes available
again...

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
