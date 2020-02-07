Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8CCCA155735
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  7 Feb 2020 12:54:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726819AbgBGLym (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 7 Feb 2020 06:54:42 -0500
Received: from mail-ot1-f67.google.com ([209.85.210.67]:42320 "EHLO
        mail-ot1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726674AbgBGLyl (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 7 Feb 2020 06:54:41 -0500
Received: by mail-ot1-f67.google.com with SMTP id 66so1872443otd.9
        for <linux-renesas-soc@vger.kernel.org>; Fri, 07 Feb 2020 03:54:40 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=aqPQyjSPzI6Dm3O4+BJ8GXlrXKzPoDIL3Fx3zbwuBvM=;
        b=jGJc1AbrKMDm3WI+g8EUNYK8zX82dOeidIAJAYp5s8mxoZsFqVPo2qkcDyUwnJscB2
         dWBL1qEEQyXPbg0/yho49nlOsyEUjg+LxTrr0MTWpVnt1tdx6UD0mwKdyRKqxXNoG4TL
         7OXi7h/M/Yr/XHlVr6trY1okvraLAP+xSnFGFTUUU6ojXA19IL9CYZAxpyppGiZzle2P
         nN2o6IU4ddc3g9YcY+8t35Vsq0qQmaiugYEDdmkaxbwih0ime3R0xnJV73aNLsvXHnyD
         x4aGTq41cSBbyZobnYrgIjGbLUP4ZHCZ19U5vn83a0e/p74W+pCSPrnkgBQ0Se4Kvr7l
         xLKQ==
X-Gm-Message-State: APjAAAXBXMczRhpDAzJuH+6QmL+iUXml+4zAlq6ea4LTXdhTJ68jx0st
        zqO6HjCks4sQZ8p83Jy5BNvmi9o1hMYf1h6zsb0=
X-Google-Smtp-Source: APXvYqw6o1Ik9gTYcKV5IjrAOh78r9R57jyQ72pp6manVYdjYyrn+qim2jbfNT+cv04g4TDxTlzZ1e2Dfe6UZ7lw1Xg=
X-Received: by 2002:a9d:7602:: with SMTP id k2mr2410801otl.39.1581076480019;
 Fri, 07 Feb 2020 03:54:40 -0800 (PST)
MIME-Version: 1.0
References: <156630351537.24954.2550542042474735517.sendpatchset@octo>
In-Reply-To: <156630351537.24954.2550542042474735517.sendpatchset@octo>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Fri, 7 Feb 2020 12:54:29 +0100
Message-ID: <CAMuHMdWJgos4540rhj54EmVKX+QCtAwXLWMH7mL286UUuv9HaA@mail.gmail.com>
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

Except that it changes all the time.
What is userspace supposed to do with this value?
Support the deprecated UPF_SPD_CUST flag?
Anything else?

See also "[PATCH] serial: sh-sci: Support custom speed setting"
https://lore.kernel.org/linux-renesas-soc/20200129161955.30562-1-erosca@de.adit-jv.com/

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

Iff this is worthwhile, I think it's better to use the highest rate of all
available clock inputs, as that gives a hint about the maximum usable
speed.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
