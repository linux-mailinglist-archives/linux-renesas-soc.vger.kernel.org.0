Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 060782B7D22
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 18 Nov 2020 12:59:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727881AbgKRL63 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 18 Nov 2020 06:58:29 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43956 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726985AbgKRL63 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 18 Nov 2020 06:58:29 -0500
Received: from mail-lf1-x144.google.com (mail-lf1-x144.google.com [IPv6:2a00:1450:4864:20::144])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A61D2C0613D4
        for <linux-renesas-soc@vger.kernel.org>; Wed, 18 Nov 2020 03:58:28 -0800 (PST)
Received: by mail-lf1-x144.google.com with SMTP id w142so2541234lff.8
        for <linux-renesas-soc@vger.kernel.org>; Wed, 18 Nov 2020 03:58:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ragnatech-se.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=2S1xFY3cUq6ZkRFJo9F1WPP/Q+c40qtiLMxRMddI34Y=;
        b=hgyqvPsGY7eL1OyYrV61JS4hnoXG0iPUXe/7HM7K+kfPWynp0Qhe5wUH86CZaV+763
         nYk+m7G/zmrqX/+V/iPoqLJCaohNS9w5yWxoZI0dguxNe61J4ody52EsSCJ043zgp9Ci
         xvDQ9ZGyubyGl7k7ozdbGiPkj6JJs97RYrJ2KFbOGt0foG4pqVGU5oPXPIYF/2eKRvOV
         62K1cH3bgUSwJhgWKpTM4FPk29e07wi1/LLgwuIw/cHnX0kbrY0YH66LLtrd8SlWSZt0
         Zn2MKMiDCofSG8BwcvgqxWGTjIWpBz8K9PSb8ubtbujq1fuj/JVLEmY6phPm3YgXSDM1
         4fPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=2S1xFY3cUq6ZkRFJo9F1WPP/Q+c40qtiLMxRMddI34Y=;
        b=Hr+1wFDe7d75+L+GXXqjVtljNxRZ0kCCNKoGPn1V9pHMtTh3NhR9x7+cgX27FWL45W
         xcLy5acn5xnZ7aub7UXFkNosyKeMmc2p2Jdx/SnoUPW40GNOsY5Rpuk3k34yN2oO/Lsd
         uyjmP91bWIrp0INvnL5Y+1l3gLK9eMhFigQOEoexWIT0EcjMvqrQyRw2urozX6hGQRLD
         2FAEuZJks+w9Zii5D/DgvYUZXh8P1ueziigk0LSrQwkSv/Nz4EDSTWCjTWg6WwFaixbx
         MbiHnbccOoBY+yZojPih1AsOm/Qx1/LGISKN9vepF2OQPp7DXaJuFUNDCbD7dpCCjXap
         X33A==
X-Gm-Message-State: AOAM533pvM5LKU9RTXIxkPJVZt6LgrT5mXbtKaCJCfh/kT+usITUgO2N
        uWAHGcT/Lf+uPxRvMxQEou51r4WoDRjXeI8v
X-Google-Smtp-Source: ABdhPJykhAJNiiKOmcVPj3kq3yn0eXCzt2GavmcTLKpNTRol9ltst2QjezFLfAGndsaYQMX38y4Ltw==
X-Received: by 2002:a19:e21b:: with SMTP id z27mr3365013lfg.409.1605700707184;
        Wed, 18 Nov 2020 03:58:27 -0800 (PST)
Received: from localhost (h-209-203.A463.priv.bahnhof.se. [155.4.209.203])
        by smtp.gmail.com with ESMTPSA id g8sm3554584lfb.223.2020.11.18.03.58.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2020 03:58:26 -0800 (PST)
Date:   Wed, 18 Nov 2020 12:58:25 +0100
From:   Niklas =?iso-8859-1?Q?S=F6derlund?= 
        <niklas.soderlund@ragnatech.se>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     Magnus Damm <magnus.damm@gmail.com>,
        linux-arm-kernel@lists.infradead.org,
        linux-renesas-soc@vger.kernel.org, Arnd Bergmann <arnd@kernel.org>
Subject: Re: [PATCH] ARM: shmobile: Stop using __raw_*() I/O accessors
Message-ID: <20201118115825.GD3118893@oden.dyn.berto.se>
References: <20201117142447.2205664-1-geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20201117142447.2205664-1-geert+renesas@glider.be>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Geert,

Thanks for your work.

On 2020-11-17 15:24:47 +0100, Geert Uytterhoeven wrote:
> There is no reason to keep on using the __raw_{read,write}l() I/O
> accessors in Renesas ARM platform code.  Switch to using the plain
> {read,write}l() I/O accessors, to have a chance that this works on
> big-endian.
> 
> Suggested-by: Arnd Bergmann <arnd@kernel.org>
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Reviewed-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>

> ---
> To be queued in renesas-devel for v5.11.
> 
>  arch/arm/mach-shmobile/platsmp-scu.c   |  2 +-
>  arch/arm/mach-shmobile/setup-r8a7778.c |  8 ++++----
>  arch/arm/mach-shmobile/setup-r8a7779.c | 14 +++++++-------
>  arch/arm/mach-shmobile/smp-r8a7779.c   |  2 +-
>  arch/arm/mach-shmobile/smp-sh73a0.c    | 10 +++++-----
>  5 files changed, 18 insertions(+), 18 deletions(-)
> 
> diff --git a/arch/arm/mach-shmobile/platsmp-scu.c b/arch/arm/mach-shmobile/platsmp-scu.c
> index fcfcef1d1ae4f81f..3849f71e6e12eba6 100644
> --- a/arch/arm/mach-shmobile/platsmp-scu.c
> +++ b/arch/arm/mach-shmobile/platsmp-scu.c
> @@ -64,7 +64,7 @@ static int shmobile_smp_scu_psr_core_disabled(int cpu)
>  {
>  	unsigned long mask = SCU_PM_POWEROFF << (cpu * 8);
>  
> -	if ((__raw_readl(shmobile_scu_base + 8) & mask) == mask)
> +	if ((readl(shmobile_scu_base + 8) & mask) == mask)
>  		return 1;
>  
>  	return 0;
> diff --git a/arch/arm/mach-shmobile/setup-r8a7778.c b/arch/arm/mach-shmobile/setup-r8a7778.c
> index 819dbda47298ae88..02cda9cada4c4546 100644
> --- a/arch/arm/mach-shmobile/setup-r8a7778.c
> +++ b/arch/arm/mach-shmobile/setup-r8a7778.c
> @@ -31,12 +31,12 @@ static void __init r8a7778_init_irq_dt(void)
>  	irqchip_init();
>  
>  	/* route all interrupts to ARM */
> -	__raw_writel(0x73ffffff, base + INT2NTSR0);
> -	__raw_writel(0xffffffff, base + INT2NTSR1);
> +	writel(0x73ffffff, base + INT2NTSR0);
> +	writel(0xffffffff, base + INT2NTSR1);
>  
>  	/* unmask all known interrupts in INTCS2 */
> -	__raw_writel(0x08330773, base + INT2SMSKCR0);
> -	__raw_writel(0x00311110, base + INT2SMSKCR1);
> +	writel(0x08330773, base + INT2SMSKCR0);
> +	writel(0x00311110, base + INT2SMSKCR1);
>  
>  	iounmap(base);
>  }
> diff --git a/arch/arm/mach-shmobile/setup-r8a7779.c b/arch/arm/mach-shmobile/setup-r8a7779.c
> index 446d40b50b7b784b..b6e282116d664705 100644
> --- a/arch/arm/mach-shmobile/setup-r8a7779.c
> +++ b/arch/arm/mach-shmobile/setup-r8a7779.c
> @@ -34,15 +34,15 @@ static void __init r8a7779_init_irq_dt(void)
>  	irqchip_init();
>  
>  	/* route all interrupts to ARM */
> -	__raw_writel(0xffffffff, base + INT2NTSR0);
> -	__raw_writel(0x3fffffff, base + INT2NTSR1);
> +	writel(0xffffffff, base + INT2NTSR0);
> +	writel(0x3fffffff, base + INT2NTSR1);
>  
>  	/* unmask all known interrupts in INTCS2 */
> -	__raw_writel(0xfffffff0, base + INT2SMSKCR0);
> -	__raw_writel(0xfff7ffff, base + INT2SMSKCR1);
> -	__raw_writel(0xfffbffdf, base + INT2SMSKCR2);
> -	__raw_writel(0xbffffffc, base + INT2SMSKCR3);
> -	__raw_writel(0x003fee3f, base + INT2SMSKCR4);
> +	writel(0xfffffff0, base + INT2SMSKCR0);
> +	writel(0xfff7ffff, base + INT2SMSKCR1);
> +	writel(0xfffbffdf, base + INT2SMSKCR2);
> +	writel(0xbffffffc, base + INT2SMSKCR3);
> +	writel(0x003fee3f, base + INT2SMSKCR4);
>  
>  	iounmap(base);
>  }
> diff --git a/arch/arm/mach-shmobile/smp-r8a7779.c b/arch/arm/mach-shmobile/smp-r8a7779.c
> index 80fef14a47ba6b7e..51163854d9a14d17 100644
> --- a/arch/arm/mach-shmobile/smp-r8a7779.c
> +++ b/arch/arm/mach-shmobile/smp-r8a7779.c
> @@ -45,7 +45,7 @@ static void __init r8a7779_smp_prepare_cpus(unsigned int max_cpus)
>  	void __iomem *base = ioremap(HPBREG_BASE, 0x1000);
>  
>  	/* Map the reset vector (in headsmp-scu.S, headsmp.S) */
> -	__raw_writel(__pa(shmobile_boot_vector), base + AVECR);
> +	writel(__pa(shmobile_boot_vector), base + AVECR);
>  
>  	/* setup r8a7779 specific SCU bits */
>  	shmobile_smp_scu_prepare_cpus(R8A7779_SCU_BASE, max_cpus);
> diff --git a/arch/arm/mach-shmobile/smp-sh73a0.c b/arch/arm/mach-shmobile/smp-sh73a0.c
> index 916f6367bc282eb4..62f4d2501e174a78 100644
> --- a/arch/arm/mach-shmobile/smp-sh73a0.c
> +++ b/arch/arm/mach-shmobile/smp-sh73a0.c
> @@ -39,10 +39,10 @@ static int sh73a0_boot_secondary(unsigned int cpu, struct task_struct *idle)
>  	unsigned int lcpu = cpu_logical_map(cpu);
>  	void __iomem *cpg2 = ioremap(CPG_BASE2, PAGE_SIZE);
>  
> -	if (((__raw_readl(cpg2 + PSTR) >> (4 * lcpu)) & 3) == 3)
> -		__raw_writel(1 << lcpu, cpg2 + WUPCR);	/* wake up */
> +	if (((readl(cpg2 + PSTR) >> (4 * lcpu)) & 3) == 3)
> +		writel(1 << lcpu, cpg2 + WUPCR);	/* wake up */
>  	else
> -		__raw_writel(1 << lcpu, cpg2 + SRESCR);	/* reset */
> +		writel(1 << lcpu, cpg2 + SRESCR);	/* reset */
>  	iounmap(cpg2);
>  	return 0;
>  }
> @@ -53,8 +53,8 @@ static void __init sh73a0_smp_prepare_cpus(unsigned int max_cpus)
>  	void __iomem *sysc = ioremap(SYSC_BASE, PAGE_SIZE);
>  
>  	/* Map the reset vector (in headsmp.S) */
> -	__raw_writel(0, ap + APARMBAREA);      /* 4k */
> -	__raw_writel(__pa(shmobile_boot_vector), sysc + SBAR);
> +	writel(0, ap + APARMBAREA);      /* 4k */
> +	writel(__pa(shmobile_boot_vector), sysc + SBAR);
>  	iounmap(sysc);
>  	iounmap(ap);
>  
> -- 
> 2.25.1
> 

-- 
Regards,
Niklas Söderlund
