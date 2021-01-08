Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 706DC2EFBE8
	for <lists+linux-renesas-soc@lfdr.de>; Sat,  9 Jan 2021 00:58:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725793AbhAHX6T (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 8 Jan 2021 18:58:19 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58644 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725792AbhAHX6T (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 8 Jan 2021 18:58:19 -0500
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com [IPv6:2a00:1450:4864:20::136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 964F3C061573
        for <linux-renesas-soc@vger.kernel.org>; Fri,  8 Jan 2021 15:57:38 -0800 (PST)
Received: by mail-lf1-x136.google.com with SMTP id o17so27017864lfg.4
        for <linux-renesas-soc@vger.kernel.org>; Fri, 08 Jan 2021 15:57:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=bXBEV2qwkB08QLhyng3ARCLP/t7+rlKlWr/8GjsMDHc=;
        b=Tj1tl2TLCYfPqgeOpyrtiqpGFoAX7LMmfEH9YPhTR84FMrv8mQVDwe984OBfLZMWyJ
         2gpMNRgC7pKRC4BR8EHqae6ZujKeVMiBCgvx0S2REOiyZ0Sg2CoQqyvhBZT3iAXBQj3v
         Fd7RKGj5AC5fPZlr3BVOIMeu7igui1HpEQvtjSpswCopKAl7UZxt9BwbBh2abtxD52mX
         t28wrwLB1Tg5mKPoYmDACWv8aRUx46+OkywlXuDb2HjfqweqLnJNGbugs6Ag2Gve5xrM
         UjS/3ouhlOI5+/YSEPHO4yRmKmBkztgFC0aqo3X9+IY7nLSFEBlP52M2NSjDYaYDWsvd
         gy1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=bXBEV2qwkB08QLhyng3ARCLP/t7+rlKlWr/8GjsMDHc=;
        b=pM6fA5PIYKs6XLIycVC9VRDjU48mykzoH2Kc8gy1GCkQkNAmfwqxBaES/sWtCGBwMJ
         pRqAY868JNjvr5yvk7aRyxsVzx6TEp3bhEJK35HRfCpgQ5Rl/MuPPfTefkai1CfVsw1z
         cglBDdpcu+BxTuTlXf+ddPNm488IpNztKzQx1Wg0BANM5iJopbECVpY56ucvaFZ95u3B
         AMcJ30yvlr1WRAGLAY6nSglLCplICpp12uMSg343EoBPGlKJvs3ZXucqyyVsOZBEm8Wt
         dOwVmCLkPf3+Ec2nPScfJFmWrZD7ZNv1lV3EqeA7EFYlggCEYk8+Ir8IwUQzW/9UntPi
         UJMQ==
X-Gm-Message-State: AOAM5325mSyqD+VkpeXN17/oT8WXZjCiOtTrpryQhbF+I2/f5wORC7Oz
        /BMihvm6Twr667Qx7AiVLiMQaYYyVIZ3dsXQ72f2kF13gXc=
X-Google-Smtp-Source: ABdhPJwL9bNbBGl0gw0ng5EK5X5cI2+peYJLRuRy/AzZIkrwrjdWDh1CkTADBQXQucegUztwZZOJ48eU+cKCBtdHK3w=
X-Received: by 2002:ac2:5597:: with SMTP id v23mr2421818lfg.649.1610150255894;
 Fri, 08 Jan 2021 15:57:35 -0800 (PST)
MIME-Version: 1.0
References: <20210104130111.1269694-1-geert+renesas@glider.be>
In-Reply-To: <20210104130111.1269694-1-geert+renesas@glider.be>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Sat, 9 Jan 2021 00:57:24 +0100
Message-ID: <CACRpkdZyV-tye0b6Pxf6s_SSEy1sq=Hqr_xXUopJrCkXsu9m9g@mail.gmail.com>
Subject: Re: [PATCH v12] ARM: uncompress: Validate start of physical memory
 against passed DTB
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     Russell King <linux@armlinux.org.uk>,
        Ard Biesheuvel <ardb@kernel.org>,
        Nicolas Pitre <nico@fluxnic.net>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Dmitry Osipenko <digetx@gmail.com>,
        Arnd Bergmann <arnd@arndb.de>,
        Eric Miao <eric.miao@nvidia.com>,
        =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>,
        Lukasz Stelmach <l.stelmach@samsung.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Chris Brandt <chris.brandt@renesas.com>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Mon, Jan 4, 2021 at 2:01 PM Geert Uytterhoeven
<geert+renesas@glider.be> wrote:

> Currently, the start address of physical memory is obtained by masking
> the program counter with a fixed mask of 0xf8000000.  This mask value
> was chosen as a balance between the requirements of different platforms.
> However, this does require that the start address of physical memory is
> a multiple of 128 MiB, precluding booting Linux on platforms where this
> requirement is not fulfilled.
>
> Fix this limitation by validating the masked address against the memory
> information in the passed DTB.  Only use the start address
> from DTB when masking would yield an out-of-range address, prefer the
> traditional method in all other cases.  Note that this applies only to the
> explicitly passed DTB on modern systems, and not to a DTB appended to
> the kernel, or to ATAGS.  The appended DTB may need to be augmented by
> information from ATAGS, which may need to rely on knowledge of the start
> address of physical memory itself.
>
> This allows to boot Linux on r7s9210/rza2mevb using the 64 MiB of SDRAM
> on the RZA2MEVB sub board, which is located at 0x0C000000 (CS3 space),
> i.e. not at a multiple of 128 MiB.
>
> Suggested-by: Nicolas Pitre <nico@fluxnic.net>
> Suggested-by: Ard Biesheuvel <ardb@kernel.org>
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> Reviewed-by: Ard Biesheuvel <ardb@kernel.org>
> Acked-by: Nicolas Pitre <nico@fluxnic.net>

Sorry for the long delay in reading the patch :(

I really like the looks of this now, moreover it is very useful.
I suppose it is already in the patch tracker, but for the record:
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

> +               reg = fdt_getprop(fdt, offset, "linux,usable-memory", &len);

I suppose we already had a discussion of why this property
is undocumented? Or should we document it? Obviously
it is already in widespread use.

Yours,
Linus Walleij
