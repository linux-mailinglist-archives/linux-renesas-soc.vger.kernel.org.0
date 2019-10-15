Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A8C43D7E6D
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 15 Oct 2019 20:08:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727360AbfJOSIM (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 15 Oct 2019 14:08:12 -0400
Received: from mail.kernel.org ([198.145.29.99]:39740 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725820AbfJOSIL (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 15 Oct 2019 14:08:11 -0400
Received: from localhost (unknown [38.98.37.135])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 2BB3620659;
        Tue, 15 Oct 2019 18:08:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1571162890;
        bh=5AnmJWnwSLd45t+Cg3Vuhkl5YGkWgQB/xzBwzn/ZTNQ=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=bzzJ8FU6Wp971eJ1oy+xtv0AxDMMXHoC32JRAFGGLP6TugImeZF2hNNI6JBe5oaG0
         7/+XL8BpBWi0stVAC8iXLkGDKUX51ZrssNGCOyJSbOPnmbfpKOQLLh6r/Z7CENqbyf
         vIJ+AKdLDfp5VEKiZPyhpkxevylD3OaUvyEa1hqY=
Date:   Tue, 15 Oct 2019 19:54:22 +0200
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     Michal Simek <michal.simek@xilinx.com>
Cc:     Geert Uytterhoeven <geert@linux-m68k.org>,
        Michal Simek <monstr@monstr.eu>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Jiri Slaby <jslaby@suse.com>,
        "open list:SERIAL DRIVERS" <linux-serial@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Subject: Re: [PATCH] serial: core: Use cons->index for preferred console
 registration
Message-ID: <20191015175422.GA1072965@kroah.com>
References: <4a877f1c7189a7c45b59a6ebfc3de607e8758949.1567434470.git.michal.simek@xilinx.com>
 <CAMuHMdWY2VsY-CyAxSvpm1XYicAWqU7NORSQofQ+T195DwyLUg@mail.gmail.com>
 <7284590f-2b74-1b47-2d61-783ad8d5f46f@monstr.eu>
 <CAMuHMdWZYALZB1bP5Mtoq4Nj5iubzdWBf1vRY9Mh5QvjCDhBgA@mail.gmail.com>
 <622f4c5e-e3ed-3f91-254d-78d905de79c9@xilinx.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <622f4c5e-e3ed-3f91-254d-78d905de79c9@xilinx.com>
User-Agent: Mutt/1.12.2 (2019-09-21)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Tue, Oct 15, 2019 at 04:36:56PM +0200, Michal Simek wrote:
> On 15. 10. 19 11:51, Geert Uytterhoeven wrote:
> > Hi Michal,
> > 
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
> 
> Greg: Please revert this patch I will investigate why it is failing.

Which patch exactly?  Can you provide a revert?  That makes it easiest
for me.

thanks,

greg k-h
