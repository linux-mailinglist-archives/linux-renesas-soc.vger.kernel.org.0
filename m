Return-Path: <linux-renesas-soc+bounces-23595-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id EC16FC0887E
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 25 Oct 2025 04:06:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 98B923B2AA7
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 25 Oct 2025 02:06:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1A725237713;
	Sat, 25 Oct 2025 02:06:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Y7P7Isci"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C2FC189F5C;
	Sat, 25 Oct 2025 02:06:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761357963; cv=none; b=R9JkE9Au3mWiEHHMNcqFBUKNZAqV1vVjmJawT2DPci3F8wTLh1Ivdw02f29ToCBNkekbkyVtRG6MKj+TYDlUCJqeI5Jarrlj49rRZyB0r5RKLaXuOPqv9T+1KB67akOJy+ru35hSCYUQSYw1m4OlpptSlK9M0Dw7r1PnL4WZ3lc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761357963; c=relaxed/simple;
	bh=UUyFabh3Km47IO5QxbAGDRixvtEwG3sJQ8Pmnsxtr34=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Q8C3O54jEFWSdj3xlSLRxDnm+rhtxf6aQEPTdh5PZoPXkNeDnO1x/fNt9sfIy0bpA/dBDbbvDBolMMJQIfQOsp07y6Hghk7u/PWcczxYQONu/Q7n/q3Q2pkelH+puLIvMsksEzQaUsEyUzeUpt6v8n8Hmy3+Gc30fps2EpSPo9w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Y7P7Isci; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761357961; x=1792893961;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=UUyFabh3Km47IO5QxbAGDRixvtEwG3sJQ8Pmnsxtr34=;
  b=Y7P7Iscif2O6eryFwm/BK1ed5OMuxyx2fF2acbkbPO2QvioOZs2t0TQm
   7LCZ/SNTg+GHSX8MiQzw3j7xLpaakKSlYimK1DDut8URgz/oga55AHIAH
   7gFdxIUIMDKiZRcWMl15RJ+jfB1duiPWeTJlPvSkF+YffaB0eBDa/EBva
   YdlU5W5rl9UXqsszg7QzS7XVPALRdIIv7xCGB91cChRGM/gN6VUYNbEaT
   S1ZwNdiDlKx/9qhYoA/0b4MK1gI3Hv903iIdm7yw0R2Uqp+xX/PhrkiVw
   hFUwwWPqCfou0c9D10J/8pbUH49ghxudtYOpJ9jLJOr4N/KweyAyypRRE
   g==;
X-CSE-ConnectionGUID: ZTHZz7n2TPSUT82P/zyFKQ==
X-CSE-MsgGUID: F+Bt4fv7R0WM3FES+Tfs8w==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="63688028"
X-IronPort-AV: E=Sophos;i="6.19,254,1754982000"; 
   d="scan'208";a="63688028"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Oct 2025 19:06:00 -0700
X-CSE-ConnectionGUID: nhHc/15PS/6qQVB76dd4og==
X-CSE-MsgGUID: GcjI3a4XQVGE2FZ/gbs2bw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,254,1754982000"; 
   d="scan'208";a="215222108"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by orviesa002.jf.intel.com with ESMTP; 24 Oct 2025 19:05:57 -0700
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vCTfH-000F41-0i;
	Sat, 25 Oct 2025 02:05:55 +0000
Date: Sat, 25 Oct 2025 10:05:22 +0800
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
Message-ID: <202510250901.tqADmdvc-lkp@intel.com>
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
config: nios2-randconfig-001-20251025 (https://download.01.org/0day-ci/archive/20251025/202510250901.tqADmdvc-lkp@intel.com/config)
compiler: nios2-linux-gcc (GCC) 11.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251025/202510250901.tqADmdvc-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202510250901.tqADmdvc-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/clk/renesas/r9a09g056-cpg.c:130:1: warning: data definition has no type or storage class
     130 | RZV2H_CPG_PLL_DSI_LIMITS(rzv2n_cpg_pll_dsi_limits);
         | ^~~~~~~~~~~~~~~~~~~~~~~~
   drivers/clk/renesas/r9a09g056-cpg.c:130:1: error: type defaults to 'int' in declaration of 'RZV2H_CPG_PLL_DSI_LIMITS' [-Werror=implicit-int]
>> drivers/clk/renesas/r9a09g056-cpg.c:130:1: warning: parameter names (without types) in function declaration
   drivers/clk/renesas/r9a09g056-cpg.c:153:9: error: implicit declaration of function 'DEF_PLLDSI'; did you mean 'DEF_PLL'? [-Werror=implicit-function-declaration]
     153 |         DEF_PLLDSI(".plldsi", CLK_PLLDSI, CLK_QEXTAL, PLLDSI),
         |         ^~~~~~~~~~
         |         DEF_PLL
   drivers/clk/renesas/r9a09g056-cpg.c:131:25: error: implicit declaration of function 'PLL_PACK_LIMITS' [-Werror=implicit-function-declaration]
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
   drivers/clk/renesas/r9a09g056-cpg.c:191:9: error: implicit declaration of function 'DEF_PLLDSI_DIV' [-Werror=implicit-function-declaration]
     191 |         DEF_PLLDSI_DIV(".plldsi_gear", CLK_PLLDSI_GEAR, CLK_PLLDSI,
         |         ^~~~~~~~~~~~~~
   drivers/clk/renesas/r9a09g056-cpg.c:192:24: error: 'CSDIV1_DIVCTL2' undeclared here (not in a function); did you mean 'CDDIV1_DIVCTL2'?
     192 |                        CSDIV1_DIVCTL2, dtable_2_32),
         |                        ^~~~~~~~~~~~~~
         |                        CDDIV1_DIVCTL2
   cc1: some warnings being treated as errors


vim +130 drivers/clk/renesas/r9a09g056-cpg.c

   129	
 > 130	RZV2H_CPG_PLL_DSI_LIMITS(rzv2n_cpg_pll_dsi_limits);
   131	#define PLLDSI		PLL_PACK_LIMITS(0xc0, 1, 0, &rzv2n_cpg_pll_dsi_limits)
   132	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

