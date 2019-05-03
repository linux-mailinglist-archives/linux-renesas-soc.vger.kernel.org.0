Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 980D812C8C
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  3 May 2019 13:39:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727667AbfECLi5 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 3 May 2019 07:38:57 -0400
Received: from mail-ua1-f66.google.com ([209.85.222.66]:39680 "EHLO
        mail-ua1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726377AbfECLi4 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 3 May 2019 07:38:56 -0400
Received: by mail-ua1-f66.google.com with SMTP id 88so1885986uau.6;
        Fri, 03 May 2019 04:38:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=FvqZ/fQUnKqtTENumzYLYcCbYX7oGb9GDcUl0ClcFis=;
        b=UnpbDTizDlNXjxbGLpg7eQtmTnIy0/PfKqgqwFucQHPI2DDxNhfKlf/UXqG0yQ9NvN
         dwVy6I07yGHeq7tBdlAYBy0+4hYr1o4e+YwE+8w74uggdoPt0jZ+eJonPJAuVkALfdlB
         SmHnjHl4vm+GHlzBFHFz9QOqjhcABTNRhMoPXnL1Cm8cK9SaJ8XSZqe8xY6UMGXuu1ep
         bHYtWUD+nl24knwb/zK95oPFSowOlNrzEMtQCAEGn+4NNs4WxNO7WdUvwV1H6HhBcgUA
         qHcKIuUktd/l0ri8mf72MD883QJ5K0X3zbJj8S05+BOPV4bPX+wIhB5dgFVery4oqXOp
         JiIA==
X-Gm-Message-State: APjAAAXa3zuJmeSxj1zWfKcPBMak3jscQTwZMp4KUdlLezUijgO6BJyw
        4JFNwL3ipeEVbbd9aTMedVIOieivu8+dffzETk/Yu2DC
X-Google-Smtp-Source: APXvYqwvxMEGmN+05vhczm0D2Rwg1KLtmbn0eGLmZc26G8TzEjlkd065DbCBKz/hao2kh5PwvFcbplRQhvjGWR0zK+A=
X-Received: by 2002:a9f:352a:: with SMTP id o39mr4938847uao.78.1556883534530;
 Fri, 03 May 2019 04:38:54 -0700 (PDT)
MIME-Version: 1.0
References: <1556882268-27451-1-git-send-email-olekstysh@gmail.com>
In-Reply-To: <1556882268-27451-1-git-send-email-olekstysh@gmail.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Fri, 3 May 2019 13:38:42 +0200
Message-ID: <CAMuHMdVYff-YsGxJykT_p31iyw9f4yVY967_i166TSm__WRG9g@mail.gmail.com>
Subject: Re: [PATCH V2] ARM: mach-shmobile: Don't init CNTVOFF if PSCI is available
To:     Oleksandr Tyshchenko <olekstysh@gmail.com>
Cc:     Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Julien Grall <julien.grall@arm.com>,
        Simon Horman <horms@verge.net.au>,
        Magnus Damm <magnus.damm@gmail.com>,
        Russell King <linux@armlinux.org.uk>,
        Biju Das <biju.das@bp.renesas.com>,
        Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Oleksandr,

On Fri, May 3, 2019 at 1:21 PM Oleksandr Tyshchenko <olekstysh@gmail.com> wrote:
> From: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
>
> If PSCI is available then most likely we are running on PSCI-enabled
> U-Boot which, we assume, has already taken care of resetting CNTVOFF
> before switching to non-secure mode and we don't need to.
>
> Also, don't init CNTVOFF if we are running on top of Xen hypervisor,
> as CNTVOFF is controlled by hypervisor itself and shouldn't be touched
> by Dom0 in such case.
>
> Signed-off-by: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
> CC: Julien Grall <julien.grall@arm.com>

Thanks for your patch!

> ---
>    You can find previous discussion here:
>    https://lkml.org/lkml/2019/4/17/810
>
>    Changes in v2:
>       - Clarify patch subject/description
>       - Don't use CONFIG_ARM_PSCI option, check whether the PSCI is available,
>         by using psci_smp_available()
>       - Check whether we are running on top of Xen, by using xen_domain()
> ---
>  arch/arm/mach-shmobile/setup-rcar-gen2.c | 13 ++++++++++++-
>  1 file changed, 12 insertions(+), 1 deletion(-)
>
> diff --git a/arch/arm/mach-shmobile/setup-rcar-gen2.c b/arch/arm/mach-shmobile/setup-rcar-gen2.c
> index eea60b2..bc8537b 100644
> --- a/arch/arm/mach-shmobile/setup-rcar-gen2.c
> +++ b/arch/arm/mach-shmobile/setup-rcar-gen2.c
> @@ -17,7 +17,9 @@
>  #include <linux/of.h>
>  #include <linux/of_fdt.h>
>  #include <linux/of_platform.h>
> +#include <xen/xen.h>
>  #include <asm/mach/arch.h>
> +#include <asm/psci.h>
>  #include <asm/secure_cntvoff.h>
>  #include "common.h"
>  #include "rcar-gen2.h"
> @@ -63,7 +65,16 @@ void __init rcar_gen2_timer_init(void)
>         void __iomem *base;
>         u32 freq;
>
> -       secure_cntvoff_init();
> +       /*
> +        * If PSCI is available then most likely we are running on PSCI-enabled
> +        * U-Boot which, we assume, has already taken care of resetting CNTVOFF
> +        * before switching to non-secure mode and we don't need to.
> +        * Another check is to be sure that we are not running on top of Xen
> +        * hypervisor, as CNTVOFF is controlled by hypervisor itself and
> +        * shouldn't be touched by Dom0 in such case.
> +        */
> +       if (!psci_smp_available() && !xen_domain())
> +               secure_cntvoff_init();
>
>         if (of_machine_is_compatible("renesas,r8a7745") ||
>             of_machine_is_compatible("renesas,r8a77470") ||

How do you prevent secure_cntvoff_init() from being called for secondary
CPUs in arch/arm/mach-shmobile/headsmp-apmu.S?

With PSCI, it is not called if "enable-method" in DT is "psci"', so that case
is covered, I guess.

What about XEN? Do you override the "enable-method"?
If yes, perhaps a check for "renesas,apmu" is more appropriate?

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
