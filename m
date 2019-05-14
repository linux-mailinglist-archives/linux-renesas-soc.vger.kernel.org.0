Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 39E351CCAE
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 14 May 2019 18:13:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725901AbfENQNy (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 14 May 2019 12:13:54 -0400
Received: from foss.arm.com ([217.140.101.70]:58378 "EHLO foss.arm.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725980AbfENQNy (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 14 May 2019 12:13:54 -0400
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.72.51.249])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B9B77374;
        Tue, 14 May 2019 09:13:53 -0700 (PDT)
Received: from [10.1.196.50] (e108454-lin.cambridge.arm.com [10.1.196.50])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 615C33F703;
        Tue, 14 May 2019 09:13:52 -0700 (PDT)
Subject: Re: [PATCH V4] ARM: mach-shmobile: Don't init CNTVOFF/counter if PSCI
 is available
To:     Oleksandr Tyshchenko <olekstysh@gmail.com>,
        linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     horms@verge.net.au, magnus.damm@gmail.com, linux@armlinux.org.uk,
        geert@linux-m68k.org,
        Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
References: <1557850012-16612-1-git-send-email-olekstysh@gmail.com>
From:   Julien Grall <julien.grall@arm.com>
Message-ID: <4e712484-d6a4-e358-ea66-51dfcee18b0d@arm.com>
Date:   Tue, 14 May 2019 17:13:50 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <1557850012-16612-1-git-send-email-olekstysh@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi,

On 14/05/2019 17:06, Oleksandr Tyshchenko wrote:
> diff --git a/arch/arm/mach-shmobile/setup-rcar-gen2.c b/arch/arm/mach-shmobile/setup-rcar-gen2.c
> index eea60b2..64e3abd 100644
> --- a/arch/arm/mach-shmobile/setup-rcar-gen2.c
> +++ b/arch/arm/mach-shmobile/setup-rcar-gen2.c
> @@ -17,6 +17,7 @@
>   #include <linux/of.h>
>   #include <linux/of_fdt.h>
>   #include <linux/of_platform.h>
> +#include <linux/psci.h>
>   #include <asm/mach/arch.h>
>   #include <asm/secure_cntvoff.h>
>   #include "common.h"
> @@ -63,6 +64,15 @@ void __init rcar_gen2_timer_init(void)
>   	void __iomem *base;
>   	u32 freq;
>   
> +	/*
> +	 * If PSCI is available then most likely we are running on PSCI-enabled
> +	 * U-Boot which, we assume, has already taken care of resetting CNTVOFF
> +	 * and updating counter module before switching to non-secure mode
> +	 * and we don't need to.
> +	 */
> +	if (psci_ops.cpu_on) > +		goto skip_update;
Are you sure this is working when ARM_PSCI_FW is not selected? Is it possible to 
have a .config for RCAR without ARM_PSCI_FW?

Cheers,

-- 
Julien Grall
