Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id EE3F978794
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 29 Jul 2019 10:37:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727816AbfG2Ih6 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 29 Jul 2019 04:37:58 -0400
Received: from mail-wr1-f68.google.com ([209.85.221.68]:46960 "EHLO
        mail-wr1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726305AbfG2Ih6 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 29 Jul 2019 04:37:58 -0400
Received: by mail-wr1-f68.google.com with SMTP id z1so60806483wru.13;
        Mon, 29 Jul 2019 01:37:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=v2fzYoiHmZNvVNIDlst/n6yOdTe6WLLtW6cd2YyN8MM=;
        b=R7j6SuD8lbX7+8+uQqG43xDRp3q0y3KukZWYfYk5sg22JzUZpXLj3napj6tm8MZZWn
         Z1QmLws8LptdB0FXwPAK2tOkSsXlEXsD2R70OE6W7U4rZ3uD7JCEDQqdANSgi3o1zj0/
         oLElcLJJL6fKhJkHex+bOKP/Pab6cQrizP2pMNDJP07jz4ZAa08uTRhj/UpL727yGbr4
         ckpvWl8MhQr7C96kx/tscyjOimtlkqlXN7n5fE1JhphSB15DqIkNFsUlqKynobaxgKs8
         UDDe55CK3es6mauJL0h1gOTuJ1V/O6afDd4JBZ4syIFYZSkn/NhdYQG6EZ1zBWbJHdSX
         qtig==
X-Gm-Message-State: APjAAAVAqHBWMU/82OOAjqygtw6NCHD3MJrNbqTXXZwzB/FGfQxX9mQz
        1a2BIq1IXGe1A/EJGlW5DyiNepzZTO2WAR2Ek40=
X-Google-Smtp-Source: APXvYqxYXV4BHC4egPdmH36nxGmOUs6g1mJFhEYtAHtxFcz7uUV8f/StmyERRviKiL8TwLEZNbCTOrALYs+OlmhVmOU=
X-Received: by 2002:adf:f08f:: with SMTP id n15mr34847348wro.213.1564389476092;
 Mon, 29 Jul 2019 01:37:56 -0700 (PDT)
MIME-Version: 1.0
References: <1563289264-26432-1-git-send-email-uli+renesas@fpond.eu> <1563289264-26432-3-git-send-email-uli+renesas@fpond.eu>
In-Reply-To: <1563289264-26432-3-git-send-email-uli+renesas@fpond.eu>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Mon, 29 Jul 2019 10:37:44 +0200
Message-ID: <CAMuHMdXrfv7xh9f5xsHnG87L1u1V2r2MuS6bV2zxWKku6AALqg@mail.gmail.com>
Subject: Re: [PATCH 2/2] mmc: tmio: remove obsolete PM workaround
To:     Ulrich Hecht <uli+renesas@fpond.eu>
Cc:     Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Linux MMC List <linux-mmc@vger.kernel.org>,
        =?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
        Wolfram Sang <wsa@the-dreams.de>,
        Masahiro Yamada <yamada.masahiro@socionext.com>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        Magnus Damm <magnus.damm@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Tue, Jul 16, 2019 at 5:01 PM Ulrich Hecht <uli+renesas@fpond.eu> wrote:
> Obsoleted by
> "mmc: tmio: move runtime PM enablement to the driver implementations".

commit 7ff213193310ef8d ("mmc: tmio: move runtime PM enablement to the
driver implementations")

>
> Signed-off-by: Ulrich Hecht <uli+renesas@fpond.eu>
> ---
>  drivers/mmc/host/tmio_mmc_core.c | 9 ---------
>  1 file changed, 9 deletions(-)
>
> diff --git a/drivers/mmc/host/tmio_mmc_core.c b/drivers/mmc/host/tmio_mmc_core.c
> index 26dcbba..29c0d2c 100644
> --- a/drivers/mmc/host/tmio_mmc_core.c
> +++ b/drivers/mmc/host/tmio_mmc_core.c
> @@ -1221,15 +1221,6 @@ int tmio_mmc_host_probe(struct tmio_mmc_host *_host)
>                 _host->reset = tmio_mmc_reset;
>
>         /*
> -        * On Gen2+, eMMC with NONREMOVABLE currently fails because native
> -        * hotplug gets disabled. It seems RuntimePM related yet we need further
> -        * research. Since we are planning a PM overhaul anyway, let's enforce
> -        * for now the device being active by enabling native hotplug always.
> -        */
> -       if (pdata->flags & TMIO_MMC_MIN_RCAR2)
> -               _host->native_hotplug = true;
> -
> -       /*
>          * While using internal tmio hardware logic for card detection, we need
>          * to ensure it stays powered for it to work.
>          */

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
