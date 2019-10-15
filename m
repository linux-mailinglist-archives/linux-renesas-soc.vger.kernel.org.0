Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1460ED7289
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 15 Oct 2019 11:52:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729761AbfJOJwB (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 15 Oct 2019 05:52:01 -0400
Received: from mail-oi1-f194.google.com ([209.85.167.194]:40135 "EHLO
        mail-oi1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726525AbfJOJwB (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 15 Oct 2019 05:52:01 -0400
Received: by mail-oi1-f194.google.com with SMTP id k9so16258346oib.7;
        Tue, 15 Oct 2019 02:52:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=0CYH4j0srWEiMsF+OANP2Wo3C2QtrbO2vNC7ScJyUA8=;
        b=CRJkdxvRsEdmSjXPukZYYgvX4DkkJeiIJSiT/ZyI25yexbp6OV0lTckYGSCMjkPmsv
         rXRi9ljGAcbghXFDiCvG6UpuETrrp+Zl8HM25gqe6OxojQUvpnFP7WEfhZ8TQT7SHxDi
         P7P+0EpnXadQoiTM426ur4kPi6lSGQVwjyKBAdqcr4i/ZFX2nn6x3bhglGHEkSm7twCo
         caEETgE0L0PkIWzYDX1LXmgWrRUa9ky/mb87PaOiQfDsZsL+Cb0F2N0n8QuiZwovc9us
         /UWLxRoeD2m7Fh3XU8XgeYYVQzBaJ+ruwYlGL2SZ6SbKn5ATiDeWEvJbRyCTnnPOCF1S
         9CQA==
X-Gm-Message-State: APjAAAWA8NXHePGYzi3XqlWnLwqasGNIk6zU/cBqYcyle+QeDyk1IwUg
        rLKvrgRVeEzXCx/Uspy/UZlCJx2K9YDUZil7EMA=
X-Google-Smtp-Source: APXvYqwlKwjCfbaD/Fu4Kccv/2hAco6cGIIYZtyu2Fqx7giwBiOA8FU9ug4GAzQwht8aPR23rojHPBuumOCb+IuEQ+k=
X-Received: by 2002:aca:4bd2:: with SMTP id y201mr3095361oia.102.1571133119807;
 Tue, 15 Oct 2019 02:51:59 -0700 (PDT)
MIME-Version: 1.0
References: <4a877f1c7189a7c45b59a6ebfc3de607e8758949.1567434470.git.michal.simek@xilinx.com>
 <CAMuHMdWY2VsY-CyAxSvpm1XYicAWqU7NORSQofQ+T195DwyLUg@mail.gmail.com> <7284590f-2b74-1b47-2d61-783ad8d5f46f@monstr.eu>
In-Reply-To: <7284590f-2b74-1b47-2d61-783ad8d5f46f@monstr.eu>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Tue, 15 Oct 2019 11:51:48 +0200
Message-ID: <CAMuHMdWZYALZB1bP5Mtoq4Nj5iubzdWBf1vRY9Mh5QvjCDhBgA@mail.gmail.com>
Subject: Re: [PATCH] serial: core: Use cons->index for preferred console registration
To:     Michal Simek <monstr@monstr.eu>
Cc:     Michal Simek <michal.simek@xilinx.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Jiri Slaby <jslaby@suse.com>,
        "open list:SERIAL DRIVERS" <linux-serial@vger.kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Michal,

On Tue, Oct 15, 2019 at 11:22 AM Michal Simek <monstr@monstr.eu> wrote:
> On 15. 10. 19 11:19, Geert Uytterhoeven wrote:
> > On Mon, Sep 2, 2019 at 4:29 PM Michal Simek <michal.simek@xilinx.com> wrote:
> >> The reason for this patch is xilinx_uartps driver which create one dynamic
> >> instance per IP with unique major and minor combinations. drv->nr is in
> >> this case all the time setup to 1. That means that uport->line is all the
> >> time setup to 0 and drv->tty_driver->name_base is doing shift in name to
> >> for example ttyPS3.
> >>
> >> register_console() is looping over console_cmdline array and looking for
> >> proper name/index combination which is in our case ttyPS/3.
> >> That's why every instance of driver needs to be registered with proper
> >> combination of name/number (ttyPS/3). Using uport->line is doing
> >> registration with ttyPS/0 which is wrong that's why proper console index
> >> should be used which is in cons->index field.
> >>
> >> Also it is visible that recording console should be done based on
> >> information about console not about the port but in most cases numbers are
> >> the same and xilinx_uartps is only one exception now.
> >>
> >> Signed-off-by: Michal Simek <michal.simek@xilinx.com>
> >
> > This is now commit 91daae03188e0dd1 ("serial: core: Use cons->index
> > for preferred console registration") in tty-next.
> >
> > This has been bisected to break the serial console on (at least)
> > r8a7791/koelsch and r8a7795/h3-salvator-xs.
> >
> > The line "printk: console [ttySC0] enabled" is no longer printed.
> > The system continues booting without any serial console output, and the
> > login prompt never appears on the serial console.
> >
> > Reverting this commit fixes the issue.
>
> Sorry for trouble with this patch. Can you please point me to dts files
> for these boards and also what's the value you have in uport->line and

arch/arm/boot/dts/r8a7791-koelsch.dts
arch/arm64/boot/dts/renesas/r8a7795-salvator-xs.dts

> uport->cons->index?

On r8a7791/koelsch:

    Serial: 8250/16550 driver, 4 ports, IRQ sharing disabled
    platform serial8250: uport->line = 0, uport->cons->index = -1
    platform serial8250: uport->line = 1, uport->cons->index = -1
    platform serial8250: uport->line = 2, uport->cons->index = -1
    platform serial8250: uport->line = 3, uport->cons->index = -1
    SuperH (H)SCI(F) driver initialized
  * sh-sci e6e60000.serial: uport->line = 0, uport->cons->index = -1
  * e6e60000.serial: ttySC0 at MMIO 0xe6e60000 (irq = 79, base_baud =
0) is a scif
    printk: console [ttySC0] enabled
    sh-sci e6e68000.serial: uport->line = 1, uport->cons->index = 0
    e6e68000.serial: ttySC1 at MMIO 0xe6e68000 (irq = 80, base_baud =
0) is a scif

On r8a7795/salvator-xs:

    sh-sci e6550000.serial: uport->line = 1, uport->cons->index = -1
    e6550000.serial: ttySC1 at MMIO 0xe6550000 (irq = 34, base_baud =
0) is a hscif
  * sh-sci e6e88000.serial: uport->line = 0, uport->cons->index = -1
  * e6e88000.serial: ttySC0 at MMIO 0xe6e88000 (irq = 120, base_baud =
0) is a scif
    printk: console [ttySC0] enabled

Actual serial consoles marked with *.

There are no 8250 serial ports in the system, shmobile_defconfig just includes
driver support for it.

Thanks!

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
