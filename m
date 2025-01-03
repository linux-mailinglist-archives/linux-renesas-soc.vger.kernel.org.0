Return-Path: <linux-renesas-soc+bounces-11801-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 40423A007FC
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  3 Jan 2025 11:44:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0C244163702
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  3 Jan 2025 10:43:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8C0241F943A;
	Fri,  3 Jan 2025 10:43:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dud4EzEy"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF7E01D0E28;
	Fri,  3 Jan 2025 10:43:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735901036; cv=none; b=TArzo4eTmhmaY0BzMhd3P0UYuPXVw4F42pV3ODo9J3P4K6aPSWLiiHt0ExaBlDig3DJYWlNIgL82gdo5x//3FrSfOVdH7g0YXcNx80/cLtdvNMdZNv3i1cOZ8fsU+pxpRkgLDqxJAsCwboUnbThjjppiB3bXaeQWB26kNkhk0Hw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735901036; c=relaxed/simple;
	bh=W3SI4+SkxaOgtn463kCITvEc1JhZYX42cBiZfA+WNLk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PXEHhmW64tbXb86N6Q7FRf/2UQ3auWjcmoZ5bsOhfclkAd6cipRPAxIiDEovBJYcakedxxfRBl9OUO/8R4dH/SpeRCaBxMaVqvu9VEzMVoiblP7xLUbHbksNFAm+yc/3tlEqQYMEZhlg43rIf6lUUrlTmQwNBN+lsYkEOkqRftA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dud4EzEy; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1735901034; x=1767437034;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=W3SI4+SkxaOgtn463kCITvEc1JhZYX42cBiZfA+WNLk=;
  b=dud4EzEy4vKWXa1l3aBp12FQ44NxNy66Pnj/sOH+sysa8GRtTQkuSv04
   6zncHKRPPSHDvbxaiYSnRy8jHFHKpvWbwz1wjFXsZHV/aFc9ZqofStbUY
   kGNUo+vyLb/fK3PUe9/VpU0JDlsOvlP232SgVJ46N/ZKnzjESL/0vQwet
   7qihYRF0hliFFhZFcPDKEj20dJucvUnejN3Xnx2L7vvWAaHdY1/dQuGGq
   tvrIgG6BuucQRD/LcnIwUf18Mm565c4KlvK52ACy4Huf8sBIp5yc2hdCH
   trTbhqgChMsuma38aB7kZqXuqAbpG1WbdNh+zE1wzPmPi6E577ll3jDTJ
   Q==;
X-CSE-ConnectionGUID: 3tUE+GchTCyTh61PhrAUpw==
X-CSE-MsgGUID: y0S44ZC1QvqQ1DPQx78sVQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11303"; a="53558905"
X-IronPort-AV: E=Sophos;i="6.12,286,1728975600"; 
   d="scan'208";a="53558905"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Jan 2025 02:43:53 -0800
X-CSE-ConnectionGUID: uoSEFevqQK2o8pw2gKBF9w==
X-CSE-MsgGUID: Czx/GJbiR5OfQNBF44/vmA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="132687356"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 03 Jan 2025 02:43:50 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tTf9f-0009bj-30;
	Fri, 03 Jan 2025 10:43:47 +0000
Date: Fri, 3 Jan 2025 18:42:50 +0800
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
Subject: Re: [PATCH v3 3/6] clk: renesas: rzv2h: Simplify BUS_MSTOP macros
 and field extraction
Message-ID: <202501031820.KwL9vVF2-lkp@intel.com>
References: <20250102181839.352599-4-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250102181839.352599-4-prabhakar.mahadev-lad.rj@bp.renesas.com>

Hi Prabhakar,

kernel test robot noticed the following build errors:

[auto build test ERROR on geert-renesas-drivers/renesas-clk]
[also build test ERROR on next-20241220]
[cannot apply to linus/master v6.13-rc5]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Prabhakar/clk-renesas-rzv2h-Fix-use-after-free-in-MSTOP-refcount-handling/20250103-022238
base:   https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git renesas-clk
patch link:    https://lore.kernel.org/r/20250102181839.352599-4-prabhakar.mahadev-lad.rj%40bp.renesas.com
patch subject: [PATCH v3 3/6] clk: renesas: rzv2h: Simplify BUS_MSTOP macros and field extraction
config: powerpc64-randconfig-001-20250103 (https://download.01.org/0day-ci/archive/20250103/202501031820.KwL9vVF2-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250103/202501031820.KwL9vVF2-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501031820.KwL9vVF2-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/clk/renesas/r9a09g057-cpg.c:121:7: error: call to undeclared function 'FIELD_PREP_CONST'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     121 |                                                 BUS_MSTOP(5, BIT(10))),
         |                                                 ^
   drivers/clk/renesas/rzv2h-cpg.h:51:31: note: expanded from macro 'BUS_MSTOP'
      51 | #define BUS_MSTOP(idx, mask)    (FIELD_PREP_CONST(BUS_MSTOP_IDX_MASK, (idx)) | \
         |                                  ^
>> drivers/clk/renesas/r9a09g057-cpg.c:120:2: error: initializer element is not a compile-time constant
     120 |         DEF_MOD("gtm_0_pclk",                   CLK_PLLCM33_DIV16, 4, 3, 2, 3,
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     121 |                                                 BUS_MSTOP(5, BIT(10))),
         |                                                 ~~~~~~~~~~~~~~~~~~~~~~
   drivers/clk/renesas/rzv2h-cpg.h:148:2: note: expanded from macro 'DEF_MOD'
     148 |         DEF_MOD_BASE(_name, _mstop, _parent, false, false, _onindex, _onbit, _monindex, _monbit)
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/clk/renesas/rzv2h-cpg.h:137:17: note: expanded from macro 'DEF_MOD_BASE'
     137 |                 .mstop_data = (_mstop), \
         |                               ^~~~~~~~
   2 errors generated.


vim +/FIELD_PREP_CONST +121 drivers/clk/renesas/r9a09g057-cpg.c

36932cbc3e6cc9 Lad Prabhakar 2024-07-29  116  
36932cbc3e6cc9 Lad Prabhakar 2024-07-29  117  static const struct rzv2h_mod_clk r9a09g057_mod_clks[] __initconst = {
7bd4cb3d6b7c43 Biju Das      2024-12-13  118  	DEF_MOD_CRITICAL("icu_0_pclk_i",	CLK_PLLCM33_DIV16, 0, 5, 0, 5,
7bd4cb3d6b7c43 Biju Das      2024-12-13  119  						BUS_MSTOP_NONE),
7bd4cb3d6b7c43 Biju Das      2024-12-13 @120  	DEF_MOD("gtm_0_pclk",			CLK_PLLCM33_DIV16, 4, 3, 2, 3,
7bd4cb3d6b7c43 Biju Das      2024-12-13 @121  						BUS_MSTOP(5, BIT(10))),
7bd4cb3d6b7c43 Biju Das      2024-12-13  122  	DEF_MOD("gtm_1_pclk",			CLK_PLLCM33_DIV16, 4, 4, 2, 4,
7bd4cb3d6b7c43 Biju Das      2024-12-13  123  						BUS_MSTOP(5, BIT(11))),
7bd4cb3d6b7c43 Biju Das      2024-12-13  124  	DEF_MOD("gtm_2_pclk",			CLK_PLLCLN_DIV16, 4, 5, 2, 5,
7bd4cb3d6b7c43 Biju Das      2024-12-13  125  						BUS_MSTOP(2, BIT(13))),
7bd4cb3d6b7c43 Biju Das      2024-12-13  126  	DEF_MOD("gtm_3_pclk",			CLK_PLLCLN_DIV16, 4, 6, 2, 6,
7bd4cb3d6b7c43 Biju Das      2024-12-13  127  						BUS_MSTOP(2, BIT(14))),
7bd4cb3d6b7c43 Biju Das      2024-12-13  128  	DEF_MOD("gtm_4_pclk",			CLK_PLLCLN_DIV16, 4, 7, 2, 7,
7bd4cb3d6b7c43 Biju Das      2024-12-13  129  						BUS_MSTOP(11, BIT(13))),
7bd4cb3d6b7c43 Biju Das      2024-12-13  130  	DEF_MOD("gtm_5_pclk",			CLK_PLLCLN_DIV16, 4, 8, 2, 8,
7bd4cb3d6b7c43 Biju Das      2024-12-13  131  						BUS_MSTOP(11, BIT(14))),
7bd4cb3d6b7c43 Biju Das      2024-12-13  132  	DEF_MOD("gtm_6_pclk",			CLK_PLLCLN_DIV16, 4, 9, 2, 9,
7bd4cb3d6b7c43 Biju Das      2024-12-13  133  						BUS_MSTOP(11, BIT(15))),
7bd4cb3d6b7c43 Biju Das      2024-12-13  134  	DEF_MOD("gtm_7_pclk",			CLK_PLLCLN_DIV16, 4, 10, 2, 10,
7bd4cb3d6b7c43 Biju Das      2024-12-13  135  						BUS_MSTOP(12, BIT(0))),
7bd4cb3d6b7c43 Biju Das      2024-12-13  136  	DEF_MOD("wdt_0_clkp",			CLK_PLLCM33_DIV16, 4, 11, 2, 11,
7bd4cb3d6b7c43 Biju Das      2024-12-13  137  						BUS_MSTOP(3, BIT(10))),
7bd4cb3d6b7c43 Biju Das      2024-12-13  138  	DEF_MOD("wdt_0_clk_loco",		CLK_QEXTAL, 4, 12, 2, 12,
7bd4cb3d6b7c43 Biju Das      2024-12-13  139  						BUS_MSTOP(3, BIT(10))),
7bd4cb3d6b7c43 Biju Das      2024-12-13  140  	DEF_MOD("wdt_1_clkp",			CLK_PLLCLN_DIV16, 4, 13, 2, 13,
7bd4cb3d6b7c43 Biju Das      2024-12-13  141  						BUS_MSTOP(1, BIT(0))),
7bd4cb3d6b7c43 Biju Das      2024-12-13  142  	DEF_MOD("wdt_1_clk_loco",		CLK_QEXTAL, 4, 14, 2, 14,
7bd4cb3d6b7c43 Biju Das      2024-12-13  143  						BUS_MSTOP(1, BIT(0))),
7bd4cb3d6b7c43 Biju Das      2024-12-13  144  	DEF_MOD("wdt_2_clkp",			CLK_PLLCLN_DIV16, 4, 15, 2, 15,
7bd4cb3d6b7c43 Biju Das      2024-12-13  145  						BUS_MSTOP(5, BIT(12))),
7bd4cb3d6b7c43 Biju Das      2024-12-13  146  	DEF_MOD("wdt_2_clk_loco",		CLK_QEXTAL, 5, 0, 2, 16,
7bd4cb3d6b7c43 Biju Das      2024-12-13  147  						BUS_MSTOP(5, BIT(12))),
7bd4cb3d6b7c43 Biju Das      2024-12-13  148  	DEF_MOD("wdt_3_clkp",			CLK_PLLCLN_DIV16, 5, 1, 2, 17,
7bd4cb3d6b7c43 Biju Das      2024-12-13  149  						BUS_MSTOP(5, BIT(13))),
7bd4cb3d6b7c43 Biju Das      2024-12-13  150  	DEF_MOD("wdt_3_clk_loco",		CLK_QEXTAL, 5, 2, 2, 18,
7bd4cb3d6b7c43 Biju Das      2024-12-13  151  						BUS_MSTOP(5, BIT(13))),
7bd4cb3d6b7c43 Biju Das      2024-12-13  152  	DEF_MOD("scif_0_clk_pck",		CLK_PLLCM33_DIV16, 8, 15, 4, 15,
7bd4cb3d6b7c43 Biju Das      2024-12-13  153  						BUS_MSTOP(3, BIT(14))),
7bd4cb3d6b7c43 Biju Das      2024-12-13  154  	DEF_MOD("riic_8_ckm",			CLK_PLLCM33_DIV16, 9, 3, 4, 19,
7bd4cb3d6b7c43 Biju Das      2024-12-13  155  						BUS_MSTOP(3, BIT(13))),
7bd4cb3d6b7c43 Biju Das      2024-12-13  156  	DEF_MOD("riic_0_ckm",			CLK_PLLCLN_DIV16, 9, 4, 4, 20,
7bd4cb3d6b7c43 Biju Das      2024-12-13  157  						BUS_MSTOP(1, BIT(1))),
7bd4cb3d6b7c43 Biju Das      2024-12-13  158  	DEF_MOD("riic_1_ckm",			CLK_PLLCLN_DIV16, 9, 5, 4, 21,
7bd4cb3d6b7c43 Biju Das      2024-12-13  159  						BUS_MSTOP(1, BIT(2))),
7bd4cb3d6b7c43 Biju Das      2024-12-13  160  	DEF_MOD("riic_2_ckm",			CLK_PLLCLN_DIV16, 9, 6, 4, 22,
7bd4cb3d6b7c43 Biju Das      2024-12-13  161  						BUS_MSTOP(1, BIT(3))),
7bd4cb3d6b7c43 Biju Das      2024-12-13  162  	DEF_MOD("riic_3_ckm",			CLK_PLLCLN_DIV16, 9, 7, 4, 23,
7bd4cb3d6b7c43 Biju Das      2024-12-13  163  						BUS_MSTOP(1, BIT(4))),
7bd4cb3d6b7c43 Biju Das      2024-12-13  164  	DEF_MOD("riic_4_ckm",			CLK_PLLCLN_DIV16, 9, 8, 4, 24,
7bd4cb3d6b7c43 Biju Das      2024-12-13  165  						BUS_MSTOP(1, BIT(5))),
7bd4cb3d6b7c43 Biju Das      2024-12-13  166  	DEF_MOD("riic_5_ckm",			CLK_PLLCLN_DIV16, 9, 9, 4, 25,
7bd4cb3d6b7c43 Biju Das      2024-12-13  167  						BUS_MSTOP(1, BIT(6))),
7bd4cb3d6b7c43 Biju Das      2024-12-13  168  	DEF_MOD("riic_6_ckm",			CLK_PLLCLN_DIV16, 9, 10, 4, 26,
7bd4cb3d6b7c43 Biju Das      2024-12-13  169  						BUS_MSTOP(1, BIT(7))),
7bd4cb3d6b7c43 Biju Das      2024-12-13  170  	DEF_MOD("riic_7_ckm",			CLK_PLLCLN_DIV16, 9, 11, 4, 27,
7bd4cb3d6b7c43 Biju Das      2024-12-13  171  						BUS_MSTOP(1, BIT(8))),
7bd4cb3d6b7c43 Biju Das      2024-12-13  172  	DEF_MOD("sdhi_0_imclk",			CLK_PLLCLN_DIV8, 10, 3, 5, 3,
7bd4cb3d6b7c43 Biju Das      2024-12-13  173  						BUS_MSTOP(8, BIT(2))),
7bd4cb3d6b7c43 Biju Das      2024-12-13  174  	DEF_MOD("sdhi_0_imclk2",		CLK_PLLCLN_DIV8, 10, 4, 5, 4,
7bd4cb3d6b7c43 Biju Das      2024-12-13  175  						BUS_MSTOP(8, BIT(2))),
7bd4cb3d6b7c43 Biju Das      2024-12-13  176  	DEF_MOD("sdhi_0_clk_hs",		CLK_PLLCLN_DIV2, 10, 5, 5, 5,
7bd4cb3d6b7c43 Biju Das      2024-12-13  177  						BUS_MSTOP(8, BIT(2))),
7bd4cb3d6b7c43 Biju Das      2024-12-13  178  	DEF_MOD("sdhi_0_aclk",			CLK_PLLDTY_ACPU_DIV4, 10, 6, 5, 6,
7bd4cb3d6b7c43 Biju Das      2024-12-13  179  						BUS_MSTOP(8, BIT(2))),
7bd4cb3d6b7c43 Biju Das      2024-12-13  180  	DEF_MOD("sdhi_1_imclk",			CLK_PLLCLN_DIV8, 10, 7, 5, 7,
7bd4cb3d6b7c43 Biju Das      2024-12-13  181  						BUS_MSTOP(8, BIT(3))),
7bd4cb3d6b7c43 Biju Das      2024-12-13  182  	DEF_MOD("sdhi_1_imclk2",		CLK_PLLCLN_DIV8, 10, 8, 5, 8,
7bd4cb3d6b7c43 Biju Das      2024-12-13  183  						BUS_MSTOP(8, BIT(3))),
7bd4cb3d6b7c43 Biju Das      2024-12-13  184  	DEF_MOD("sdhi_1_clk_hs",		CLK_PLLCLN_DIV2, 10, 9, 5, 9,
7bd4cb3d6b7c43 Biju Das      2024-12-13  185  						BUS_MSTOP(8, BIT(3))),
7bd4cb3d6b7c43 Biju Das      2024-12-13  186  	DEF_MOD("sdhi_1_aclk",			CLK_PLLDTY_ACPU_DIV4, 10, 10, 5, 10,
7bd4cb3d6b7c43 Biju Das      2024-12-13  187  						BUS_MSTOP(8, BIT(3))),
7bd4cb3d6b7c43 Biju Das      2024-12-13  188  	DEF_MOD("sdhi_2_imclk",			CLK_PLLCLN_DIV8, 10, 11, 5, 11,
7bd4cb3d6b7c43 Biju Das      2024-12-13  189  						BUS_MSTOP(8, BIT(4))),
7bd4cb3d6b7c43 Biju Das      2024-12-13  190  	DEF_MOD("sdhi_2_imclk2",		CLK_PLLCLN_DIV8, 10, 12, 5, 12,
7bd4cb3d6b7c43 Biju Das      2024-12-13  191  						BUS_MSTOP(8, BIT(4))),
7bd4cb3d6b7c43 Biju Das      2024-12-13  192  	DEF_MOD("sdhi_2_clk_hs",		CLK_PLLCLN_DIV2, 10, 13, 5, 13,
7bd4cb3d6b7c43 Biju Das      2024-12-13  193  						BUS_MSTOP(8, BIT(4))),
7bd4cb3d6b7c43 Biju Das      2024-12-13  194  	DEF_MOD("sdhi_2_aclk",			CLK_PLLDTY_ACPU_DIV4, 10, 14, 5, 14,
7bd4cb3d6b7c43 Biju Das      2024-12-13  195  						BUS_MSTOP(8, BIT(4))),
7bd4cb3d6b7c43 Biju Das      2024-12-13  196  	DEF_MOD("cru_0_aclk",			CLK_PLLDTY_ACPU_DIV2, 13, 2, 6, 18,
7bd4cb3d6b7c43 Biju Das      2024-12-13  197  						BUS_MSTOP(9, BIT(4))),
7bd4cb3d6b7c43 Biju Das      2024-12-13  198  	DEF_MOD_NO_PM("cru_0_vclk",		CLK_PLLVDO_CRU0, 13, 3, 6, 19,
7bd4cb3d6b7c43 Biju Das      2024-12-13  199  						BUS_MSTOP(9, BIT(4))),
7bd4cb3d6b7c43 Biju Das      2024-12-13  200  	DEF_MOD("cru_0_pclk",			CLK_PLLDTY_DIV16, 13, 4, 6, 20,
7bd4cb3d6b7c43 Biju Das      2024-12-13  201  						BUS_MSTOP(9, BIT(4))),
7bd4cb3d6b7c43 Biju Das      2024-12-13  202  	DEF_MOD("cru_1_aclk",			CLK_PLLDTY_ACPU_DIV2, 13, 5, 6, 21,
7bd4cb3d6b7c43 Biju Das      2024-12-13  203  						BUS_MSTOP(9, BIT(5))),
7bd4cb3d6b7c43 Biju Das      2024-12-13  204  	DEF_MOD_NO_PM("cru_1_vclk",		CLK_PLLVDO_CRU1, 13, 6, 6, 22,
7bd4cb3d6b7c43 Biju Das      2024-12-13  205  						BUS_MSTOP(9, BIT(5))),
7bd4cb3d6b7c43 Biju Das      2024-12-13  206  	DEF_MOD("cru_1_pclk",			CLK_PLLDTY_DIV16, 13, 7, 6, 23,
7bd4cb3d6b7c43 Biju Das      2024-12-13  207  						BUS_MSTOP(9, BIT(5))),
7bd4cb3d6b7c43 Biju Das      2024-12-13  208  	DEF_MOD("cru_2_aclk",			CLK_PLLDTY_ACPU_DIV2, 13, 8, 6, 24,
7bd4cb3d6b7c43 Biju Das      2024-12-13  209  						BUS_MSTOP(9, BIT(6))),
7bd4cb3d6b7c43 Biju Das      2024-12-13  210  	DEF_MOD_NO_PM("cru_2_vclk",		CLK_PLLVDO_CRU2, 13, 9, 6, 25,
7bd4cb3d6b7c43 Biju Das      2024-12-13  211  						BUS_MSTOP(9, BIT(6))),
7bd4cb3d6b7c43 Biju Das      2024-12-13  212  	DEF_MOD("cru_2_pclk",			CLK_PLLDTY_DIV16, 13, 10, 6, 26,
7bd4cb3d6b7c43 Biju Das      2024-12-13  213  						BUS_MSTOP(9, BIT(6))),
7bd4cb3d6b7c43 Biju Das      2024-12-13  214  	DEF_MOD("cru_3_aclk",			CLK_PLLDTY_ACPU_DIV2, 13, 11, 6, 27,
7bd4cb3d6b7c43 Biju Das      2024-12-13  215  						BUS_MSTOP(9, BIT(7))),
7bd4cb3d6b7c43 Biju Das      2024-12-13  216  	DEF_MOD_NO_PM("cru_3_vclk",		CLK_PLLVDO_CRU3, 13, 12, 6, 28,
7bd4cb3d6b7c43 Biju Das      2024-12-13  217  						BUS_MSTOP(9, BIT(7))),
7bd4cb3d6b7c43 Biju Das      2024-12-13  218  	DEF_MOD("cru_3_pclk",			CLK_PLLDTY_DIV16, 13, 13, 6, 29,
7bd4cb3d6b7c43 Biju Das      2024-12-13  219  						BUS_MSTOP(9, BIT(7))),
36932cbc3e6cc9 Lad Prabhakar 2024-07-29  220  };
36932cbc3e6cc9 Lad Prabhakar 2024-07-29  221  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

