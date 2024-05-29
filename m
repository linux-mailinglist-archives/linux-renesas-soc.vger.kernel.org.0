Return-Path: <linux-renesas-soc+bounces-5579-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 059708D2D90
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 29 May 2024 08:46:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 28E9C1C2571C
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 29 May 2024 06:46:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D8CCA1607A7;
	Wed, 29 May 2024 06:46:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XSXmJW+q"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64AA015B144
	for <linux-renesas-soc@vger.kernel.org>; Wed, 29 May 2024 06:46:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716965194; cv=none; b=OJwGJFWdr3qIQioueNQP491pM6SQncy4u1GUz7AJV8zfxaIM1IIFixJDhgcfJ6X6GBIL/0Z1EeHU6+ZWm1OMEzRgmNnLlm+4ehJKBrkogduxg9ksKeplGt91RabnL53y3ChxeEsHcQZoJw+qilBpp63OnP+a/2NK2FZ615YvDKQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716965194; c=relaxed/simple;
	bh=rd5hS7CL6V65Koc4Bcw08+411149ggZk2kU0YpKc54w=;
	h=Date:From:To:Cc:Subject:Message-ID; b=ne4o7QvnEus6lR+nwD4I/o5JDnzYq1FjdSu06nV5Y8ZT5xi98YKSZGWSHbiB3cP5qtzv1sny+9x6rlCqH513l5hUUymDQ7pThNklzRPKBMBOyiEChOlou2obo9p/n3ffTLJ65BSICzgVFSX9HwQNi7ikhlDhrEQKu5iLY0bPae4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XSXmJW+q; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1716965192; x=1748501192;
  h=date:from:to:cc:subject:message-id;
  bh=rd5hS7CL6V65Koc4Bcw08+411149ggZk2kU0YpKc54w=;
  b=XSXmJW+qoqW34/dnovfV2k7i5dy1PcMfM12B0y4uBghtseK5OIdlaYf4
   rjJYuFPHKOndni3u2NZ1qCgTEHaZ9gdpCnCLjIyx2M46KagnZgS02MBqT
   3P982c23a3a91gmVadlolC8eUe8S71Ke/r1lITHJ8NqZHblrPwTbHTObD
   XGr60QewhtdqMDVzu6VBIkk2BCGKzBLOYfvR9cNVyrjyavhVlYm0Jp4ZN
   7BYENUjQn/k++XPF9qsGARTwPS5FIqP5ViPEm0VOOmVYw58AxSI73DCHq
   FhAzM0powq0+1mUiRT7btkMeho9+K81KrR3NAOnvNJW/FIIaoa5Vrmhwj
   g==;
X-CSE-ConnectionGUID: u4ivK0fMR1KhWPsOpNLs/A==
X-CSE-MsgGUID: Bmg0M6DvRZ2OLUox+8o3ZQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11085"; a="13516367"
X-IronPort-AV: E=Sophos;i="6.08,197,1712646000"; 
   d="scan'208";a="13516367"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 May 2024 23:46:31 -0700
X-CSE-ConnectionGUID: 5Vo326gFQDyzoQy4I2/W0Q==
X-CSE-MsgGUID: DxAD/LSXSH+E4sMpClYqcg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,197,1712646000"; 
   d="scan'208";a="35279822"
Received: from unknown (HELO 0610945e7d16) ([10.239.97.151])
  by fmviesa007.fm.intel.com with ESMTP; 28 May 2024 23:46:29 -0700
Received: from kbuild by 0610945e7d16 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sCD4q-000DED-2W;
	Wed, 29 May 2024 06:46:25 +0000
Date: Wed, 29 May 2024 14:45:36 +0800
From: kernel test robot <lkp@intel.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: linux-renesas-soc@vger.kernel.org
Subject: [geert-renesas-drivers:master] BUILD REGRESSION
 0b2f40fe4961467879063f9e70c4d1426ff4218d
Message-ID: <202405291433.tcq7Q3qN-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git master
branch HEAD: 0b2f40fe4961467879063f9e70c4d1426ff4218d  [LOCAL] arm64: renesas: defconfig: Update renesas_defconfig

Error/Warning reports:

https://lore.kernel.org/oe-kbuild-all/202405290741.B3D8sNtJ-lkp@intel.com
https://lore.kernel.org/oe-kbuild-all/202405290948.dvQMPrCs-lkp@intel.com

Error/Warning: (recently discovered and may have been fixed)

drivers/gpu/drm/amd/amdgpu/../pm/swsmu/smu14/smu_v14_0_2_ppt.c:1565:20: error: use of undeclared identifier 'I2C_CLASS_SPD'
drivers/gpu/drm/amd/amdgpu/../pm/swsmu/smu14/smu_v14_0_2_ppt.c:1565:34: error: 'I2C_CLASS_SPD' undeclared (first use in this function); did you mean 'I2C_CLASS_HWMON'?

Error/Warning ids grouped by kconfigs:

gcc_recent_errors
|-- arc-allmodconfig
|   `-- drivers-gpu-drm-amd-amdgpu-..-pm-swsmu-smu14-smu_v14_0_2_ppt.c:error:I2C_CLASS_SPD-undeclared-(first-use-in-this-function)
|-- arc-allyesconfig
|   `-- drivers-gpu-drm-amd-amdgpu-..-pm-swsmu-smu14-smu_v14_0_2_ppt.c:error:I2C_CLASS_SPD-undeclared-(first-use-in-this-function)
|-- arm-allmodconfig
|   `-- drivers-gpu-drm-amd-amdgpu-..-pm-swsmu-smu14-smu_v14_0_2_ppt.c:error:I2C_CLASS_SPD-undeclared-(first-use-in-this-function)
|-- arm-allyesconfig
|   `-- drivers-gpu-drm-amd-amdgpu-..-pm-swsmu-smu14-smu_v14_0_2_ppt.c:error:I2C_CLASS_SPD-undeclared-(first-use-in-this-function)
|-- csky-allmodconfig
|   `-- drivers-gpu-drm-amd-amdgpu-..-pm-swsmu-smu14-smu_v14_0_2_ppt.c:error:I2C_CLASS_SPD-undeclared-(first-use-in-this-function)
|-- csky-allyesconfig
|   `-- drivers-gpu-drm-amd-amdgpu-..-pm-swsmu-smu14-smu_v14_0_2_ppt.c:error:I2C_CLASS_SPD-undeclared-(first-use-in-this-function)
|-- loongarch-defconfig
|   `-- drivers-gpu-drm-amd-amdgpu-..-pm-swsmu-smu14-smu_v14_0_2_ppt.c:error:I2C_CLASS_SPD-undeclared-(first-use-in-this-function)
|-- loongarch-loongson3_defconfig
|   `-- drivers-gpu-drm-amd-amdgpu-..-pm-swsmu-smu14-smu_v14_0_2_ppt.c:error:I2C_CLASS_SPD-undeclared-(first-use-in-this-function)
|-- microblaze-allmodconfig
|   `-- drivers-gpu-drm-amd-amdgpu-..-pm-swsmu-smu14-smu_v14_0_2_ppt.c:error:I2C_CLASS_SPD-undeclared-(first-use-in-this-function)
|-- mips-allyesconfig
|   `-- drivers-gpu-drm-amd-amdgpu-..-pm-swsmu-smu14-smu_v14_0_2_ppt.c:error:I2C_CLASS_SPD-undeclared-(first-use-in-this-function)
|-- openrisc-allyesconfig
|   `-- drivers-gpu-drm-amd-amdgpu-..-pm-swsmu-smu14-smu_v14_0_2_ppt.c:error:I2C_CLASS_SPD-undeclared-(first-use-in-this-function)
|-- parisc-allmodconfig
|   `-- drivers-gpu-drm-amd-amdgpu-..-pm-swsmu-smu14-smu_v14_0_2_ppt.c:error:I2C_CLASS_SPD-undeclared-(first-use-in-this-function)
|-- parisc-allyesconfig
|   `-- drivers-gpu-drm-amd-amdgpu-..-pm-swsmu-smu14-smu_v14_0_2_ppt.c:error:I2C_CLASS_SPD-undeclared-(first-use-in-this-function)
|-- powerpc-allmodconfig
|   `-- drivers-gpu-drm-amd-amdgpu-..-pm-swsmu-smu14-smu_v14_0_2_ppt.c:error:I2C_CLASS_SPD-undeclared-(first-use-in-this-function)
|-- powerpc64-randconfig-001-20240529
|   `-- drivers-gpu-drm-amd-amdgpu-..-pm-swsmu-smu14-smu_v14_0_2_ppt.c:error:I2C_CLASS_SPD-undeclared-(first-use-in-this-function)
|-- riscv-randconfig-001-20240529
|   `-- drivers-gpu-drm-amd-amdgpu-..-pm-swsmu-smu14-smu_v14_0_2_ppt.c:error:I2C_CLASS_SPD-undeclared-(first-use-in-this-function)
|-- s390-allyesconfig
|   `-- drivers-gpu-drm-amd-amdgpu-..-pm-swsmu-smu14-smu_v14_0_2_ppt.c:error:I2C_CLASS_SPD-undeclared-(first-use-in-this-function)
|-- sparc-allmodconfig
|   `-- drivers-gpu-drm-amd-amdgpu-..-pm-swsmu-smu14-smu_v14_0_2_ppt.c:error:I2C_CLASS_SPD-undeclared-(first-use-in-this-function)
|-- sparc64-allmodconfig
|   `-- drivers-gpu-drm-amd-amdgpu-..-pm-swsmu-smu14-smu_v14_0_2_ppt.c:error:I2C_CLASS_SPD-undeclared-(first-use-in-this-function)
|-- sparc64-allyesconfig
|   `-- drivers-gpu-drm-amd-amdgpu-..-pm-swsmu-smu14-smu_v14_0_2_ppt.c:error:I2C_CLASS_SPD-undeclared-(first-use-in-this-function)
|-- sparc64-randconfig-002-20240529
|   `-- drivers-gpu-drm-amd-amdgpu-..-pm-swsmu-smu14-smu_v14_0_2_ppt.c:error:I2C_CLASS_SPD-undeclared-(first-use-in-this-function)
`-- xtensa-allyesconfig
    `-- drivers-gpu-drm-amd-amdgpu-..-pm-swsmu-smu14-smu_v14_0_2_ppt.c:error:I2C_CLASS_SPD-undeclared-(first-use-in-this-function)
clang_recent_errors
|-- arm64-allmodconfig
|   `-- drivers-gpu-drm-amd-amdgpu-..-pm-swsmu-smu14-smu_v14_0_2_ppt.c:error:use-of-undeclared-identifier-I2C_CLASS_SPD
|-- i386-randconfig-006-20240529
|   `-- drivers-gpu-drm-amd-amdgpu-..-pm-swsmu-smu14-smu_v14_0_2_ppt.c:error:use-of-undeclared-identifier-I2C_CLASS_SPD
|-- i386-randconfig-141-20240529
|   `-- drivers-gpu-drm-amd-amdgpu-..-pm-swsmu-smu14-smu_v14_0_2_ppt.c:error:use-of-undeclared-identifier-I2C_CLASS_SPD
|-- powerpc-allyesconfig
|   `-- drivers-gpu-drm-amd-amdgpu-..-pm-swsmu-smu14-smu_v14_0_2_ppt.c:error:use-of-undeclared-identifier-I2C_CLASS_SPD
|-- riscv-allmodconfig
|   `-- drivers-gpu-drm-amd-amdgpu-..-pm-swsmu-smu14-smu_v14_0_2_ppt.c:error:use-of-undeclared-identifier-I2C_CLASS_SPD
|-- riscv-allyesconfig
|   `-- drivers-gpu-drm-amd-amdgpu-..-pm-swsmu-smu14-smu_v14_0_2_ppt.c:error:use-of-undeclared-identifier-I2C_CLASS_SPD
`-- x86_64-randconfig-013-20240529
    `-- drivers-gpu-drm-amd-amdgpu-..-pm-swsmu-smu14-smu_v14_0_2_ppt.c:error:use-of-undeclared-identifier-I2C_CLASS_SPD

elapsed time: 751m

configs tested: 179
configs skipped: 3

tested configs:
alpha                             allnoconfig   gcc  
alpha                            allyesconfig   gcc  
alpha                               defconfig   gcc  
arc                              allmodconfig   gcc  
arc                               allnoconfig   gcc  
arc                              allyesconfig   gcc  
arc                                 defconfig   gcc  
arc                   randconfig-001-20240529   gcc  
arc                   randconfig-002-20240529   gcc  
arc                    vdk_hs38_smp_defconfig   gcc  
arm                              allmodconfig   gcc  
arm                               allnoconfig   clang
arm                              allyesconfig   gcc  
arm                                 defconfig   clang
arm                   milbeaut_m10v_defconfig   clang
arm                            mmp2_defconfig   gcc  
arm                          pxa168_defconfig   clang
arm                   randconfig-001-20240529   gcc  
arm                   randconfig-002-20240529   gcc  
arm                   randconfig-003-20240529   gcc  
arm                   randconfig-004-20240529   gcc  
arm64                            allmodconfig   clang
arm64                             allnoconfig   gcc  
arm64                               defconfig   gcc  
arm64                 randconfig-001-20240529   clang
arm64                 randconfig-002-20240529   clang
arm64                 randconfig-003-20240529   gcc  
arm64                 randconfig-004-20240529   gcc  
csky                             allmodconfig   gcc  
csky                              allnoconfig   gcc  
csky                             allyesconfig   gcc  
csky                                defconfig   gcc  
csky                  randconfig-001-20240529   gcc  
csky                  randconfig-002-20240529   gcc  
hexagon                          allmodconfig   clang
hexagon                           allnoconfig   clang
hexagon                          allyesconfig   clang
hexagon                             defconfig   clang
hexagon               randconfig-001-20240529   clang
hexagon               randconfig-002-20240529   clang
i386                             allmodconfig   gcc  
i386                              allnoconfig   gcc  
i386                             allyesconfig   gcc  
i386         buildonly-randconfig-001-20240529   clang
i386         buildonly-randconfig-002-20240529   gcc  
i386         buildonly-randconfig-003-20240529   gcc  
i386         buildonly-randconfig-004-20240529   clang
i386         buildonly-randconfig-005-20240529   gcc  
i386         buildonly-randconfig-006-20240529   clang
i386                                defconfig   clang
i386                  randconfig-001-20240529   clang
i386                  randconfig-002-20240529   gcc  
i386                  randconfig-003-20240529   gcc  
i386                  randconfig-004-20240529   gcc  
i386                  randconfig-005-20240529   clang
i386                  randconfig-006-20240529   clang
i386                  randconfig-011-20240529   clang
i386                  randconfig-012-20240529   clang
i386                  randconfig-013-20240529   clang
i386                  randconfig-014-20240529   gcc  
i386                  randconfig-015-20240529   clang
i386                  randconfig-016-20240529   gcc  
loongarch                        allmodconfig   gcc  
loongarch                         allnoconfig   gcc  
loongarch                           defconfig   gcc  
loongarch                 loongson3_defconfig   gcc  
loongarch             randconfig-001-20240529   gcc  
loongarch             randconfig-002-20240529   gcc  
m68k                             allmodconfig   gcc  
m68k                              allnoconfig   gcc  
m68k                             allyesconfig   gcc  
m68k                                defconfig   gcc  
m68k                           sun3_defconfig   gcc  
microblaze                       allmodconfig   gcc  
microblaze                        allnoconfig   gcc  
microblaze                       allyesconfig   gcc  
microblaze                          defconfig   gcc  
mips                              allnoconfig   gcc  
mips                             allyesconfig   gcc  
mips                         cobalt_defconfig   gcc  
mips                           rs90_defconfig   gcc  
nios2                            allmodconfig   gcc  
nios2                             allnoconfig   gcc  
nios2                            allyesconfig   gcc  
nios2                               defconfig   gcc  
nios2                 randconfig-001-20240529   gcc  
nios2                 randconfig-002-20240529   gcc  
openrisc                          allnoconfig   gcc  
openrisc                         allyesconfig   gcc  
openrisc                            defconfig   gcc  
parisc                           alldefconfig   gcc  
parisc                           allmodconfig   gcc  
parisc                            allnoconfig   gcc  
parisc                           allyesconfig   gcc  
parisc                              defconfig   gcc  
parisc                randconfig-001-20240529   gcc  
parisc                randconfig-002-20240529   gcc  
parisc64                            defconfig   gcc  
powerpc                          allmodconfig   gcc  
powerpc                           allnoconfig   gcc  
powerpc                          allyesconfig   clang
powerpc                      mgcoge_defconfig   clang
powerpc               randconfig-001-20240529   clang
powerpc               randconfig-002-20240529   clang
powerpc               randconfig-003-20240529   clang
powerpc                    sam440ep_defconfig   gcc  
powerpc                     skiroot_defconfig   clang
powerpc64             randconfig-001-20240529   gcc  
powerpc64             randconfig-002-20240529   clang
powerpc64             randconfig-003-20240529   clang
riscv                            allmodconfig   clang
riscv                             allnoconfig   gcc  
riscv                            allyesconfig   clang
riscv                               defconfig   clang
riscv                 randconfig-001-20240529   gcc  
riscv                 randconfig-002-20240529   clang
s390                             allmodconfig   clang
s390                              allnoconfig   clang
s390                             allyesconfig   gcc  
s390                                defconfig   clang
s390                  randconfig-001-20240529   clang
s390                  randconfig-002-20240529   gcc  
sh                               allmodconfig   gcc  
sh                                allnoconfig   gcc  
sh                               allyesconfig   gcc  
sh                                  defconfig   gcc  
sh                          landisk_defconfig   gcc  
sh                    randconfig-001-20240529   gcc  
sh                    randconfig-002-20240529   gcc  
sh                          rsk7264_defconfig   gcc  
sh                          sdk7786_defconfig   gcc  
sh                           se7722_defconfig   gcc  
sparc                            allmodconfig   gcc  
sparc                             allnoconfig   gcc  
sparc                               defconfig   gcc  
sparc64                          allmodconfig   gcc  
sparc64                          allyesconfig   gcc  
sparc64                             defconfig   gcc  
sparc64               randconfig-001-20240529   gcc  
sparc64               randconfig-002-20240529   gcc  
um                               allmodconfig   clang
um                                allnoconfig   clang
um                               allyesconfig   gcc  
um                                  defconfig   clang
um                             i386_defconfig   gcc  
um                    randconfig-001-20240529   clang
um                    randconfig-002-20240529   gcc  
um                           x86_64_defconfig   clang
x86_64                            allnoconfig   clang
x86_64                           allyesconfig   clang
x86_64       buildonly-randconfig-001-20240529   gcc  
x86_64       buildonly-randconfig-002-20240529   clang
x86_64       buildonly-randconfig-003-20240529   clang
x86_64       buildonly-randconfig-004-20240529   gcc  
x86_64       buildonly-randconfig-005-20240529   clang
x86_64       buildonly-randconfig-006-20240529   gcc  
x86_64                              defconfig   gcc  
x86_64                randconfig-001-20240529   gcc  
x86_64                randconfig-002-20240529   clang
x86_64                randconfig-003-20240529   clang
x86_64                randconfig-004-20240529   clang
x86_64                randconfig-005-20240529   gcc  
x86_64                randconfig-006-20240529   gcc  
x86_64                randconfig-011-20240529   gcc  
x86_64                randconfig-012-20240529   gcc  
x86_64                randconfig-013-20240529   clang
x86_64                randconfig-014-20240529   gcc  
x86_64                randconfig-015-20240529   gcc  
x86_64                randconfig-016-20240529   clang
x86_64                randconfig-071-20240529   clang
x86_64                randconfig-072-20240529   gcc  
x86_64                randconfig-073-20240529   gcc  
x86_64                randconfig-074-20240529   clang
x86_64                randconfig-075-20240529   clang
x86_64                randconfig-076-20240529   clang
x86_64                          rhel-8.3-rust   clang
xtensa                            allnoconfig   gcc  
xtensa                randconfig-001-20240529   gcc  
xtensa                randconfig-002-20240529   gcc  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

