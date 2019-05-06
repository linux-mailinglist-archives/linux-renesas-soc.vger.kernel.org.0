Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3D34A15060
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  6 May 2019 17:37:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726520AbfEFPho (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 6 May 2019 11:37:44 -0400
Received: from usa-sjc-mx-foss1.foss.arm.com ([217.140.101.70]:54566 "EHLO
        foss.arm.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726279AbfEFPho (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 6 May 2019 11:37:44 -0400
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.72.51.249])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E7C34374;
        Mon,  6 May 2019 08:37:43 -0700 (PDT)
Received: from [10.37.12.89] (unknown [10.37.12.89])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 0DE983F575;
        Mon,  6 May 2019 08:37:41 -0700 (PDT)
Subject: Re: [PATCH V2] ARM: mach-shmobile: Don't init CNTVOFF if PSCI is
 available
To:     Oleksandr Tyshchenko <olekstysh@gmail.com>,
        linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     horms@verge.net.au, magnus.damm@gmail.com, linux@armlinux.org.uk,
        biju.das@bp.renesas.com,
        Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
References: <1556882268-27451-1-git-send-email-olekstysh@gmail.com>
From:   Julien Grall <julien.grall@arm.com>
Message-ID: <b52a7c3f-6e10-b45e-4cb9-859ac4b468a8@arm.com>
Date:   Mon, 6 May 2019 16:37:40 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <1556882268-27451-1-git-send-email-olekstysh@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Oleksandr,

On 5/3/19 12:17 PM, Oleksandr Tyshchenko wrote:
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
> 
> ---
>     You can find previous discussion here:
>     https://lkml.org/lkml/2019/4/17/810
> 
>     Changes in v2:
>        - Clarify patch subject/description
>        - Don't use CONFIG_ARM_PSCI option, check whether the PSCI is available,
>          by using psci_smp_available()
>        - Check whether we are running on top of Xen, by using xen_domain()
> ---
>   arch/arm/mach-shmobile/setup-rcar-gen2.c | 13 ++++++++++++-
>   1 file changed, 12 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/arm/mach-shmobile/setup-rcar-gen2.c b/arch/arm/mach-shmobile/setup-rcar-gen2.c
> index eea60b2..bc8537b 100644
> --- a/arch/arm/mach-shmobile/setup-rcar-gen2.c
> +++ b/arch/arm/mach-shmobile/setup-rcar-gen2.c
> @@ -17,7 +17,9 @@
>   #include <linux/of.h>
>   #include <linux/of_fdt.h>
>   #include <linux/of_platform.h>
> +#include <xen/xen.h>
>   #include <asm/mach/arch.h>
> +#include <asm/psci.h>
>   #include <asm/secure_cntvoff.h>
>   #include "common.h"
>   #include "rcar-gen2.h"
> @@ -63,7 +65,16 @@ void __init rcar_gen2_timer_init(void)
>   	void __iomem *base;
>   	u32 freq;
>   
> -	secure_cntvoff_init();
> +	/*
> +	 * If PSCI is available then most likely we are running on PSCI-enabled
> +	 * U-Boot which, we assume, has already taken care of resetting CNTVOFF
> +	 * before switching to non-secure mode and we don't need to.
> +	 * Another check is to be sure that we are not running on top of Xen
> +	 * hypervisor, as CNTVOFF is controlled by hypervisor itself and
> +	 * shouldn't be touched by Dom0 in such case.

If you are running on top of Xen, then PSCI will be available. So is 
there any real value to check the presence of Xen as well?

Cheers,

-- 
Julien Grall
