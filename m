Return-Path: <linux-renesas-soc+bounces-13786-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 179CAA48532
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 27 Feb 2025 17:36:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B39FF3AC7DE
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 27 Feb 2025 16:32:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5D5714EB38;
	Thu, 27 Feb 2025 16:33:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="n+CKa4q9"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 815AB1ACEB5;
	Thu, 27 Feb 2025 16:33:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740673984; cv=none; b=s6hKRTeGy6ppUWkCsTld2nTxTb9qnughpFyLcy3QqFe/gFQ9fSgiB1WdSrBJxZ+YqBmCyo+0WFDeVtYN/ZsmrlLHBDsTea1aFobDB2XIx2lVWbi58F55Dzau16be4oTw3F/0U+cPOH8lzWphARCWrbvbtK/nB3oohvl+GQ4l+Xs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740673984; c=relaxed/simple;
	bh=xZAGtiBsGVxjIe3gDGDtguAEm32g2nHJ2cV0VNCaCc0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KElHh2ljkrcBCFs2vhPZ1u4xJGz0+opQomHUqNyov370F27xbmOQ29qiybIXgaFk9BMZENsCmAlSysc4WSsHwIzoakclZFesUsDhi2dOkDF9RRObqi7TASMXzdmE+0M1LFzXHBfUSWMpq5C0TkdWNwNUiovsuXnLopdJNuL47tg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=n+CKa4q9; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1740673982; x=1772209982;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=xZAGtiBsGVxjIe3gDGDtguAEm32g2nHJ2cV0VNCaCc0=;
  b=n+CKa4q9Jq3fptWImzOiO2Wop/tp50kRp7TdX+r3FcTufZCloKlsdBkD
   V6UHBd6RFqDwPQHfAAAzE/9AaeAwfLdJS/WYPgEFcbqyAzEVjMSQiPs/0
   QiLK7MpihY7WNiVouLtqdETjgevXLrsci9zIXL4kGHi4mGATSb3qxRWfF
   l4tzeTxOEvRUUUxDnwMl8lLYNBPV10X+75jDTULuQfPeEO10Z7JoAc2uA
   OkOwKXNCwSWT4r/n4ArKkwvzoGVBnC3iHzX4ncw0f02SKUl1W0581g1Bk
   XIFLe9WAFuV+MtSGTwSx1GES0Ejwc5/nstOdx9dePs1h2aXX1Wh1suaU1
   w==;
X-CSE-ConnectionGUID: bsHMLeMzS/mV6NzqB1qE/g==
X-CSE-MsgGUID: zu3LkvlSTSivVwbx4M7fJA==
X-IronPort-AV: E=McAfee;i="6700,10204,11314"; a="52985966"
X-IronPort-AV: E=Sophos;i="6.12,310,1728975600"; 
   d="scan'208";a="52985966"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Feb 2025 08:33:02 -0800
X-CSE-ConnectionGUID: sPldEseqQBCwTkBow3WKPA==
X-CSE-MsgGUID: T61cUxiFTMaOxWwXeT1zTg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,320,1732608000"; 
   d="scan'208";a="140303904"
Received: from lkp-server02.sh.intel.com (HELO 76cde6cc1f07) ([10.239.97.151])
  by fmviesa002.fm.intel.com with ESMTP; 27 Feb 2025 08:33:00 -0800
Received: from kbuild by 76cde6cc1f07 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tngoj-000Dho-2G;
	Thu, 27 Feb 2025 16:32:57 +0000
Date: Fri, 28 Feb 2025 00:32:29 +0800
From: kernel test robot <lkp@intel.com>
To: Thierry Bultel <thierry.bultel.yh@bp.renesas.com>,
	thierry.bultel@linatsea.fr
Cc: oe-kbuild-all@lists.linux.dev, linux-renesas-soc@vger.kernel.org,
	geert@linux-m68k.org, paul.barker.ct@bp.renesas.com,
	Thierry Bultel <thierry.bultel.yh@bp.renesas.com>,
	linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org
Subject: Re: [PATCH v3 06/13] clk: renesas: Add support for R9A09G077 SoC
Message-ID: <202502280006.8lJfdpzm-lkp@intel.com>
References: <20250226130935.3029927-7-thierry.bultel.yh@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250226130935.3029927-7-thierry.bultel.yh@bp.renesas.com>

Hi Thierry,

kernel test robot noticed the following build warnings:

[auto build test WARNING on tty/tty-testing]
[also build test WARNING on tty/tty-next tty/tty-linus geert-renesas-devel/next linus/master v6.14-rc4 next-20250227]
[cannot apply to geert-renesas-drivers/renesas-clk]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Thierry-Bultel/dt-bindings-clock-Add-cpg-for-the-Renesas-RZ-T2H-SoC/20250226-221033
base:   https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/tty.git tty-testing
patch link:    https://lore.kernel.org/r/20250226130935.3029927-7-thierry.bultel.yh%40bp.renesas.com
patch subject: [PATCH v3 06/13] clk: renesas: Add support for R9A09G077 SoC
config: arc-randconfig-r122-20250227 (https://download.01.org/0day-ci/archive/20250228/202502280006.8lJfdpzm-lkp@intel.com/config)
compiler: arceb-elf-gcc (GCC) 13.2.0
reproduce: (https://download.01.org/0day-ci/archive/20250228/202502280006.8lJfdpzm-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502280006.8lJfdpzm-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/clk/renesas/renesas-cpg-mssr.c:216:49: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void *base @@     got void [noderef] __iomem * @@
   drivers/clk/renesas/renesas-cpg-mssr.c:216:49: sparse:     expected void *base
   drivers/clk/renesas/renesas-cpg-mssr.c:216:49: sparse:     got void [noderef] __iomem *
>> drivers/clk/renesas/renesas-cpg-mssr.c:294:51: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void [noderef] __iomem *addr @@     got void * @@
   drivers/clk/renesas/renesas-cpg-mssr.c:294:51: sparse:     expected void [noderef] __iomem *addr
   drivers/clk/renesas/renesas-cpg-mssr.c:294:51: sparse:     got void *

vim +216 drivers/clk/renesas/renesas-cpg-mssr.c

   211	
   212	static void *cpg_rzt2h_addr_from_offset(struct clk_hw *hw, u16 offset)
   213	{
   214		struct mstp_clock *clock = to_mstp_clock(hw);
   215		struct cpg_mssr_priv *priv = clock->priv;
 > 216		void *base = RZT2H_MSTPCR_BLOCK(offset) ? priv->pub.base1 : priv->pub.base0;
   217	
   218		return base + RZT2H_MSTPCR_OFFSET(offset);
   219	}
   220	
   221	static int cpg_mstp_clock_endisable(struct clk_hw *hw, bool enable)
   222	{
   223		struct mstp_clock *clock = to_mstp_clock(hw);
   224		struct cpg_mssr_priv *priv = clock->priv;
   225		unsigned int reg = clock->index / 32;
   226		unsigned int bit = clock->index % 32;
   227		struct device *dev = priv->dev;
   228		u32 bitmask = BIT(bit);
   229		unsigned long flags;
   230		u32 value;
   231		int error;
   232	
   233		dev_dbg(dev, "MSTP %u%02u/%pC %s\n", reg, bit, hw->clk,
   234			enable ? "ON" : "OFF");
   235		spin_lock_irqsave(&priv->pub.rmw_lock, flags);
   236	
   237		if (priv->reg_layout == CLK_REG_LAYOUT_RZ_A) {
   238			value = readb(priv->pub.base0 + priv->control_regs[reg]);
   239			if (enable)
   240				value &= ~bitmask;
   241			else
   242				value |= bitmask;
   243			writeb(value, priv->pub.base0 + priv->control_regs[reg]);
   244	
   245			/* dummy read to ensure write has completed */
   246			readb(priv->pub.base0 + priv->control_regs[reg]);
   247			barrier_data(priv->pub.base0 + priv->control_regs[reg]);
   248	
   249		} else {
   250			value = readl(priv->pub.base0 + priv->control_regs[reg]);
   251			if (enable)
   252				value &= ~bitmask;
   253			else
   254				value |= bitmask;
   255			writel(value, priv->pub.base0 + priv->control_regs[reg]);
   256		}
   257	
   258		spin_unlock_irqrestore(&priv->pub.rmw_lock, flags);
   259	
   260		if (!enable || priv->reg_layout == CLK_REG_LAYOUT_RZ_A ||
   261			priv->reg_layout == CLK_REG_LAYOUT_RZ_T2H)
   262			return 0;
   263	
   264		error = readl_poll_timeout_atomic(priv->pub.base0 + priv->status_regs[reg],
   265						  value, !(value & bitmask), 0, 10);
   266		if (error)
   267			dev_err(dev, "Failed to enable SMSTP %p[%d]\n",
   268				priv->pub.base0 + priv->control_regs[reg], bit);
   269	
   270		return error;
   271	}
   272	
   273	static int cpg_mstp_clock_enable(struct clk_hw *hw)
   274	{
   275		return cpg_mstp_clock_endisable(hw, true);
   276	}
   277	
   278	static void cpg_mstp_clock_disable(struct clk_hw *hw)
   279	{
   280		cpg_mstp_clock_endisable(hw, false);
   281	}
   282	
   283	static int cpg_mstp_clock_is_enabled(struct clk_hw *hw)
   284	{
   285		struct mstp_clock *clock = to_mstp_clock(hw);
   286		struct cpg_mssr_priv *priv = clock->priv;
   287		unsigned int reg = clock->index / 32;
   288		u32 value;
   289	
   290		if (priv->reg_layout == CLK_REG_LAYOUT_RZ_A)
   291			value = readb(priv->pub.base0 + priv->control_regs[reg]);
   292		else if (priv->reg_layout == CLK_REG_LAYOUT_RZ_T2H) {
   293			void __iomem *addr =
 > 294				cpg_rzt2h_addr_from_offset(hw,
   295							   priv->control_regs[reg]);
   296			value = readw(addr);
   297		}
   298		else
   299			value = readl(priv->pub.base0 + priv->status_regs[reg]);
   300	
   301		return !(value & BIT(clock->index % 32));
   302	}
   303	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

