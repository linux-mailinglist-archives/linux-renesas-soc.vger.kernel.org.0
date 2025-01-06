Return-Path: <linux-renesas-soc+bounces-11888-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D765A03188
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  6 Jan 2025 21:45:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 8EBAA7A0103
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  6 Jan 2025 20:45:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 35AC91DFE30;
	Mon,  6 Jan 2025 20:45:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nhOHe/Gx"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 588221DFE1D;
	Mon,  6 Jan 2025 20:45:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736196347; cv=none; b=EMRIMkFloPmm+ukNPuAWLBH8ZYCUf2qGfdUk6WQwB46/Li0VuxfIGuLTmexw0C6lhoBSpqvTIxjjNlBUCC4CkwgIgb/8XN2BDWc3jISzM12mTEsrhloXV8UJgkqNylLUP9i9Ef+tTHYCDmiafeuZtMQ+Mo7SbG9PzN6nKJ/q31M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736196347; c=relaxed/simple;
	bh=Td2Yw5gDgT71UUI9oUoAO/KVWMFVudBpj0r/FbkefG0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tId3CIYe5OX8kc/9UZDLb6a4SUxUOMQANEVEBfEpVmNJ1nXBBsOKG0sWxb8oJXYSXNAN2Fh0uZ9iVN3UzdmpvWfKA2ckr4/ddSUpEpINvCgBfOVe9fmNA9PiNfqbLJ7CnSc22rsO+kaNp86yZ/2LPkWKYnZOCZB8VsSCOaqNCrg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nhOHe/Gx; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1736196344; x=1767732344;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Td2Yw5gDgT71UUI9oUoAO/KVWMFVudBpj0r/FbkefG0=;
  b=nhOHe/GxLRSfiiGBMrQagoeXyPFWX/9dPulrl1/OThE7wed+hA7uP/y6
   nT4wucuxxHknmvNOgQHM4INde4XtQj09Ol1ioawi7HIpJRtU0fGMQlVN+
   tpqRTVYJNOXAWNl66jppCsyz4SQcNAxY3QZYMUkEK/YaKKmeYBjBaqvvL
   muItcBD1OIT9R4CY42/2uQmdqSm1SMiTyIqw4ENs/Sv+dp3d2RP+3vKJ4
   5SXrIFFMzXZZ/NKtFCy7JLNZmap6ED4uy48Z5AlUHkjz3Dvw2mQVx5Uci
   VAUGN5Sz6mma1Hz1IUSJ9RDivVt2I7KhS9UpK7SS6Ic/YD+xxNv8d+0b4
   g==;
X-CSE-ConnectionGUID: L9jZfd5CTZCPQmZI5c0SQA==
X-CSE-MsgGUID: pxNkgh80R/KKucnbYcqlLA==
X-IronPort-AV: E=McAfee;i="6700,10204,11307"; a="36255615"
X-IronPort-AV: E=Sophos;i="6.12,293,1728975600"; 
   d="scan'208";a="36255615"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Jan 2025 12:45:43 -0800
X-CSE-ConnectionGUID: ZhaHLtE1TlObiHy7LKnWlA==
X-CSE-MsgGUID: dOTvV6GcRpi5f74ZHQe04w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,293,1728975600"; 
   d="scan'208";a="102433668"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 06 Jan 2025 12:45:40 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tUtyk-000DuV-1S;
	Mon, 06 Jan 2025 20:45:38 +0000
Date: Tue, 7 Jan 2025 04:45:33 +0800
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
Subject: Re: [PATCH] clk: renesas: r9a07g044: Add clock and reset entry for
 DRP-AI
Message-ID: <202501070453.pzWqNQZr-lkp@intel.com>
References: <20250104175346.656352-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250104175346.656352-1-prabhakar.mahadev-lad.rj@bp.renesas.com>

Hi Prabhakar,

kernel test robot noticed the following build warnings:

[auto build test WARNING on geert-renesas-drivers/renesas-clk]
[also build test WARNING on clk/clk-next linus/master v6.13-rc6 next-20250106]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Prabhakar/clk-renesas-r9a07g044-Add-clock-and-reset-entry-for-DRP-AI/20250105-015708
base:   https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git renesas-clk
patch link:    https://lore.kernel.org/r/20250104175346.656352-1-prabhakar.mahadev-lad.rj%40bp.renesas.com
patch subject: [PATCH] clk: renesas: r9a07g044: Add clock and reset entry for DRP-AI
config: mips-randconfig-r073-20250107 (https://download.01.org/0day-ci/archive/20250107/202501070453.pzWqNQZr-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250107/202501070453.pzWqNQZr-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501070453.pzWqNQZr-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/clk/renesas/r9a07g044-cpg.c:97:35: warning: unused variable 'dtable_4_32' [-Wunused-const-variable]
      97 | static const struct clk_div_table dtable_4_32[] = {
         |                                   ^~~~~~~~~~~
   1 warning generated.


vim +/dtable_4_32 +97 drivers/clk/renesas/r9a07g044-cpg.c

    96	
  > 97	static const struct clk_div_table dtable_4_32[] = {
    98		{3, 4},
    99		{4, 5},
   100		{5, 6},
   101		{6, 7},
   102		{7, 8},
   103		{8, 9},
   104		{9, 10},
   105		{10, 11},
   106		{11, 12},
   107		{12, 13},
   108		{13, 14},
   109		{14, 15},
   110		{15, 16},
   111		{16, 17},
   112		{17, 18},
   113		{18, 19},
   114		{19, 20},
   115		{20, 21},
   116		{21, 22},
   117		{22, 23},
   118		{23, 24},
   119		{24, 25},
   120		{25, 26},
   121		{26, 27},
   122		{27, 28},
   123		{28, 29},
   124		{29, 30},
   125		{30, 31},
   126		{31, 32},
   127		{0, 0},
   128	};
   129	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

