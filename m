Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B6119A1496
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 29 Aug 2019 11:21:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726009AbfH2JVp (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 29 Aug 2019 05:21:45 -0400
Received: from mail-ot1-f68.google.com ([209.85.210.68]:35089 "EHLO
        mail-ot1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725782AbfH2JVo (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 29 Aug 2019 05:21:44 -0400
Received: by mail-ot1-f68.google.com with SMTP id 100so2758425otn.2
        for <linux-renesas-soc@vger.kernel.org>; Thu, 29 Aug 2019 02:21:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=m1j0+RATAM+WPnLVkKV5S0B7tJ8kBZMbYXGaBspiSYE=;
        b=IINJ9q2nmHHlzjI9U3L7HfZ0aeoUin2nFieYc8Sw0hfKLaueENp2RQ/u4lQWkfdxx3
         Vp59CghNUS2lGDK72cA4G+XVErGgofa+k6PT0gFoKLSkovGfvtSLK2V14W6i1x+iwi2y
         OtIBRs9kwznw3SkAsxU2onWhlSaXMUs9U3Yxk8/Z7pQcAfiruH+WnZXa8NBuqTJJbWrP
         yUFVNUfV4I3YJBcgo54v9h/p2dn/0QUmcrFIjuViXEr79WgDVbS4csdfOpoT9xPIbHXm
         O3RDUvmNxukMFeuPIimMFhfMpHzd/6IF22K1Q2ar67WAWsfwSWcrxlQIyxPF/EUSpnjP
         UVKw==
X-Gm-Message-State: APjAAAXHNV8p5etsrsZwyHVP82N0klfMB4XsJIECmSV2An1gi1cR2dMH
        tu0F712TfYgN5eQH6UC5k5l+0F7D5DJaqHmqiDcn+g==
X-Google-Smtp-Source: APXvYqzL9goJ1246noqmYYL1ScaN10+6qd/H243hH3ZsdEk/UspbFbMv7JjUY88uHXYM7cyT+Tt1+YsQ48JjlB3u9+w=
X-Received: by 2002:a9d:2cc:: with SMTP id 70mr6841854otl.145.1567070503893;
 Thu, 29 Aug 2019 02:21:43 -0700 (PDT)
MIME-Version: 1.0
References: <156630351537.24954.2550542042474735517.sendpatchset@octo>
In-Reply-To: <156630351537.24954.2550542042474735517.sendpatchset@octo>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Thu, 29 Aug 2019 11:21:32 +0200
Message-ID: <CAMuHMdUWY5yO20kgQxQ_rzLfi=eghW+5trZB25YJ7QVPYhDYJw@mail.gmail.com>
Subject: Re: [PATCH/RFC] serial: sh-sci: Update uartclk based on selected clock
To:     Magnus Damm <magnus.damm@gmail.com>
Cc:     Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Magnus,

On Tue, Aug 20, 2019 at 2:16 PM Magnus Damm <magnus.damm@gmail.com> wrote:
> From: Magnus Damm <damm+renesas@opensource.se>
>
> I noticed that uartclk never gets updated as it is today.
>
> This compile tested patch makes sure uartclk is in sync with
> whatever clock is selected during sci_set_termios(). Exposing
> the actual value to user space seems like a good plan to me.

Thanks for your patch!

> Another semi-related issue:
>
> The ->termios() callback in the SCIF driver seems to enable clocks using
> runtine pm in sci_port_enable() followed by register accesses and
> a before returnng sci_port_enable() disables clocks as well.
>
> The ->pm() callback will enable the port again later on however
> on SoCs where the SCIF is in a power domain it looks like the
> register contents might get lost due to power down between ->termios()
> and ->pm()?
>
> Perhaps the power domain use case is known to be busted?

Have you considered nesting of the various serial core/pm functions?

A quick s2ram test on APE6EVM without no_console_suspend shows that
the A3SP power area is powered down, while the console still works
fine afterwards.

> Not-Yet-Signed-off-by: Magnus Damm <damm+renesas@opensource.se>
> ---
>
>  drivers/tty/serial/sh-sci.c |   10 +++++++++-
>  1 file changed, 9 insertions(+), 1 deletion(-)
>
> --- 0001/drivers/tty/serial/sh-sci.c
> +++ work/drivers/tty/serial/sh-sci.c    2019-08-20 20:32:17.680030451 +0900
> @@ -129,6 +129,7 @@ struct sci_port {
>         /* Clocks */
>         struct clk              *clks[SCI_NUM_CLKS];
>         unsigned long           clk_rates[SCI_NUM_CLKS];
> +       int                     sel_clk;
>
>         int                     irqs[SCIx_NR_IRQS];
>         char                    *irqstr[SCIx_NR_IRQS];
> @@ -542,7 +543,11 @@ static void sci_port_enable(struct sci_p
>                 clk_prepare_enable(sci_port->clks[i]);
>                 sci_port->clk_rates[i] = clk_get_rate(sci_port->clks[i]);
>         }
> -       sci_port->port.uartclk = sci_port->clk_rates[SCI_FCK];
> +
> +       if (sci_port->sel_clk >= 0)
> +               sci_port->port.uartclk = sci_port->clk_rates[sci_port->sel_clk];
> +       else
> +               sci_port->port.uartclk = sci_port->clk_rates[SCI_FCK];
>  }
>
>  static void sci_port_disable(struct sci_port *sci_port)
> @@ -2472,6 +2477,7 @@ done:
>                 dev_dbg(port->dev, "Using clk %pC for %u%+d bps\n",
>                         s->clks[best_clk], baud, min_err);
>
> +       s->sel_clk = best_clk;

Might be better to get rid of sci_port.sel_clk, by filling in s->port.uartclk
in sci_set_termios(), right after the call to sci_port_enable() below?

>         sci_port_enable(s);
>
>         /*

Gr{oetje,eeting}s,

                        Geert


--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
