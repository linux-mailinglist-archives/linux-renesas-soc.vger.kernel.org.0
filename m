Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C021A13542F
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  9 Jan 2020 09:18:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728349AbgAIISr (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 9 Jan 2020 03:18:47 -0500
Received: from mail-qt1-f196.google.com ([209.85.160.196]:37782 "EHLO
        mail-qt1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728273AbgAIISq (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 9 Jan 2020 03:18:46 -0500
Received: by mail-qt1-f196.google.com with SMTP id w47so5191189qtk.4;
        Thu, 09 Jan 2020 00:18:46 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=GJqTWyJTs1zwYmmHyFe9SRWpjlE7IkPRXbAKLt6+Ehs=;
        b=MwH/NvJqcfnBhXVRAbXjxcdbDgUIOTzExNZdavAfGg+/BTltQPmXIV7cV0nfluvWow
         HykrI2a0ab2sXrVOlhFoFu6LHy0z64HbFgPq2o+CvwIvXnrc6jPUfOM//t0h7LSj3yeU
         hVfntb0F+hGIvVnhjI0nLyX8bDVmSr3NXh1/S/NHHp/SQpvna9VJYACJzu7TQYhHKuvE
         8oSpFAtxcyqGkmCTn6GgeBxoS6Equp8CyQLWvnUlREWAx5r93KBP9FpTWkQdi3We1XTg
         lKeoGCOIUJIZlcJmDP+kCyLXhIBv2KrRWjignwB3M89tpfqFxULMZVVie0Op6IXZWWNz
         B9uA==
X-Gm-Message-State: APjAAAWybVRU3EJdpEGgPukumLev32v3yRAfweiTxZfb6pCySrAklyH9
        py+5v4uQGgxm0l55qrPcNIasxe/4L3s7mlPlCIoDm0+E
X-Google-Smtp-Source: APXvYqyWbS7PuUTlSTTCzM+dBZcrBH0cNspZNTCeGmAHvOarpA8BIVugqe2qYGN74SJrHG65JLC/kHAKQQT268wqC08=
X-Received: by 2002:aed:27de:: with SMTP id m30mr7053330qtg.151.1578557925922;
 Thu, 09 Jan 2020 00:18:45 -0800 (PST)
MIME-Version: 1.0
References: <87o8vdsceg.wl-kuninori.morimoto.gx@renesas.com> <87lfqhscac.wl-kuninori.morimoto.gx@renesas.com>
In-Reply-To: <87lfqhscac.wl-kuninori.morimoto.gx@renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Thu, 9 Jan 2020 09:18:34 +0100
Message-ID: <CAMuHMdWo2w=Uf-yKReg+BMjKk4otGqG0DE4urtWhVOTE9+o1kw@mail.gmail.com>
Subject: Re: [PATCH][repost] sh: clkfwk: remove r8/r16/r32
To:     Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc:     Yoshinori Sato <ysato@users.sourceforge.jp>,
        Rich Felker <dalias@libc.org>,
        Andrew Morton <akpm@linux-foundation.org>,
        Linux-SH <linux-sh@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Morimoto-san,

On Thu, Jan 9, 2020 at 1:29 AM Kuninori Morimoto
<kuninori.morimoto.gx@renesas.com> wrote:
> From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
>
> SH will get below warning
>
> ${LINUX}/drivers/sh/clk/cpg.c: In function 'r8':
> ${LINUX}/drivers/sh/clk/cpg.c:41:17: warning: passing argument 1 of 'ioread8'
>  discards 'const' qualifier from pointer target type [-Wdiscarded-qualifiers]
>   return ioread8(addr);
>                  ^~~~
> In file included from ${LINUX}/arch/sh/include/asm/io.h:21,
>                  from ${LINUX}/include/linux/io.h:13,
>                  from ${LINUX}/drivers/sh/clk/cpg.c:14:
> ${LINUX}/include/asm-generic/iomap.h:29:29: note: expected 'void *' but
> argument is of type 'const void *'
>  extern unsigned int ioread8(void __iomem *);
>                              ^~~~~~~~~~~~~~
>
> We don't need "const" for r8/r16/r32.
> And we don't need r8/r16/r32 themselvs.
> This patch cleanup these.
>
> Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

One note below.

> --- a/drivers/sh/clk/cpg.c
> +++ b/drivers/sh/clk/cpg.c
> @@ -36,36 +36,21 @@ static void sh_clk_write(int value, struct clk *clk)
>                 iowrite32(value, clk->mapped_reg);
>  }
>
> -static unsigned int r8(const void __iomem *addr)
> -{
> -       return ioread8(addr);
> -}
> -
> -static unsigned int r16(const void __iomem *addr)
> -{
> -       return ioread16(addr);
> -}
> -
> -static unsigned int r32(const void __iomem *addr)
> -{
> -       return ioread32(addr);
> -}
> -
>  static int sh_clk_mstp_enable(struct clk *clk)
>  {
>         sh_clk_write(sh_clk_read(clk) & ~(1 << clk->enable_bit), clk);
>         if (clk->status_reg) {
> -               unsigned int (*read)(const void __iomem *addr);
> +               unsigned int (*read)(void __iomem *addr);

While it is good to get rid of the wrappers, the change above will conflict with
[PATCH v2 1/9] iomap: Constify ioreadX() iomem argument (as in generic
implementation)
(https://lore.kernel.org/lkml/20200108200528.4614-2-krzk@kernel.org/),
which will add const to ioread*().

>                 int i;
>                 void __iomem *mapped_status = (phys_addr_t)clk->status_reg -
>                         (phys_addr_t)clk->enable_reg + clk->mapped_reg;
>
>                 if (clk->flags & CLK_ENABLE_REG_8BIT)
> -                       read = r8;
> +                       read = ioread8;
>                 else if (clk->flags & CLK_ENABLE_REG_16BIT)
> -                       read = r16;
> +                       read = ioread16;
>                 else
> -                       read = r32;
> +                       read = ioread32;
>
>                 for (i = 1000;
>                      (read(mapped_status) & (1 << clk->enable_bit)) && i;

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
