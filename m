Return-Path: <linux-renesas-soc+bounces-19753-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CB73B158F0
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 30 Jul 2025 08:27:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B842A3B1BCF
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 30 Jul 2025 06:26:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CD1401E8326;
	Wed, 30 Jul 2025 06:27:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Tjgbyh/M"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E9612629D;
	Wed, 30 Jul 2025 06:27:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753856843; cv=none; b=oj0aLZKwPv9FvwN4mMxtelqqWoiMpNcBZ2KjcuZRmWArZcrotyh+/UTuevNBQxKIcLDuupX1/y2mbozUBQyT3JYDYxSlDA75B1EYBGPXJT7yFBrWJ3WEqxboFFxTh9D0pgUQ2obGzLycgthJd+X1KTUgxMMCqXdPWHw7ULj4Y1s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753856843; c=relaxed/simple;
	bh=fmG8on2z6yzv097Owu47Z8r1fW9cEKDPaju+MlSxgZg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dX37MKJ3SeSVUDgw1wftT1diyoTWDj4y2ujUkcUaFLaqjGye8QXbLrLZtByhVcrHI1yYyPE8HXqbneyyDi2Xh/IzHN5IGEN+2JiostE4McihDwDLTEEmeqInM2J2krYfecAaq3e8kACO253Mlb67/9ezk6iQzWos2hA/mWMjGRc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Tjgbyh/M; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1753856842; x=1785392842;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=fmG8on2z6yzv097Owu47Z8r1fW9cEKDPaju+MlSxgZg=;
  b=Tjgbyh/ML0WCfchnJ5RgN6mn6IP0f28Gi6z10WSM0oUN+f3g3WVXSbBm
   gFF0djQFajOgPYd7vozVno3GgdoM8377KSU9fWfGiSo22tPpu6FW8O9YL
   cTei8jl+3ruqfWTq/Jt/0oVQCEGPL8CwBNGFj1XhOQv5WIan35N1dmE/5
   WnMouFAOAFZiAm1Rl7j2p329VatJ00I0G31StfSrWp61/Ixtn6qKE6PVp
   locCqoGo6mfZamWjx+78KhtxTNLGkFkGaW7ipIXayfkggUfp1g9pf6vsj
   bQwtxt/WcJChFha+x7xUtHeLCfpBL8qVUF+rhJtL+oTD/6B9ZHtnbY/NP
   A==;
X-CSE-ConnectionGUID: U6X/7lfHSXa0A2pSd3EUIQ==
X-CSE-MsgGUID: pJg8sfuySSq+u1EF1BPP5Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11506"; a="59790316"
X-IronPort-AV: E=Sophos;i="6.16,350,1744095600"; 
   d="scan'208";a="59790316"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Jul 2025 23:27:21 -0700
X-CSE-ConnectionGUID: jOBEbNJVTGO3S51PEZVkfg==
X-CSE-MsgGUID: 4QSs1WsVS6SrH2nUopNmEQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,350,1744095600"; 
   d="scan'208";a="163685308"
Received: from lkp-server01.sh.intel.com (HELO 160750d4a34c) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 29 Jul 2025 23:27:18 -0700
Received: from kbuild by 160750d4a34c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uh0HT-00026q-2N;
	Wed, 30 Jul 2025 06:27:15 +0000
Date: Wed, 30 Jul 2025 14:27:09 +0800
From: kernel test robot <lkp@intel.com>
To: Biju <biju.das.au@gmail.com>,
	Wolfram Sang <wsa-dev@sang-engineering.com>,
	Ulf Hansson <ulf.hansson@linaro.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Biju Das <biju.das.jz@bp.renesas.com>, linux-mmc@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: Re: [PATCH v2 1/2] mmc: tmio: Add 64-bit read/write support for
 SD_BUF0 in polling mode
Message-ID: <202507301421.AmWhOZBk-lkp@intel.com>
References: <20250727160731.106312-2-biju.das.jz@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250727160731.106312-2-biju.das.jz@bp.renesas.com>

Hi Biju,

kernel test robot noticed the following build errors:

[auto build test ERROR on linus/master]
[also build test ERROR on ulf-hansson-mmc-mirror/next v6.16 next-20250729]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Biju/mmc-tmio-Add-64-bit-read-write-support-for-SD_BUF0-in-polling-mode/20250728-001022
base:   linus/master
patch link:    https://lore.kernel.org/r/20250727160731.106312-2-biju.das.jz%40bp.renesas.com
patch subject: [PATCH v2 1/2] mmc: tmio: Add 64-bit read/write support for SD_BUF0 in polling mode
config: powerpc64-randconfig-001-20250730 (https://download.01.org/0day-ci/archive/20250730/202507301421.AmWhOZBk-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 78c460bbe8f1fc17e2e66b37edf419ccecbfecba)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250730/202507301421.AmWhOZBk-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202507301421.AmWhOZBk-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from drivers/mmc/host/uniphier-sd.c:21:
>> drivers/mmc/host/tmio_mmc.h:249:2: error: call to undeclared function 'ioread64_rep'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     249 |         ioread64_rep(host->ctl + (addr << host->bus_shift), buf, count);
         |         ^
>> drivers/mmc/host/tmio_mmc.h:255:2: error: call to undeclared function 'iowrite64_rep'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     255 |         iowrite64_rep(host->ctl + (addr << host->bus_shift), buf, count);
         |         ^
   2 errors generated.


vim +/ioread64_rep +249 drivers/mmc/host/tmio_mmc.h

   244	
   245	#ifdef CONFIG_64BIT
   246	static inline void sd_ctrl_read64_rep(struct tmio_mmc_host *host, int addr,
   247					      u64 *buf, int count)
   248	{
 > 249		ioread64_rep(host->ctl + (addr << host->bus_shift), buf, count);
   250	}
   251	
   252	static inline void sd_ctrl_write64_rep(struct tmio_mmc_host *host, int addr,
   253					       const u64 *buf, int count)
   254	{
 > 255		iowrite64_rep(host->ctl + (addr << host->bus_shift), buf, count);
   256	}
   257	#endif
   258	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

