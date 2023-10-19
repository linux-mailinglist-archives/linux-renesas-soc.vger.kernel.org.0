Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 724547CF95C
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 19 Oct 2023 14:51:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1345380AbjJSMvA (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 19 Oct 2023 08:51:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57874 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1345501AbjJSMu7 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 19 Oct 2023 08:50:59 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 77D63F7
        for <linux-renesas-soc@vger.kernel.org>; Thu, 19 Oct 2023 05:50:57 -0700 (PDT)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4A383C433C8;
        Thu, 19 Oct 2023 12:50:53 +0000 (UTC)
Message-ID: <572668b5-48b5-4bac-8712-75a5e2c096bd@linux-m68k.org>
Date:   Thu, 19 Oct 2023 22:50:50 +1000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 09/12] m68k: use the coherent DMA code for coldfire
 without data cache
Content-Language: en-US
To:     Christoph Hellwig <hch@lst.de>, iommu@lists.linux.dev
Cc:     Paul Walmsley <paul.walmsley@sifive.com>,
        Palmer Dabbelt <palmer@dabbelt.com>,
        Conor Dooley <conor@kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        Robin Murphy <robin.murphy@arm.com>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Wei Fang <wei.fang@nxp.com>,
        Shenwei Wang <shenwei.wang@nxp.com>,
        Clark Wang <xiaoning.wang@nxp.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        linux-m68k@lists.linux-m68k.org, netdev@vger.kernel.org,
        linux-riscv@lists.infradead.org, linux-renesas-soc@vger.kernel.org,
        Jim Quinlan <james.quinlan@broadcom.com>
References: <20231016054755.915155-1-hch@lst.de>
 <20231016054755.915155-10-hch@lst.de>
From:   Greg Ungerer <gerg@linux-m68k.org>
In-Reply-To: <20231016054755.915155-10-hch@lst.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.0 required=5.0 tests=BAYES_00,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Christoph,

On 16/10/23 15:47, Christoph Hellwig wrote:
> Coldfire cores configured without a data cache are DMA coherent and
> should thus simply use the simple coherent version of dma-direct.
> 
> Introduce a new COLDFIRE_COHERENT_DMA Kconfig symbol as a convenient
> short hand for such configurations, and a M68K_NONCOHERENT_DMA symbol
> for all cases where we need to build non-coherent DMA infrastructure
> to simplify the Kconfig and code conditionals.
> 
> Not building the non-coherent DMA code slightly reduces the code
> size for such configurations.
> 
> Numers for m5249evb_defconfig below:
> 
>    text	   data	    bss	    dec	    hex	filename
> 2896158	 401052	  65392	3362602	 334f2a	vmlinux.before
> 2895166	 400988	  65392	3361546	 334b0a	vmlinux.after
> 
> Signed-off-by: Christoph Hellwig <hch@lst.de>
> ---
>   arch/m68k/Kconfig         |  8 ++++----
>   arch/m68k/Kconfig.cpu     | 12 ++++++++++++
>   arch/m68k/kernel/Makefile |  2 +-
>   arch/m68k/kernel/dma.c    |  2 +-
>   4 files changed, 18 insertions(+), 6 deletions(-)
> 
> diff --git a/arch/m68k/Kconfig b/arch/m68k/Kconfig
> index 0430b8ba6b5cc6..6c585eae89f4dc 100644
> --- a/arch/m68k/Kconfig
> +++ b/arch/m68k/Kconfig
> @@ -3,19 +3,19 @@ config M68K
>   	bool
>   	default y
>   	select ARCH_32BIT_OFF_T
> -	select ARCH_DMA_ALLOC if !MMU || COLDFIRE
> +	select ARCH_DMA_ALLOC if M68K_NONCOHERENT_DMA && COLDFIRE
>   	select ARCH_HAS_BINFMT_FLAT
>   	select ARCH_HAS_CPU_FINALIZE_INIT if MMU
>   	select ARCH_HAS_CURRENT_STACK_POINTER
> -	select ARCH_HAS_DMA_PREP_COHERENT if HAS_DMA && MMU && !COLDFIRE
> -	select ARCH_HAS_SYNC_DMA_FOR_DEVICE if HAS_DMA
> +	select ARCH_HAS_DMA_PREP_COHERENT if M68K_NONCOHERENT_DMA && !COLDFIRE
> +	select ARCH_HAS_SYNC_DMA_FOR_DEVICE if M68K_NONCOHERENT_DMA
>   	select ARCH_HAVE_NMI_SAFE_CMPXCHG if RMW_INSNS
>   	select ARCH_MIGHT_HAVE_PC_PARPORT if ISA
>   	select ARCH_NO_PREEMPT if !COLDFIRE
>   	select ARCH_USE_MEMTEST if MMU_MOTOROLA
>   	select ARCH_WANT_IPC_PARSE_VERSION
>   	select BINFMT_FLAT_ARGVP_ENVP_ON_STACK
> -	select DMA_DIRECT_REMAP if HAS_DMA && MMU && !COLDFIRE
> +	select DMA_DIRECT_REMAP if M68K_NONCOHERENT_DMA && !COLDFIRE
>   	select GENERIC_ATOMIC64
>   	select GENERIC_CPU_DEVICES
>   	select GENERIC_IOMAP
> diff --git a/arch/m68k/Kconfig.cpu b/arch/m68k/Kconfig.cpu
> index b826e9c677b2ae..e8905d38c714c4 100644
> --- a/arch/m68k/Kconfig.cpu
> +++ b/arch/m68k/Kconfig.cpu
> @@ -535,3 +535,15 @@ config CACHE_COPYBACK
>   	  The ColdFire CPU cache is set into Copy-back mode.
>   endchoice
>   endif # HAVE_CACHE_CB
> +
> +# Coldfire cores that do not have a data cache configured can do coherent DMA.
> +config COLDFIRE_COHERENT_DMA
> +	bool
> +	default y
> +	depends on COLDFIRE
> +	depends on !HAVE_CACHE_CB && !CONFIG_CACHE_D && !CONFIG_CACHE_BOTH
                                       ^^^^^^             ^^^^^^

This needs to be "depends on !HAVE_CACHE_CB && !CACHE_D && !CACHE_BOTH".

Regards
Greg


> +
> +config M68K_NONCOHERENT_DMA
> +	bool
> +	default y
> +	depends on HAS_DMA && !COLDFIRE_COHERENT_DMA
> diff --git a/arch/m68k/kernel/Makefile b/arch/m68k/kernel/Makefile
> index af015447dfb4c1..01fb69a5095f43 100644
> --- a/arch/m68k/kernel/Makefile
> +++ b/arch/m68k/kernel/Makefile
> @@ -23,7 +23,7 @@ obj-$(CONFIG_MMU_MOTOROLA) += ints.o vectors.o
>   obj-$(CONFIG_MMU_SUN3) += ints.o vectors.o
>   obj-$(CONFIG_PCI) += pcibios.o
>   
> -obj-$(CONFIG_HAS_DMA)	+= dma.o
> +obj-$(CONFIG_M68K_NONCOHERENT_DMA) += dma.o
>   
>   obj-$(CONFIG_KEXEC)		+= machine_kexec.o relocate_kernel.o
>   obj-$(CONFIG_BOOTINFO_PROC)	+= bootinfo_proc.o
> diff --git a/arch/m68k/kernel/dma.c b/arch/m68k/kernel/dma.c
> index 2e192a5df949bb..f83870cfa79b37 100644
> --- a/arch/m68k/kernel/dma.c
> +++ b/arch/m68k/kernel/dma.c
> @@ -17,7 +17,7 @@
>   
>   #include <asm/cacheflush.h>
>   
> -#if defined(CONFIG_MMU) && !defined(CONFIG_COLDFIRE)
> +#ifndef CONFIG_COLDFIRE
>   void arch_dma_prep_coherent(struct page *page, size_t size)
>   {
>   	cache_push(page_to_phys(page), size);
