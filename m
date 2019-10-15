Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C9160D71FD
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 15 Oct 2019 11:19:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726678AbfJOJTh (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 15 Oct 2019 05:19:37 -0400
Received: from mail-oi1-f195.google.com ([209.85.167.195]:37794 "EHLO
        mail-oi1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725980AbfJOJTh (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 15 Oct 2019 05:19:37 -0400
Received: by mail-oi1-f195.google.com with SMTP id i16so16202796oie.4;
        Tue, 15 Oct 2019 02:19:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=+KkHVe7XiI2w+s1khaLxgYiblcensoZmhTtGUMIWDQM=;
        b=W1ZoreIT6WtTJN7kxNy0LtYAMmcbPH4gl8w412z0N3EhcfX5YG1XrV3k2KYwmQLpni
         druUT3XjMAU20KbKEE9UXVcysmgtnDmBl6zPoFEmoyTjadQsyZpR17HNE8Q1yHct3jZ+
         hZpXCifpKgcEpsb66YNEUKFPhnzErF3OLNdWpMbEcQ+DPNQUPxwB696p6fVCyUEz20XP
         BGcTpGr2qD2FN1sLae6L3oRFyYolg9tHEv5azPD4BqhijaXctv/gcxXUQqrYgl7V5hLL
         LLp2JuPFH5orBUT0ZXNvbYyc8j24ReSx6JE/eaC5MorjXZB+d0zhvh08Mr+5uFISE8DB
         Ohog==
X-Gm-Message-State: APjAAAV7iPfxEMU2Ze8p7WYJvaEqhDGfNV0PIN0ylU4k3obZfR3BvHHp
        jQqwUyAarpondTz5yVzl+Gy0sZMktZxe5Nr380M=
X-Google-Smtp-Source: APXvYqzhaz8x3mX03fBf3KLgIqmj4TfpV+VGFzay1G84HHBSpuT7CjrIyNsXkaGyN3iLkkHNfGsNfQfD7tja+Ypx5Ow=
X-Received: by 2002:aca:882:: with SMTP id 124mr28234946oii.54.1571131176133;
 Tue, 15 Oct 2019 02:19:36 -0700 (PDT)
MIME-Version: 1.0
References: <4a877f1c7189a7c45b59a6ebfc3de607e8758949.1567434470.git.michal.simek@xilinx.com>
In-Reply-To: <4a877f1c7189a7c45b59a6ebfc3de607e8758949.1567434470.git.michal.simek@xilinx.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Tue, 15 Oct 2019 11:19:25 +0200
Message-ID: <CAMuHMdWY2VsY-CyAxSvpm1XYicAWqU7NORSQofQ+T195DwyLUg@mail.gmail.com>
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

Hi Michal,

On Mon, Sep 2, 2019 at 4:29 PM Michal Simek <michal.simek@xilinx.com> wrote:
> The reason for this patch is xilinx_uartps driver which create one dynamic
> instance per IP with unique major and minor combinations. drv->nr is in
> this case all the time setup to 1. That means that uport->line is all the
> time setup to 0 and drv->tty_driver->name_base is doing shift in name to
> for example ttyPS3.
>
> register_console() is looping over console_cmdline array and looking for
> proper name/index combination which is in our case ttyPS/3.
> That's why every instance of driver needs to be registered with proper
> combination of name/number (ttyPS/3). Using uport->line is doing
> registration with ttyPS/0 which is wrong that's why proper console index
> should be used which is in cons->index field.
>
> Also it is visible that recording console should be done based on
> information about console not about the port but in most cases numbers are
> the same and xilinx_uartps is only one exception now.
>
> Signed-off-by: Michal Simek <michal.simek@xilinx.com>

This is now commit 91daae03188e0dd1 ("serial: core: Use cons->index
for preferred console registration") in tty-next.

This has been bisected to break the serial console on (at least)
r8a7791/koelsch and r8a7795/h3-salvator-xs.

The line "printk: console [ttySC0] enabled" is no longer printed.
The system continues booting without any serial console output, and the
login prompt never appears on the serial console.

Reverting this commit fixes the issue.

> --- a/drivers/tty/serial/serial_core.c
> +++ b/drivers/tty/serial/serial_core.c
> @@ -2825,7 +2825,8 @@ int uart_add_one_port(struct uart_driver *drv, struct uart_port *uport)
>                 lockdep_set_class(&uport->lock, &port_lock_key);
>         }
>         if (uport->cons && uport->dev)
> -               of_console_check(uport->dev->of_node, uport->cons->name, uport->line);
> +               of_console_check(uport->dev->of_node, uport->cons->name,
> +                                uport->cons->index);
>
>         uart_configure_port(drv, state, uport);

Gr{oetje,eeting}s,

                        Geert


--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
