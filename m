Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D470ED7215
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 15 Oct 2019 11:22:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725946AbfJOJV7 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 15 Oct 2019 05:21:59 -0400
Received: from mail-oi1-f193.google.com ([209.85.167.193]:40570 "EHLO
        mail-oi1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726320AbfJOJV5 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 15 Oct 2019 05:21:57 -0400
Received: by mail-oi1-f193.google.com with SMTP id k9so16191304oib.7;
        Tue, 15 Oct 2019 02:21:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=PtZh1eDtsmQe32hnrI0UGHtD+cjDd+0nCV/54zTIuBk=;
        b=kGsnv1meq/8FB1K2P321sOwyTGB6Cvqg3DEUvmg/9cQOpvJMmWH5W5lw8H0K6vCGYh
         rqCu67+aMJhYiVXDc0rmVUmpN0GbNkgx2Fetcbi+LjdJNXwNsq1tU9dh6v/QLiQ66IqH
         G5dhGMRjxj77ZyySbKZMMddfgpqUYmXRFVhT+h5qazZ7g/lXbLm6Xb4REts27ndp8X3F
         H688fa0RAqxE5MPlnl7r78z6sQi0kwbyfMR41X4tHM7S9zRHcFeR98P65CWCzeD5+gGV
         fSuuaLMc0sIwlbIO5ZUJwnHIEiKtyypLlRXs/SQD+RZHoYaoSL2pDR7BHzCy+kVCzBny
         j9Tg==
X-Gm-Message-State: APjAAAWsdUpwGOn3QuMTy5xhnKfZMr603/r3DVOQJTs1pSfOB9LB7da3
        jo1/o4wPk/HTZs4Pl6SWTmmUbcLyGvgxnEAG4h8=
X-Google-Smtp-Source: APXvYqw0gXgXjRpDJpbD6WQpA/u9qvGHCsZIlT5z2CnJru+kAxXX/OPiETm/V4VjDweqAIamotwbSKqQbEw73JKBUCk=
X-Received: by 2002:a05:6808:3b4:: with SMTP id n20mr17701290oie.131.1571131316044;
 Tue, 15 Oct 2019 02:21:56 -0700 (PDT)
MIME-Version: 1.0
References: <4a877f1c7189a7c45b59a6ebfc3de607e8758949.1567434470.git.michal.simek@xilinx.com>
 <CAMuHMdWY2VsY-CyAxSvpm1XYicAWqU7NORSQofQ+T195DwyLUg@mail.gmail.com>
In-Reply-To: <CAMuHMdWY2VsY-CyAxSvpm1XYicAWqU7NORSQofQ+T195DwyLUg@mail.gmail.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Tue, 15 Oct 2019 11:21:44 +0200
Message-ID: <CAMuHMdUN0GNWd7+zqRhXz7Uinnojx-bK+LW6Q_Q75yBNuUycxw@mail.gmail.com>
Subject: Re: [PATCH] serial: core: Use cons->index for preferred console registration
To:     Michal Simek <michal.simek@xilinx.com>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Michal Simek <monstr@monstr.eu>, Jiri Slaby <jslaby@suse.com>,
        "open list:SERIAL DRIVERS" <linux-serial@vger.kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Tue, Oct 15, 2019 at 11:19 AM Geert Uytterhoeven
<geert@linux-m68k.org> wrote:
> On Mon, Sep 2, 2019 at 4:29 PM Michal Simek <michal.simek@xilinx.com> wrote:
> > The reason for this patch is xilinx_uartps driver which create one dynamic
> > instance per IP with unique major and minor combinations. drv->nr is in
> > this case all the time setup to 1. That means that uport->line is all the
> > time setup to 0 and drv->tty_driver->name_base is doing shift in name to
> > for example ttyPS3.
> >
> > register_console() is looping over console_cmdline array and looking for
> > proper name/index combination which is in our case ttyPS/3.
> > That's why every instance of driver needs to be registered with proper
> > combination of name/number (ttyPS/3). Using uport->line is doing
> > registration with ttyPS/0 which is wrong that's why proper console index
> > should be used which is in cons->index field.
> >
> > Also it is visible that recording console should be done based on
> > information about console not about the port but in most cases numbers are
> > the same and xilinx_uartps is only one exception now.
> >
> > Signed-off-by: Michal Simek <michal.simek@xilinx.com>
>
> This is now commit 91daae03188e0dd1 ("serial: core: Use cons->index
> for preferred console registration") in tty-next.
>
> This has been bisected to break the serial console on (at least)
> r8a7791/koelsch and r8a7795/h3-salvator-xs.
>
> The line "printk: console [ttySC0] enabled" is no longer printed.

s/is no longer printed/no longer appears in the kernel log/, of course.

> The system continues booting without any serial console output, and the
> login prompt never appears on the serial console.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
