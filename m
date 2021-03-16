Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B2FAC33D457
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 16 Mar 2021 13:54:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231705AbhCPMxt (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 16 Mar 2021 08:53:49 -0400
Received: from mail-vk1-f169.google.com ([209.85.221.169]:33409 "EHLO
        mail-vk1-f169.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232978AbhCPMxU (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 16 Mar 2021 08:53:20 -0400
Received: by mail-vk1-f169.google.com with SMTP id b10so3558787vkl.0;
        Tue, 16 Mar 2021 05:53:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=89XmsMYO9u/e4dB2YkZDf1RWmbZiz/I21ljcsqnAdLs=;
        b=Wvn48Ea/BSHPRU/s8okAJRTM1U5/3sEdhsuAyrSMkES3NrPzOLJbjHKYm4xz2spxCt
         3n/5daiv6uoECPIjTmC6s5Wg7u0ExLb4w4m9NUAoCBAEL+2pOdcgEEN4cxzgYZcs4W5l
         L3ia3VRFXlDWaVPaT/CwNAz8qvGtwleGT0u+21ZxJjh2tOGo7loP9X7R6+wCChE8bXrm
         bxpbVMRqJ8FMYp4CyR4TY5M1/0CSsRHxp47weO6+5U4qOxmEL32+L5XO+N7SdRBQ1Tuf
         AwCDWUbOu4cTiKg2s4ofqczC6cVXj4xByhPEECvlCf33khHRnNnCEjP2dUk39ALhlus+
         VALg==
X-Gm-Message-State: AOAM5307Ojaf1Xfqg0vkHjgZD00Z3B+H3A7DF+iDZQkmWnhmU1e2fHlF
        1fB2ZkCZ3rMMh64uBzQHsHtxeKx3wbhKYoc51PjdhecxCRw=
X-Google-Smtp-Source: ABdhPJwzWg7sH79v5xXWK/RGTQvBSf8wQ7ovU1d0YXRO0vY836tqqCbVp6WpcKvAlPP+E2KU9Fyz0dy8nveI+uEN9Ak=
X-Received: by 2002:a1f:2502:: with SMTP id l2mr7465479vkl.5.1615899199563;
 Tue, 16 Mar 2021 05:53:19 -0700 (PDT)
MIME-Version: 1.0
References: <20210315145938.58565-1-wsa+renesas@sang-engineering.com> <20210315145938.58565-4-wsa+renesas@sang-engineering.com>
In-Reply-To: <20210315145938.58565-4-wsa+renesas@sang-engineering.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Tue, 16 Mar 2021 13:53:08 +0100
Message-ID: <CAMuHMdUw8wWh3ybsFUopKGMw-Zbcqr9bJBEGHAerL-Y226A0=w@mail.gmail.com>
Subject: Re: [PATCH v2 3/3] mmc: renesas_sdhi: do hard reset if possible
To:     Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc:     Linux MMC List <linux-mmc@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Wolfram,

On Mon, Mar 15, 2021 at 4:00 PM Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
> All recent SDHI instances can be reset via the reset controller. If one
> is found, use it instead of the open coded reset. This is to get a
> future-proof sane reset state.
>
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Thanks for your patch!

> --- a/drivers/mmc/host/Kconfig
> +++ b/drivers/mmc/host/Kconfig
> @@ -707,6 +707,7 @@ config MMC_SDHI
>         tristate "Renesas SDHI SD/SDIO controller support"
>         depends on SUPERH || ARCH_RENESAS || COMPILE_TEST
>         select MMC_TMIO_CORE
> +       select RESET_CONTROLLER

... if ARCH_RENESAS?

While RESET_CONTROLLER can be enabled on SuperH (and compiles),
there are no reset drivers for SuperH, so it won't be used anyway.

>         help
>           This provides support for the SDHI SD/SDIO controller found in
>           Renesas SuperH, ARM and ARM64 based SoCs

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
