Return-Path: <linux-renesas-soc+bounces-1248-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AC3E381E1C3
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 25 Dec 2023 18:35:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D0CF81C211B8
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 25 Dec 2023 17:35:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E52EF537EB;
	Mon, 25 Dec 2023 17:35:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="IdRCpA+x"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC30552F91
	for <linux-renesas-soc@vger.kernel.org>; Mon, 25 Dec 2023 17:35:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1703525716; x=1735061716;
  h=date:from:to:cc:subject:message-id;
  bh=szcQmaOBSkp3yzVCQ4mX5CjDbxdWqwlT23NCtO+OwV8=;
  b=IdRCpA+xKzaxg+RniQAk3MS671fcGJsgEiJ6OTm9/kaNxQRhrZjQ/vlp
   uwsp+JsYsQv9Jzduhr0qJiUxCNBihYi1OxE7uJIM1+7iZXOb9zQiCefAo
   vkvkK5xCqmjRWu3W3JQRWKOsC7NW4QRIZ5x8qAjFZQJpop98VTfL+tqHG
   6aeOo7uK8eWdST1u0CzIGDp5ZsLgHy9AzdDO22fpGvYWTZjo4DXzQGSNm
   Hv+2XXaP0A0mTDI9NAjLQpiAIPr4cFOtd6Grt1dawykocSW8C3DYBH4pb
   YCIv+scl3GTrJO7Kmq192yFwZjjciXBaRUpyRndBmpB79OHeYfO3Clbuo
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10934"; a="9824119"
X-IronPort-AV: E=Sophos;i="6.04,303,1695711600"; 
   d="scan'208";a="9824119"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Dec 2023 09:35:15 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.04,303,1695711600"; 
   d="scan'208";a="12245421"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by fmviesa002.fm.intel.com with ESMTP; 25 Dec 2023 09:35:14 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rHorA-000DWG-0N;
	Mon, 25 Dec 2023 17:35:12 +0000
Date: Tue, 26 Dec 2023 01:34:59 +0800
From: kernel test robot <lkp@intel.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: linux-renesas-soc@vger.kernel.org
Subject: [geert-renesas-devel:master] BUILD SUCCESS
 db69966489aabddb179fc8aced341e2a4283c272
Message-ID: <202312260156.Q4NlsfAZ-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git master
branch HEAD: db69966489aabddb179fc8aced341e2a4283c272  Merge tag 'v6.7-rc7' into renesas-devel

elapsed time: 1765m

configs tested: 81
configs skipped: 0

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                            allyesconfig   gcc  
alpha                               defconfig   gcc  
arc                              allmodconfig   gcc  
arc                              allyesconfig   gcc  
arc                   randconfig-001-20231225   gcc  
arc                   randconfig-002-20231225   gcc  
arm                              allmodconfig   gcc  
arm                           omap1_defconfig   clang
arm                   randconfig-001-20231225   clang
arm                   randconfig-002-20231225   clang
arm                   randconfig-003-20231225   clang
arm                   randconfig-004-20231225   clang
arm                        spear6xx_defconfig   gcc  
arm64                 randconfig-001-20231225   clang
arm64                 randconfig-002-20231225   clang
arm64                 randconfig-003-20231225   clang
arm64                 randconfig-004-20231225   clang
csky                  randconfig-001-20231225   gcc  
csky                  randconfig-002-20231225   gcc  
i386                             allmodconfig   clang
i386                              allnoconfig   clang
i386                             allyesconfig   clang
i386         buildonly-randconfig-001-20231225   clang
i386         buildonly-randconfig-002-20231225   clang
i386         buildonly-randconfig-003-20231225   clang
i386         buildonly-randconfig-004-20231225   clang
i386         buildonly-randconfig-005-20231225   clang
i386         buildonly-randconfig-006-20231225   clang
i386                                defconfig   gcc  
i386                  randconfig-001-20231225   clang
i386                  randconfig-002-20231225   clang
i386                  randconfig-003-20231225   clang
i386                  randconfig-004-20231225   clang
i386                  randconfig-005-20231225   clang
i386                  randconfig-006-20231225   clang
i386                  randconfig-011-20231225   gcc  
i386                  randconfig-012-20231225   gcc  
i386                  randconfig-013-20231225   gcc  
i386                  randconfig-014-20231225   gcc  
i386                  randconfig-015-20231225   gcc  
i386                  randconfig-016-20231225   gcc  
loongarch                        allmodconfig   gcc  
m68k                             allmodconfig   gcc  
m68k                             allyesconfig   gcc  
m68k                         amcore_defconfig   gcc  
m68k                            mac_defconfig   gcc  
microblaze                       allmodconfig   gcc  
microblaze                       allyesconfig   gcc  
mips                             allyesconfig   gcc  
mips                        maltaup_defconfig   clang
nios2                         10m50_defconfig   gcc  
nios2                            allmodconfig   gcc  
nios2                            allyesconfig   gcc  
openrisc                         allyesconfig   gcc  
parisc                           allmodconfig   gcc  
parisc                           allyesconfig   gcc  
powerpc                          allmodconfig   clang
powerpc                          g5_defconfig   clang
powerpc                 mpc837x_rdb_defconfig   gcc  
powerpc                     tqm8541_defconfig   gcc  
powerpc64                        alldefconfig   gcc  
riscv                          rv32_defconfig   clang
s390                             allmodconfig   gcc  
s390                             allyesconfig   gcc  
sh                               allmodconfig   gcc  
sh                               allyesconfig   gcc  
sh                          rsk7264_defconfig   gcc  
sh                   rts7751r2dplus_defconfig   gcc  
sh                           se7722_defconfig   gcc  
sh                           se7750_defconfig   gcc  
sparc                            allmodconfig   gcc  
sparc                       sparc32_defconfig   gcc  
sparc64                          allmodconfig   gcc  
sparc64                          allyesconfig   gcc  
um                               allmodconfig   clang
um                               allyesconfig   clang
x86_64                            allnoconfig   gcc  
x86_64                           allyesconfig   clang
x86_64                              defconfig   gcc  
x86_64                          rhel-8.3-rust   clang
xtensa                  audio_kc705_defconfig   gcc  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

