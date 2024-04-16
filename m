Return-Path: <linux-renesas-soc+bounces-4631-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 897468A5F26
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 16 Apr 2024 02:18:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2018C1F21A8A
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 16 Apr 2024 00:18:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 148F917E;
	Tue, 16 Apr 2024 00:18:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="J+8KAREJ"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58117629
	for <linux-renesas-soc@vger.kernel.org>; Tue, 16 Apr 2024 00:18:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713226723; cv=none; b=NzLaYgLcCUzdJdE4YYhH7INkPdko1IKuPylzTJqjt6OBZ0nL90PDbppAVk2kXm5F9svMISyw5rvO70zFk56gDl9VeDfQMo7PvyAouo5Ahh8cbVOYaEItByiLwSv0g45pwO2FCAp4+WtLf8kl/A7YNZWM+0CkBPeOnQQnEsgGrUU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713226723; c=relaxed/simple;
	bh=IP5vSIukHWYNMyncMn3CNq518bpej8EC6jBvrTSdFds=;
	h=Date:From:To:Cc:Subject:Message-ID; b=Eez9Q+FtfvBcz8ozVvXLpnYb9oWsQVxPp1r64XBIXEsnuHFWcdpweJLrNqMqQ4JmgortV4D2olBSsJVmv+HdhDqTENGFcT7pgEwHfMQ9Fvqt13ulNAjPy4SATkNsIspCOMwz1EK1AU4tHyTpT4cmr5FoS91DWFok7IYfTsQ1FnE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=J+8KAREJ; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1713226721; x=1744762721;
  h=date:from:to:cc:subject:message-id;
  bh=IP5vSIukHWYNMyncMn3CNq518bpej8EC6jBvrTSdFds=;
  b=J+8KAREJUXz3MXGhV7hjcIbK4EOMGFoQUmWrRKMNycFBLff4l0HfufgH
   4/izgbTh4EVmEDIEwv4dkmSLhvP5px42PLvLxa8pI0hIPKJ3IYY4HohyB
   NLFL6UXEmlX1WwOz/23b1c2z8Sq6dzZnFrpgP0/pgBWu2mEq/GLHpvX2r
   DPehnMCyawbSfS58qsGNAh+NTckmECs21DoCvDGzJFEBKLGaWExK60NOb
   3Y3tDnJcQbc7lahzmisvAXic417M9/UGeFDkoeL+RzrFVpxT6ieUlD6W8
   FC2pG5K11bl/GriAox0PZIgxO/RL0xUWvyS2pUNaDbuuurjpHqfSCD/e/
   g==;
X-CSE-ConnectionGUID: B09og8cLQSywllvjO3rxHw==
X-CSE-MsgGUID: u1IwJNnBTJq8w0kSWMu8Lg==
X-IronPort-AV: E=McAfee;i="6600,9927,11045"; a="8505791"
X-IronPort-AV: E=Sophos;i="6.07,204,1708416000"; 
   d="scan'208";a="8505791"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Apr 2024 17:18:38 -0700
X-CSE-ConnectionGUID: fjyVKM6pTZ+RKBE5Lx6Jjg==
X-CSE-MsgGUID: RS5JSta6RruIUeEWJcIvqg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,204,1708416000"; 
   d="scan'208";a="22153743"
Received: from unknown (HELO 23c141fc0fd8) ([10.239.97.151])
  by fmviesa009.fm.intel.com with ESMTP; 15 Apr 2024 17:18:37 -0700
Received: from kbuild by 23c141fc0fd8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rwWWw-0004l2-1z;
	Tue, 16 Apr 2024 00:18:34 +0000
Date: Tue, 16 Apr 2024 08:18:31 +0800
From: kernel test robot <lkp@intel.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: linux-renesas-soc@vger.kernel.org
Subject: [geert-renesas-devel:next] BUILD SUCCESS
 f4a6540ae2c417ba0b1173cb30f20b6aa3ff113f
Message-ID: <202404160828.uUdKkHcu-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git next
branch HEAD: f4a6540ae2c417ba0b1173cb30f20b6aa3ff113f  Merge branch 'renesas-dts-for-v6.10' into renesas-next

elapsed time: 728m

configs tested: 174
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig   gcc  
alpha                            allyesconfig   gcc  
alpha                               defconfig   gcc  
arc                              allmodconfig   gcc  
arc                               allnoconfig   gcc  
arc                              allyesconfig   gcc  
arc                                 defconfig   gcc  
arc                   randconfig-001-20240416   gcc  
arc                   randconfig-002-20240416   gcc  
arm                              allmodconfig   gcc  
arm                               allnoconfig   clang
arm                              allyesconfig   gcc  
arm                                 defconfig   clang
arm                           imxrt_defconfig   clang
arm                            mmp2_defconfig   gcc  
arm                           omap1_defconfig   gcc  
arm                         orion5x_defconfig   clang
arm                             pxa_defconfig   gcc  
arm                   randconfig-001-20240416   clang
arm                   randconfig-002-20240416   clang
arm                   randconfig-003-20240416   gcc  
arm                   randconfig-004-20240416   clang
arm64                            allmodconfig   clang
arm64                             allnoconfig   gcc  
arm64                               defconfig   gcc  
arm64                 randconfig-001-20240416   gcc  
arm64                 randconfig-002-20240416   clang
arm64                 randconfig-003-20240416   gcc  
arm64                 randconfig-004-20240416   gcc  
csky                             allmodconfig   gcc  
csky                              allnoconfig   gcc  
csky                             allyesconfig   gcc  
csky                                defconfig   gcc  
csky                  randconfig-001-20240416   gcc  
csky                  randconfig-002-20240416   gcc  
hexagon                          allmodconfig   clang
hexagon                           allnoconfig   clang
hexagon                          allyesconfig   clang
hexagon                             defconfig   clang
hexagon               randconfig-001-20240416   clang
hexagon               randconfig-002-20240416   clang
i386                             allmodconfig   gcc  
i386                              allnoconfig   gcc  
i386                             allyesconfig   gcc  
i386         buildonly-randconfig-001-20240415   clang
i386         buildonly-randconfig-002-20240415   gcc  
i386         buildonly-randconfig-003-20240415   gcc  
i386         buildonly-randconfig-004-20240415   gcc  
i386         buildonly-randconfig-005-20240415   gcc  
i386         buildonly-randconfig-006-20240415   clang
i386                                defconfig   clang
i386                  randconfig-001-20240415   gcc  
i386                  randconfig-002-20240415   clang
i386                  randconfig-003-20240415   gcc  
i386                  randconfig-004-20240415   gcc  
i386                  randconfig-005-20240415   gcc  
i386                  randconfig-006-20240415   clang
i386                  randconfig-011-20240415   gcc  
i386                  randconfig-012-20240415   clang
i386                  randconfig-013-20240415   gcc  
i386                  randconfig-014-20240415   gcc  
i386                  randconfig-015-20240415   gcc  
i386                  randconfig-016-20240415   gcc  
loongarch                        allmodconfig   gcc  
loongarch                         allnoconfig   gcc  
loongarch                           defconfig   gcc  
loongarch             randconfig-001-20240416   gcc  
loongarch             randconfig-002-20240416   gcc  
m68k                             allmodconfig   gcc  
m68k                              allnoconfig   gcc  
m68k                             allyesconfig   gcc  
m68k                                defconfig   gcc  
microblaze                       allmodconfig   gcc  
microblaze                        allnoconfig   gcc  
microblaze                       allyesconfig   gcc  
microblaze                          defconfig   gcc  
mips                              allnoconfig   gcc  
mips                             allyesconfig   gcc  
mips                            gpr_defconfig   clang
mips                           jazz_defconfig   clang
mips                         rt305x_defconfig   clang
nios2                            allmodconfig   gcc  
nios2                             allnoconfig   gcc  
nios2                            allyesconfig   gcc  
nios2                               defconfig   gcc  
nios2                 randconfig-001-20240416   gcc  
nios2                 randconfig-002-20240416   gcc  
openrisc                          allnoconfig   gcc  
openrisc                         allyesconfig   gcc  
openrisc                            defconfig   gcc  
parisc                           allmodconfig   gcc  
parisc                            allnoconfig   gcc  
parisc                           allyesconfig   gcc  
parisc                              defconfig   gcc  
parisc                randconfig-001-20240416   gcc  
parisc                randconfig-002-20240416   gcc  
parisc64                            defconfig   gcc  
powerpc                    adder875_defconfig   gcc  
powerpc                          allmodconfig   gcc  
powerpc                           allnoconfig   gcc  
powerpc                          allyesconfig   clang
powerpc                     ep8248e_defconfig   gcc  
powerpc                       maple_defconfig   clang
powerpc               randconfig-001-20240416   clang
powerpc               randconfig-002-20240416   gcc  
powerpc               randconfig-003-20240416   clang
powerpc                  storcenter_defconfig   gcc  
powerpc                     taishan_defconfig   clang
powerpc                     tqm5200_defconfig   gcc  
powerpc                     tqm8555_defconfig   clang
powerpc64             randconfig-001-20240416   gcc  
powerpc64             randconfig-002-20240416   gcc  
powerpc64             randconfig-003-20240416   gcc  
riscv                            allmodconfig   clang
riscv                             allnoconfig   gcc  
riscv                            allyesconfig   clang
riscv                               defconfig   clang
riscv                 randconfig-001-20240416   gcc  
riscv                 randconfig-002-20240416   gcc  
s390                             allmodconfig   clang
s390                              allnoconfig   clang
s390                             allyesconfig   gcc  
s390                                defconfig   clang
s390                  randconfig-001-20240416   clang
s390                  randconfig-002-20240416   gcc  
sh                               allmodconfig   gcc  
sh                                allnoconfig   gcc  
sh                               allyesconfig   gcc  
sh                                  defconfig   gcc  
sh                          r7785rp_defconfig   gcc  
sh                    randconfig-001-20240416   gcc  
sh                    randconfig-002-20240416   gcc  
sparc                            allmodconfig   gcc  
sparc                             allnoconfig   gcc  
sparc                               defconfig   gcc  
sparc64                          allmodconfig   gcc  
sparc64                          allyesconfig   gcc  
sparc64                             defconfig   gcc  
um                               allmodconfig   clang
um                                allnoconfig   clang
um                               allyesconfig   gcc  
um                                  defconfig   clang
um                             i386_defconfig   gcc  
um                           x86_64_defconfig   clang
x86_64                            allnoconfig   clang
x86_64                           allyesconfig   clang
x86_64       buildonly-randconfig-001-20240416   gcc  
x86_64       buildonly-randconfig-002-20240416   gcc  
x86_64       buildonly-randconfig-003-20240416   gcc  
x86_64       buildonly-randconfig-004-20240416   clang
x86_64       buildonly-randconfig-005-20240416   gcc  
x86_64       buildonly-randconfig-006-20240416   clang
x86_64                              defconfig   gcc  
x86_64                randconfig-001-20240416   clang
x86_64                randconfig-002-20240416   clang
x86_64                randconfig-003-20240416   gcc  
x86_64                randconfig-004-20240416   clang
x86_64                randconfig-005-20240416   clang
x86_64                randconfig-006-20240416   gcc  
x86_64                randconfig-011-20240416   gcc  
x86_64                randconfig-012-20240416   clang
x86_64                randconfig-013-20240416   clang
x86_64                randconfig-014-20240416   clang
x86_64                randconfig-015-20240416   clang
x86_64                randconfig-016-20240416   gcc  
x86_64                randconfig-071-20240416   clang
x86_64                randconfig-072-20240416   clang
x86_64                randconfig-073-20240416   clang
x86_64                randconfig-074-20240416   clang
x86_64                randconfig-075-20240416   gcc  
x86_64                randconfig-076-20240416   gcc  
x86_64                          rhel-8.3-rust   clang
xtensa                            allnoconfig   gcc  
xtensa                       common_defconfig   gcc  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

