Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 84ED2330973
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  8 Mar 2021 09:36:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231433AbhCHIgJ (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 8 Mar 2021 03:36:09 -0500
Received: from mail-ua1-f50.google.com ([209.85.222.50]:41880 "EHLO
        mail-ua1-f50.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230341AbhCHIfn (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 8 Mar 2021 03:35:43 -0500
Received: by mail-ua1-f50.google.com with SMTP id u13so3058585uap.8;
        Mon, 08 Mar 2021 00:35:43 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=idle5xLu52lK6hHesv6Zvw3rifnSNDluxt4tlFsGgyI=;
        b=oiYtZLRswgQPNDA0pie/fGCNrVixepzOUCAcx3ZtuN+oD3k2SP/RK6QTM9yiE57YyR
         GLRzZTW0xRqxezlAluCyalxDILBdkDMUGzR0sGqNKqq6SWVSmTFj8nxSuiPo4G3dUT6w
         +yeEtRP3qI/x/wVjlegPE6K+uBHZrxrUsqabQE6kgS4TRmTLLczJ5h7NwMuSppJo2OeH
         BZ7z9XnzJUrkvZMF/yZOTKf6TWTKeTEJZYd/d3DbMX8Ppal6dlW1g2L4hc127rWQnnPV
         FHINLY54NnLkXjNml3OTxwiMyhc90Y5PyiuigPZ5jB3LC8zK4tH5+TKP59RnMshIGexT
         pY5A==
X-Gm-Message-State: AOAM533zWeNyUyLA57d90ju/RQ70Z3zQp7x6z+Y4xBatgACeKgzwSniq
        84F7ijJWKuWgZQP/RsCf8yGcVNCKC1oUsQIxjl0=
X-Google-Smtp-Source: ABdhPJzZW5Yj7ZOgbBWZDJ2g2luunE3jxgw+3+M0kFhVmEgwGd9/JYTYERtx1gyqz96OLdBuOSYrXoZ55fGEqFAFS8c=
X-Received: by 2002:ab0:20b3:: with SMTP id y19mr11998385ual.2.1615192543092;
 Mon, 08 Mar 2021 00:35:43 -0800 (PST)
MIME-Version: 1.0
References: <20210305132859.8208-1-wsa+renesas@sang-engineering.com>
In-Reply-To: <20210305132859.8208-1-wsa+renesas@sang-engineering.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Mon, 8 Mar 2021 09:35:31 +0100
Message-ID: <CAMuHMdX9f_G9zMR4=snbHUOP0ufNg8CvSxX8P6+W-z7hBRbQ2g@mail.gmail.com>
Subject: Re: [PATCH] clocksource: sh_cmt: use CMTOUT_IE only when supported
To:     Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Phong Hoang <phong.hoang.wz@renesas.com>
Cc:     Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        =?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Wolfram, Phong-san,

On Fri, Mar 5, 2021 at 2:30 PM Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
> CMTOUT_IE is only supported for older SoCs. Newer SoCs shall not set
> this bit. So, add a version check.
>
> Reported-by: Phong Hoang <phong.hoang.wz@renesas.com>
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Thanks for your patch!

As R-Car Gen2/3 indeed don't have this bit:
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

But given my comments below, I think it would make sense to change the
one-line summary to e.g. "clocksource: sh_cmt: R-Car Gen2/Gen3 do not
have CMTOUT_IE".

> --- a/drivers/clocksource/sh_cmt.c
> +++ b/drivers/clocksource/sh_cmt.c
> @@ -143,6 +143,7 @@ struct sh_cmt_device {
>  #define SH_CMT32_CMCSR_SSIE            (1 << 10)
>  #define SH_CMT32_CMCSR_CMS             (1 << 9)
>  #define SH_CMT32_CMCSR_CMM             (1 << 8)
> +/* CMTOUT_IE only for SH_CMT_32BIT and SH_CMT_48BIT */
>  #define SH_CMT32_CMCSR_CMTOUT_IE       (1 << 7)
>  #define SH_CMT32_CMCSR_CMR_NONE                (0 << 4)
>  #define SH_CMT32_CMCSR_CMR_DMA         (1 << 4)
> @@ -339,8 +340,9 @@ static int sh_cmt_enable(struct sh_cmt_channel *ch)
>                 sh_cmt_write_cmcsr(ch, SH_CMT16_CMCSR_CMIE |
>                                    SH_CMT16_CMCSR_CKS512);
>         } else {
> -               sh_cmt_write_cmcsr(ch, SH_CMT32_CMCSR_CMM |
> -                                  SH_CMT32_CMCSR_CMTOUT_IE |
> +               u32 cmtout = ch->cmt->info->model <= SH_CMT_48BIT ?
> +                             SH_CMT32_CMCSR_CMTOUT_IE : 0;
> +               sh_cmt_write_cmcsr(ch, cmtout | SH_CMT32_CMCSR_CMM |
>                                    SH_CMT32_CMCSR_CMR_IRQ |
>                                    SH_CMT32_CMCSR_CKS_RCLK8);
>         }

Note that this bit is still set for all "32-bit" and all other "48-bit"
variants:

SH_CMT_32BIT:
sh7720: CMTOUT_IE supported
sh7343/7366: no docs
sh7722/sh7723: limited docs, but "Supports canceling of the standby
state in U-standby mode."
sh7724: CMTOUT_IE supported

SH_CMT_48BIT:
sh73a0/r8a7740: CMTOUT_IE supported on channels 1/2/3, not on 0/4/5

So even not all older models support this bit.
Probably this bit should only be set when the timer is configured as a
wake-up source.  But that is out-of-scope for this patch.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
