Return-Path: <linux-renesas-soc+bounces-10527-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 422A59CD61C
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 15 Nov 2024 05:05:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E97BB2827FD
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 15 Nov 2024 04:05:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EE1C4156F5D;
	Fri, 15 Nov 2024 04:05:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="TG9FGm2P"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC3EB4F218;
	Fri, 15 Nov 2024 04:04:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.50.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731643510; cv=none; b=PoCeeCpXwikd1WuOmjLRlZkYRLGfQOAzHlhxLsdOOFHAoifB5I4TG+aKdWHpz4YCUQLSag7ugUXKLHZZXCqYB/RN5CiYqSNrV7yzwHBUtUJieQ3Wsz3bTNb4onlCwo/gGvB9A4+s6s1QT9+SNKfEkBfj5BBzyS0kMlAG7QlYrD8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731643510; c=relaxed/simple;
	bh=tTwfv8XsCYbK7dWH3i159FcEK0AX2R5ZuAyys/XOCjQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=pMEKtO0Ho7IjtE6ltWDDdQ3yMHzbFNLQJOpvBbs8rJ4zHQ32J4YqIpnSk35Y8EmPTlrvRa+sSugSgDxsmtojhDRPOi3ZftD844oYq7nKv3+ftXTRXAXLyLAgCS52hXn2u57u3uYdVLYM/sxlKlqR39wgcIkN+q8C6t3DiX7xKH8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=TG9FGm2P; arc=none smtp.client-ip=90.155.50.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:Content-Type:
	In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description;
	bh=tqy59bhN+bRxyH4lFjsJcTP5KL0/JrPof3mp/Jpj2g4=; b=TG9FGm2PeuDQxlcZj4jgkYPEdi
	7B91v60bgnzVJ8En8e7/d5qEYnHy3eAxIMM+pYKNwJSA1FqTUfU+sezDx5m8kpA+Gq2BQbaZtFYL6
	QNgunF55YeVgclB3xyKXbtQQ0r54LGBVpffC5AdRooNUCJCKnVc6/+/8iNmfyjbm3mAUQSq7SWPCo
	HZ0nQo5txwm3symssSQQXzfH8NUxCw1/UjsYFLMwaKJtubO0NDPHoe46aIz6Lz2f/VEesuclrb52f
	ckucXdLEn0YwhXsNZ1Cn3yiWqrCB7MytPb+DDP8COFG/sBCMieWgQQRhhO+ieSB/ADLHeWaonNcdW
	+LQJPxhQ==;
Received: from [50.53.2.24] (helo=[192.168.254.17])
	by casper.infradead.org with esmtpsa (Exim 4.98 #2 (Red Hat Linux))
	id 1tBnZe-00000000oRN-0Vj3;
	Fri, 15 Nov 2024 04:04:45 +0000
Message-ID: <66ab2ee4-bef3-4969-a14e-7804b62dca78@infradead.org>
Date: Thu, 14 Nov 2024 20:04:40 -0800
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: drivers/video/fbdev/sh7760fb.c:363:31: sparse: sparse: incorrect
 type in argument 3 (different address spaces)
To: kernel test robot <lkp@intel.com>, linux-renesas-soc@vger.kernel.org,
 Nobuhiro Iwamatsu <iwamatsu.nobuhiro@renesas.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
 Helge Deller <deller@gmx.de>
References: <202411082014.qSQ9A5ho-lkp@intel.com>
Content-Language: en-US
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <202411082014.qSQ9A5ho-lkp@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi robot,

On 11/8/24 4:27 AM, kernel test robot wrote:
> Hi Randy,
> 
> First bad commit (maybe != root cause):
> 
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
> head:   906bd684e4b1e517dd424a354744c5b0aebef8af
> commit: 51084f89d687e14d96278241e5200cde4b0985c7 fbdev: sh7760fb: allow modular build

The same warnings happen without this patch applied, so I suggest that you
backtrack to the commit that is listed near the end of your email. Thanks so much. :)

> date:   7 months ago
> config: sh-randconfig-r132-20241108 (https://download.01.org/0day-ci/archive/20241108/202411082014.qSQ9A5ho-lkp@intel.com/config)
> compiler: sh4-linux-gcc (GCC) 14.2.0
> reproduce: (https://download.01.org/0day-ci/archive/20241108/202411082014.qSQ9A5ho-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202411082014.qSQ9A5ho-lkp@intel.com/
> 
> sparse warnings: (new ones prefixed by >>)
>>> drivers/video/fbdev/sh7760fb.c:363:31: sparse: sparse: incorrect type in argument 3 (different address spaces) @@     expected void *cpu_addr @@     got char [noderef] __iomem *screen_base @@
>    drivers/video/fbdev/sh7760fb.c:363:31: sparse:     expected void *cpu_addr
>    drivers/video/fbdev/sh7760fb.c:363:31: sparse:     got char [noderef] __iomem *screen_base
>>> drivers/video/fbdev/sh7760fb.c:423:27: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected char [noderef] __iomem *screen_base @@     got void *[assigned] fbmem @@
>    drivers/video/fbdev/sh7760fb.c:423:27: sparse:     expected char [noderef] __iomem *screen_base
>    drivers/video/fbdev/sh7760fb.c:423:27: sparse:     got void *[assigned] fbmem
>    drivers/video/fbdev/sh7760fb.c: note: in included file (through include/linux/mmzone.h, include/linux/gfp.h, include/linux/xarray.h, ...):
>    include/linux/page-flags.h:242:46: sparse: sparse: self-comparison always evaluates to false
>    include/linux/page-flags.h:242:46: sparse: sparse: self-comparison always evaluates to false
> 
> vim +363 drivers/video/fbdev/sh7760fb.c
> 
> 4a25e41831ee85 drivers/video/sh7760fb.c       Nobuhiro Iwamatsu 2008-07-23  354  
> 4a25e41831ee85 drivers/video/sh7760fb.c       Nobuhiro Iwamatsu 2008-07-23  355  static void sh7760fb_free_mem(struct fb_info *info)
> 4a25e41831ee85 drivers/video/sh7760fb.c       Nobuhiro Iwamatsu 2008-07-23  356  {
> 4a25e41831ee85 drivers/video/sh7760fb.c       Nobuhiro Iwamatsu 2008-07-23  357  	struct sh7760fb_par *par = info->par;
> 4a25e41831ee85 drivers/video/sh7760fb.c       Nobuhiro Iwamatsu 2008-07-23  358  
> 4a25e41831ee85 drivers/video/sh7760fb.c       Nobuhiro Iwamatsu 2008-07-23  359  	if (!info->screen_base)
> 4a25e41831ee85 drivers/video/sh7760fb.c       Nobuhiro Iwamatsu 2008-07-23  360  		return;
> 4a25e41831ee85 drivers/video/sh7760fb.c       Nobuhiro Iwamatsu 2008-07-23  361  
> 8404e56f4bc1d1 drivers/video/fbdev/sh7760fb.c Thomas Zimmermann 2023-06-13  362  	dma_free_coherent(info->device, info->screen_size,
> 4a25e41831ee85 drivers/video/sh7760fb.c       Nobuhiro Iwamatsu 2008-07-23 @363  			  info->screen_base, par->fbdma);
> 4a25e41831ee85 drivers/video/sh7760fb.c       Nobuhiro Iwamatsu 2008-07-23  364  
> 4a25e41831ee85 drivers/video/sh7760fb.c       Nobuhiro Iwamatsu 2008-07-23  365  	par->fbdma = 0;
> 4a25e41831ee85 drivers/video/sh7760fb.c       Nobuhiro Iwamatsu 2008-07-23  366  	info->screen_base = NULL;
> 4a25e41831ee85 drivers/video/sh7760fb.c       Nobuhiro Iwamatsu 2008-07-23  367  	info->screen_size = 0;
> 4a25e41831ee85 drivers/video/sh7760fb.c       Nobuhiro Iwamatsu 2008-07-23  368  }
> 4a25e41831ee85 drivers/video/sh7760fb.c       Nobuhiro Iwamatsu 2008-07-23  369  
> 4a25e41831ee85 drivers/video/sh7760fb.c       Nobuhiro Iwamatsu 2008-07-23  370  /* allocate the framebuffer memory. This memory must be in Area3,
> 4a25e41831ee85 drivers/video/sh7760fb.c       Nobuhiro Iwamatsu 2008-07-23  371   * (dictated by the DMA engine) and contiguous, at a 512 byte boundary.
> 4a25e41831ee85 drivers/video/sh7760fb.c       Nobuhiro Iwamatsu 2008-07-23  372   */
> 4a25e41831ee85 drivers/video/sh7760fb.c       Nobuhiro Iwamatsu 2008-07-23  373  static int sh7760fb_alloc_mem(struct fb_info *info)
> 4a25e41831ee85 drivers/video/sh7760fb.c       Nobuhiro Iwamatsu 2008-07-23  374  {
> 4a25e41831ee85 drivers/video/sh7760fb.c       Nobuhiro Iwamatsu 2008-07-23  375  	struct sh7760fb_par *par = info->par;
> 4a25e41831ee85 drivers/video/sh7760fb.c       Nobuhiro Iwamatsu 2008-07-23  376  	void *fbmem;
> 4a25e41831ee85 drivers/video/sh7760fb.c       Nobuhiro Iwamatsu 2008-07-23  377  	unsigned long vram;
> 4a25e41831ee85 drivers/video/sh7760fb.c       Nobuhiro Iwamatsu 2008-07-23  378  	int ret, bpp;
> 4a25e41831ee85 drivers/video/sh7760fb.c       Nobuhiro Iwamatsu 2008-07-23  379  
> 4a25e41831ee85 drivers/video/sh7760fb.c       Nobuhiro Iwamatsu 2008-07-23  380  	if (info->screen_base)
> 4a25e41831ee85 drivers/video/sh7760fb.c       Nobuhiro Iwamatsu 2008-07-23  381  		return 0;
> 4a25e41831ee85 drivers/video/sh7760fb.c       Nobuhiro Iwamatsu 2008-07-23  382  
> 4a25e41831ee85 drivers/video/sh7760fb.c       Nobuhiro Iwamatsu 2008-07-23  383  	/* get color info from register value */
> f08c6c53b8e157 drivers/video/fbdev/sh7760fb.c Thomas Zimmermann 2023-06-13  384  	ret = sh7760fb_get_color_info(info, par->pd->lddfr, &bpp, NULL);
> 4a25e41831ee85 drivers/video/sh7760fb.c       Nobuhiro Iwamatsu 2008-07-23  385  	if (ret) {
> 4a25e41831ee85 drivers/video/sh7760fb.c       Nobuhiro Iwamatsu 2008-07-23  386  		printk(KERN_ERR "colinfo\n");
> 4a25e41831ee85 drivers/video/sh7760fb.c       Nobuhiro Iwamatsu 2008-07-23  387  		return ret;
> 4a25e41831ee85 drivers/video/sh7760fb.c       Nobuhiro Iwamatsu 2008-07-23  388  	}
> 4a25e41831ee85 drivers/video/sh7760fb.c       Nobuhiro Iwamatsu 2008-07-23  389  
> 4a25e41831ee85 drivers/video/sh7760fb.c       Nobuhiro Iwamatsu 2008-07-23  390  	/* min VRAM: xres_min = 16, yres_min = 1, bpp = 1: 2byte -> 1 page
> 4a25e41831ee85 drivers/video/sh7760fb.c       Nobuhiro Iwamatsu 2008-07-23  391  	   max VRAM: xres_max = 1024, yres_max = 1024, bpp = 16: 2MB */
> 4a25e41831ee85 drivers/video/sh7760fb.c       Nobuhiro Iwamatsu 2008-07-23  392  
> 4a25e41831ee85 drivers/video/sh7760fb.c       Nobuhiro Iwamatsu 2008-07-23  393  	vram = info->var.xres * info->var.yres;
> 4a25e41831ee85 drivers/video/sh7760fb.c       Nobuhiro Iwamatsu 2008-07-23  394  	if (info->var.grayscale) {
> 4a25e41831ee85 drivers/video/sh7760fb.c       Nobuhiro Iwamatsu 2008-07-23  395  		if (bpp == 1)
> 4a25e41831ee85 drivers/video/sh7760fb.c       Nobuhiro Iwamatsu 2008-07-23  396  			vram >>= 3;
> 4a25e41831ee85 drivers/video/sh7760fb.c       Nobuhiro Iwamatsu 2008-07-23  397  		else if (bpp == 2)
> 4a25e41831ee85 drivers/video/sh7760fb.c       Nobuhiro Iwamatsu 2008-07-23  398  			vram >>= 2;
> 4a25e41831ee85 drivers/video/sh7760fb.c       Nobuhiro Iwamatsu 2008-07-23  399  		else if (bpp == 4)
> 4a25e41831ee85 drivers/video/sh7760fb.c       Nobuhiro Iwamatsu 2008-07-23  400  			vram >>= 1;
> 4a25e41831ee85 drivers/video/sh7760fb.c       Nobuhiro Iwamatsu 2008-07-23  401  	} else if (bpp > 8)
> 4a25e41831ee85 drivers/video/sh7760fb.c       Nobuhiro Iwamatsu 2008-07-23  402  		vram *= 2;
> 4a25e41831ee85 drivers/video/sh7760fb.c       Nobuhiro Iwamatsu 2008-07-23  403  	if ((vram < 1) || (vram > 1024 * 2048)) {
> 46d86f3b3b1d22 drivers/video/fbdev/sh7760fb.c Thomas Zimmermann 2023-06-13  404  		fb_dbg(info, "too much VRAM required. Check settings\n");
> 4a25e41831ee85 drivers/video/sh7760fb.c       Nobuhiro Iwamatsu 2008-07-23  405  		return -ENODEV;
> 4a25e41831ee85 drivers/video/sh7760fb.c       Nobuhiro Iwamatsu 2008-07-23  406  	}
> 4a25e41831ee85 drivers/video/sh7760fb.c       Nobuhiro Iwamatsu 2008-07-23  407  
> 4a25e41831ee85 drivers/video/sh7760fb.c       Nobuhiro Iwamatsu 2008-07-23  408  	if (vram < PAGE_SIZE)
> 4a25e41831ee85 drivers/video/sh7760fb.c       Nobuhiro Iwamatsu 2008-07-23  409  		vram = PAGE_SIZE;
> 4a25e41831ee85 drivers/video/sh7760fb.c       Nobuhiro Iwamatsu 2008-07-23  410  
> 8404e56f4bc1d1 drivers/video/fbdev/sh7760fb.c Thomas Zimmermann 2023-06-13  411  	fbmem = dma_alloc_coherent(info->device, vram, &par->fbdma, GFP_KERNEL);
> 4a25e41831ee85 drivers/video/sh7760fb.c       Nobuhiro Iwamatsu 2008-07-23  412  
> 4a25e41831ee85 drivers/video/sh7760fb.c       Nobuhiro Iwamatsu 2008-07-23  413  	if (!fbmem)
> 4a25e41831ee85 drivers/video/sh7760fb.c       Nobuhiro Iwamatsu 2008-07-23  414  		return -ENOMEM;
> 4a25e41831ee85 drivers/video/sh7760fb.c       Nobuhiro Iwamatsu 2008-07-23  415  
> 4a25e41831ee85 drivers/video/sh7760fb.c       Nobuhiro Iwamatsu 2008-07-23  416  	if ((par->fbdma & SH7760FB_DMA_MASK) != SH7760FB_DMA_MASK) {
> 4a25e41831ee85 drivers/video/sh7760fb.c       Nobuhiro Iwamatsu 2008-07-23  417  		sh7760fb_free_mem(info);
> 8404e56f4bc1d1 drivers/video/fbdev/sh7760fb.c Thomas Zimmermann 2023-06-13  418  		dev_err(info->device, "kernel gave me memory at 0x%08lx, which is"
> 4a25e41831ee85 drivers/video/sh7760fb.c       Nobuhiro Iwamatsu 2008-07-23  419  			"unusable for the LCDC\n", (unsigned long)par->fbdma);
> 4a25e41831ee85 drivers/video/sh7760fb.c       Nobuhiro Iwamatsu 2008-07-23  420  		return -ENOMEM;
> 4a25e41831ee85 drivers/video/sh7760fb.c       Nobuhiro Iwamatsu 2008-07-23  421  	}
> 4a25e41831ee85 drivers/video/sh7760fb.c       Nobuhiro Iwamatsu 2008-07-23  422  
> 4a25e41831ee85 drivers/video/sh7760fb.c       Nobuhiro Iwamatsu 2008-07-23 @423  	info->screen_base = fbmem;
> 4a25e41831ee85 drivers/video/sh7760fb.c       Nobuhiro Iwamatsu 2008-07-23  424  	info->screen_size = vram;
> 537a1bf059fa31 drivers/video/sh7760fb.c       Krzysztof Helt    2009-06-30  425  	info->fix.smem_start = (unsigned long)info->screen_base;
> 537a1bf059fa31 drivers/video/sh7760fb.c       Krzysztof Helt    2009-06-30  426  	info->fix.smem_len = info->screen_size;
> 4a25e41831ee85 drivers/video/sh7760fb.c       Nobuhiro Iwamatsu 2008-07-23  427  
> 4a25e41831ee85 drivers/video/sh7760fb.c       Nobuhiro Iwamatsu 2008-07-23  428  	return 0;
> 4a25e41831ee85 drivers/video/sh7760fb.c       Nobuhiro Iwamatsu 2008-07-23  429  }
> 4a25e41831ee85 drivers/video/sh7760fb.c       Nobuhiro Iwamatsu 2008-07-23  430  
> 
> :::::: The code at line 363 was first introduced by commit
> :::::: 4a25e41831ee851c1365d8b41decc22493b18e6d video: sh7760fb: SH7760/SH7763 LCDC framebuffer driver

This one ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
> 
> :::::: TO: Nobuhiro Iwamatsu <iwamatsu.nobuhiro@renesas.com>
> :::::: CC: Linus Torvalds <torvalds@linux-foundation.org>
> 

-- 
~Randy


