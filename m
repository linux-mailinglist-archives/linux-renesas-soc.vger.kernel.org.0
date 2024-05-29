Return-Path: <linux-renesas-soc+bounces-5576-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id DBB0D8D2A0C
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 29 May 2024 03:40:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 114021F2707E
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 29 May 2024 01:40:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1FE7B1E4A6;
	Wed, 29 May 2024 01:40:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GATT9Z7d"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 694A11B974
	for <linux-renesas-soc@vger.kernel.org>; Wed, 29 May 2024 01:40:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716946847; cv=none; b=qhy4QCjxL7aPpjabnj68gy/1enIX1/X97kdSS6ceLWrhq+slFKFaQQCr3kFcY/WC1r8emF0sIN++ZubMKnvYYAUoeAO8BKoP1xYEpjDOJPEDIE8qFtsO2MjEIg2NhqitdAUtEMhRYowg59pfMX/60XbSFIVa3J26/EOCLB2FHko=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716946847; c=relaxed/simple;
	bh=YetHjzR1iboakDXPScpGbZSxKbuROzxaIKHjYmFsaQw=;
	h=Date:From:To:Cc:Subject:Message-ID; b=WIvLRdJMggJivPmKkkwD9A0BmJxbhzPJpmPFxVqV2f/sLADIZuifCETeUtf/cGRb4H0zEN9XoL6g/xCNYScmm+56YQRGrUeJPqLRwLztmeKlIKqs2B+1qDRq9jvg2lPcLisT3qp7b6oGMgcCuBg/u3F8iaP70ondcN8vVluhbxo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GATT9Z7d; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1716946845; x=1748482845;
  h=date:from:to:cc:subject:message-id;
  bh=YetHjzR1iboakDXPScpGbZSxKbuROzxaIKHjYmFsaQw=;
  b=GATT9Z7dNtYkh0c7VpgiKohPLlN6SY8QoaGYJV7p3pavOokeNdh1X45j
   Kx2bquK+39OK117JMpMwhyGzeWDOt39gNJI9AgMvfHYPP9dVoSujk5E6K
   /T3i2wRFXAjE5p4WBlevKiyP5yxwhsglGo+20+kPAbR4dwxQtb6gTCCU3
   4ywdPJdx+QLKsJ2yULO0EJWf8wYQBkYUivZ/O+LxKvsJnqU87u3UpRPN+
   Igmjb3md9lhg4SRAsqNuH6YxeeoHhdStZVHI4GG/Rj+RU86ZVdN9mRRxT
   lROruZ/XZK2w1qPp6wjSnvMgmZWsN5HtV0dl71hhXSgWpwhfqefCPz/Jc
   w==;
X-CSE-ConnectionGUID: uBLDwkkcRuiShDGXVwr15g==
X-CSE-MsgGUID: k36SV5jsRm6DcEyQZS1xPw==
X-IronPort-AV: E=McAfee;i="6600,9927,11085"; a="13550589"
X-IronPort-AV: E=Sophos;i="6.08,197,1712646000"; 
   d="scan'208";a="13550589"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 May 2024 18:40:45 -0700
X-CSE-ConnectionGUID: xOMqPn8rQm6ywKOvBvKCYA==
X-CSE-MsgGUID: NOc960EbQWq1jw6efDiVeA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,197,1712646000"; 
   d="scan'208";a="35324906"
Received: from unknown (HELO 0610945e7d16) ([10.239.97.151])
  by orviesa009.jf.intel.com with ESMTP; 28 May 2024 18:40:43 -0700
Received: from kbuild by 0610945e7d16 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sC8Iz-000Cyz-0R;
	Wed, 29 May 2024 01:40:41 +0000
Date: Wed, 29 May 2024 09:40:40 +0800
From: kernel test robot <lkp@intel.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: linux-renesas-soc@vger.kernel.org
Subject: [geert-renesas-devel:renesas-arm-defconfig-for-v6.11] BUILD
 SUCCESS f7a2f03b42b742ac69058256fa8a9ffeeaaf66f7
Message-ID: <202405290938.zvBmNQY7-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git renesas-arm-defconfig-for-v6.11
branch HEAD: f7a2f03b42b742ac69058256fa8a9ffeeaaf66f7  arm64: defconfig: Enable Renesas R-Car Gen4 PCIe controller

elapsed time: 878m

configs tested: 129
configs skipped: 161

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig   gcc  
alpha                            allyesconfig   gcc  
alpha                               defconfig   gcc  
arc                               allnoconfig   gcc  
arc                                 defconfig   gcc  
arc                         haps_hs_defconfig   gcc  
arc                            hsdk_defconfig   gcc  
arc                   randconfig-001-20240529   gcc  
arc                   randconfig-002-20240529   gcc  
arm                       omap2plus_defconfig   gcc  
arm                   randconfig-001-20240529   gcc  
arm                   randconfig-002-20240529   gcc  
arm                   randconfig-003-20240529   gcc  
arm                   randconfig-004-20240529   gcc  
arm                           sunxi_defconfig   gcc  
arm64                            allmodconfig   clang
arm64                             allnoconfig   gcc  
arm64                            allyesconfig   clang
arm64                               defconfig   gcc  
arm64                 randconfig-001-20240528   clang
arm64                 randconfig-002-20240528   clang
arm64                 randconfig-003-20240528   gcc  
arm64                 randconfig-003-20240529   gcc  
arm64                 randconfig-004-20240528   gcc  
arm64                 randconfig-004-20240529   gcc  
csky                              allnoconfig   gcc  
csky                                defconfig   gcc  
csky                  randconfig-001-20240529   gcc  
csky                  randconfig-002-20240529   gcc  
hexagon                          allmodconfig   clang
hexagon                          allyesconfig   clang
i386                             allmodconfig   gcc  
i386                              allnoconfig   gcc  
i386                             allyesconfig   gcc  
i386         buildonly-randconfig-001-20240528   gcc  
i386         buildonly-randconfig-002-20240529   gcc  
i386         buildonly-randconfig-003-20240529   gcc  
i386         buildonly-randconfig-005-20240529   gcc  
i386                  randconfig-002-20240529   gcc  
i386                  randconfig-003-20240528   gcc  
i386                  randconfig-003-20240529   gcc  
i386                  randconfig-004-20240528   gcc  
i386                  randconfig-004-20240529   gcc  
i386                  randconfig-005-20240528   gcc  
i386                  randconfig-006-20240528   gcc  
i386                  randconfig-012-20240528   gcc  
i386                  randconfig-013-20240528   gcc  
i386                  randconfig-014-20240529   gcc  
i386                  randconfig-015-20240528   gcc  
i386                  randconfig-016-20240528   gcc  
i386                  randconfig-016-20240529   gcc  
loongarch                        allmodconfig   gcc  
loongarch                         allnoconfig   gcc  
loongarch                           defconfig   gcc  
loongarch             randconfig-001-20240529   gcc  
loongarch             randconfig-002-20240529   gcc  
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
mips                 decstation_r4k_defconfig   gcc  
mips                      malta_kvm_defconfig   gcc  
nios2                            allmodconfig   gcc  
nios2                             allnoconfig   gcc  
nios2                            allyesconfig   gcc  
nios2                               defconfig   gcc  
nios2                 randconfig-001-20240529   gcc  
nios2                 randconfig-002-20240529   gcc  
openrisc                          allnoconfig   gcc  
openrisc                            defconfig   gcc  
parisc                            allnoconfig   gcc  
parisc                              defconfig   gcc  
parisc                randconfig-001-20240529   gcc  
parisc                randconfig-002-20240529   gcc  
parisc64                            defconfig   gcc  
powerpc                           allnoconfig   gcc  
powerpc                          allyesconfig   clang
powerpc64             randconfig-001-20240529   gcc  
riscv                            allmodconfig   clang
riscv                             allnoconfig   gcc  
riscv                            allyesconfig   clang
riscv                 randconfig-001-20240529   gcc  
s390                             allyesconfig   gcc  
s390                  randconfig-002-20240529   gcc  
sh                               allmodconfig   gcc  
sh                                allnoconfig   gcc  
sh                               allyesconfig   gcc  
sh                                  defconfig   gcc  
sh                        dreamcast_defconfig   gcc  
sh                        edosk7760_defconfig   gcc  
sh                    randconfig-001-20240529   gcc  
sh                    randconfig-002-20240529   gcc  
sh                           se7780_defconfig   gcc  
sparc                            allmodconfig   gcc  
sparc                             allnoconfig   gcc  
sparc                               defconfig   gcc  
sparc64                          alldefconfig   gcc  
sparc64                          allmodconfig   gcc  
sparc64                          allyesconfig   gcc  
sparc64                             defconfig   gcc  
sparc64               randconfig-001-20240529   gcc  
sparc64               randconfig-002-20240529   gcc  
um                               allmodconfig   clang
um                               allyesconfig   gcc  
um                             i386_defconfig   gcc  
um                    randconfig-002-20240529   gcc  
x86_64       buildonly-randconfig-002-20240529   clang
x86_64       buildonly-randconfig-003-20240529   clang
x86_64       buildonly-randconfig-005-20240529   clang
x86_64                              defconfig   gcc  
x86_64                randconfig-002-20240529   clang
x86_64                randconfig-003-20240529   clang
x86_64                randconfig-004-20240529   clang
x86_64                randconfig-013-20240529   clang
x86_64                randconfig-016-20240529   clang
x86_64                randconfig-071-20240529   clang
x86_64                randconfig-074-20240529   clang
x86_64                randconfig-075-20240529   clang
x86_64                randconfig-076-20240529   clang
x86_64                               rhel-8.3   gcc  
xtensa                            allnoconfig   gcc  
xtensa                randconfig-001-20240529   gcc  
xtensa                randconfig-002-20240529   gcc  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

