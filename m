Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6E962225BFB
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 20 Jul 2020 11:45:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727769AbgGTJpv (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 20 Jul 2020 05:45:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40620 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727062AbgGTJpv (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 20 Jul 2020 05:45:51 -0400
Received: from mail-lf1-x142.google.com (mail-lf1-x142.google.com [IPv6:2a00:1450:4864:20::142])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B935EC061794
        for <linux-renesas-soc@vger.kernel.org>; Mon, 20 Jul 2020 02:45:50 -0700 (PDT)
Received: by mail-lf1-x142.google.com with SMTP id i19so4118528lfj.8
        for <linux-renesas-soc@vger.kernel.org>; Mon, 20 Jul 2020 02:45:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=U/l8IN76uZIcbGjuibERd07MK8no6cw81F/n0dCuZ4M=;
        b=ve6H2cCXsp8AkClfySnFQHElNCaxyUMNkvp1NthH7bHPcnb7EFuMAf2CONacE0JybS
         xkvw4GGMerT8JXQcKks1g7efBZ32lPRK27bF/u7UL0aLBEvOeA4C0M929D8/o5yYjOef
         teU4oZG0OEQxfXTXI1u2AtfYEuVgpfsRcBRWwrkiyAqP93JsJzlt5EzIguYzExLyef74
         Ke+N1Gy1H74b98G4I3EwIvhSw/EkkRvWqDAbSbsxlaXeQ/ikpDr0adlTyHldzGShbLPo
         TWAY/U3vYMZ2sFEHMFGBRLJVNtz+HkCdwr+SXgrgtqNPYTEbJ3fsiDuD83fMLrZWdtUS
         RVaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=U/l8IN76uZIcbGjuibERd07MK8no6cw81F/n0dCuZ4M=;
        b=j914UBpj5zZSe7O7K4cuQVnproVmTE8sCdrt3QCoaywnqzMcZ/PVsA/WnnzS0gXdn0
         vp6+KFPe5CLATSJjcDDoi96/xipNiOOinql12oDpIw1flPq76HwsgM3pNluhQPNKqWo8
         7PS8k/GDLNhJhA8Y2Sn2Kx4pmfpuR8BW4mLGrwVyCqQ4Rb8S761z3hARQvNu3bSr8iqY
         Bdi0h3b9Xyh7qvI3+wDz2zJFXuDBqk2lZCrb1wEZjnFxdLgZ9xC8va/KXxdZWkY04+Cu
         8DoVpjOf8JSUOkAp8zc4JINZcc/8enSjHrZcwYB4RhZI1uS7KCBaLTJvqcD96Ir7ycrU
         BRoQ==
X-Gm-Message-State: AOAM532xTHKHC2+vCQAW3oJPrwDRcaRX4kDk6Xp89OTdh19WORETScdH
        B3NZKx2uy9TgY8PyP0HJsSbSfYKjWrV5ABI5NlzpWg==
X-Google-Smtp-Source: ABdhPJw3PXvS098B3YnUOTqA4QxObbiOlL98CB9XNefRJLZkkXcwh2hzkz1NBhKil3TpqHn2PeWBhZ0tU/2rKvuhLho=
X-Received: by 2002:ac2:5dc1:: with SMTP id x1mr552123lfq.217.1595238349012;
 Mon, 20 Jul 2020 02:45:49 -0700 (PDT)
MIME-Version: 1.0
References: <20200706150205.22053-1-geert+renesas@glider.be>
In-Reply-To: <20200706150205.22053-1-geert+renesas@glider.be>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Mon, 20 Jul 2020 11:45:38 +0200
Message-ID: <CACRpkdZD3gVLdcjaOL9ZCfZD+hrOUB0-q0NpoHu6m1Ujupw6Fw@mail.gmail.com>
Subject: Re: [PATCH/RFC v7] ARM: boot: Obtain start of physical memory from DTB
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     Dmitry Osipenko <digetx@gmail.com>,
        Nicolas Pitre <nico@fluxnic.net>,
        Arnd Bergmann <arnd@arndb.de>,
        Eric Miao <eric.miao@nvidia.com>,
        =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>,
        Lukasz Stelmach <l.stelmach@samsung.com>,
        Masahiro Yamada <masahiroy@kernel.org>,
        Russell King <linux@armlinux.org.uk>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Chris Brandt <chris.brandt@renesas.com>,
        Ard Biesheuvel <ardb@kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        Marek Szyprowski <m.szyprowski@samsung.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Mon, Jul 6, 2020 at 5:03 PM Geert Uytterhoeven
<geert+renesas@glider.be> wrote:

> Currently, the start address of physical memory is obtained by masking
> the program counter with a fixed mask of 0xf8000000.  This mask value
> was chosen as a balance between the requirements of different platforms.
> However, this does require that the start address of physical memory is
> a multiple of 128 MiB, precluding booting Linux on platforms where this
> requirement is not fulfilled.
>
> Fix this limitation by obtaining the start address from the DTB instead,
> if available (either explicitly passed, or appended to the kernel).
> Fall back to the traditional method when needed.
>
> This allows to boot Linux on r7s9210/rza2mevb using the 64 MiB of SDRAM
> on the RZA2MEVB sub board, which is located at 0x0C000000 (CS3 space),
> i.e. not at a multiple of 128 MiB.
>
> Suggested-by: Nicolas Pitre <nico@fluxnic.net>
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> Reviewed-by: Nicolas Pitre <nico@fluxnic.net>
> Reviewed-by: Ard Biesheuvel <ardb@kernel.org>
> Tested-by: Marek Szyprowski <m.szyprowski@samsung.com>
> Tested-by: Dmitry Osipenko <digetx@gmail.com>
> Cc: Lukasz Stelmach <l.stelmach@samsung.com>

I tried to test this on the APQ8060 Qualcomm board. This is an odd beast,
because physical memory starts at 0x40200000 which is 8MiB aligned,
not even 16 MiB. Oddly this *works* with the mainline kernel, giving
the following boot crawl:

[    0.000000] cma: Reserved 256 MiB at 0x50000000
[    0.000000] Zone ranges:
[    0.000000]   Normal   [mem 0x0000000040200000-0x000000005fffffff]
[    0.000000]   HighMem  empty
[    0.000000] Movable zone start for each node
[    0.000000] Early memory node ranges
[    0.000000]   node   0: [mem 0x0000000040200000-0x0000000042dfffff]
[    0.000000]   node   0: [mem 0x0000000048000000-0x000000005fffffff]
[    0.000000] Initmem setup node 0 [mem 0x0000000040200000-0x000000005fffffff]

It crashes so hard with this patch that I don't even get earlydebug
messages. (Scary!)

I also tried to simply load the kernel to 0x50000000 which solved
an issue I had with KASan in the past, but it doesn't help. The
first memblock is at 0x40200000 after all.

Any hints at what may be going wrong here?

No panic though - I know this platform is a stress test, but it'd be
nice not to regress it.

Yours,
Linus Walleij
