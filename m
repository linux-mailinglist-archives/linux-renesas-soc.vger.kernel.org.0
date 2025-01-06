Return-Path: <linux-renesas-soc+bounces-11862-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 616E2A01E13
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  6 Jan 2025 04:11:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id EFFC53A0544
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  6 Jan 2025 03:11:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CC1FE155326;
	Mon,  6 Jan 2025 03:11:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cx8lkfNt"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1574478F2F;
	Mon,  6 Jan 2025 03:11:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736133062; cv=none; b=lT894Ko1h3rUO8BCTnufhW31Aqz/JC4xYnFLx/1JVvBaQL5zeGJa6Fb0xzAc5IZ67r1UisIHku3YOGKr41JQV3sMGBkvnpoCHmwb4AwE0PBGsGHXbpml6Aaki06hnkqUkhdjOhN5HpK+6nLbGtj3fNqdzpS5Zj6Sd1ZV6aYUyAo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736133062; c=relaxed/simple;
	bh=BGHJPAGUmaDxq3GKXC+GLKFqJprVvTr3ybxTHqO3EEk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Wma/FTOIljgHOtcdsWaDiBMUfb0RpIN9OjbXn4XB8G9+rsCHqXU1M30kiNc27pjnz0I7uwCKlqR/ecne0jgShMXR6pNwJIje5SHGX1eSnjqrvOv//sUqnljtnVzClh728eS6yZygkPEbptN121UQ+Oc1i/FKumpt7m2FP3l9e8g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=cx8lkfNt; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1736133061; x=1767669061;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=BGHJPAGUmaDxq3GKXC+GLKFqJprVvTr3ybxTHqO3EEk=;
  b=cx8lkfNtlO5HA0V+cc3gPA1zBPS/ygt7kjeQ4Cr7FFlqGw/gDDBEEH0S
   wL79aAxSH66vKzhbB3ZGKyH6ghZTdtt2dgDe3I3sCJnY6w0OdKe/u0DWd
   371NBalBKoH4I9GYXGF922L1h+nYlqQt7LMjhgS0X60Ez9iE2xI8xa2R+
   GnFBAoboWbScDzEe+rkweM9NrFwYUqVuD2nbHh8mnmWrpC7vIQjvlcoWF
   fZOzb+sT9QR49GuV9dUcDBPagXtSlzgDYPa9MISmAFxBOCqc/HxGSN7wX
   +xOL9pcc0pCM/V8kWctM7D8l71sgQ3HZX01+GjCfYkWX3gr2HPSLul30/
   w==;
X-CSE-ConnectionGUID: S3h8CLjqTA+xPHlKf4NLmw==
X-CSE-MsgGUID: DgEJ3C8RQ0mLcpwmbLHf7g==
X-IronPort-AV: E=McAfee;i="6700,10204,11306"; a="40045773"
X-IronPort-AV: E=Sophos;i="6.12,292,1728975600"; 
   d="scan'208";a="40045773"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Jan 2025 19:11:00 -0800
X-CSE-ConnectionGUID: RaTZywhFRLaPo7RRqvOO+w==
X-CSE-MsgGUID: +IbA2OdQQFqI6jJhZzw2Ug==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,292,1728975600"; 
   d="scan'208";a="102846774"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 05 Jan 2025 19:10:38 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tUdVf-000CCN-24;
	Mon, 06 Jan 2025 03:10:31 +0000
Date: Mon, 6 Jan 2025 11:10:02 +0800
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
Message-ID: <202501061001.6iClUTxN-lkp@intel.com>
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
[also build test WARNING on clk/clk-next linus/master v6.13-rc6 next-20241220]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Prabhakar/clk-renesas-r9a07g044-Add-clock-and-reset-entry-for-DRP-AI/20250105-015708
base:   https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git renesas-clk
patch link:    https://lore.kernel.org/r/20250104175346.656352-1-prabhakar.mahadev-lad.rj%40bp.renesas.com
patch subject: [PATCH] clk: renesas: r9a07g044: Add clock and reset entry for DRP-AI
config: nios2-randconfig-r052-20250106 (https://download.01.org/0day-ci/archive/20250106/202501061001.6iClUTxN-lkp@intel.com/config)
compiler: nios2-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250106/202501061001.6iClUTxN-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501061001.6iClUTxN-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/clk/renesas/r9a07g044-cpg.c:97:35: warning: 'dtable_4_32' defined but not used [-Wunused-const-variable=]
      97 | static const struct clk_div_table dtable_4_32[] = {
         |                                   ^~~~~~~~~~~


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

