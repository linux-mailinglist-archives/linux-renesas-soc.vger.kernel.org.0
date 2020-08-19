Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AAA62249D70
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 19 Aug 2020 14:08:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727807AbgHSMIA (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 19 Aug 2020 08:08:00 -0400
Received: from mail-oi1-f193.google.com ([209.85.167.193]:37691 "EHLO
        mail-oi1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727022AbgHSMH0 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 19 Aug 2020 08:07:26 -0400
Received: by mail-oi1-f193.google.com with SMTP id e6so20785570oii.4
        for <linux-renesas-soc@vger.kernel.org>; Wed, 19 Aug 2020 05:07:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=D2NRu5H+t3o+tSYrWrGUFU1mvP6wBK5QuGC9nUPHNwo=;
        b=GtiYqzrsejRc7wT/TW9BeakQtX4uZdD8N+a0MjbOQG3pNy6addY0xqmY/f3x6hr5dT
         Ppe0qvoTxy/N56lIh703mw0h3oNcHuWxGM+yo1V8Bxfz5pWyUFF5zY6jPsKLJPj8Wf8b
         jPOCaA94t+hqyKlCxvR1/aqvpyW5h7OU3IUWv7KVEBrhm9fTSutWVbWayk0QmtMRUpAZ
         NVAy5G2P5AbaP3dnvuJ9ZGPb0iHfqIDPZDbRkIrnSa6SNxzBQjoKo30M/viEYJY3ex3y
         gzmkgd/6rncSFnbwW50YVBGzFO/RxUZixeHrggx7Dmcr7WFUY2puX7wBF9TTcNsN5VKi
         EjVw==
X-Gm-Message-State: AOAM530yo57oxlbtRoUWU8bpxiRgm8HqP4Z/cCLLQXKTOI4GA6bIEIFW
        c9DfXGihqgRFArX02wjMrcI8RoCJ3n3Ijs9zgKE=
X-Google-Smtp-Source: ABdhPJw9vHl82bQfGYMWt24AWzlByTkx99e2KIkKJ30f5EAzaLxhK+KiY8MdeV0jWNyA1mVIt/kV4dRfIPhaqVALtpM=
X-Received: by 2002:aca:4b54:: with SMTP id y81mr2995360oia.54.1597838845898;
 Wed, 19 Aug 2020 05:07:25 -0700 (PDT)
MIME-Version: 1.0
References: <20200819101240.12260-1-geert+renesas@glider.be>
In-Reply-To: <20200819101240.12260-1-geert+renesas@glider.be>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Wed, 19 Aug 2020 14:07:14 +0200
Message-ID: <CAMuHMdV2Y4Ukc4SR+fi_F4J1eugFTV+LhAOK=sWjWbe0YEzyFQ@mail.gmail.com>
Subject: Re: [PATCH] arm64: defconfig: Enable RPC-IF support
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>,
        Magnus Damm <magnus.damm@gmail.com>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Wed, Aug 19, 2020 at 12:12 PM Geert Uytterhoeven
<geert+renesas@glider.be> wrote:
> Enable support for the Renesas SPI Multi I/O Bus Controller (RPC-IF),
> which is used on the Condor, Eagle, V3HSK, and V3MSK boards.
>
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
> To be queued in renesas-devel for v5.10.
> ---
>  arch/arm64/configs/defconfig | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
> index 3bd5de74019b4088..edcb2368fc4f3e6c 100644
> --- a/arch/arm64/configs/defconfig
> +++ b/arch/arm64/configs/defconfig
> @@ -458,6 +458,7 @@ CONFIG_SPI_MESON_SPIFC=m
>  CONFIG_SPI_ORION=y
>  CONFIG_SPI_PL022=y
>  CONFIG_SPI_ROCKCHIP=y
> +CONFIG_SPI_RPCIF=y

Oops, this should probably be modular...

>  CONFIG_SPI_QCOM_QSPI=m
>  CONFIG_SPI_QUP=y
>  CONFIG_SPI_QCOM_GENI=m
> @@ -921,6 +922,7 @@ CONFIG_ARCH_K3_J721E_SOC=y
>  CONFIG_TI_SCI_PM_DOMAINS=y
>  CONFIG_EXTCON_USB_GPIO=y
>  CONFIG_EXTCON_USBC_CROS_EC=y
> +CONFIG_RENESAS_RPCIF=y

Likewise. Will fix while applying.

>  CONFIG_IIO=y
>  CONFIG_EXYNOS_ADC=y
>  CONFIG_MAX9611=m

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
