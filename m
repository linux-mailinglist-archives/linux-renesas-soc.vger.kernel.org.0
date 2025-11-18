Return-Path: <linux-renesas-soc+bounces-24707-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FC39C68C54
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 18 Nov 2025 11:18:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 6F73B38275A
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 18 Nov 2025 10:14:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CFCBA33BBBB;
	Tue, 18 Nov 2025 10:12:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BsG9HbMA"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDD8133769B;
	Tue, 18 Nov 2025 10:12:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763460738; cv=none; b=IIA9M7K8QKEBLPJoGp72/V9CzuWkBq6jO/ldjrkLM61WEKrT0xDP4djJ8fZk7QyQwCeDhNvRdzALgaMTZSLRdoo9jfbnpNGPBv+HYiv0/cxlG6GqxxHAj8g9ZgHauFmSvAkYhc//KKXHbCl862+253U01l/1R3oOBpqjyfTNZio=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763460738; c=relaxed/simple;
	bh=IBSZEQCxwFwFXWr1+hAKJwWSDWg2HomVHnDyZXuAT3U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=og6qIGFjtpHDJZluYmjvEN9A4xWHbEea0W3U+Abp7LmkOqsZzdWpGWuoEdtyIJw8TYwze9l/7PQZzfy61zxkXupD4I2y4VpSEC1JFCBCkvVLB6oHiueNF94YAY2BbxeUXPFcz4dtI48U6207Y0X6OlmAUKkfaxcK/RV0ttjfPc8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BsG9HbMA; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1763460736; x=1794996736;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=IBSZEQCxwFwFXWr1+hAKJwWSDWg2HomVHnDyZXuAT3U=;
  b=BsG9HbMAut6IAfVlW4RWgdqxCrcCZZ+gSQorNJWMWHzDEdfvLxfXRvpY
   2eFqLsDzU3jNIW3ppP0o7FK4GROyJ9kMYcw3LQUN3R0vfcV2kyGcN6BIu
   wtRBvumj2Nq0o/6ND1Cgv645O4l1u6uPHWP2XEMlP4T7w0V8/EPpvRVsj
   IcfivTeMbkcYgIVuCQ54Gf2ETiAr9KU2WFWaL8cQdocCHWnjr7ZWVg4Sy
   yXUZcmiYlFGqNTkuyGlBXqMcoP6Y04S/yvQJLyBFZpfCdFVoX44MCFe+D
   h3pZu3E6CopWEForl8FKV10S6bHX4tE1t2WJWfjRZWIiTzAndDkcFGWVZ
   Q==;
X-CSE-ConnectionGUID: KooMahA3Rma8Q5z1eWuk7w==
X-CSE-MsgGUID: tDS645lTQW++6CUHzmIjqQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11616"; a="65358567"
X-IronPort-AV: E=Sophos;i="6.19,314,1754982000"; 
   d="scan'208";a="65358567"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Nov 2025 02:12:15 -0800
X-CSE-ConnectionGUID: F6UZBT5HTReRGyv7xUYBHw==
X-CSE-MsgGUID: euH+GglzSWqKgqcJ6wQbNA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,314,1754982000"; 
   d="scan'208";a="191157957"
Received: from lkp-server01.sh.intel.com (HELO adf6d29aa8d9) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 18 Nov 2025 02:12:12 -0800
Received: from kbuild by adf6d29aa8d9 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vLIgz-0001bK-2i;
	Tue, 18 Nov 2025 10:12:09 +0000
Date: Tue, 18 Nov 2025 18:11:59 +0800
From: kernel test robot <lkp@intel.com>
To: Prabhakar <prabhakar.csengg@gmail.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: Re: [PATCH v3] clk: renesas: r9a09g077: Add xSPI core and module
 clocks
Message-ID: <202511181733.mdvppqVT-lkp@intel.com>
References: <20251117205627.39376-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251117205627.39376-1-prabhakar.mahadev-lad.rj@bp.renesas.com>

Hi Prabhakar,

kernel test robot noticed the following build errors:

[auto build test ERROR on geert-renesas-drivers/renesas-clk]
[also build test ERROR on next-20251118]
[cannot apply to clk/clk-next linus/master v6.18-rc6]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Prabhakar/clk-renesas-r9a09g077-Add-xSPI-core-and-module-clocks/20251118-045831
base:   https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git renesas-clk
patch link:    https://lore.kernel.org/r/20251117205627.39376-1-prabhakar.mahadev-lad.rj%40bp.renesas.com
patch subject: [PATCH v3] clk: renesas: r9a09g077: Add xSPI core and module clocks
config: riscv-randconfig-002-20251118 (https://download.01.org/0day-ci/archive/20251118/202511181733.mdvppqVT-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 0bba1e76581bad04e7d7f09f5115ae5e2989e0d9)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251118/202511181733.mdvppqVT-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511181733.mdvppqVT-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/clk/renesas/r9a09g077-cpg.c:88:21: error: use of undeclared identifier 'R9A09G077_XSPI_CLK1'
      88 |         LAST_DT_CORE_CLK = R9A09G077_XSPI_CLK1,
         |                            ^~~~~~~~~~~~~~~~~~~
>> drivers/clk/renesas/r9a09g077-cpg.c:230:32: error: use of undeclared identifier 'R9A09G077_XSPI_CLK0'
     230 |         DEF_DIV_FSELXSPI("XSPI_CLK0", R9A09G077_XSPI_CLK0, CLK_DIVSELXSPI0_SCKCR,
         |                                       ^~~~~~~~~~~~~~~~~~~
   drivers/clk/renesas/r9a09g077-cpg.c:232:32: error: use of undeclared identifier 'R9A09G077_XSPI_CLK1'
     232 |         DEF_DIV_FSELXSPI("XSPI_CLK1", R9A09G077_XSPI_CLK1, CLK_DIVSELXSPI1_SCKCR,
         |                                       ^~~~~~~~~~~~~~~~~~~
>> drivers/clk/renesas/r9a09g077-cpg.c:496:19: error: invalid application of 'sizeof' to an incomplete type 'const struct cpg_core_clk[]'
     496 |         .num_core_clks = ARRAY_SIZE(r9a09g077_core_clks),
         |                          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/array_size.h:11:32: note: expanded from macro 'ARRAY_SIZE'
      11 | #define ARRAY_SIZE(arr) (sizeof(arr) / sizeof((arr)[0]) + __must_be_array(arr))
         |                                ^~~~~
   4 errors generated.

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for ARCH_HAS_ELF_CORE_EFLAGS
   Depends on [n]: BINFMT_ELF [=y] && ELF_CORE [=n]
   Selected by [y]:
   - RISCV [=y]


vim +/R9A09G077_XSPI_CLK1 +88 drivers/clk/renesas/r9a09g077-cpg.c

    74	
    75	#define DEF_DIV(_name, _id, _parent, _conf, _dtable) \
    76		DEF_TYPE(_name, _id, CLK_TYPE_RZT2H_DIV, .conf = _conf, \
    77			 .parent = _parent, .dtable = _dtable, .flag = 0)
    78	#define DEF_MUX(_name, _id, _conf, _parent_names, _num_parents, _mux_flags) \
    79		DEF_TYPE(_name, _id, CLK_TYPE_RZT2H_MUX, .conf = _conf, \
    80			 .parent_names = _parent_names, .num_parents = _num_parents, \
    81			 .flag = 0, .mux_flags = _mux_flags)
    82	#define DEF_DIV_FSELXSPI(_name, _id, _parent, _conf, _dtable) \
    83		DEF_TYPE(_name, _id, CLK_TYPE_RZT2H_FSELXSPI, .conf = _conf, \
    84			 .parent = _parent, .dtable = _dtable, .flag = 0)
    85	
    86	enum clk_ids {
    87		/* Core Clock Outputs exported to DT */
  > 88		LAST_DT_CORE_CLK = R9A09G077_XSPI_CLK1,
    89	
    90		/* External Input Clocks */
    91		CLK_EXTAL,
    92	
    93		/* Internal Core Clocks */
    94		CLK_LOCO,
    95		CLK_PLL0,
    96		CLK_PLL1,
    97		CLK_PLL2,
    98		CLK_PLL4,
    99		CLK_SEL_CLK_PLL0,
   100		CLK_SEL_CLK_PLL1,
   101		CLK_SEL_CLK_PLL2,
   102		CLK_SEL_CLK_PLL4,
   103		CLK_PLL4D1,
   104		CLK_PLL4D1_DIV3,
   105		CLK_PLL4D1_DIV4,
   106		CLK_SCI0ASYNC,
   107		CLK_SCI1ASYNC,
   108		CLK_SCI2ASYNC,
   109		CLK_SCI3ASYNC,
   110		CLK_SCI4ASYNC,
   111		CLK_SCI5ASYNC,
   112		CLK_SPI0ASYNC,
   113		CLK_SPI1ASYNC,
   114		CLK_SPI2ASYNC,
   115		CLK_SPI3ASYNC,
   116		CLK_DIVSELXSPI0_SCKCR,
   117		CLK_DIVSELXSPI1_SCKCR,
   118	
   119		/* Module Clocks */
   120		MOD_CLK_BASE,
   121	};
   122	
   123	static const struct clk_div_table dtable_1_2[] = {
   124		{0, 2},
   125		{1, 1},
   126		{0, 0},
   127	};
   128	
   129	static const struct clk_div_table dtable_6_8_16_32_64[] = {
   130		{6, 64},
   131		{5, 32},
   132		{4, 16},
   133		{3, 8},
   134		{2, 6},
   135		{0, 0},
   136	};
   137	
   138	static const struct clk_div_table dtable_24_25_30_32[] = {
   139		{0, 32},
   140		{1, 30},
   141		{2, 25},
   142		{3, 24},
   143		{0, 0},
   144	};
   145	
   146	/* Mux clock tables */
   147	
   148	static const char * const sel_clk_pll0[] = { ".loco", ".pll0" };
   149	static const char * const sel_clk_pll1[] = { ".loco", ".pll1" };
   150	static const char * const sel_clk_pll2[] = { ".loco", ".pll2" };
   151	static const char * const sel_clk_pll4[] = { ".loco", ".pll4" };
   152	static const char * const sel_clk_pll4d1_div3_div4[] = { ".pll4d1_div3", ".pll4d1_div4" };
   153	
   154	static const struct cpg_core_clk r9a09g077_core_clks[] __initconst = {
   155		/* External Clock Inputs */
   156		DEF_INPUT("extal", CLK_EXTAL),
   157	
   158		/* Internal Core Clocks */
   159		DEF_RATE(".loco", CLK_LOCO, 1000 * 1000),
   160		DEF_FIXED(".pll0", CLK_PLL0, CLK_EXTAL, 1, 48),
   161		DEF_FIXED(".pll1", CLK_PLL1, CLK_EXTAL, 1, 40),
   162		DEF_FIXED(".pll2", CLK_PLL2, CLK_EXTAL, 1, 32),
   163		DEF_FIXED(".pll4", CLK_PLL4, CLK_EXTAL, 1, 96),
   164	
   165		DEF_MUX(".sel_clk_pll0", CLK_SEL_CLK_PLL0, SEL_PLL,
   166			sel_clk_pll0, ARRAY_SIZE(sel_clk_pll0), CLK_MUX_READ_ONLY),
   167		DEF_MUX(".sel_clk_pll1", CLK_SEL_CLK_PLL1, SEL_PLL,
   168			sel_clk_pll1, ARRAY_SIZE(sel_clk_pll1), CLK_MUX_READ_ONLY),
   169		DEF_MUX(".sel_clk_pll2", CLK_SEL_CLK_PLL2, SEL_PLL,
   170			sel_clk_pll2, ARRAY_SIZE(sel_clk_pll2), CLK_MUX_READ_ONLY),
   171		DEF_MUX(".sel_clk_pll4", CLK_SEL_CLK_PLL4, SEL_PLL,
   172			sel_clk_pll4, ARRAY_SIZE(sel_clk_pll4), CLK_MUX_READ_ONLY),
   173	
   174		DEF_FIXED(".pll4d1", CLK_PLL4D1, CLK_SEL_CLK_PLL4, 1, 1),
   175		DEF_FIXED(".pll4d1_div3", CLK_PLL4D1_DIV3, CLK_PLL4D1, 3, 1),
   176		DEF_FIXED(".pll4d1_div4", CLK_PLL4D1_DIV4, CLK_PLL4D1, 4, 1),
   177		DEF_DIV(".sci0async", CLK_SCI0ASYNC, CLK_PLL4D1, DIVSCI0ASYNC,
   178			dtable_24_25_30_32),
   179		DEF_DIV(".sci1async", CLK_SCI1ASYNC, CLK_PLL4D1, DIVSCI1ASYNC,
   180			dtable_24_25_30_32),
   181		DEF_DIV(".sci2async", CLK_SCI2ASYNC, CLK_PLL4D1, DIVSCI2ASYNC,
   182			dtable_24_25_30_32),
   183		DEF_DIV(".sci3async", CLK_SCI3ASYNC, CLK_PLL4D1, DIVSCI3ASYNC,
   184			dtable_24_25_30_32),
   185		DEF_DIV(".sci4async", CLK_SCI4ASYNC, CLK_PLL4D1, DIVSCI4ASYNC,
   186			dtable_24_25_30_32),
   187		DEF_DIV(".sci5async", CLK_SCI5ASYNC, CLK_PLL4D1, DIVSCI5ASYNC,
   188			dtable_24_25_30_32),
   189	
   190		DEF_DIV(".spi0async", CLK_SPI0ASYNC, CLK_PLL4D1, DIVSPI0ASYNC,
   191			dtable_24_25_30_32),
   192		DEF_DIV(".spi1async", CLK_SPI1ASYNC, CLK_PLL4D1, DIVSPI1ASYNC,
   193			dtable_24_25_30_32),
   194		DEF_DIV(".spi2async", CLK_SPI2ASYNC, CLK_PLL4D1, DIVSPI2ASYNC,
   195			dtable_24_25_30_32),
   196		DEF_DIV(".spi3async", CLK_SPI3ASYNC, CLK_PLL4D1, DIVSPI3ASYNC,
   197			dtable_24_25_30_32),
   198	
   199		DEF_MUX(".divselxspi0", CLK_DIVSELXSPI0_SCKCR, DIVSEL_XSPI0,
   200			sel_clk_pll4d1_div3_div4,
   201			ARRAY_SIZE(sel_clk_pll4d1_div3_div4), 0),
   202		DEF_MUX(".divselxspi1", CLK_DIVSELXSPI1_SCKCR, DIVSEL_XSPI1,
   203			sel_clk_pll4d1_div3_div4,
   204			ARRAY_SIZE(sel_clk_pll4d1_div3_div4), 0),
   205	
   206		/* Core output clk */
   207		DEF_DIV("CA55C0", R9A09G077_CLK_CA55C0, CLK_SEL_CLK_PLL0, DIVCA55C0,
   208			dtable_1_2),
   209		DEF_DIV("CA55C1", R9A09G077_CLK_CA55C1, CLK_SEL_CLK_PLL0, DIVCA55C1,
   210			dtable_1_2),
   211		DEF_DIV("CA55C2", R9A09G077_CLK_CA55C2, CLK_SEL_CLK_PLL0, DIVCA55C2,
   212			dtable_1_2),
   213		DEF_DIV("CA55C3", R9A09G077_CLK_CA55C3, CLK_SEL_CLK_PLL0, DIVCA55C3,
   214			dtable_1_2),
   215		DEF_DIV("CA55S", R9A09G077_CLK_CA55S, CLK_SEL_CLK_PLL0, DIVCA55S,
   216			dtable_1_2),
   217		DEF_FIXED("PCLKGPTL", R9A09G077_CLK_PCLKGPTL, CLK_SEL_CLK_PLL1, 2, 1),
   218		DEF_FIXED("PCLKH", R9A09G077_CLK_PCLKH, CLK_SEL_CLK_PLL1, 4, 1),
   219		DEF_FIXED("PCLKM", R9A09G077_CLK_PCLKM, CLK_SEL_CLK_PLL1, 8, 1),
   220		DEF_FIXED("PCLKL", R9A09G077_CLK_PCLKL, CLK_SEL_CLK_PLL1, 16, 1),
   221		DEF_FIXED("PCLKAH", R9A09G077_CLK_PCLKAH, CLK_PLL4D1, 6, 1),
   222		DEF_FIXED("PCLKAM", R9A09G077_CLK_PCLKAM, CLK_PLL4D1, 12, 1),
   223		DEF_FIXED("SDHI_CLKHS", R9A09G077_SDHI_CLKHS, CLK_SEL_CLK_PLL2, 1, 1),
   224		DEF_FIXED("USB_CLK", R9A09G077_USB_CLK, CLK_PLL4D1, 48, 1),
   225		DEF_FIXED("ETCLKA", R9A09G077_ETCLKA, CLK_SEL_CLK_PLL1, 5, 1),
   226		DEF_FIXED("ETCLKB", R9A09G077_ETCLKB, CLK_SEL_CLK_PLL1, 8, 1),
   227		DEF_FIXED("ETCLKC", R9A09G077_ETCLKC, CLK_SEL_CLK_PLL1, 10, 1),
   228		DEF_FIXED("ETCLKD", R9A09G077_ETCLKD, CLK_SEL_CLK_PLL1, 20, 1),
   229		DEF_FIXED("ETCLKE", R9A09G077_ETCLKE, CLK_SEL_CLK_PLL1, 40, 1),
 > 230		DEF_DIV_FSELXSPI("XSPI_CLK0", R9A09G077_XSPI_CLK0, CLK_DIVSELXSPI0_SCKCR,
   231				 FSELXSPI0, dtable_6_8_16_32_64),
   232		DEF_DIV_FSELXSPI("XSPI_CLK1", R9A09G077_XSPI_CLK1, CLK_DIVSELXSPI1_SCKCR,
   233				 FSELXSPI1, dtable_6_8_16_32_64),
   234	};
   235	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

