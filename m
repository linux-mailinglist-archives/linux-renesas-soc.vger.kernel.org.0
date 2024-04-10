Return-Path: <linux-renesas-soc+bounces-4423-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CBE7E89E950
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 10 Apr 2024 07:00:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 517D1285352
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 10 Apr 2024 05:00:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 54F1910A13;
	Wed, 10 Apr 2024 05:00:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dY8s9Lqt"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A93AE10958
	for <linux-renesas-soc@vger.kernel.org>; Wed, 10 Apr 2024 05:00:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712725247; cv=none; b=SSUK5o4HON2YSvXtNs5ZwIed0eeBplNWPHxRyUAVWfQzXNPug2SQ5aBZqjIoEq04U5WcGjR96tLcviBOTbVbF0J2/jjHZAxyAY63SO0p68emXXvpataojPzP/tUBAKgDb4by+DMLHsp15vSWaaxdEvg+SVyMlq+REvzqJiWwCyk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712725247; c=relaxed/simple;
	bh=YhXssk+4XXU7k/pJAZNazA/8xEUq3CZjl4PT5aUlwrc=;
	h=Date:From:To:Cc:Subject:Message-ID; b=numk0K3xRm/sEczzAldQHxrdKkxWKEJfSsy6D4psEKtKcIAH6AJDaKmVicYM2QzsJ9OaNmPWQP3a9z20Nm7WZK0kFLKS8gC5E7Eo2DOzw0AdaoO59Hj8+kFWITOf8J/5WM37AFmCD4CGNtgHX5qJ2c0UFWmdNq0F6Tc5SJ2v6Pg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dY8s9Lqt; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1712725244; x=1744261244;
  h=date:from:to:cc:subject:message-id;
  bh=YhXssk+4XXU7k/pJAZNazA/8xEUq3CZjl4PT5aUlwrc=;
  b=dY8s9Lqt0rOq2NFvvd8JhN94MGc/jpoJpTb1xIgnqXgrw4hpYiCP5WxQ
   luBzgkCSm+9ZeFDdGLcq2XX1P0eb6mRKDvHkEPBvF0gg7gDYShjkCaFhf
   z4kcsGRKz6C8o4GyXZZp7pBhvnAA07uG7oUm5nFYUfO0+LVGdOpge4dqW
   fZTlLzNaJ6o6z+ZzHUnjHV1PPk+UbNXxsK1CL13imM5xBJWtayVrEm9BG
   hNeOqSuiyjX3O+inSvZAYL9mq90KHyySXVugsB0rbbRoxMZFQQUkCS2+6
   GOcOf3M5kp4BhM3ovrMrrwEXnRmg7tjnE2J36b+x+rOXaP1XnNh6OJAdk
   w==;
X-CSE-ConnectionGUID: k7Cf6E54SASYQfv94eKZgw==
X-CSE-MsgGUID: Ksa5ypTpS5WhznhskCECLQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11039"; a="19219369"
X-IronPort-AV: E=Sophos;i="6.07,190,1708416000"; 
   d="scan'208";a="19219369"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Apr 2024 22:00:44 -0700
X-CSE-ConnectionGUID: tiymb3OlT+63MmDe0drxWA==
X-CSE-MsgGUID: wHFZQYvKTW69LE9xIphOig==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,190,1708416000"; 
   d="scan'208";a="20872060"
Received: from lkp-server01.sh.intel.com (HELO e61807b1d151) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 09 Apr 2024 22:00:42 -0700
Received: from kbuild by e61807b1d151 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ruQ4e-0006tU-1g;
	Wed, 10 Apr 2024 05:00:40 +0000
Date: Wed, 10 Apr 2024 12:59:58 +0800
From: kernel test robot <lkp@intel.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: linux-renesas-soc@vger.kernel.org
Subject: [geert-renesas-devel:next] BUILD SUCCESS
 957eed54b7b66fdd3e93ca7550be25aba1ee225d
Message-ID: <202404101256.mn714lia-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git next
branch HEAD: 957eed54b7b66fdd3e93ca7550be25aba1ee225d  Merge branch 'renesas-dts-for-v6.10' into renesas-next

elapsed time: 1265m

configs tested: 207
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
arc                         haps_hs_defconfig   gcc  
arc                     haps_hs_smp_defconfig   gcc  
arc                   randconfig-001-20240409   gcc  
arc                   randconfig-001-20240410   gcc  
arc                   randconfig-002-20240409   gcc  
arc                   randconfig-002-20240410   gcc  
arm                              allmodconfig   gcc  
arm                               allnoconfig   clang
arm                              allyesconfig   gcc  
arm                                 defconfig   clang
arm                        keystone_defconfig   gcc  
arm                   randconfig-001-20240409   gcc  
arm                   randconfig-001-20240410   gcc  
arm                   randconfig-003-20240410   gcc  
arm                   randconfig-004-20240409   gcc  
arm                         s3c6400_defconfig   gcc  
arm                         socfpga_defconfig   gcc  
arm64                            allmodconfig   clang
arm64                             allnoconfig   gcc  
arm64                            allyesconfig   clang
arm64                               defconfig   gcc  
arm64                 randconfig-001-20240409   gcc  
arm64                 randconfig-002-20240409   gcc  
arm64                 randconfig-002-20240410   gcc  
arm64                 randconfig-003-20240410   gcc  
arm64                 randconfig-004-20240410   gcc  
csky                             allmodconfig   gcc  
csky                              allnoconfig   gcc  
csky                             allyesconfig   gcc  
csky                                defconfig   gcc  
csky                  randconfig-001-20240409   gcc  
csky                  randconfig-001-20240410   gcc  
csky                  randconfig-002-20240409   gcc  
csky                  randconfig-002-20240410   gcc  
hexagon                          allmodconfig   clang
hexagon                           allnoconfig   clang
hexagon                          allyesconfig   clang
hexagon                             defconfig   clang
i386                             allmodconfig   gcc  
i386                              allnoconfig   gcc  
i386                             allyesconfig   gcc  
i386         buildonly-randconfig-001-20240410   gcc  
i386         buildonly-randconfig-003-20240409   gcc  
i386         buildonly-randconfig-005-20240409   gcc  
i386         buildonly-randconfig-005-20240410   gcc  
i386         buildonly-randconfig-006-20240409   gcc  
i386         buildonly-randconfig-006-20240410   gcc  
i386                                defconfig   clang
i386                  randconfig-002-20240409   gcc  
i386                  randconfig-003-20240410   gcc  
i386                  randconfig-004-20240409   gcc  
i386                  randconfig-004-20240410   gcc  
i386                  randconfig-005-20240409   gcc  
i386                  randconfig-005-20240410   gcc  
i386                  randconfig-011-20240409   gcc  
i386                  randconfig-013-20240410   gcc  
i386                  randconfig-015-20240409   gcc  
i386                  randconfig-015-20240410   gcc  
i386                  randconfig-016-20240410   gcc  
loongarch                        alldefconfig   gcc  
loongarch                        allmodconfig   gcc  
loongarch                         allnoconfig   gcc  
loongarch                        allyesconfig   gcc  
loongarch                           defconfig   gcc  
loongarch             randconfig-001-20240409   gcc  
loongarch             randconfig-001-20240410   gcc  
loongarch             randconfig-002-20240409   gcc  
loongarch             randconfig-002-20240410   gcc  
m68k                             allmodconfig   gcc  
m68k                              allnoconfig   gcc  
m68k                             allyesconfig   gcc  
m68k                                defconfig   gcc  
m68k                        m5407c3_defconfig   gcc  
m68k                       m5475evb_defconfig   gcc  
m68k                            mac_defconfig   gcc  
microblaze                       allmodconfig   gcc  
microblaze                        allnoconfig   gcc  
microblaze                       allyesconfig   gcc  
microblaze                          defconfig   gcc  
microblaze                      mmu_defconfig   gcc  
mips                             allmodconfig   gcc  
mips                              allnoconfig   gcc  
mips                             allyesconfig   gcc  
mips                           ip22_defconfig   gcc  
mips                      malta_kvm_defconfig   gcc  
mips                          rm200_defconfig   gcc  
nios2                            allmodconfig   gcc  
nios2                             allnoconfig   gcc  
nios2                            allyesconfig   gcc  
nios2                               defconfig   gcc  
nios2                 randconfig-001-20240409   gcc  
nios2                 randconfig-001-20240410   gcc  
nios2                 randconfig-002-20240409   gcc  
nios2                 randconfig-002-20240410   gcc  
openrisc                         allmodconfig   gcc  
openrisc                          allnoconfig   gcc  
openrisc                         allyesconfig   gcc  
openrisc                            defconfig   gcc  
parisc                           allmodconfig   gcc  
parisc                            allnoconfig   gcc  
parisc                           allyesconfig   gcc  
parisc                              defconfig   gcc  
parisc                randconfig-001-20240409   gcc  
parisc                randconfig-001-20240410   gcc  
parisc                randconfig-002-20240409   gcc  
parisc                randconfig-002-20240410   gcc  
parisc64                            defconfig   gcc  
powerpc                          allmodconfig   gcc  
powerpc                           allnoconfig   gcc  
powerpc                          allyesconfig   clang
powerpc               randconfig-001-20240410   gcc  
powerpc               randconfig-002-20240409   gcc  
powerpc               randconfig-002-20240410   gcc  
powerpc               randconfig-003-20240410   gcc  
powerpc                 xes_mpc85xx_defconfig   gcc  
powerpc64             randconfig-001-20240409   gcc  
powerpc64             randconfig-001-20240410   gcc  
powerpc64             randconfig-002-20240410   gcc  
powerpc64             randconfig-003-20240409   gcc  
riscv                            allmodconfig   clang
riscv                             allnoconfig   gcc  
riscv                            allyesconfig   clang
riscv                               defconfig   clang
riscv                 randconfig-001-20240410   gcc  
riscv                 randconfig-002-20240409   gcc  
riscv                 randconfig-002-20240410   gcc  
s390                             allmodconfig   clang
s390                              allnoconfig   clang
s390                             allyesconfig   gcc  
s390                                defconfig   clang
s390                  randconfig-001-20240409   gcc  
s390                  randconfig-002-20240409   gcc  
sh                               allmodconfig   gcc  
sh                                allnoconfig   gcc  
sh                               allyesconfig   gcc  
sh                                  defconfig   gcc  
sh                        dreamcast_defconfig   gcc  
sh                          polaris_defconfig   gcc  
sh                    randconfig-001-20240409   gcc  
sh                    randconfig-001-20240410   gcc  
sh                    randconfig-002-20240409   gcc  
sh                    randconfig-002-20240410   gcc  
sh                          rsk7201_defconfig   gcc  
sh                          sdk7780_defconfig   gcc  
sparc                            allmodconfig   gcc  
sparc                             allnoconfig   gcc  
sparc                            allyesconfig   gcc  
sparc                               defconfig   gcc  
sparc64                          allmodconfig   gcc  
sparc64                          allyesconfig   gcc  
sparc64                             defconfig   gcc  
sparc64               randconfig-001-20240409   gcc  
sparc64               randconfig-001-20240410   gcc  
sparc64               randconfig-002-20240409   gcc  
sparc64               randconfig-002-20240410   gcc  
um                               allmodconfig   clang
um                                allnoconfig   clang
um                               allyesconfig   gcc  
um                                  defconfig   clang
um                             i386_defconfig   gcc  
um                    randconfig-002-20240409   gcc  
um                           x86_64_defconfig   clang
x86_64                           alldefconfig   gcc  
x86_64                            allnoconfig   clang
x86_64                           allyesconfig   clang
x86_64       buildonly-randconfig-001-20240409   clang
x86_64       buildonly-randconfig-002-20240409   clang
x86_64       buildonly-randconfig-002-20240410   clang
x86_64       buildonly-randconfig-003-20240410   clang
x86_64       buildonly-randconfig-005-20240409   clang
x86_64       buildonly-randconfig-005-20240410   clang
x86_64       buildonly-randconfig-006-20240409   clang
x86_64                              defconfig   gcc  
x86_64                randconfig-001-20240409   clang
x86_64                randconfig-001-20240410   clang
x86_64                randconfig-002-20240409   clang
x86_64                randconfig-003-20240410   clang
x86_64                randconfig-004-20240410   clang
x86_64                randconfig-005-20240409   clang
x86_64                randconfig-006-20240409   clang
x86_64                randconfig-006-20240410   clang
x86_64                randconfig-012-20240409   clang
x86_64                randconfig-014-20240409   clang
x86_64                randconfig-014-20240410   clang
x86_64                randconfig-016-20240410   clang
x86_64                randconfig-072-20240409   clang
x86_64                randconfig-072-20240410   clang
x86_64                randconfig-073-20240409   clang
x86_64                randconfig-074-20240409   clang
x86_64                randconfig-074-20240410   clang
x86_64                randconfig-075-20240409   clang
x86_64                randconfig-076-20240410   clang
x86_64                          rhel-8.3-rust   clang
x86_64                               rhel-8.3   gcc  
xtensa                            allnoconfig   gcc  
xtensa                           allyesconfig   gcc  
xtensa                randconfig-001-20240409   gcc  
xtensa                randconfig-001-20240410   gcc  
xtensa                randconfig-002-20240409   gcc  
xtensa                randconfig-002-20240410   gcc  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

