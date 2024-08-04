Return-Path: <linux-renesas-soc+bounces-7718-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id BB065946F48
	for <lists+linux-renesas-soc@lfdr.de>; Sun,  4 Aug 2024 16:20:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6F3AA1F21103
	for <lists+linux-renesas-soc@lfdr.de>; Sun,  4 Aug 2024 14:20:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 98D9C4D8B8;
	Sun,  4 Aug 2024 14:20:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="g/Jjuqi3"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC56A1CA9F
	for <linux-renesas-soc@vger.kernel.org>; Sun,  4 Aug 2024 14:20:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722781225; cv=none; b=GnfYXWt3B3wdhWECCbD4HjYLRlqX0h/weO5e2AsjN9/6uqAV+diN4O7QFcnPCcBO4wBwXQrSjTXCg2K4vQDSFNh4hlF9k0tdtFnNRACEMed4t711VhEH7EoaxNTdqmX0VV46coPopi+oJmqiQ1T/IukCRAUJdKYvRuAhU56C4hQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722781225; c=relaxed/simple;
	bh=iVl3jV2GYEuVOmZsIV/I3gXt7gZ8wDTJGFeA+XWGsD4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ETds7Ne9TOcMizAbzZSiyd3O+bsGSqn+OrPnObCLATrtbRzk1FSwEszTCZDYgCx01gpmeKvGBDHvirVoXvWMjeAfdICEF4oobXOK8NkJnmK6bR9ixXrKiqh/zNRYPT+TZeoFPXer7k0KpyNITGYnfafq2r4YUiieZNSzMw+AOEE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=g/Jjuqi3; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1722781224; x=1754317224;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=iVl3jV2GYEuVOmZsIV/I3gXt7gZ8wDTJGFeA+XWGsD4=;
  b=g/Jjuqi3Niy80ZfZ0lfBphriClpcu5nWrMH3Yheqdo8xeqPbigkqIRKb
   mKeSx7S/KIZL2bW/ueBTPTYv0qKk0irGnAB8md+Nzx5tpAdqB/6dFlmhn
   76yM4Xh+8A4LRFQDGHWHLlzuacJTDMu1xbgs0JfxJE5fxWXTRPwBgTt3c
   wXggW1uIlZxj/ExHThqgjYa8OL1dt61OW8XHN+K+xVMzneo4TAHW+k4jq
   O6Oh+Fr2HhZ8B4urJ52BteFD0JPySQDT3VPIv+HQ0GnsClN1H452Fuk//
   nTC2bI2BK+IUIENrzHR1KGscqgyWF89WmVfKFaoe5c/03dBfyos87NJ/V
   Q==;
X-CSE-ConnectionGUID: TPr+spKsRB2rMbsVmIRGTg==
X-CSE-MsgGUID: QhoucosuRiWrNp99Txh5nQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11154"; a="32118861"
X-IronPort-AV: E=Sophos;i="6.09,262,1716274800"; 
   d="scan'208";a="32118861"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Aug 2024 07:20:24 -0700
X-CSE-ConnectionGUID: TSPw0bo2T8qBA0ry73Xvgw==
X-CSE-MsgGUID: oGdbIRdhQQWbdNDX4ZVQUA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,262,1716274800"; 
   d="scan'208";a="55788295"
Received: from unknown (HELO b6bf6c95bbab) ([10.239.97.151])
  by orviesa010.jf.intel.com with ESMTP; 04 Aug 2024 07:20:22 -0700
Received: from kbuild by b6bf6c95bbab with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sac5r-0001T4-2F;
	Sun, 04 Aug 2024 14:20:19 +0000
Date: Sun, 4 Aug 2024 22:19:24 +0800
From: kernel test robot <lkp@intel.com>
To: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-renesas-soc@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [geert-renesas-drivers:renesas-clk-for-v6.12 29/29] sparc-linux-ld:
 drivers/clk/renesas/rzv2h-cpg.o:undefined reference to `r9a09g057_cpg_info'
Message-ID: <202408042234.WAYccHy6-lkp@intel.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git renesas-clk-for-v6.12
head:   42b54d52ecb7a81998592c2b40f8a963e82ed02e
commit: 42b54d52ecb7a81998592c2b40f8a963e82ed02e [29/29] clk: renesas: Add RZ/V2H(P) CPG driver
config: sparc-randconfig-r111-20240804 (https://download.01.org/0day-ci/archive/20240804/202408042234.WAYccHy6-lkp@intel.com/config)
compiler: sparc-linux-gcc (GCC) 14.1.0
reproduce: (https://download.01.org/0day-ci/archive/20240804/202408042234.WAYccHy6-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202408042234.WAYccHy6-lkp@intel.com/

All errors (new ones prefixed by >>):

>> sparc-linux-ld: drivers/clk/renesas/rzv2h-cpg.o:(.rodata+0xc0): undefined reference to `r9a09g057_cpg_info'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

