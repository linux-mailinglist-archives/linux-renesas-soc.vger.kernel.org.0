Return-Path: <linux-renesas-soc+bounces-11788-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 953CDA002AC
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  3 Jan 2025 03:21:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 73F1E3A2F70
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  3 Jan 2025 02:21:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1681314D444;
	Fri,  3 Jan 2025 02:21:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kzyl2sku"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B10028E8;
	Fri,  3 Jan 2025 02:21:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735870916; cv=none; b=GzK3Xojz9+u8Tto8e+zW4VCBKVnhRKo8TC5j2K5SD/aBmNi7H/D2got9Bd5cKLzfBSmvgEj9bw5bJ+ZgCZwUlTWs+AUmyvQH5ayzWoFog3UDMSEeEgvPEkhfh9RMt4tAF03aRj/3EfQi0kDsEnT4Ex2x7j+/1M4eQ+TtGymj3Sw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735870916; c=relaxed/simple;
	bh=bocTFWs0FIUVM8V7HwKMqKBsVEoTEnYuAJAgzbMct1U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LDRmEZorTr8MU3KaTVfuMgVoxAWWCBJYTlxkdoTQ5HWvsQQiu7I+FfC68SdXffvI+oAzLcNUX2lxIQzpdOQB7CbkRHzDJFcXBk66gPmzxoX88mN9lrPCLSRcPViK8BhLfQuNO7qJoktHsbxzRJZGqAExpNDF+uO/Aw9d2iyIaHM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kzyl2sku; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1735870914; x=1767406914;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=bocTFWs0FIUVM8V7HwKMqKBsVEoTEnYuAJAgzbMct1U=;
  b=kzyl2skuWzCtBo+uuXIAsDmiHlntq0/nxmyCGJ4brSuyI10Bxu0tOEfo
   SM+Psl7AHg9xki/8wsiFRaRUK/hBZDC2VDPdsf134bo4FgXLcnd/xBp1v
   Y5PFSBoFTAc4rA4y31GopUg7udzs9ch+mzfVByTRoCvHnLx4ukprwuC0V
   jxswcsU9SbSTL4qySlqsl3i6jnvy0WBL7cuAN5s60II4J8ITDcoyRoxNx
   +RaLUmxOI/kB8gNCMTEGokHZ2yXX+CEo2HEDTydspKBZJoQc0NIeHEHsR
   z5AXlOp8X/6PUfkecN5j6pYVD3QHukDEyNYKzZrMduEyohNTUD58enJzE
   Q==;
X-CSE-ConnectionGUID: K5u1MXJfQbSxCxYrvhNIbA==
X-CSE-MsgGUID: yeQM6bV5Rd6MPKcQwJNZtA==
X-IronPort-AV: E=McAfee;i="6700,10204,11303"; a="53662787"
X-IronPort-AV: E=Sophos;i="6.12,286,1728975600"; 
   d="scan'208";a="53662787"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jan 2025 18:21:53 -0800
X-CSE-ConnectionGUID: arU3oN7DTdKWnclAMX3w7A==
X-CSE-MsgGUID: blOfOOg9QOuB29RTSUkx9A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="106298554"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 02 Jan 2025 18:21:50 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tTXJr-00095D-26;
	Fri, 03 Jan 2025 02:21:47 +0000
Date: Fri, 3 Jan 2025 10:21:42 +0800
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
Subject: Re: [PATCH v3 3/6] clk: renesas: rzv2h: Simplify BUS_MSTOP macros
 and field extraction
Message-ID: <202501030941.vDjx439p-lkp@intel.com>
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
config: sparc-randconfig-002-20250103 (https://download.01.org/0day-ci/archive/20250103/202501030941.vDjx439p-lkp@intel.com/config)
compiler: sparc-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250103/202501030941.vDjx439p-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501030941.vDjx439p-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from drivers/clk/renesas/r9a09g057-cpg.c:15:
>> drivers/clk/renesas/rzv2h-cpg.h:51:34: error: implicit declaration of function 'FIELD_PREP_CONST' [-Wimplicit-function-declaration]
      51 | #define BUS_MSTOP(idx, mask)    (FIELD_PREP_CONST(BUS_MSTOP_IDX_MASK, (idx)) | \
         |                                  ^~~~~~~~~~~~~~~~
   drivers/clk/renesas/rzv2h-cpg.h:137:32: note: in definition of macro 'DEF_MOD_BASE'
     137 |                 .mstop_data = (_mstop), \
         |                                ^~~~~~
   drivers/clk/renesas/r9a09g057-cpg.c:120:9: note: in expansion of macro 'DEF_MOD'
     120 |         DEF_MOD("gtm_0_pclk",                   CLK_PLLCM33_DIV16, 4, 3, 2, 3,
         |         ^~~~~~~
   drivers/clk/renesas/r9a09g057-cpg.c:121:49: note: in expansion of macro 'BUS_MSTOP'
     121 |                                                 BUS_MSTOP(5, BIT(10))),
         |                                                 ^~~~~~~~~
>> drivers/clk/renesas/rzv2h-cpg.h:137:31: error: initializer element is not constant
     137 |                 .mstop_data = (_mstop), \
         |                               ^
   drivers/clk/renesas/rzv2h-cpg.h:148:9: note: in expansion of macro 'DEF_MOD_BASE'
     148 |         DEF_MOD_BASE(_name, _mstop, _parent, false, false, _onindex, _onbit, _monindex, _monbit)
         |         ^~~~~~~~~~~~
   drivers/clk/renesas/r9a09g057-cpg.c:120:9: note: in expansion of macro 'DEF_MOD'
     120 |         DEF_MOD("gtm_0_pclk",                   CLK_PLLCM33_DIV16, 4, 3, 2, 3,
         |         ^~~~~~~
   drivers/clk/renesas/rzv2h-cpg.h:137:31: note: (near initialization for 'r9a09g057_mod_clks[1].mstop_data')
     137 |                 .mstop_data = (_mstop), \
         |                               ^
   drivers/clk/renesas/rzv2h-cpg.h:148:9: note: in expansion of macro 'DEF_MOD_BASE'
     148 |         DEF_MOD_BASE(_name, _mstop, _parent, false, false, _onindex, _onbit, _monindex, _monbit)
         |         ^~~~~~~~~~~~
   drivers/clk/renesas/r9a09g057-cpg.c:120:9: note: in expansion of macro 'DEF_MOD'
     120 |         DEF_MOD("gtm_0_pclk",                   CLK_PLLCM33_DIV16, 4, 3, 2, 3,
         |         ^~~~~~~
>> drivers/clk/renesas/rzv2h-cpg.h:137:31: error: initializer element is not constant
     137 |                 .mstop_data = (_mstop), \
         |                               ^
   drivers/clk/renesas/rzv2h-cpg.h:148:9: note: in expansion of macro 'DEF_MOD_BASE'
     148 |         DEF_MOD_BASE(_name, _mstop, _parent, false, false, _onindex, _onbit, _monindex, _monbit)
         |         ^~~~~~~~~~~~
   drivers/clk/renesas/r9a09g057-cpg.c:122:9: note: in expansion of macro 'DEF_MOD'
     122 |         DEF_MOD("gtm_1_pclk",                   CLK_PLLCM33_DIV16, 4, 4, 2, 4,
         |         ^~~~~~~
   drivers/clk/renesas/rzv2h-cpg.h:137:31: note: (near initialization for 'r9a09g057_mod_clks[2].mstop_data')
     137 |                 .mstop_data = (_mstop), \
         |                               ^
   drivers/clk/renesas/rzv2h-cpg.h:148:9: note: in expansion of macro 'DEF_MOD_BASE'
     148 |         DEF_MOD_BASE(_name, _mstop, _parent, false, false, _onindex, _onbit, _monindex, _monbit)
         |         ^~~~~~~~~~~~
   drivers/clk/renesas/r9a09g057-cpg.c:122:9: note: in expansion of macro 'DEF_MOD'
     122 |         DEF_MOD("gtm_1_pclk",                   CLK_PLLCM33_DIV16, 4, 4, 2, 4,
         |         ^~~~~~~
>> drivers/clk/renesas/rzv2h-cpg.h:137:31: error: initializer element is not constant
     137 |                 .mstop_data = (_mstop), \
         |                               ^
   drivers/clk/renesas/rzv2h-cpg.h:148:9: note: in expansion of macro 'DEF_MOD_BASE'
     148 |         DEF_MOD_BASE(_name, _mstop, _parent, false, false, _onindex, _onbit, _monindex, _monbit)
         |         ^~~~~~~~~~~~
   drivers/clk/renesas/r9a09g057-cpg.c:124:9: note: in expansion of macro 'DEF_MOD'
     124 |         DEF_MOD("gtm_2_pclk",                   CLK_PLLCLN_DIV16, 4, 5, 2, 5,
         |         ^~~~~~~
   drivers/clk/renesas/rzv2h-cpg.h:137:31: note: (near initialization for 'r9a09g057_mod_clks[3].mstop_data')
     137 |                 .mstop_data = (_mstop), \
         |                               ^
   drivers/clk/renesas/rzv2h-cpg.h:148:9: note: in expansion of macro 'DEF_MOD_BASE'
     148 |         DEF_MOD_BASE(_name, _mstop, _parent, false, false, _onindex, _onbit, _monindex, _monbit)
         |         ^~~~~~~~~~~~
   drivers/clk/renesas/r9a09g057-cpg.c:124:9: note: in expansion of macro 'DEF_MOD'
     124 |         DEF_MOD("gtm_2_pclk",                   CLK_PLLCLN_DIV16, 4, 5, 2, 5,
         |         ^~~~~~~
>> drivers/clk/renesas/rzv2h-cpg.h:137:31: error: initializer element is not constant
     137 |                 .mstop_data = (_mstop), \
         |                               ^
   drivers/clk/renesas/rzv2h-cpg.h:148:9: note: in expansion of macro 'DEF_MOD_BASE'
     148 |         DEF_MOD_BASE(_name, _mstop, _parent, false, false, _onindex, _onbit, _monindex, _monbit)
         |         ^~~~~~~~~~~~
   drivers/clk/renesas/r9a09g057-cpg.c:126:9: note: in expansion of macro 'DEF_MOD'
     126 |         DEF_MOD("gtm_3_pclk",                   CLK_PLLCLN_DIV16, 4, 6, 2, 6,
         |         ^~~~~~~
   drivers/clk/renesas/rzv2h-cpg.h:137:31: note: (near initialization for 'r9a09g057_mod_clks[4].mstop_data')
     137 |                 .mstop_data = (_mstop), \
         |                               ^
   drivers/clk/renesas/rzv2h-cpg.h:148:9: note: in expansion of macro 'DEF_MOD_BASE'
     148 |         DEF_MOD_BASE(_name, _mstop, _parent, false, false, _onindex, _onbit, _monindex, _monbit)
         |         ^~~~~~~~~~~~
   drivers/clk/renesas/r9a09g057-cpg.c:126:9: note: in expansion of macro 'DEF_MOD'
     126 |         DEF_MOD("gtm_3_pclk",                   CLK_PLLCLN_DIV16, 4, 6, 2, 6,
         |         ^~~~~~~
>> drivers/clk/renesas/rzv2h-cpg.h:137:31: error: initializer element is not constant
     137 |                 .mstop_data = (_mstop), \
         |                               ^
   drivers/clk/renesas/rzv2h-cpg.h:148:9: note: in expansion of macro 'DEF_MOD_BASE'
     148 |         DEF_MOD_BASE(_name, _mstop, _parent, false, false, _onindex, _onbit, _monindex, _monbit)
         |         ^~~~~~~~~~~~
   drivers/clk/renesas/r9a09g057-cpg.c:128:9: note: in expansion of macro 'DEF_MOD'
     128 |         DEF_MOD("gtm_4_pclk",                   CLK_PLLCLN_DIV16, 4, 7, 2, 7,
         |         ^~~~~~~
   drivers/clk/renesas/rzv2h-cpg.h:137:31: note: (near initialization for 'r9a09g057_mod_clks[5].mstop_data')
     137 |                 .mstop_data = (_mstop), \
         |                               ^
   drivers/clk/renesas/rzv2h-cpg.h:148:9: note: in expansion of macro 'DEF_MOD_BASE'
     148 |         DEF_MOD_BASE(_name, _mstop, _parent, false, false, _onindex, _onbit, _monindex, _monbit)
         |         ^~~~~~~~~~~~
   drivers/clk/renesas/r9a09g057-cpg.c:128:9: note: in expansion of macro 'DEF_MOD'
     128 |         DEF_MOD("gtm_4_pclk",                   CLK_PLLCLN_DIV16, 4, 7, 2, 7,
         |         ^~~~~~~
>> drivers/clk/renesas/rzv2h-cpg.h:137:31: error: initializer element is not constant
     137 |                 .mstop_data = (_mstop), \
         |                               ^
   drivers/clk/renesas/rzv2h-cpg.h:148:9: note: in expansion of macro 'DEF_MOD_BASE'
     148 |         DEF_MOD_BASE(_name, _mstop, _parent, false, false, _onindex, _onbit, _monindex, _monbit)
         |         ^~~~~~~~~~~~
   drivers/clk/renesas/r9a09g057-cpg.c:130:9: note: in expansion of macro 'DEF_MOD'
     130 |         DEF_MOD("gtm_5_pclk",                   CLK_PLLCLN_DIV16, 4, 8, 2, 8,
         |         ^~~~~~~
   drivers/clk/renesas/rzv2h-cpg.h:137:31: note: (near initialization for 'r9a09g057_mod_clks[6].mstop_data')
     137 |                 .mstop_data = (_mstop), \
         |                               ^
   drivers/clk/renesas/rzv2h-cpg.h:148:9: note: in expansion of macro 'DEF_MOD_BASE'
     148 |         DEF_MOD_BASE(_name, _mstop, _parent, false, false, _onindex, _onbit, _monindex, _monbit)
         |         ^~~~~~~~~~~~
   drivers/clk/renesas/r9a09g057-cpg.c:130:9: note: in expansion of macro 'DEF_MOD'
     130 |         DEF_MOD("gtm_5_pclk",                   CLK_PLLCLN_DIV16, 4, 8, 2, 8,
         |         ^~~~~~~
>> drivers/clk/renesas/rzv2h-cpg.h:137:31: error: initializer element is not constant
     137 |                 .mstop_data = (_mstop), \
         |                               ^
   drivers/clk/renesas/rzv2h-cpg.h:148:9: note: in expansion of macro 'DEF_MOD_BASE'
     148 |         DEF_MOD_BASE(_name, _mstop, _parent, false, false, _onindex, _onbit, _monindex, _monbit)
         |         ^~~~~~~~~~~~
   drivers/clk/renesas/r9a09g057-cpg.c:132:9: note: in expansion of macro 'DEF_MOD'
     132 |         DEF_MOD("gtm_6_pclk",                   CLK_PLLCLN_DIV16, 4, 9, 2, 9,
         |         ^~~~~~~
   drivers/clk/renesas/rzv2h-cpg.h:137:31: note: (near initialization for 'r9a09g057_mod_clks[7].mstop_data')
     137 |                 .mstop_data = (_mstop), \
         |                               ^
   drivers/clk/renesas/rzv2h-cpg.h:148:9: note: in expansion of macro 'DEF_MOD_BASE'
     148 |         DEF_MOD_BASE(_name, _mstop, _parent, false, false, _onindex, _onbit, _monindex, _monbit)
         |         ^~~~~~~~~~~~
   drivers/clk/renesas/r9a09g057-cpg.c:132:9: note: in expansion of macro 'DEF_MOD'
     132 |         DEF_MOD("gtm_6_pclk",                   CLK_PLLCLN_DIV16, 4, 9, 2, 9,
         |         ^~~~~~~
>> drivers/clk/renesas/rzv2h-cpg.h:137:31: error: initializer element is not constant
     137 |                 .mstop_data = (_mstop), \
         |                               ^
   drivers/clk/renesas/rzv2h-cpg.h:148:9: note: in expansion of macro 'DEF_MOD_BASE'
     148 |         DEF_MOD_BASE(_name, _mstop, _parent, false, false, _onindex, _onbit, _monindex, _monbit)
         |         ^~~~~~~~~~~~
   drivers/clk/renesas/r9a09g057-cpg.c:134:9: note: in expansion of macro 'DEF_MOD'
     134 |         DEF_MOD("gtm_7_pclk",                   CLK_PLLCLN_DIV16, 4, 10, 2, 10,
         |         ^~~~~~~
   drivers/clk/renesas/rzv2h-cpg.h:137:31: note: (near initialization for 'r9a09g057_mod_clks[8].mstop_data')
     137 |                 .mstop_data = (_mstop), \
         |                               ^
   drivers/clk/renesas/rzv2h-cpg.h:148:9: note: in expansion of macro 'DEF_MOD_BASE'
     148 |         DEF_MOD_BASE(_name, _mstop, _parent, false, false, _onindex, _onbit, _monindex, _monbit)
         |         ^~~~~~~~~~~~
   drivers/clk/renesas/r9a09g057-cpg.c:134:9: note: in expansion of macro 'DEF_MOD'
     134 |         DEF_MOD("gtm_7_pclk",                   CLK_PLLCLN_DIV16, 4, 10, 2, 10,
         |         ^~~~~~~
>> drivers/clk/renesas/rzv2h-cpg.h:137:31: error: initializer element is not constant
     137 |                 .mstop_data = (_mstop), \
         |                               ^
   drivers/clk/renesas/rzv2h-cpg.h:148:9: note: in expansion of macro 'DEF_MOD_BASE'
     148 |         DEF_MOD_BASE(_name, _mstop, _parent, false, false, _onindex, _onbit, _monindex, _monbit)
         |         ^~~~~~~~~~~~
   drivers/clk/renesas/r9a09g057-cpg.c:136:9: note: in expansion of macro 'DEF_MOD'
     136 |         DEF_MOD("wdt_0_clkp",                   CLK_PLLCM33_DIV16, 4, 11, 2, 11,
         |         ^~~~~~~
   drivers/clk/renesas/rzv2h-cpg.h:137:31: note: (near initialization for 'r9a09g057_mod_clks[9].mstop_data')
     137 |                 .mstop_data = (_mstop), \
         |                               ^
   drivers/clk/renesas/rzv2h-cpg.h:148:9: note: in expansion of macro 'DEF_MOD_BASE'
     148 |         DEF_MOD_BASE(_name, _mstop, _parent, false, false, _onindex, _onbit, _monindex, _monbit)
         |         ^~~~~~~~~~~~
   drivers/clk/renesas/r9a09g057-cpg.c:136:9: note: in expansion of macro 'DEF_MOD'
     136 |         DEF_MOD("wdt_0_clkp",                   CLK_PLLCM33_DIV16, 4, 11, 2, 11,
         |         ^~~~~~~
>> drivers/clk/renesas/rzv2h-cpg.h:137:31: error: initializer element is not constant
     137 |                 .mstop_data = (_mstop), \
         |                               ^
   drivers/clk/renesas/rzv2h-cpg.h:148:9: note: in expansion of macro 'DEF_MOD_BASE'
     148 |         DEF_MOD_BASE(_name, _mstop, _parent, false, false, _onindex, _onbit, _monindex, _monbit)
         |         ^~~~~~~~~~~~
   drivers/clk/renesas/r9a09g057-cpg.c:138:9: note: in expansion of macro 'DEF_MOD'
     138 |         DEF_MOD("wdt_0_clk_loco",               CLK_QEXTAL, 4, 12, 2, 12,
         |         ^~~~~~~
   drivers/clk/renesas/rzv2h-cpg.h:137:31: note: (near initialization for 'r9a09g057_mod_clks[10].mstop_data')
     137 |                 .mstop_data = (_mstop), \
         |                               ^
   drivers/clk/renesas/rzv2h-cpg.h:148:9: note: in expansion of macro 'DEF_MOD_BASE'
     148 |         DEF_MOD_BASE(_name, _mstop, _parent, false, false, _onindex, _onbit, _monindex, _monbit)
         |         ^~~~~~~~~~~~
   drivers/clk/renesas/r9a09g057-cpg.c:138:9: note: in expansion of macro 'DEF_MOD'
     138 |         DEF_MOD("wdt_0_clk_loco",               CLK_QEXTAL, 4, 12, 2, 12,
         |         ^~~~~~~
>> drivers/clk/renesas/rzv2h-cpg.h:137:31: error: initializer element is not constant
     137 |                 .mstop_data = (_mstop), \
         |                               ^
   drivers/clk/renesas/rzv2h-cpg.h:148:9: note: in expansion of macro 'DEF_MOD_BASE'
     148 |         DEF_MOD_BASE(_name, _mstop, _parent, false, false, _onindex, _onbit, _monindex, _monbit)
         |         ^~~~~~~~~~~~
   drivers/clk/renesas/r9a09g057-cpg.c:140:9: note: in expansion of macro 'DEF_MOD'
     140 |         DEF_MOD("wdt_1_clkp",                   CLK_PLLCLN_DIV16, 4, 13, 2, 13,
         |         ^~~~~~~
   drivers/clk/renesas/rzv2h-cpg.h:137:31: note: (near initialization for 'r9a09g057_mod_clks[11].mstop_data')
     137 |                 .mstop_data = (_mstop), \
         |                               ^
   drivers/clk/renesas/rzv2h-cpg.h:148:9: note: in expansion of macro 'DEF_MOD_BASE'
     148 |         DEF_MOD_BASE(_name, _mstop, _parent, false, false, _onindex, _onbit, _monindex, _monbit)
         |         ^~~~~~~~~~~~
   drivers/clk/renesas/r9a09g057-cpg.c:140:9: note: in expansion of macro 'DEF_MOD'
     140 |         DEF_MOD("wdt_1_clkp",                   CLK_PLLCLN_DIV16, 4, 13, 2, 13,
         |         ^~~~~~~
>> drivers/clk/renesas/rzv2h-cpg.h:137:31: error: initializer element is not constant
     137 |                 .mstop_data = (_mstop), \
         |                               ^
   drivers/clk/renesas/rzv2h-cpg.h:148:9: note: in expansion of macro 'DEF_MOD_BASE'
     148 |         DEF_MOD_BASE(_name, _mstop, _parent, false, false, _onindex, _onbit, _monindex, _monbit)
         |         ^~~~~~~~~~~~
   drivers/clk/renesas/r9a09g057-cpg.c:142:9: note: in expansion of macro 'DEF_MOD'
     142 |         DEF_MOD("wdt_1_clk_loco",               CLK_QEXTAL, 4, 14, 2, 14,
         |         ^~~~~~~
   drivers/clk/renesas/rzv2h-cpg.h:137:31: note: (near initialization for 'r9a09g057_mod_clks[12].mstop_data')
     137 |                 .mstop_data = (_mstop), \
         |                               ^
   drivers/clk/renesas/rzv2h-cpg.h:148:9: note: in expansion of macro 'DEF_MOD_BASE'
     148 |         DEF_MOD_BASE(_name, _mstop, _parent, false, false, _onindex, _onbit, _monindex, _monbit)
         |         ^~~~~~~~~~~~
   drivers/clk/renesas/r9a09g057-cpg.c:142:9: note: in expansion of macro 'DEF_MOD'
     142 |         DEF_MOD("wdt_1_clk_loco",               CLK_QEXTAL, 4, 14, 2, 14,
         |         ^~~~~~~
>> drivers/clk/renesas/rzv2h-cpg.h:137:31: error: initializer element is not constant
     137 |                 .mstop_data = (_mstop), \
         |                               ^
   drivers/clk/renesas/rzv2h-cpg.h:148:9: note: in expansion of macro 'DEF_MOD_BASE'
     148 |         DEF_MOD_BASE(_name, _mstop, _parent, false, false, _onindex, _onbit, _monindex, _monbit)
         |         ^~~~~~~~~~~~
   drivers/clk/renesas/r9a09g057-cpg.c:144:9: note: in expansion of macro 'DEF_MOD'
     144 |         DEF_MOD("wdt_2_clkp",                   CLK_PLLCLN_DIV16, 4, 15, 2, 15,
         |         ^~~~~~~
   drivers/clk/renesas/rzv2h-cpg.h:137:31: note: (near initialization for 'r9a09g057_mod_clks[13].mstop_data')
     137 |                 .mstop_data = (_mstop), \
         |                               ^
   drivers/clk/renesas/rzv2h-cpg.h:148:9: note: in expansion of macro 'DEF_MOD_BASE'
     148 |         DEF_MOD_BASE(_name, _mstop, _parent, false, false, _onindex, _onbit, _monindex, _monbit)
         |         ^~~~~~~~~~~~
   drivers/clk/renesas/r9a09g057-cpg.c:144:9: note: in expansion of macro 'DEF_MOD'
     144 |         DEF_MOD("wdt_2_clkp",                   CLK_PLLCLN_DIV16, 4, 15, 2, 15,
         |         ^~~~~~~
>> drivers/clk/renesas/rzv2h-cpg.h:137:31: error: initializer element is not constant
     137 |                 .mstop_data = (_mstop), \
         |                               ^
   drivers/clk/renesas/rzv2h-cpg.h:148:9: note: in expansion of macro 'DEF_MOD_BASE'
     148 |         DEF_MOD_BASE(_name, _mstop, _parent, false, false, _onindex, _onbit, _monindex, _monbit)
         |         ^~~~~~~~~~~~
   drivers/clk/renesas/r9a09g057-cpg.c:146:9: note: in expansion of macro 'DEF_MOD'
     146 |         DEF_MOD("wdt_2_clk_loco",               CLK_QEXTAL, 5, 0, 2, 16,
         |         ^~~~~~~
   drivers/clk/renesas/rzv2h-cpg.h:137:31: note: (near initialization for 'r9a09g057_mod_clks[14].mstop_data')
     137 |                 .mstop_data = (_mstop), \
         |                               ^
   drivers/clk/renesas/rzv2h-cpg.h:148:9: note: in expansion of macro 'DEF_MOD_BASE'
     148 |         DEF_MOD_BASE(_name, _mstop, _parent, false, false, _onindex, _onbit, _monindex, _monbit)
         |         ^~~~~~~~~~~~
   drivers/clk/renesas/r9a09g057-cpg.c:146:9: note: in expansion of macro 'DEF_MOD'
     146 |         DEF_MOD("wdt_2_clk_loco",               CLK_QEXTAL, 5, 0, 2, 16,
         |         ^~~~~~~
>> drivers/clk/renesas/rzv2h-cpg.h:137:31: error: initializer element is not constant
     137 |                 .mstop_data = (_mstop), \
         |                               ^
   drivers/clk/renesas/rzv2h-cpg.h:148:9: note: in expansion of macro 'DEF_MOD_BASE'
     148 |         DEF_MOD_BASE(_name, _mstop, _parent, false, false, _onindex, _onbit, _monindex, _monbit)
         |         ^~~~~~~~~~~~
   drivers/clk/renesas/r9a09g057-cpg.c:148:9: note: in expansion of macro 'DEF_MOD'
     148 |         DEF_MOD("wdt_3_clkp",                   CLK_PLLCLN_DIV16, 5, 1, 2, 17,
         |         ^~~~~~~
   drivers/clk/renesas/rzv2h-cpg.h:137:31: note: (near initialization for 'r9a09g057_mod_clks[15].mstop_data')
     137 |                 .mstop_data = (_mstop), \
         |                               ^
   drivers/clk/renesas/rzv2h-cpg.h:148:9: note: in expansion of macro 'DEF_MOD_BASE'
     148 |         DEF_MOD_BASE(_name, _mstop, _parent, false, false, _onindex, _onbit, _monindex, _monbit)
         |         ^~~~~~~~~~~~
   drivers/clk/renesas/r9a09g057-cpg.c:148:9: note: in expansion of macro 'DEF_MOD'
     148 |         DEF_MOD("wdt_3_clkp",                   CLK_PLLCLN_DIV16, 5, 1, 2, 17,
         |         ^~~~~~~
>> drivers/clk/renesas/rzv2h-cpg.h:137:31: error: initializer element is not constant
     137 |                 .mstop_data = (_mstop), \
         |                               ^
   drivers/clk/renesas/rzv2h-cpg.h:148:9: note: in expansion of macro 'DEF_MOD_BASE'
     148 |         DEF_MOD_BASE(_name, _mstop, _parent, false, false, _onindex, _onbit, _monindex, _monbit)
         |         ^~~~~~~~~~~~
   drivers/clk/renesas/r9a09g057-cpg.c:150:9: note: in expansion of macro 'DEF_MOD'
     150 |         DEF_MOD("wdt_3_clk_loco",               CLK_QEXTAL, 5, 2, 2, 18,
         |         ^~~~~~~
   drivers/clk/renesas/rzv2h-cpg.h:137:31: note: (near initialization for 'r9a09g057_mod_clks[16].mstop_data')
     137 |                 .mstop_data = (_mstop), \
         |                               ^
   drivers/clk/renesas/rzv2h-cpg.h:148:9: note: in expansion of macro 'DEF_MOD_BASE'
     148 |         DEF_MOD_BASE(_name, _mstop, _parent, false, false, _onindex, _onbit, _monindex, _monbit)
         |         ^~~~~~~~~~~~
   drivers/clk/renesas/r9a09g057-cpg.c:150:9: note: in expansion of macro 'DEF_MOD'
     150 |         DEF_MOD("wdt_3_clk_loco",               CLK_QEXTAL, 5, 2, 2, 18,
         |         ^~~~~~~
>> drivers/clk/renesas/rzv2h-cpg.h:137:31: error: initializer element is not constant
     137 |                 .mstop_data = (_mstop), \
         |                               ^
   drivers/clk/renesas/rzv2h-cpg.h:148:9: note: in expansion of macro 'DEF_MOD_BASE'
     148 |         DEF_MOD_BASE(_name, _mstop, _parent, false, false, _onindex, _onbit, _monindex, _monbit)
         |         ^~~~~~~~~~~~
   drivers/clk/renesas/r9a09g057-cpg.c:152:9: note: in expansion of macro 'DEF_MOD'
     152 |         DEF_MOD("scif_0_clk_pck",               CLK_PLLCM33_DIV16, 8, 15, 4, 15,
         |         ^~~~~~~
   drivers/clk/renesas/rzv2h-cpg.h:137:31: note: (near initialization for 'r9a09g057_mod_clks[17].mstop_data')
     137 |                 .mstop_data = (_mstop), \
         |                               ^
   drivers/clk/renesas/rzv2h-cpg.h:148:9: note: in expansion of macro 'DEF_MOD_BASE'
     148 |         DEF_MOD_BASE(_name, _mstop, _parent, false, false, _onindex, _onbit, _monindex, _monbit)
         |         ^~~~~~~~~~~~
   drivers/clk/renesas/r9a09g057-cpg.c:152:9: note: in expansion of macro 'DEF_MOD'
     152 |         DEF_MOD("scif_0_clk_pck",               CLK_PLLCM33_DIV16, 8, 15, 4, 15,
         |         ^~~~~~~
>> drivers/clk/renesas/rzv2h-cpg.h:137:31: error: initializer element is not constant
     137 |                 .mstop_data = (_mstop), \
         |                               ^
   drivers/clk/renesas/rzv2h-cpg.h:148:9: note: in expansion of macro 'DEF_MOD_BASE'
     148 |         DEF_MOD_BASE(_name, _mstop, _parent, false, false, _onindex, _onbit, _monindex, _monbit)
         |         ^~~~~~~~~~~~
   drivers/clk/renesas/r9a09g057-cpg.c:154:9: note: in expansion of macro 'DEF_MOD'
     154 |         DEF_MOD("riic_8_ckm",                   CLK_PLLCM33_DIV16, 9, 3, 4, 19,
         |         ^~~~~~~
   drivers/clk/renesas/rzv2h-cpg.h:137:31: note: (near initialization for 'r9a09g057_mod_clks[18].mstop_data')
     137 |                 .mstop_data = (_mstop), \
         |                               ^
   drivers/clk/renesas/rzv2h-cpg.h:148:9: note: in expansion of macro 'DEF_MOD_BASE'
     148 |         DEF_MOD_BASE(_name, _mstop, _parent, false, false, _onindex, _onbit, _monindex, _monbit)
         |         ^~~~~~~~~~~~
   drivers/clk/renesas/r9a09g057-cpg.c:154:9: note: in expansion of macro 'DEF_MOD'
     154 |         DEF_MOD("riic_8_ckm",                   CLK_PLLCM33_DIV16, 9, 3, 4, 19,
         |         ^~~~~~~
>> drivers/clk/renesas/rzv2h-cpg.h:137:31: error: initializer element is not constant
     137 |                 .mstop_data = (_mstop), \
         |                               ^
   drivers/clk/renesas/rzv2h-cpg.h:148:9: note: in expansion of macro 'DEF_MOD_BASE'
     148 |         DEF_MOD_BASE(_name, _mstop, _parent, false, false, _onindex, _onbit, _monindex, _monbit)
         |         ^~~~~~~~~~~~
   drivers/clk/renesas/r9a09g057-cpg.c:156:9: note: in expansion of macro 'DEF_MOD'
     156 |         DEF_MOD("riic_0_ckm",                   CLK_PLLCLN_DIV16, 9, 4, 4, 20,
         |         ^~~~~~~
   drivers/clk/renesas/rzv2h-cpg.h:137:31: note: (near initialization for 'r9a09g057_mod_clks[19].mstop_data')
     137 |                 .mstop_data = (_mstop), \
         |                               ^
   drivers/clk/renesas/rzv2h-cpg.h:148:9: note: in expansion of macro 'DEF_MOD_BASE'
     148 |         DEF_MOD_BASE(_name, _mstop, _parent, false, false, _onindex, _onbit, _monindex, _monbit)
         |         ^~~~~~~~~~~~
   drivers/clk/renesas/r9a09g057-cpg.c:156:9: note: in expansion of macro 'DEF_MOD'
     156 |         DEF_MOD("riic_0_ckm",                   CLK_PLLCLN_DIV16, 9, 4, 4, 20,
         |         ^~~~~~~
   drivers/clk/renesas/rzv2h-cpg.h:137:31: error: initializer element is not constant
     137 |                 .mstop_data = (_mstop), \
         |                               ^
   drivers/clk/renesas/rzv2h-cpg.h:148:9: note: in expansion of macro 'DEF_MOD_BASE'
     148 |         DEF_MOD_BASE(_name, _mstop, _parent, false, false, _onindex, _onbit, _monindex, _monbit)
         |         ^~~~~~~~~~~~
   drivers/clk/renesas/r9a09g057-cpg.c:158:9: note: in expansion of macro 'DEF_MOD'
     158 |         DEF_MOD("riic_1_ckm",                   CLK_PLLCLN_DIV16, 9, 5, 4, 21,
         |         ^~~~~~~
   drivers/clk/renesas/rzv2h-cpg.h:137:31: note: (near initialization for 'r9a09g057_mod_clks[20].mstop_data')
     137 |                 .mstop_data = (_mstop), \
         |                               ^
   drivers/clk/renesas/rzv2h-cpg.h:148:9: note: in expansion of macro 'DEF_MOD_BASE'
     148 |         DEF_MOD_BASE(_name, _mstop, _parent, false, false, _onindex, _onbit, _monindex, _monbit)
         |         ^~~~~~~~~~~~
   drivers/clk/renesas/r9a09g057-cpg.c:158:9: note: in expansion of macro 'DEF_MOD'
     158 |         DEF_MOD("riic_1_ckm",                   CLK_PLLCLN_DIV16, 9, 5, 4, 21,
         |         ^~~~~~~
   drivers/clk/renesas/rzv2h-cpg.h:137:31: error: initializer element is not constant
     137 |                 .mstop_data = (_mstop), \
         |                               ^
   drivers/clk/renesas/rzv2h-cpg.h:148:9: note: in expansion of macro 'DEF_MOD_BASE'
     148 |         DEF_MOD_BASE(_name, _mstop, _parent, false, false, _onindex, _onbit, _monindex, _monbit)
         |         ^~~~~~~~~~~~
   drivers/clk/renesas/r9a09g057-cpg.c:160:9: note: in expansion of macro 'DEF_MOD'
     160 |         DEF_MOD("riic_2_ckm",                   CLK_PLLCLN_DIV16, 9, 6, 4, 22,
         |         ^~~~~~~
   drivers/clk/renesas/rzv2h-cpg.h:137:31: note: (near initialization for 'r9a09g057_mod_clks[21].mstop_data')
     137 |                 .mstop_data = (_mstop), \
         |                               ^
   drivers/clk/renesas/rzv2h-cpg.h:148:9: note: in expansion of macro 'DEF_MOD_BASE'
     148 |         DEF_MOD_BASE(_name, _mstop, _parent, false, false, _onindex, _onbit, _monindex, _monbit)
         |         ^~~~~~~~~~~~
   drivers/clk/renesas/r9a09g057-cpg.c:160:9: note: in expansion of macro 'DEF_MOD'
     160 |         DEF_MOD("riic_2_ckm",                   CLK_PLLCLN_DIV16, 9, 6, 4, 22,
         |         ^~~~~~~
   drivers/clk/renesas/rzv2h-cpg.h:137:31: error: initializer element is not constant
     137 |                 .mstop_data = (_mstop), \
         |                               ^
   drivers/clk/renesas/rzv2h-cpg.h:148:9: note: in expansion of macro 'DEF_MOD_BASE'
     148 |         DEF_MOD_BASE(_name, _mstop, _parent, false, false, _onindex, _onbit, _monindex, _monbit)
         |         ^~~~~~~~~~~~
   drivers/clk/renesas/r9a09g057-cpg.c:162:9: note: in expansion of macro 'DEF_MOD'
     162 |         DEF_MOD("riic_3_ckm",                   CLK_PLLCLN_DIV16, 9, 7, 4, 23,
         |         ^~~~~~~
   drivers/clk/renesas/rzv2h-cpg.h:137:31: note: (near initialization for 'r9a09g057_mod_clks[22].mstop_data')
     137 |                 .mstop_data = (_mstop), \
         |                               ^
   drivers/clk/renesas/rzv2h-cpg.h:148:9: note: in expansion of macro 'DEF_MOD_BASE'
     148 |         DEF_MOD_BASE(_name, _mstop, _parent, false, false, _onindex, _onbit, _monindex, _monbit)
         |         ^~~~~~~~~~~~
   drivers/clk/renesas/r9a09g057-cpg.c:162:9: note: in expansion of macro 'DEF_MOD'
     162 |         DEF_MOD("riic_3_ckm",                   CLK_PLLCLN_DIV16, 9, 7, 4, 23,
         |         ^~~~~~~
   drivers/clk/renesas/rzv2h-cpg.h:137:31: error: initializer element is not constant
     137 |                 .mstop_data = (_mstop), \
         |                               ^
   drivers/clk/renesas/rzv2h-cpg.h:148:9: note: in expansion of macro 'DEF_MOD_BASE'
     148 |         DEF_MOD_BASE(_name, _mstop, _parent, false, false, _onindex, _onbit, _monindex, _monbit)
         |         ^~~~~~~~~~~~
   drivers/clk/renesas/r9a09g057-cpg.c:164:9: note: in expansion of macro 'DEF_MOD'
     164 |         DEF_MOD("riic_4_ckm",                   CLK_PLLCLN_DIV16, 9, 8, 4, 24,
         |         ^~~~~~~
   drivers/clk/renesas/rzv2h-cpg.h:137:31: note: (near initialization for 'r9a09g057_mod_clks[23].mstop_data')
     137 |                 .mstop_data = (_mstop), \
         |                               ^
   drivers/clk/renesas/rzv2h-cpg.h:148:9: note: in expansion of macro 'DEF_MOD_BASE'
     148 |         DEF_MOD_BASE(_name, _mstop, _parent, false, false, _onindex, _onbit, _monindex, _monbit)
         |         ^~~~~~~~~~~~
   drivers/clk/renesas/r9a09g057-cpg.c:164:9: note: in expansion of macro 'DEF_MOD'
     164 |         DEF_MOD("riic_4_ckm",                   CLK_PLLCLN_DIV16, 9, 8, 4, 24,
         |         ^~~~~~~
   drivers/clk/renesas/rzv2h-cpg.h:137:31: error: initializer element is not constant
     137 |                 .mstop_data = (_mstop), \
         |                               ^
   drivers/clk/renesas/rzv2h-cpg.h:148:9: note: in expansion of macro 'DEF_MOD_BASE'
     148 |         DEF_MOD_BASE(_name, _mstop, _parent, false, false, _onindex, _onbit, _monindex, _monbit)
         |         ^~~~~~~~~~~~
   drivers/clk/renesas/r9a09g057-cpg.c:166:9: note: in expansion of macro 'DEF_MOD'
     166 |         DEF_MOD("riic_5_ckm",                   CLK_PLLCLN_DIV16, 9, 9, 4, 25,
         |         ^~~~~~~
   drivers/clk/renesas/rzv2h-cpg.h:137:31: note: (near initialization for 'r9a09g057_mod_clks[24].mstop_data')
     137 |                 .mstop_data = (_mstop), \


vim +/FIELD_PREP_CONST +51 drivers/clk/renesas/rzv2h-cpg.h

    48	
    49	#define BUS_MSTOP_IDX_MASK	GENMASK(31, 16)
    50	#define BUS_MSTOP_BITS_MASK	GENMASK(15, 0)
  > 51	#define BUS_MSTOP(idx, mask)	(FIELD_PREP_CONST(BUS_MSTOP_IDX_MASK, (idx)) | \
    52					 FIELD_PREP_CONST(BUS_MSTOP_BITS_MASK, (mask)))
    53	#define BUS_MSTOP_NONE		GENMASK(31, 0)
    54	
    55	/**
    56	 * Definitions of CPG Core Clocks
    57	 *
    58	 * These include:
    59	 *   - Clock outputs exported to DT
    60	 *   - External input clocks
    61	 *   - Internal CPG clocks
    62	 */
    63	struct cpg_core_clk {
    64		const char *name;
    65		unsigned int id;
    66		unsigned int parent;
    67		unsigned int div;
    68		unsigned int mult;
    69		unsigned int type;
    70		union {
    71			unsigned int conf;
    72			struct ddiv ddiv;
    73		} cfg;
    74		const struct clk_div_table *dtable;
    75		u32 flag;
    76	};
    77	
    78	enum clk_types {
    79		/* Generic */
    80		CLK_TYPE_IN,		/* External Clock Input */
    81		CLK_TYPE_FF,		/* Fixed Factor Clock */
    82		CLK_TYPE_PLL,
    83		CLK_TYPE_DDIV,		/* Dynamic Switching Divider */
    84	};
    85	
    86	/* BIT(31) indicates if CLK1/2 are accessible or not */
    87	#define PLL_CONF(n)		(BIT(31) | ((n) & ~GENMASK(31, 16)))
    88	#define PLL_CLK_ACCESS(n)	((n) & BIT(31) ? 1 : 0)
    89	#define PLL_CLK1_OFFSET(n)	((n) & ~GENMASK(31, 16))
    90	#define PLL_CLK2_OFFSET(n)	(((n) & ~GENMASK(31, 16)) + (0x4))
    91	
    92	#define DEF_TYPE(_name, _id, _type...) \
    93		{ .name = _name, .id = _id, .type = _type }
    94	#define DEF_BASE(_name, _id, _type, _parent...) \
    95		DEF_TYPE(_name, _id, _type, .parent = _parent)
    96	#define DEF_PLL(_name, _id, _parent, _conf) \
    97		DEF_TYPE(_name, _id, CLK_TYPE_PLL, .parent = _parent, .cfg.conf = _conf)
    98	#define DEF_INPUT(_name, _id) \
    99		DEF_TYPE(_name, _id, CLK_TYPE_IN)
   100	#define DEF_FIXED(_name, _id, _parent, _mult, _div) \
   101		DEF_BASE(_name, _id, CLK_TYPE_FF, _parent, .div = _div, .mult = _mult)
   102	#define DEF_DDIV(_name, _id, _parent, _ddiv_packed, _dtable) \
   103		DEF_TYPE(_name, _id, CLK_TYPE_DDIV, \
   104			.cfg.ddiv = _ddiv_packed, \
   105			.parent = _parent, \
   106			.dtable = _dtable, \
   107			.flag = CLK_DIVIDER_HIWORD_MASK)
   108	
   109	/**
   110	 * struct rzv2h_mod_clk - Module Clocks definitions
   111	 *
   112	 * @name: handle between common and hardware-specific interfaces
   113	 * @mstop_data: packed data mstop register offset and mask
   114	 * @parent: id of parent clock
   115	 * @critical: flag to indicate the clock is critical
   116	 * @no_pm: flag to indicate PM is not supported
   117	 * @on_index: control register index
   118	 * @on_bit: ON bit
   119	 * @mon_index: monitor register index
   120	 * @mon_bit: monitor bit
   121	 */
   122	struct rzv2h_mod_clk {
   123		const char *name;
   124		u32 mstop_data;
   125		u16 parent;
   126		bool critical;
   127		bool no_pm;
   128		u8 on_index;
   129		u8 on_bit;
   130		s8 mon_index;
   131		u8 mon_bit;
   132	};
   133	
   134	#define DEF_MOD_BASE(_name, _mstop, _parent, _critical, _no_pm, _onindex, _onbit, _monindex, _monbit) \
   135		{ \
   136			.name = (_name), \
 > 137			.mstop_data = (_mstop), \
   138			.parent = (_parent), \
   139			.critical = (_critical), \
   140			.no_pm = (_no_pm), \
   141			.on_index = (_onindex), \
   142			.on_bit = (_onbit), \
   143			.mon_index = (_monindex), \
   144			.mon_bit = (_monbit), \
   145		}
   146	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

