Return-Path: <linux-renesas-soc+bounces-4849-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 7ABF78AF801
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 23 Apr 2024 22:28:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E1E991F2478A
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 23 Apr 2024 20:28:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3890A5B1E3;
	Tue, 23 Apr 2024 20:28:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UR+46p3b"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52CE6142627
	for <linux-renesas-soc@vger.kernel.org>; Tue, 23 Apr 2024 20:28:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713904128; cv=none; b=uznOrmg6L3PnaP1DxRZfnyFUEi+LtA2Mb6I3lRwwhbzAHvhrmePSbWu7XcUVU6UZ99CfKnn/9SmXjwhoQwqxGv/7N2C6FfGs0NjEpEjWfXN0QaiLSTV7PZplF9z7qctmzP/IX+n9WNjpays29z0XZwbr4OxgihfsZGuF2r6QF/A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713904128; c=relaxed/simple;
	bh=yggNE2sIlMa5Q+RxzI4vuZSyZyoaoiVbJlE818CT+jE=;
	h=Date:From:To:Cc:Subject:Message-ID; b=QtzwqMqgEE3NJRjI0rHj6ZS/r4Jub6tl3mJUCprtfY7ChBHm/wh8oFsz02orkUTDyUxwfEbdeoO3a+RJaF5QfUQiKxWeiI4ts1aL5iFCysIAE3SBQEUq9k8JsMCj67obmWzgoLj/idhZpez7UfTUFrwCErtxuCmjsjwmlMbAKDI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=UR+46p3b; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1713904125; x=1745440125;
  h=date:from:to:cc:subject:message-id;
  bh=yggNE2sIlMa5Q+RxzI4vuZSyZyoaoiVbJlE818CT+jE=;
  b=UR+46p3bdq18bCPeP1eg+9aaSy2+PSQY77ck1j6c4EiQ32DuA7qGEQnb
   l7Veq/DAhWJeh8rMGkDRGMZfuHkaEU8zqxS3gujJcNNpGfug3zLDRJoK0
   c26ZzBC7tFUHeZaLgG7kVkfYYFkxSd+4LwLncVB5ob7qXWjhtGzbMDdMp
   X1Aop5svA0UqD6qrMPC2FwU1IXSlH3CvlZhjmC5QSi8oDr2vjWf/P56Rw
   ZY36ZIzzta5cnzs0yWFcV3Yh4joWIyj6NlTTXeml1hq+mcvfGt0UIZzV9
   rRJa9MAsoPzUgpHLnukUXjve/2mv5oGplISJ393zP13dye77wNvJKuIxf
   g==;
X-CSE-ConnectionGUID: QCY2MwJ6TPSPihrG+9xzOg==
X-CSE-MsgGUID: cz+FlAp7TSGIs9fgjcVFoA==
X-IronPort-AV: E=McAfee;i="6600,9927,11053"; a="9728258"
X-IronPort-AV: E=Sophos;i="6.07,222,1708416000"; 
   d="scan'208";a="9728258"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Apr 2024 13:28:45 -0700
X-CSE-ConnectionGUID: +x1dy2PxRYedyrT+4n+mmg==
X-CSE-MsgGUID: CkKL8PXWSn+rOOzpW6JkLg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,222,1708416000"; 
   d="scan'208";a="47755881"
Received: from lkp-server01.sh.intel.com (HELO e434dd42e5a1) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 23 Apr 2024 13:28:43 -0700
Received: from kbuild by e434dd42e5a1 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rzMkr-0000VU-1n;
	Tue, 23 Apr 2024 20:28:41 +0000
Date: Wed, 24 Apr 2024 04:28:05 +0800
From: kernel test robot <lkp@intel.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: linux-renesas-soc@vger.kernel.org
Subject: [geert-renesas-devel:renesas-dts-for-v6.10] BUILD SUCCESS
 f026b6426603d25d2c8a8c517925c7b243cf223d
Message-ID: <202404240402.NUfpYJ1J-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git renesas-dts-for-v6.10
branch HEAD: f026b6426603d25d2c8a8c517925c7b243cf223d  arm64: dts: renesas: r8a779h0: Link IOMMU consumers

elapsed time: 743m

configs tested: 126
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
arm                              allmodconfig   gcc  
arm                               allnoconfig   clang
arm                              allyesconfig   gcc  
arm                                 defconfig   clang
arm64                            allmodconfig   clang
arm64                             allnoconfig   gcc  
arm64                            allyesconfig   clang
arm64                               defconfig   gcc  
csky                             allmodconfig   gcc  
csky                              allnoconfig   gcc  
csky                             allyesconfig   gcc  
csky                                defconfig   gcc  
hexagon                          allmodconfig   clang
hexagon                           allnoconfig   clang
hexagon                          allyesconfig   clang
hexagon                             defconfig   clang
i386                             allmodconfig   gcc  
i386                              allnoconfig   gcc  
i386                             allyesconfig   gcc  
i386         buildonly-randconfig-001-20240423   clang
i386         buildonly-randconfig-002-20240423   clang
i386         buildonly-randconfig-003-20240423   gcc  
i386         buildonly-randconfig-004-20240423   clang
i386         buildonly-randconfig-005-20240423   clang
i386         buildonly-randconfig-006-20240423   gcc  
i386                                defconfig   clang
i386                  randconfig-001-20240423   gcc  
i386                  randconfig-002-20240423   gcc  
i386                  randconfig-003-20240423   clang
i386                  randconfig-004-20240423   gcc  
i386                  randconfig-005-20240423   clang
i386                  randconfig-006-20240423   clang
i386                  randconfig-011-20240423   gcc  
i386                  randconfig-012-20240423   clang
i386                  randconfig-013-20240423   clang
i386                  randconfig-014-20240423   gcc  
i386                  randconfig-015-20240423   gcc  
i386                  randconfig-016-20240423   clang
loongarch                        allmodconfig   gcc  
loongarch                         allnoconfig   gcc  
loongarch                           defconfig   gcc  
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
nios2                            allmodconfig   gcc  
nios2                             allnoconfig   gcc  
nios2                            allyesconfig   gcc  
nios2                               defconfig   gcc  
openrisc                          allnoconfig   gcc  
openrisc                         allyesconfig   gcc  
openrisc                            defconfig   gcc  
parisc                           allmodconfig   gcc  
parisc                            allnoconfig   gcc  
parisc                           allyesconfig   gcc  
parisc                              defconfig   gcc  
parisc64                            defconfig   gcc  
powerpc                          allmodconfig   gcc  
powerpc                           allnoconfig   gcc  
powerpc                          allyesconfig   clang
riscv                            allmodconfig   clang
riscv                             allnoconfig   gcc  
riscv                            allyesconfig   clang
riscv                               defconfig   clang
s390                             allmodconfig   clang
s390                              allnoconfig   clang
s390                             allyesconfig   gcc  
s390                                defconfig   clang
sh                               allmodconfig   gcc  
sh                                allnoconfig   gcc  
sh                               allyesconfig   gcc  
sh                                  defconfig   gcc  
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
x86_64       buildonly-randconfig-001-20240423   clang
x86_64       buildonly-randconfig-002-20240423   clang
x86_64       buildonly-randconfig-003-20240423   gcc  
x86_64       buildonly-randconfig-004-20240423   gcc  
x86_64       buildonly-randconfig-005-20240423   clang
x86_64       buildonly-randconfig-006-20240423   gcc  
x86_64                              defconfig   gcc  
x86_64                randconfig-001-20240423   clang
x86_64                randconfig-002-20240423   gcc  
x86_64                randconfig-003-20240423   gcc  
x86_64                randconfig-004-20240423   gcc  
x86_64                randconfig-005-20240423   gcc  
x86_64                randconfig-006-20240423   gcc  
x86_64                randconfig-011-20240423   gcc  
x86_64                randconfig-012-20240423   gcc  
x86_64                randconfig-013-20240423   clang
x86_64                randconfig-014-20240423   clang
x86_64                randconfig-015-20240423   clang
x86_64                randconfig-016-20240423   gcc  
x86_64                randconfig-071-20240423   clang
x86_64                randconfig-072-20240423   clang
x86_64                randconfig-073-20240423   clang
x86_64                randconfig-074-20240423   gcc  
x86_64                randconfig-075-20240423   gcc  
x86_64                randconfig-076-20240423   gcc  
x86_64                          rhel-8.3-rust   clang
xtensa                            allnoconfig   gcc  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

