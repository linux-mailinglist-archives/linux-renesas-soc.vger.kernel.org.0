Return-Path: <linux-renesas-soc+bounces-7717-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A0B95946BEB
	for <lists+linux-renesas-soc@lfdr.de>; Sun,  4 Aug 2024 03:32:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 13DE7B20E0A
	for <lists+linux-renesas-soc@lfdr.de>; Sun,  4 Aug 2024 01:32:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B8D137F8;
	Sun,  4 Aug 2024 01:32:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="V1bpCNjX"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF72AA38
	for <linux-renesas-soc@vger.kernel.org>; Sun,  4 Aug 2024 01:32:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722735163; cv=none; b=ShbBljsZVbtK1yvxGKf7i2UyTPQ9j80ObOUPSW9SDicAHiSMHawjkGx7+BMHHBdUUldftXEjN2UAP2dtEwMavElNRhXw16jtDpdbo/geQIuasKfRuv+s3U45EgjVeryw4ja0sTezJv1vbWOAWw6nKxRIIrPDifVdbDPQGVEjJ0E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722735163; c=relaxed/simple;
	bh=2cTOlLqeYWF+ZMmqGMSR2peUZcdQnn/9WMOR4a7IyYU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=EqIJ1y8CkWxbLKyO982zavVg+RCuYCMR4OOAGVRLqXyB38WbytTi/kuRzQPzPUi9ps9PdSUcp8ZNvF/lDia6YZhQiZzbLJaWpSkUaU1GTbvu7tZRaQlMQjGKcxCF/spPF2AB22az5k3VAfMXyou6mrmMrdD1n8RBa9DamqHKfFY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=V1bpCNjX; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1722735162; x=1754271162;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=2cTOlLqeYWF+ZMmqGMSR2peUZcdQnn/9WMOR4a7IyYU=;
  b=V1bpCNjX8U/vJ6P9SqOcLUSUEl7bmXpVvwJLjubqHoBfaV5wDVU4nCkS
   N25mcah+C2YmU5Bf4tdo4uu1CPFdkbG6iCXwqMR/crZi4P204RceRUFhn
   a+vBSCPixSGh5xzMWhthBW9irkZiWjzArp4+fjJvtyh0p9nRrr/xLYnkR
   Nl0RdANR9ZFH2e+jAVUGh6HTqmJ3hNhcgoI0L2nZ9sM5EZrG8PUAW8zF4
   ImgvROXu56c3xgc9M73aPPvT/xHwx7hAi+liqaQ4bmjZ0ZIzB4R+bmifZ
   nxoETdiwym8JAAaQCfXgAx1ngY/kM1zBemELsalG05Y0jw73NSgf+wvRF
   Q==;
X-CSE-ConnectionGUID: bOIV0VYhTkC26G5NXgMdog==
X-CSE-MsgGUID: 0palE0wWRQiNK7vzhSUFCw==
X-IronPort-AV: E=McAfee;i="6700,10204,11153"; a="32127184"
X-IronPort-AV: E=Sophos;i="6.09,261,1716274800"; 
   d="scan'208";a="32127184"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Aug 2024 18:32:41 -0700
X-CSE-ConnectionGUID: lONrNZcmQtm021hi98KLOA==
X-CSE-MsgGUID: Uq0DgxgkQRuw6N2KVSX9HA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,261,1716274800"; 
   d="scan'208";a="55753100"
Received: from unknown (HELO b6bf6c95bbab) ([10.239.97.151])
  by fmviesa008.fm.intel.com with ESMTP; 03 Aug 2024 18:32:40 -0700
Received: from kbuild by b6bf6c95bbab with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1saQ6w-00013k-0X;
	Sun, 04 Aug 2024 01:32:38 +0000
Date: Sun, 4 Aug 2024 09:31:53 +0800
From: kernel test robot <lkp@intel.com>
To: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-renesas-soc@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [geert-renesas-drivers:renesas-clk-for-v6.12 29/29] /usr/bin/ld:
 drivers/clk/renesas/rzv2h-cpg.o:undefined reference to `r9a09g057_cpg_info'
Message-ID: <202408040932.SqrqyXGU-lkp@intel.com>
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
config: um-randconfig-r122-20240803 (https://download.01.org/0day-ci/archive/20240804/202408040932.SqrqyXGU-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240804/202408040932.SqrqyXGU-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202408040932.SqrqyXGU-lkp@intel.com/

All errors (new ones prefixed by >>):

   /usr/bin/ld: warning: .tmp_vmlinux1 has a LOAD segment with RWX permissions
>> /usr/bin/ld: drivers/clk/renesas/rzv2h-cpg.o:(.rodata+0xc0): undefined reference to `r9a09g057_cpg_info'
   clang-14: error: linker command failed with exit code 1 (use -v to see invocation)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

