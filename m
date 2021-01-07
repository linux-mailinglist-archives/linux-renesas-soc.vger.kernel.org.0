Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D0F542ECE23
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  7 Jan 2021 11:49:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727749AbhAGKss (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 7 Jan 2021 05:48:48 -0500
Received: from mail-oi1-f169.google.com ([209.85.167.169]:38252 "EHLO
        mail-oi1-f169.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726151AbhAGKsr (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 7 Jan 2021 05:48:47 -0500
Received: by mail-oi1-f169.google.com with SMTP id x13so6918400oic.5;
        Thu, 07 Jan 2021 02:48:32 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=YlI/dvDuqK2iZQq6ulxYP2CcumyyIAj1ehw9bOUkprE=;
        b=ojSQ9ztTRWok5+KGbIhaszxTcUltocOFXHWbh6/I+dLRGchYaPf8cbjkVhXZfE6Viv
         bXVzrkIhPtSKE1SYOhVWZXtaeB6HO9kyJxrSxXTaKocS6aeSWgR5Y3UGfg2fB5nr70OY
         I73vsfOvRJUSyozESeximKGP2t1NvHkviJOkPOKNGB4HPSOcSoYLGYKduZ3tvxru6NPQ
         fv+TQQCC3dqLyDwqNh/SLDpZLvIeVvP7C1lrRa/KY16nV+0VBmVFJ5aCONEWt/qhAHij
         gfYAzSQ0hGwygB7rtlSCRJA+Kt8+VvxFhsMPjvrVr4v9C+TCmDg+mfKLO66gi7dd5PMY
         eAZg==
X-Gm-Message-State: AOAM5326ySUShVImFKfLgc2Vzv1xqW12lLdx6S51spSUSrqgse1siccC
        k+Br/nNqRJzwSkMbQYe2KDkz2ygk9iVNz4OCF4ZJuAJI
X-Google-Smtp-Source: ABdhPJxUrXsbIuKiz8NWLSLnSDmr+WInWXJz6psPOkMu3qqXPx+4aKdRrIqed93roiZbnPPqee8vzRVKSfqOHPx/ibc=
X-Received: by 2002:aca:3cc5:: with SMTP id j188mr968500oia.54.1610016486872;
 Thu, 07 Jan 2021 02:48:06 -0800 (PST)
MIME-Version: 1.0
References: <CGME20210104130133eucas1p2d4e75b0dfd3afca7af8952ff09568070@eucas1p2.samsung.com>
 <20210104130111.1269694-1-geert+renesas@glider.be> <092e7ed2-da95-fa4a-9949-1a23388a7b67@samsung.com>
In-Reply-To: <092e7ed2-da95-fa4a-9949-1a23388a7b67@samsung.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Thu, 7 Jan 2021 11:47:56 +0100
Message-ID: <CAMuHMdVH+0=_o7ztC+H+tN7H0P3Bv4FzESYCDLeQpH4SR8z6Ag@mail.gmail.com>
Subject: Re: [PATCH v12] ARM: uncompress: Validate start of physical memory
 against passed DTB
To:     Marek Szyprowski <m.szyprowski@samsung.com>
Cc:     Russell King <linux@armlinux.org.uk>,
        Ard Biesheuvel <ardb@kernel.org>,
        Nicolas Pitre <nico@fluxnic.net>,
        Dmitry Osipenko <digetx@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Arnd Bergmann <arnd@arndb.de>,
        Eric Miao <eric.miao@nvidia.com>,
        =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>,
        Lukasz Stelmach <l.stelmach@samsung.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Chris Brandt <chris.brandt@renesas.com>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Marek,

On Thu, Jan 7, 2021 at 11:36 AM Marek Szyprowski
<m.szyprowski@samsung.com> wrote:
> On 04.01.2021 14:01, Geert Uytterhoeven wrote:
> > Currently, the start address of physical memory is obtained by masking
> > the program counter with a fixed mask of 0xf8000000.  This mask value
> > was chosen as a balance between the requirements of different platforms.
> > However, this does require that the start address of physical memory is
> > a multiple of 128 MiB, precluding booting Linux on platforms where this
> > requirement is not fulfilled.
> >
> > Fix this limitation by validating the masked address against the memory
> > information in the passed DTB.  Only use the start address
> > from DTB when masking would yield an out-of-range address, prefer the
> > traditional method in all other cases.  Note that this applies only to the
> > explicitly passed DTB on modern systems, and not to a DTB appended to
> > the kernel, or to ATAGS.  The appended DTB may need to be augmented by
> > information from ATAGS, which may need to rely on knowledge of the start
> > address of physical memory itself.
> >
> > This allows to boot Linux on r7s9210/rza2mevb using the 64 MiB of SDRAM
> > on the RZA2MEVB sub board, which is located at 0x0C000000 (CS3 space),
> > i.e. not at a multiple of 128 MiB.
> >
> > Suggested-by: Nicolas Pitre <nico@fluxnic.net>
> > Suggested-by: Ard Biesheuvel <ardb@kernel.org>
> > Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> > Reviewed-by: Ard Biesheuvel <ardb@kernel.org>
> > Acked-by: Nicolas Pitre <nico@fluxnic.net>
>
> I've checked all of my arm 32bit test systems and they still boot fine
> with this patch. Feel free to add my:
>
> Tested-by: Marek Szyprowski <m.szyprowski@samsung.com>
>
> although I didn't test exactly the new features added by it.

Thank you, regression-testing is very valuable!

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
