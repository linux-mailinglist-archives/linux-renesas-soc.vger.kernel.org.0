Return-Path: <linux-renesas-soc+bounces-26903-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 24D42D2C8D3
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 16 Jan 2026 07:29:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id DDBAB302AE04
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 16 Jan 2026 06:29:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9164934D929;
	Fri, 16 Jan 2026 06:29:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jUciICLG"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E933346A0D
	for <linux-renesas-soc@vger.kernel.org>; Fri, 16 Jan 2026 06:29:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768544985; cv=none; b=cCz06/B5lqo6BUIPo137PX+sniflF5P2eZDCZGwGB5GxWX/yH/gI0LlV/LjNtCEpfXFfW1hphxEHE2o76F1Est5X+al2ct/KP6m0uAXLbUU7YkrmfaA+gnXCrCsNOsmjakhk5QPFGofntJPEnEALhiK5izwHotz+S9uluxRAQbQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768544985; c=relaxed/simple;
	bh=i5uyaP1Ras7Bff4JSc/Xps1bOUepT9I2pIventfhNfQ=;
	h=Date:From:To:Cc:Subject:Message-ID; b=CWg5eHhNn9Mwso0SVluC7fbVZDN/LglIpJFh1mwqKrIAXbORhurT0LzyKQyw+bCafgNwOPYKDpUb+FD4q4xSFowLVYTuhcpQi6Sl0Kxy72JcCM1xYbqQM56qEH59p7DHeSB+LF/nO5+43mqwKmkybjEWjuYBdrXyXDc7H2tYT5c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jUciICLG; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768544984; x=1800080984;
  h=date:from:to:cc:subject:message-id;
  bh=i5uyaP1Ras7Bff4JSc/Xps1bOUepT9I2pIventfhNfQ=;
  b=jUciICLG9W9LzYAzT5ap5bLZSgDeDHyqLr6wCiuXBrTVmNDIugB8zNTZ
   cnCbBtonqsHt3gahL8lbwm4LzHbSX8kIt7IA2mvqVi4JFa+HhYZ6v/J20
   Kv8SJN15hIM+050wKZq7AqGHSi4up7VUM3KbASqtoWCTW99xuSBa9fMjh
   eK2lW+GkbZ39GxyYcXea1vw3R7uy+kF4fyIWj41bWb6m1fgAkjo5mHV4P
   N6hvd9k7z5bJyjd4/tDZorh2RzPRY8TtCze4kXCJlDjorHNxEpAs/Mb3/
   rWG1JpBkdjvQBD16SO26neX3SUedo+tXU74WKoXSfUDIZySxoCMinjuRB
   Q==;
X-CSE-ConnectionGUID: 0YFpbmrRTNK+DYH/dFbiuA==
X-CSE-MsgGUID: NaBdM270Q4K14HEB+CUlUA==
X-IronPort-AV: E=McAfee;i="6800,10657,11672"; a="95336419"
X-IronPort-AV: E=Sophos;i="6.21,230,1763452800"; 
   d="scan'208";a="95336419"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jan 2026 22:29:44 -0800
X-CSE-ConnectionGUID: pwbqHE/zREe198UKNjs8TA==
X-CSE-MsgGUID: 6poVo42DSES4h0aCJgFgpQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,230,1763452800"; 
   d="scan'208";a="205437733"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 15 Jan 2026 22:29:42 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vgdL1-00000000KTs-1cLC;
	Fri, 16 Jan 2026 06:29:39 +0000
Date: Fri, 16 Jan 2026 14:29:30 +0800
From: kernel test robot <lkp@intel.com>
To: Chris Brandt <chris.brandt@renesas.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-renesas-soc@vger.kernel.org,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Biju Das <biju.das.jz@bp.renesas.com>,
 Hugo Villeneuve <hvilleneuve@dimonoff.com>
Subject: [geert-renesas-drivers:renesas-clk-for-v6.20 21/21]
 rzg2l-cpg.c:undefined reference to `__udivdi3'
Message-ID: <202601161408.8oFa2eE5-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git renesas-clk-for-v6.20
head:   5ef5f78c6635da0be514ea60c3c1cddd61dbf8dc
commit: 5ef5f78c6635da0be514ea60c3c1cddd61dbf8dc [21/21] clk: renesas: rzg2l: Remove DSI clock rate restrictions
config: xtensa-randconfig-002-20260116 (https://download.01.org/0day-ci/archive/20260116/202601161408.8oFa2eE5-lkp@intel.com/config)
compiler: xtensa-linux-gcc (GCC) 15.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260116/202601161408.8oFa2eE5-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601161408.8oFa2eE5-lkp@intel.com/

All errors (new ones prefixed by >>):

   xtensa-linux-ld: drivers/clk/renesas/rzg2l-cpg.o: in function `rzg2l_mod_clock_enable':
>> rzg2l-cpg.c:(.text+0x19cc): undefined reference to `__udivdi3'
   xtensa-linux-ld: drivers/clk/renesas/rzg2l-cpg.o: in function `rzg2l_cpg_get_foutpostdiv_rate':
   rzg2l-cpg.c:(.text+0x1c1d): undefined reference to `__udivdi3'

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for CAN_DEV
   Depends on [n]: NETDEVICES [=n] && CAN [=y]
   Selected by [y]:
   - CAN [=y] && NET [=y]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

