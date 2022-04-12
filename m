Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4440D4FDC68
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 12 Apr 2022 13:05:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242038AbiDLK0S (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 12 Apr 2022 06:26:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48424 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1358429AbiDLKS7 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 12 Apr 2022 06:18:59 -0400
Received: from mail-qt1-f176.google.com (mail-qt1-f176.google.com [209.85.160.176])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7DDA07C78C;
        Tue, 12 Apr 2022 02:16:20 -0700 (PDT)
Received: by mail-qt1-f176.google.com with SMTP id ay4so2781349qtb.11;
        Tue, 12 Apr 2022 02:16:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=vb/exwohC5cqMpKn9cySsv+5hXcFSt6tITGqK0qhvEs=;
        b=teg71CknfoVJRSLoZ+OLA2CnR8d2kDBCsLiuEuSD5WI2f9Sij2B+zNefGwrJJ51LtO
         aTjvsx/MUHqDXVmG/IcLe8YqmN5PdQ+3Cr0HxWtze0mjOhLcLdK7o//FieZmuKZm801D
         LxlhgrOg42lWO3C6liJ9a/4/7zV/GFwdhZMgYv7sp1/KTzAYdGXjy5sXjNRnVSOLAmD/
         LkxpFBUfPY2u6Ww2uYI9VKV44BxWom5+sPjsrxkxnLZ9EZffBfUHNVrQ48x8/bg8NqeG
         ciRxk/CTYN0YRx9gJONrqNYW1+LQfyCQJLVqVYfBdaXUzBRH/eB/a2WmJSDZH30FyzNo
         qZ0w==
X-Gm-Message-State: AOAM533Hpz60iaFbGhiUh0UFsB7mhomSICGAEYDg8cg0ypqEF9U9Ere4
        6iHN+BDaFtcjJVItHL9rGt6PYItp0aaEpuTL
X-Google-Smtp-Source: ABdhPJx8B//x2UQUJInXTyWdFEbdHOMBR9uc4R6GGe9r8sPxOdCCrFn30GbsNTqe6U/j3D7InGDX+Q==
X-Received: by 2002:ac8:43cc:0:b0:2eb:dc8a:d5c5 with SMTP id w12-20020ac843cc000000b002ebdc8ad5c5mr2456949qtn.663.1649754979220;
        Tue, 12 Apr 2022 02:16:19 -0700 (PDT)
Received: from mail-yb1-f182.google.com (mail-yb1-f182.google.com. [209.85.219.182])
        by smtp.gmail.com with ESMTPSA id p16-20020a05622a13d000b002e227782e9asm26730974qtk.14.2022.04.12.02.16.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 12 Apr 2022 02:16:19 -0700 (PDT)
Received: by mail-yb1-f182.google.com with SMTP id j2so32113520ybu.0;
        Tue, 12 Apr 2022 02:16:18 -0700 (PDT)
X-Received: by 2002:a25:c049:0:b0:634:6751:e8d2 with SMTP id
 c70-20020a25c049000000b006346751e8d2mr26209411ybf.6.1649754978717; Tue, 12
 Apr 2022 02:16:18 -0700 (PDT)
MIME-Version: 1.0
References: <20220407063114.1433-1-wsa+renesas@sang-engineering.com>
In-Reply-To: <20220407063114.1433-1-wsa+renesas@sang-engineering.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Tue, 12 Apr 2022 11:16:07 +0200
X-Gmail-Original-Message-ID: <CAMuHMdV=_QBTzd=yzD0kwvi2gNOp+oj3VjRursynto-Nbt4cLA@mail.gmail.com>
Message-ID: <CAMuHMdV=_QBTzd=yzD0kwvi2gNOp+oj3VjRursynto-Nbt4cLA@mail.gmail.com>
Subject: Re: [PATCH] mmc: sh_mmcif: move platform_data header to proper location
To:     Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc:     Linux MMC List <linux-mmc@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-1.4 required=5.0 tests=BAYES_00,
        FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Wolfram,

On Thu, Apr 7, 2022 at 4:33 PM Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
> We have a dedicated directory for platform_data meanwhile, don't spoil
> the MMC directory with it.
>
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
One minor nit below.

> --- a/drivers/mmc/host/sh_mmcif.c
> +++ b/drivers/mmc/host/sh_mmcif.c
> @@ -43,13 +43,13 @@
>  #include <linux/mmc/host.h>
>  #include <linux/mmc/mmc.h>
>  #include <linux/mmc/sdio.h>
> -#include <linux/mmc/sh_mmcif.h>
>  #include <linux/mmc/slot-gpio.h>
>  #include <linux/mod_devicetable.h>
>  #include <linux/mutex.h>
>  #include <linux/of_device.h>
>  #include <linux/pagemap.h>
>  #include <linux/platform_device.h>
> +#include <linux/platform_data/sh_mmcif.h>

Is this intended to be sorted? a < e.

>  #include <linux/pm_qos.h>
>  #include <linux/pm_runtime.h>
>  #include <linux/sh_dma.h>

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
