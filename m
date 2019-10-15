Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 41F1AD78DE
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 15 Oct 2019 16:40:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732491AbfJOOkr (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 15 Oct 2019 10:40:47 -0400
Received: from mail-ot1-f68.google.com ([209.85.210.68]:44549 "EHLO
        mail-ot1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732448AbfJOOkr (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 15 Oct 2019 10:40:47 -0400
Received: by mail-ot1-f68.google.com with SMTP id 21so17104269otj.11;
        Tue, 15 Oct 2019 07:40:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=iSVmDwkzhMmxJvflSTSRbJh/RaZxJFQK4nfYknfaXn8=;
        b=s6No45VSjGRujH3w9trnFa+E11TciHfw9bxA+jnoGL8mZ7WTcew1vFqKNHjFbmVC02
         ZRpto3WyNVA6rVOdkOPT8wilg/iHzz0yf4Ad1eNXVMyqlWTyQ/S7P/vud0u+78YdWkro
         +Dpn+LcLRTgrLYa6W2OEVo0D1LHoxjVoD3n14qHCMlyGxS27bHLTG9WnnRjjRL3xLuRC
         3HFcD14KiOjKAG0S4gHCJzOvjJKsvgeEVGdImANrzs531XP2P9PUWz0uwpWk/7sblvf/
         k6fqvwqo5av4SqKGjpQvs83NLMCoVKta3z/0MriMtJEL+k55XehesaWT8qx3VYyBgAot
         pqnA==
X-Gm-Message-State: APjAAAX2koly0gRPv6KTGMKIYEwjPY2n9Ntb10FAYHiAxQpfmf8P1UXK
        +Mr1XDZoTBdcCPB1Q9y5bTWQeMVMiuuVkbainCM=
X-Google-Smtp-Source: APXvYqzUYsrKQvnknIQF48f5xX0ZOC6hV5QY+ILJX2/wvHL6m5jiAI8K1yx8jv0LqGZTy0VKNoxTSHVCbeILg5a1DZs=
X-Received: by 2002:a9d:7345:: with SMTP id l5mr19910943otk.39.1571150446346;
 Tue, 15 Oct 2019 07:40:46 -0700 (PDT)
MIME-Version: 1.0
References: <4a877f1c7189a7c45b59a6ebfc3de607e8758949.1567434470.git.michal.simek@xilinx.com>
 <CAMuHMdWY2VsY-CyAxSvpm1XYicAWqU7NORSQofQ+T195DwyLUg@mail.gmail.com>
 <7284590f-2b74-1b47-2d61-783ad8d5f46f@monstr.eu> <CAMuHMdWZYALZB1bP5Mtoq4Nj5iubzdWBf1vRY9Mh5QvjCDhBgA@mail.gmail.com>
 <622f4c5e-e3ed-3f91-254d-78d905de79c9@xilinx.com>
In-Reply-To: <622f4c5e-e3ed-3f91-254d-78d905de79c9@xilinx.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Tue, 15 Oct 2019 16:40:35 +0200
Message-ID: <CAMuHMdXq1XkQKTeA0XOhk6QzoyK0DUMiesVwXkBwWQbunWH+Fg@mail.gmail.com>
Subject: Re: [PATCH] serial: core: Use cons->index for preferred console registration
To:     Michal Simek <michal.simek@xilinx.com>
Cc:     Michal Simek <monstr@monstr.eu>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Jiri Slaby <jslaby@suse.com>,
        "open list:SERIAL DRIVERS" <linux-serial@vger.kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Marek Vasut <marek.vasut+renesas@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Michal,

On Tue, Oct 15, 2019 at 4:37 PM Michal Simek <michal.simek@xilinx.com> wrote:
> On 15. 10. 19 11:51, Geert Uytterhoeven wrote:
> > On Tue, Oct 15, 2019 at 11:22 AM Michal Simek <monstr@monstr.eu> wrote:
> >> On 15. 10. 19 11:19, Geert Uytterhoeven wrote:
> >>> On Mon, Sep 2, 2019 at 4:29 PM Michal Simek <michal.simek@xilinx.com> wrote:
> >>>> The reason for this patch is xilinx_uartps driver which create one dynamic
> >>>> instance per IP with unique major and minor combinations. drv->nr is in
> >>>> this case all the time setup to 1. That means that uport->line is all the
> >>>> time setup to 0 and drv->tty_driver->name_base is doing shift in name to
> >>>> for example ttyPS3.
> >>>>
> >>>> register_console() is looping over console_cmdline array and looking for
> >>>> proper name/index combination which is in our case ttyPS/3.
> >>>> That's why every instance of driver needs to be registered with proper
> >>>> combination of name/number (ttyPS/3). Using uport->line is doing
> >>>> registration with ttyPS/0 which is wrong that's why proper console index
> >>>> should be used which is in cons->index field.
> >>>>
> >>>> Also it is visible that recording console should be done based on
> >>>> information about console not about the port but in most cases numbers are
> >>>> the same and xilinx_uartps is only one exception now.
> >>>>
> >>>> Signed-off-by: Michal Simek <michal.simek@xilinx.com>
> >>>
> >>> This is now commit 91daae03188e0dd1 ("serial: core: Use cons->index
> >>> for preferred console registration") in tty-next.
> >>>
> >>> This has been bisected to break the serial console on (at least)
> >>> r8a7791/koelsch and r8a7795/h3-salvator-xs.
> >>>
> >>> The line "printk: console [ttySC0] enabled" is no longer printed.
> >>> The system continues booting without any serial console output, and the
> >>> login prompt never appears on the serial console.
> >>>
> >>> Reverting this commit fixes the issue.
> >>
> >> Sorry for trouble with this patch. Can you please point me to dts files
> >> for these boards and also what's the value you have in uport->line and
> >
> > arch/arm/boot/dts/r8a7791-koelsch.dts
> > arch/arm64/boot/dts/renesas/r8a7795-salvator-xs.dts
> >
> >> uport->cons->index?
> >
> > On r8a7791/koelsch:
> >
> >     Serial: 8250/16550 driver, 4 ports, IRQ sharing disabled
> >     platform serial8250: uport->line = 0, uport->cons->index = -1
> >     platform serial8250: uport->line = 1, uport->cons->index = -1
> >     platform serial8250: uport->line = 2, uport->cons->index = -1
> >     platform serial8250: uport->line = 3, uport->cons->index = -1
> >     SuperH (H)SCI(F) driver initialized
> >   * sh-sci e6e60000.serial: uport->line = 0, uport->cons->index = -1
> >   * e6e60000.serial: ttySC0 at MMIO 0xe6e60000 (irq = 79, base_baud =
> > 0) is a scif
> >     printk: console [ttySC0] enabled
> >     sh-sci e6e68000.serial: uport->line = 1, uport->cons->index = 0
> >     e6e68000.serial: ttySC1 at MMIO 0xe6e68000 (irq = 80, base_baud =
> > 0) is a scif
> >
> > On r8a7795/salvator-xs:
> >
> >     sh-sci e6550000.serial: uport->line = 1, uport->cons->index = -1
> >     e6550000.serial: ttySC1 at MMIO 0xe6550000 (irq = 34, base_baud =
> > 0) is a hscif
> >   * sh-sci e6e88000.serial: uport->line = 0, uport->cons->index = -1
> >   * e6e88000.serial: ttySC0 at MMIO 0xe6e88000 (irq = 120, base_baud =
> > 0) is a scif
> >     printk: console [ttySC0] enabled
> >
> > Actual serial consoles marked with *.
> >
> > There are no 8250 serial ports in the system, shmobile_defconfig just includes
> > driver support for it.
>
> ok. I will take a look at why it is not initialized in this case. Do you
> have any qemu available for these boards?

Not me.  But Marek (CC) may have something.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
