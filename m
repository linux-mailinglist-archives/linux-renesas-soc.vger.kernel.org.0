Return-Path: <linux-renesas-soc+bounces-23594-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 39B62C087D0
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 25 Oct 2025 03:03:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 85F064E12C5
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 25 Oct 2025 01:03:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1640F20CCE4;
	Sat, 25 Oct 2025 01:03:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DOsOKCk+"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5337195FE8;
	Sat, 25 Oct 2025 01:03:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761354221; cv=none; b=anZXpIteCTF1ClNpfE2vpgSH/gIMePkoMsuTmMo1UVjlYEnNool+xWMT4XVI46W7QySP4jnk/XdXdrePQHB0ryPSHZHjnR+w+wvBGfuxZMz/1WMlEPmcmHSGd6HxeUcXSnNXuiPrzLokE+jx3PNEZ1NLEafFUjl2ZTrfnDJb/kY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761354221; c=relaxed/simple;
	bh=OyigZUEGYtST+wfiMwu6/ZIq8s4IjOCdsiksqsdakCI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sYxrFTpnO5CGliVKJUpf1GYh6TZdAU88HiCPrJxQ++APBzBBfG/LOYmAwBS0c+x+5Pepu39As44V3Nfxn1Qm3eRxOjKL2nj6DGrQHEN/fXJfIt1OJbKNWBXVPjGsAmHMUYVCTBULKIM56PAxpQWvF8L2Z8ZJB97WbkoDNC3qQk4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DOsOKCk+; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761354219; x=1792890219;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=OyigZUEGYtST+wfiMwu6/ZIq8s4IjOCdsiksqsdakCI=;
  b=DOsOKCk+9S3MpwVgTQ/evtWKrjikPHm+7DWilkOSGku9zeKMQ3Z+6WwS
   ziQRa/3nHPNJlF6Uoyf1Xxf2mb6V/PKPnxL79+awC3ft1+44/9lBjir99
   /cekeL8G1nokuZKp5dsraoRUFYrIUPVnnscSTROf0JtxB/h96HixaSYFd
   ODHsTDAlLyXJ1vqmTYtmHH6uDmaotsNyFs8hbdaCOh0dppAMdZQLrL9oo
   0dhg5KSCTYONWjVf2bnzP1gqbtZsC1DrFC9dRCPq1fb+6LISXd7EsJijD
   rkvPpx2siGgkWkTNCaFhKV1iZOEpF0s4witHpG0XVuZheACTPmu9SSsd6
   A==;
X-CSE-ConnectionGUID: EpHRcW1uTUapnYpYgbu6pQ==
X-CSE-MsgGUID: RmjIr4YPRtOdWjO3C+DT5Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="63574336"
X-IronPort-AV: E=Sophos;i="6.19,253,1754982000"; 
   d="scan'208";a="63574336"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Oct 2025 18:03:38 -0700
X-CSE-ConnectionGUID: 8586qdYRR0u90w7qFvQSVQ==
X-CSE-MsgGUID: yVooTElqRda1rFVyo5pTHg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,253,1754982000"; 
   d="scan'208";a="221762274"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by orviesa001.jf.intel.com with ESMTP; 24 Oct 2025 18:03:35 -0700
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vCSgv-000F1Z-0U;
	Sat, 25 Oct 2025 01:03:33 +0000
Date: Sat, 25 Oct 2025 09:02:52 +0800
From: kernel test robot <lkp@intel.com>
To: Prabhakar <prabhakar.csengg@gmail.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-renesas-soc@vger.kernel.org,
	linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: Re: [PATCH 1/3] clk: renesas: r9a09g056: Add clocks and resets for
 DSI and LCDC modules
Message-ID: <202510250820.8SwrAUFt-lkp@intel.com>
References: <20251023210724.666476-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251023210724.666476-2-prabhakar.mahadev-lad.rj@bp.renesas.com>

Hi Prabhakar,

kernel test robot noticed the following build warnings:

[auto build test WARNING on geert-renesas-drivers/renesas-clk]
[also build test WARNING on clk/clk-next linus/master v6.18-rc2 next-20251024]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Prabhakar/clk-renesas-r9a09g056-Add-clocks-and-resets-for-DSI-and-LCDC-modules/20251024-050927
base:   https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git renesas-clk
patch link:    https://lore.kernel.org/r/20251023210724.666476-2-prabhakar.mahadev-lad.rj%40bp.renesas.com
patch subject: [PATCH 1/3] clk: renesas: r9a09g056: Add clocks and resets for DSI and LCDC modules
config: alpha-allyesconfig (https://download.01.org/0day-ci/archive/20251025/202510250820.8SwrAUFt-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 15.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251025/202510250820.8SwrAUFt-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202510250820.8SwrAUFt-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/clk/renesas/r9a09g056-cpg.c:130:1: warning: data definition has no type or storage class
     130 | RZV2H_CPG_PLL_DSI_LIMITS(rzv2n_cpg_pll_dsi_limits);
         | ^~~~~~~~~~~~~~~~~~~~~~~~
   drivers/clk/renesas/r9a09g056-cpg.c:130:1: error: type defaults to 'int' in declaration of 'RZV2H_CPG_PLL_DSI_LIMITS' [-Wimplicit-int]
   drivers/clk/renesas/r9a09g056-cpg.c:130:1: error: parameter names (without types) in function declaration [-Wdeclaration-missing-parameter-type]
   drivers/clk/renesas/r9a09g056-cpg.c:153:9: error: implicit declaration of function 'DEF_PLLDSI'; did you mean 'DEF_PLL'? [-Wimplicit-function-declaration]
     153 |         DEF_PLLDSI(".plldsi", CLK_PLLDSI, CLK_QEXTAL, PLLDSI),
         |         ^~~~~~~~~~
         |         DEF_PLL
   drivers/clk/renesas/r9a09g056-cpg.c:131:25: error: implicit declaration of function 'PLL_PACK_LIMITS' [-Wimplicit-function-declaration]
     131 | #define PLLDSI          PLL_PACK_LIMITS(0xc0, 1, 0, &rzv2n_cpg_pll_dsi_limits)
         |                         ^~~~~~~~~~~~~~~
   drivers/clk/renesas/r9a09g056-cpg.c:153:55: note: in expansion of macro 'PLLDSI'
     153 |         DEF_PLLDSI(".plldsi", CLK_PLLDSI, CLK_QEXTAL, PLLDSI),
         |                                                       ^~~~~~
   drivers/clk/renesas/r9a09g056-cpg.c:131:54: error: 'rzv2n_cpg_pll_dsi_limits' undeclared here (not in a function)
     131 | #define PLLDSI          PLL_PACK_LIMITS(0xc0, 1, 0, &rzv2n_cpg_pll_dsi_limits)
         |                                                      ^~~~~~~~~~~~~~~~~~~~~~~~
   drivers/clk/renesas/r9a09g056-cpg.c:153:55: note: in expansion of macro 'PLLDSI'
     153 |         DEF_PLLDSI(".plldsi", CLK_PLLDSI, CLK_QEXTAL, PLLDSI),
         |                                                       ^~~~~~
   In file included from drivers/clk/renesas/r9a09g056-cpg.c:16:
   drivers/clk/renesas/r9a09g056-cpg.c:189:19: error: 'CSDIV0_DIVCTL2' undeclared here (not in a function); did you mean 'CSDIV0_DIVCTL1'?
     189 |                   CSDIV0_DIVCTL2, dtable_16_128),
         |                   ^~~~~~~~~~~~~~
   drivers/clk/renesas/rzv2h-cpg.h:196:45: note: in definition of macro 'DEF_TYPE'
     196 |         { .name = _name, .id = _id, .type = _type }
         |                                             ^~~~~
   drivers/clk/renesas/rzv2h-cpg.h:215:9: note: in expansion of macro 'DEF_DDIV'
     215 |         DEF_DDIV(_name, _id, _parent, _ddiv_packed, _dtable)
         |         ^~~~~~~~
   drivers/clk/renesas/r9a09g056-cpg.c:188:9: note: in expansion of macro 'DEF_CSDIV'
     188 |         DEF_CSDIV(".plleth_lpclk_gear", CLK_PLLETH_LPCLK_GEAR, CLK_CDIV4_PLLETH_LPCLK,
         |         ^~~~~~~~~
   drivers/clk/renesas/r9a09g056-cpg.c:191:9: error: implicit declaration of function 'DEF_PLLDSI_DIV' [-Wimplicit-function-declaration]
     191 |         DEF_PLLDSI_DIV(".plldsi_gear", CLK_PLLDSI_GEAR, CLK_PLLDSI,
         |         ^~~~~~~~~~~~~~
   drivers/clk/renesas/r9a09g056-cpg.c:192:24: error: 'CSDIV1_DIVCTL2' undeclared here (not in a function); did you mean 'CDDIV1_DIVCTL2'?
     192 |                        CSDIV1_DIVCTL2, dtable_2_32),
         |                        ^~~~~~~~~~~~~~
         |                        CDDIV1_DIVCTL2


vim +130 drivers/clk/renesas/r9a09g056-cpg.c

   129	
 > 130	RZV2H_CPG_PLL_DSI_LIMITS(rzv2n_cpg_pll_dsi_limits);
   131	#define PLLDSI		PLL_PACK_LIMITS(0xc0, 1, 0, &rzv2n_cpg_pll_dsi_limits)
   132	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

