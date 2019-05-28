Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id EDF512C130
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 28 May 2019 10:28:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726203AbfE1I2K (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 28 May 2019 04:28:10 -0400
Received: from mail-lj1-f196.google.com ([209.85.208.196]:39629 "EHLO
        mail-lj1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725943AbfE1I2K (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 28 May 2019 04:28:10 -0400
Received: by mail-lj1-f196.google.com with SMTP id a10so6047270ljf.6;
        Tue, 28 May 2019 01:28:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=dnjMuTJr4T4wXgNNb3zy4mVx/7E/VQrUe+LYBvlovEI=;
        b=kgIuPZO7JExvARzHXSptFvbkLlAtg1Mh6D6Gi3q5HHBQjmWiLWS/iHMHJt8F2W0C23
         +rRU12RkiNgO2bZD6PdG00dyJJ0BtIaJKId4lKBs4kAl83Kucwa8fWgAnuSD7e66dQcz
         +NKk3MKqXOouSc/vCIBCYMaTvRrc9K+pb03BvqFKnGuXb59vO31A+F6OyAgr89XY5bWd
         5tdGnzNdYcVhmvhNENFbFZmv1831Z8AzHDf9ehO/rqhM42Ts8A51k/Ic9Yi3BAxInqG2
         KBeDwUPxBEDoYy5/weMrs6K+FT4hT6vVVOV09iPRAtzFJ8V8r/r8clDO11Vby1qHgTEm
         /YJg==
X-Gm-Message-State: APjAAAVxnZi9Dn4m+lVqH01Afp7+59h42tJCMkYGKX/cU/Da+Djrf2MA
        2RafIkjKTy7bejBEO+8GcSkhQv21PDzGeLucjYU=
X-Google-Smtp-Source: APXvYqykJ1h+jlQhtdg1DDy+zhHSkRlP9cByAhrst5HyxTDMocbQ+xaDDnIfT2R7fBvmxs8xTL8/NeOKnyRoHE70rac=
X-Received: by 2002:a2e:8555:: with SMTP id u21mr999725ljj.133.1559032087806;
 Tue, 28 May 2019 01:28:07 -0700 (PDT)
MIME-Version: 1.0
References: <1558087093-22113-1-git-send-email-olekstysh@gmail.com>
In-Reply-To: <1558087093-22113-1-git-send-email-olekstysh@gmail.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Tue, 28 May 2019 10:27:56 +0200
Message-ID: <CAMuHMdVC=aNQTZ0r+7qpiWEyEaoQ587pm1FxhWqR3pwHwv2ARg@mail.gmail.com>
Subject: Re: [PATCH V5] ARM: mach-shmobile: Don't init CNTVOFF/counter if PSCI
 is available
To:     Oleksandr Tyshchenko <olekstysh@gmail.com>
Cc:     Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Julien Grall <julien.grall@arm.com>,
        Simon Horman <horms@verge.net.au>,
        Magnus Damm <magnus.damm@gmail.com>,
        Russell King <linux@armlinux.org.uk>,
        Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Oleksandr,

On Fri, May 17, 2019 at 11:58 AM Oleksandr Tyshchenko
<olekstysh@gmail.com> wrote:
> From: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
>
> If PSCI is available then most likely we are running on PSCI-enabled
> U-Boot which, we assume, has already taken care of resetting CNTVOFF
> and updating counter module before switching to non-secure mode
> and we don't need to.
>
> As the psci_smp_available() helper always returns false if CONFIG_SMP
> is disabled, it can't be used safely as an indicator of PSCI usage.
> For that reason, we check for the mandatory PSCI operation to be
> available.
>
> Please note, an extra check to prevent secure_cntvoff_init() from
> being called for secondary CPUs in headsmp-apmu.S is not needed,
> as SMP code for APMU based system is not executed if PSCI is in use.
>
> Signed-off-by: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>

>    Changes in v5:
>       - Check for psci_ops.cpu_on if CONFIG_ARM_PSCI_FW is defined

Thanks for the update!

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Two cosmetic comments below. I'll leave it to Simon to ignore them for
applying ;-)

> @@ -62,6 +63,21 @@ void __init rcar_gen2_timer_init(void)
>  {
>         void __iomem *base;
>         u32 freq;
> +       bool need_update = true;

Some people like reverse Xmas tree declaration order...

> +
> +       /*
> +        * If PSCI is available then most likely we are running on PSCI-enabled
> +        * U-Boot which, we assume, has already taken care of resetting CNTVOFF
> +        * and updating counter module before switching to non-secure mode
> +        * and we don't need to.
> +        */
> +#if defined(CONFIG_ARM_PSCI_FW)

#ifdef CONFIG_ARM_PSCI_FW ?

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
