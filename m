Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 94C46C302A
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  1 Oct 2019 11:28:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727375AbfJAJ2Q (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 1 Oct 2019 05:28:16 -0400
Received: from mail-ot1-f66.google.com ([209.85.210.66]:44991 "EHLO
        mail-ot1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727326AbfJAJ2Q (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 1 Oct 2019 05:28:16 -0400
Received: by mail-ot1-f66.google.com with SMTP id 21so10904671otj.11;
        Tue, 01 Oct 2019 02:28:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=7GWGh2D7aZcVTalvii3cK7UDmHvdrp+om18ofNeVba8=;
        b=qpj1jnLn8JowzM99dz8TaGdKjJ3LzU8RufP7gu+sSUSUF/5jb1MHmUsPl/giAwhZpu
         0qS4zi3t5y6AC4S7k0dhzslvbG+R7aBw5pDO2NljXQP9FJYvLlgSH6m40DjMA3SpQgmE
         4OjoNYtLnSOxMPMHxjDrA1d4WXXqikFAkQWp2sNE8Jozo47N+LQuJ9bVPMf2pNb0aPHZ
         KwXuOg7f4VVwdUG+uqQ7/tahq4V2/7eYVxZUB2glVp7Y1pMtJiGGSONSAScbRD2bOLGx
         k5RivpKgNovWj74c5c7C1+YHmzvyzKDCmHQL2Iee3UogpaZmMd7WRIxkRHgpukIlRHaC
         tzmg==
X-Gm-Message-State: APjAAAWUlJVdvkqNib1LKqgV4rafimudoYEnAIC74oVl21VczjjgZipo
        r/GIOFjfjjd3i7j+mJQ67oKhzn+E/QaY7LqWass=
X-Google-Smtp-Source: APXvYqxUufz8LGb/JAoIgX1fGGEw9iT8aiUJjPt7oB7FJ2AuPPMS33WxhIxXcjmTRYGD42MwfUAanBkCEJnpdi94Fqg=
X-Received: by 2002:a9d:404d:: with SMTP id o13mr17559692oti.39.1569922094967;
 Tue, 01 Oct 2019 02:28:14 -0700 (PDT)
MIME-Version: 1.0
References: <20190930055925.25842-1-yamada.masahiro@socionext.com>
In-Reply-To: <20190930055925.25842-1-yamada.masahiro@socionext.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Tue, 1 Oct 2019 11:28:03 +0200
Message-ID: <CAMuHMdW3e5bYfinAjqUWcONK_s4iFhwG2CXUvNR0wz3+Cf_YWA@mail.gmail.com>
Subject: Re: [PATCH] ARM: fix __get_user_check() in case uaccess_* calls are
 not inlined
To:     Masahiro Yamada <yamada.masahiro@socionext.com>
Cc:     Linux ARM <linux-arm-kernel@lists.infradead.org>,
        Russell King <rmk+kernel@armlinux.org.uk>,
        Arnd Bergmann <arnd@arndb.de>,
        Vincent Whitchurch <vincent.whitchurch@axis.com>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Russell King <linux@armlinux.org.uk>,
        Stefan Agner <stefan@agner.ch>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Julien Thierry <julien.thierry.kdev@gmail.com>,
        Olof Johansson <olof@lixom.net>,
        Thomas Gleixner <tglx@linutronix.de>,
        Linus Torvalds <torvalds@linux-foundation.org>,
        Nicolas Saenz Julienne <nsaenzjulienne@suse.de>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Mon, Sep 30, 2019 at 8:01 AM Masahiro Yamada
<yamada.masahiro@socionext.com> wrote:
> KernelCI reports that bcm2835_defconfig is no longer booting since
> commit ac7c3e4ff401 ("compiler: enable CONFIG_OPTIMIZE_INLINING
> forcibly"):
>
>   https://lkml.org/lkml/2019/9/26/825
>
> I also received a regression report from Nicolas Saenz Julienne:
>
>   https://lkml.org/lkml/2019/9/27/263
>
> This problem has cropped up on arch/arm/config/bcm2835_defconfig
> because it enables CONFIG_CC_OPTIMIZE_FOR_SIZE. The compiler tends
> to prefer not inlining functions with -Os. I was able to reproduce
> it with other boards and defconfig files by manually enabling
> CONFIG_CC_OPTIMIZE_FOR_SIZE.
>
> The __get_user_check() specifically uses r0, r1, r2 registers.
> So, uaccess_save_and_enable() and uaccess_restore() must be inlined
> in order to avoid those registers being overwritten in the callees.
>
> Prior to commit 9012d011660e ("compiler: allow all arches to enable
> CONFIG_OPTIMIZE_INLINING"), the 'inline' marker was always enough for
> inlining functions, except on x86.
>
> Since that commit, all architectures can enable CONFIG_OPTIMIZE_INLINING.
> So, __always_inline is now the only guaranteed way of forcible inlining.
>
> I want to keep as much compiler's freedom as possible about the inlining
> decision. So, I changed the function call order instead of adding
> __always_inline around.
>
> Call uaccess_save_and_enable() before assigning the __p ("r0"), and
> uaccess_restore() after evacuating the __e ("r0").
>
> Fixes: 9012d011660e ("compiler: allow all arches to enable CONFIG_OPTIMIZE_INLINING")
> Reported-by: "kernelci.org bot" <bot@kernelci.org>
> Reported-by: Nicolas Saenz Julienne <nsaenzjulienne@suse.de>
> Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>

Thanks, this fixes the issues I was seeing on r8a7791/koelsch.

Tested-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
