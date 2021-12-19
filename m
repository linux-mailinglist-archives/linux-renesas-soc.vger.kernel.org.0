Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0922747A040
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 19 Dec 2021 11:54:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234200AbhLSKyG (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Sun, 19 Dec 2021 05:54:06 -0500
Received: from mail-ua1-f50.google.com ([209.85.222.50]:43716 "EHLO
        mail-ua1-f50.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229801AbhLSKyF (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sun, 19 Dec 2021 05:54:05 -0500
Received: by mail-ua1-f50.google.com with SMTP id 107so12556551uaj.10;
        Sun, 19 Dec 2021 02:54:05 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=gx6FC+488czg1h6H33oJ6TYpz44UC/QYFVfQmRe/T6Q=;
        b=0tH3+S6znpCM46+oEq2u7VcFXEoJE0psqKtqLfQAXxQRiqgRtbYTjudKh3YFoa6MVZ
         57xdxg2nWDryIkOxuLCL6tTbIMZor90JCrIEk0/nTibzK2NVxAYSYEEMH3x5ke7GzJHm
         SpZLsPpUy04zTJYtDmXC9Mt5x5K9qfIUqH806Y12vHBltKjcA78vChwjb/ADl3LySQRI
         yeqe2JXeTuPBR/Y5OzsjOoe2gwCrQkhnmukGr4XufTicraq1aHIFUft8MTweadl/UF9/
         vo3F61s8Y6jER7wZyYDHAbUWLxDsUAoKwmSgHbAYq3+I2rvT3cDW0+00v37s/36amhuh
         poug==
X-Gm-Message-State: AOAM531+epOJOv2PzbaGuBWFwhmiC5fT7oiYRDa5K1DnEJGFhWB/Ogf9
        X/WdAYGrzUkCCKIosBamryiiBxRW5qGDwA==
X-Google-Smtp-Source: ABdhPJw2aysjag0r92Gz8aq5qwqyp6bxsDrvBFHChDVm6cOY7vNa6/oGHWZnR/ecO4XanXyd2er5Ow==
X-Received: by 2002:ab0:b88:: with SMTP id c8mr3492452uak.130.1639911244347;
        Sun, 19 Dec 2021 02:54:04 -0800 (PST)
Received: from mail-ua1-f45.google.com (mail-ua1-f45.google.com. [209.85.222.45])
        by smtp.gmail.com with ESMTPSA id 92sm2481939uar.19.2021.12.19.02.54.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 19 Dec 2021 02:54:04 -0800 (PST)
Received: by mail-ua1-f45.google.com with SMTP id y23so12589369uay.7;
        Sun, 19 Dec 2021 02:54:03 -0800 (PST)
X-Received: by 2002:ab0:15a1:: with SMTP id i30mr3571855uae.122.1639911243550;
 Sun, 19 Dec 2021 02:54:03 -0800 (PST)
MIME-Version: 1.0
References: <cover.1639663832.git.geert+renesas@glider.be> <7cbec488-01d1-1ee2-006a-a3835d42a0a7@landley.net>
In-Reply-To: <7cbec488-01d1-1ee2-006a-a3835d42a0a7@landley.net>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Sun, 19 Dec 2021 11:53:52 +0100
X-Gmail-Original-Message-ID: <CAMuHMdUYu4hOjZMHy+bPrLpJ6=3tja0kJ7WwJ5TFhHivvi0DNQ@mail.gmail.com>
Message-ID: <CAMuHMdUYu4hOjZMHy+bPrLpJ6=3tja0kJ7WwJ5TFhHivvi0DNQ@mail.gmail.com>
Subject: Re: [PATCH 0/3] serial: sh-sci: Clock handling improvements
To:     Rob Landley <rob@landley.net>
Cc:     Jiri Slaby <jirislaby@kernel.org>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Ulrich Hecht <uli+renesas@fpond.eu>,
        Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        "open list:SERIAL DRIVERS" <linux-serial@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Linux-sh list <linux-sh@vger.kernel.org>,
        "moderated list:H8/300 ARCHITECTURE" 
        <uclinux-h8-devel@lists.sourceforge.jp>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Rob,

On Sun, Dec 19, 2021 at 11:34 AM Rob Landley <rob@landley.net> wrote:
> On 12/16/21 8:17 AM, Geert Uytterhoeven wrote:
> >       Hi Greg, Jiri,
> >
> > This patch series contains a legacy cleanup and two small improvements
> > for the Renesas (H)SCI(F) serial driver.
>
> Tested-by: Rob Landley <rob@landley.net>

Thanks!

> By the way, did you ever figure out how to get the first serial port to work on
> qemu so qemu-system-sh4 doesn't have to "-serial null -serial mon:stdio" to get
> a serial console?

Nope, same as last time you asked ;-)

However, upon a fresh look at linux/arch/sh/boards/mach-r2d/setup.c,
I noticed something I missed before: the SCI port is not available
as a UART, as it is used to talk SPI to an RTC.  So that means qemu
has the hardware description wrong?

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
