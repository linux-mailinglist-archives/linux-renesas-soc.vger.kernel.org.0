Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 644B23432DA
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 21 Mar 2021 15:07:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229900AbhCUOHO (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Sun, 21 Mar 2021 10:07:14 -0400
Received: from mail-vs1-f47.google.com ([209.85.217.47]:35564 "EHLO
        mail-vs1-f47.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229784AbhCUOGu (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sun, 21 Mar 2021 10:06:50 -0400
Received: by mail-vs1-f47.google.com with SMTP id h25so6083931vso.2
        for <linux-renesas-soc@vger.kernel.org>; Sun, 21 Mar 2021 07:06:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=BOwSmDeBpjgimQMDc1bInhdWWAiHTRfP+qLrvD6Z6mE=;
        b=fPnEkuJKqIhZ307OaXhpLTZk9/wyw6xDOB8N9TPiLxWQhduxc+pABFlOQceKyUQoT6
         w4jwS1ddnRmNta+IfodG+WDcza1AKcXPewTrPOXeY/SDC60TAkVXvHao1aioNSwKOTVB
         Pe7Kk47LjBEqUdeNRxfT7whaYfwlbA8vPU9iXT6Y66EZw1clJTjJ+eAXJaeAlVfucbA3
         zFv+GQG75vjfvOfWCOfeofJg3sWgOaRtXNzA0K3RQuJ/NiNplyuH3DRUmHyUFAux8Yt8
         xYd+DOMDF8bBe/RF2GFhL5oK+eRxkV+H5hbQAKA9cXbAhqKZEvol/fPGB/1j2s1e6gYb
         zX0w==
X-Gm-Message-State: AOAM532+icuwDsGK7MSCpRwimESQEj+oi5CTynSIxxTsZ6hLk5T8/ySf
        hC1F2UlKLndHfNLbyV/Fk67eIxdDZ+jTIjOwpFDuhzBX
X-Google-Smtp-Source: ABdhPJwuoxeek1ftYwHk8YtMypYGHv/Nz+r3fMrs3NSDbXegsZV8garINDkmT+fwtO31v26pSvHoF/781tBUBG+D3uY=
X-Received: by 2002:a67:8883:: with SMTP id k125mr7190921vsd.18.1616335609800;
 Sun, 21 Mar 2021 07:06:49 -0700 (PDT)
MIME-Version: 1.0
References: <161632671592.9191.18170615656272399147.sendpatchset@octo> <161632672360.9191.17012441985597645272.sendpatchset@octo>
In-Reply-To: <161632672360.9191.17012441985597645272.sendpatchset@octo>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Sun, 21 Mar 2021 15:06:38 +0100
Message-ID: <CAMuHMdVK2SW7wxy36Fw4=6=AK+F7OWkYVY_PRUQ1JCq=CYFHDA@mail.gmail.com>
Subject: Re: [PATCH 1/2] sh73a0 CMT1 device exposed via UIO
To:     Magnus Damm <damm@opensource.se>
Cc:     Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Magnus,

On Sun, Mar 21, 2021 at 1:12 PM Magnus Damm <damm@opensource.se> wrote:
> From: Magnus Damm <damm+renesas@opensource.se>
>
> Modify the kernel slightly to expose CMT1 via UIO and print some
> IRQ-related messages from UIO for debugging purpose.
>
> Not-Yet-Signed-off-by: Magnus Damm <damm+renesas@opensource.se>

Thanks for your patch!

> --- 0001/arch/arm/boot/dts/sh73a0.dtsi
> +++ work/arch/arm/boot/dts/sh73a0.dtsi  2021-03-21 18:15:44.683760186 +0900
> @@ -99,7 +99,7 @@
>         };
>
>         cmt1: timer@e6138000 {
> -               compatible = "renesas,sh73a0-cmt1";
> +               compatible = "uio_pdrv_genirq";

DT describes hardware, not software policy, so please drop this part.

> --- 0001/drivers/uio/uio_pdrv_genirq.c
> +++ work/drivers/uio/uio_pdrv_genirq.c  2021-03-21 18:15:03.120757568 +0900
> @@ -276,7 +282,7 @@ static const struct dev_pm_ops uio_pdrv_
>
>  #ifdef CONFIG_OF
>  static struct of_device_id uio_of_genirq_match[] = {
> -       { /* This is filled with module_parm */ },
> +       { .compatible = "uio_pdrv_genirq", },

The comment you removed tells you how to use this driver ;-)
Alternative, please use driver_override and bind in sysfs.

>         { /* Sentinel */ },
>  };
>  MODULE_DEVICE_TABLE(of, uio_of_genirq_match);

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
