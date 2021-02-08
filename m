Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 86B19312EC6
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  8 Feb 2021 11:19:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231971AbhBHKTZ (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 8 Feb 2021 05:19:25 -0500
Received: from mail-ot1-f53.google.com ([209.85.210.53]:40157 "EHLO
        mail-ot1-f53.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232295AbhBHKSx (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 8 Feb 2021 05:18:53 -0500
Received: by mail-ot1-f53.google.com with SMTP id i20so13664733otl.7;
        Mon, 08 Feb 2021 02:18:37 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=sYbVgLIX+r79AC92zSDbMeMyYfHTGLVOZJrkvK6/LKQ=;
        b=ZKqKt2Gu/vTRGswruTe5S42pl3uzvr5Uvfs+RW8XMNCmeEjjpQ7DYmH2yAv2KFldiC
         XtfHqlsOaL+fZs2d6NPjHiz7VekaGYrkVbS8f/QhiUEXvHwpKQax8GLyCJIqcDN1PZPP
         wFsQHnceK7HgxKVx/ckv+wMyFGzqNsyvuZp5UgTmYS+z51+2Ya9YjTAYOkzLhobQcpsx
         BjMorwCqec3NZJulGuADSIiVIBj4PAknhm7HHa42ECFyqLpKwVPX7+ubY9p4N6HKtcXw
         TThdyFeShkp1QZeHtvrEQdFXJ8o7nh0Nj1V+M/AQHmLEkpt1GagjTRYwjolJB1zOOSOX
         VROA==
X-Gm-Message-State: AOAM531ku60lkbDSeMMZYUCM8wuOm+9pFEUypKH+Rw0lbMNbiqAWxke8
        EBHn5WTUyLlTQXXcZuRZiZaOhwFa5RMYJikq5Zs=
X-Google-Smtp-Source: ABdhPJzuE0WnFgQq2prS/EOzWrbfsuwPgtDDyydII7UXbUSgS/+JtVjC5DE9GL+Ns+9OFXHsGmG2zJDO4CdNX8b02MU=
X-Received: by 2002:a9d:77d6:: with SMTP id w22mr1010723otl.145.1612779492055;
 Mon, 08 Feb 2021 02:18:12 -0800 (PST)
MIME-Version: 1.0
References: <20210207000030.256592-1-memxor@gmail.com> <20210207173441.2902acac@canb.auug.org.au>
 <20210207073827.7l7h3475tqgxxfte@apollo>
In-Reply-To: <20210207073827.7l7h3475tqgxxfte@apollo>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Mon, 8 Feb 2021 11:18:01 +0100
Message-ID: <CAMuHMdVE+a4gMwa206=CWCUzAPD9N5nnvsPa1avWq_t1isfizQ@mail.gmail.com>
Subject: Re: [PATCH] staging: emxx_udc: Fix incorrectly defined global
To:     Kumar Kartikeya Dwivedi <memxor@gmail.com>
Cc:     Stephen Rothwell <sfr@canb.auug.org.au>,
        driverdevel <devel@driverdev.osuosl.org>,
        Greg KH <gregkh@linuxfoundation.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Nishad Kamdar <nishadkamdar@gmail.com>,
        Magnus Damm <magnus.damm@gmail.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Kumar,

CC Nishad, Magnus, linux-renesas-soc,

On Sun, Feb 7, 2021 at 8:40 AM Kumar Kartikeya Dwivedi <memxor@gmail.com> wrote:
> On Sun, Feb 07, 2021 at 12:04:41PM IST, Stephen Rothwell wrote:
> > Given that drivers/staging/emxx_udc/emxx_udc.h is only included by
> > drivers/staging/emxx_udc/emxx_udc.c, shouldn't these variables just be
> > declared static in emxx_udc.c and removed from emxx_udc.h?
> >
>
> Either would be correct. I went this way because it was originally trying to
> (incorrectly) define a global variable instead. I guess they can be static now
> and when more users are added, the linkage can be adjusted as needed.
>
> Here's another version of the patch:
>
> --
> From 5835ad916ceeba620c85bc32f52ecd69f21f8dab Mon Sep 17 00:00:00 2001
> From: Kumar Kartikeya Dwivedi <memxor@gmail.com>
> Date: Sun, 7 Feb 2021 12:53:39 +0530
> Subject: [PATCH] staging: emxx_udc: Make incorrectly defined global static
>
> The global gpio_desc pointer and int vbus_irq were defined in the header,
> instead put the definitions in the translation unit and make them static as
> there's only a single consumer in emxx_udc.c.
>
> This fixes the following sparse warnings for this driver:
> drivers/staging/emxx_udc/emxx_udc.c: note: in included file:
> drivers/staging/emxx_udc/emxx_udc.h:23:18: warning: symbol 'vbus_gpio' was not
> declared. Should it be static?
> drivers/staging/emxx_udc/emxx_udc.h:24:5: warning: symbol 'vbus_irq' was not
> declared. Should it be static?
>
> Signed-off-by: Kumar Kartikeya Dwivedi <memxor@gmail.com>

Thanks for your patch!

> --- a/drivers/staging/emxx_udc/emxx_udc.c
> +++ b/drivers/staging/emxx_udc/emxx_udc.c
> @@ -34,6 +34,9 @@
>  #define        DRIVER_DESC     "EMXX UDC driver"
>  #define        DMA_ADDR_INVALID        (~(dma_addr_t)0)
>
> +static struct gpio_desc *vbus_gpio;
> +static int vbus_irq;

While I agree these must be static, I expect the driver to be still
broken, as vbus_gpio is never set?

Commit 48101806c52203f6 ("Staging: emxx_udc: Switch to the gpio
descriptor interface") introduced both variables, which was presumably
never tested.

Magnus: perhaps we should just remove this driver?

> +
>  static const char      driver_name[] = "emxx_udc";
>  static const char      driver_desc[] = DRIVER_DESC;
>
> diff --git a/drivers/staging/emxx_udc/emxx_udc.h b/drivers/staging/emxx_udc/emxx_udc.h
> index bca614d69..c9e37a1b8 100644
> --- a/drivers/staging/emxx_udc/emxx_udc.h
> +++ b/drivers/staging/emxx_udc/emxx_udc.h
> @@ -20,8 +20,6 @@
>  /* below hacked up for staging integration */
>  #define GPIO_VBUS 0 /* GPIO_P153 on KZM9D */
>  #define INT_VBUS 0 /* IRQ for GPIO_P153 */
> -struct gpio_desc *vbus_gpio;
> -int vbus_irq;

Gr{oetje,eeting}s,

                        Geert


--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
