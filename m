Return-Path: <linux-renesas-soc+bounces-4391-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A9AC89CEAC
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  9 Apr 2024 00:58:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7FE231C21886
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  8 Apr 2024 22:58:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A8D7D171B0;
	Mon,  8 Apr 2024 22:58:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="klSp4LKR"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9DC12744B
	for <linux-renesas-soc@vger.kernel.org>; Mon,  8 Apr 2024 22:58:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712617091; cv=none; b=qLF/JmwI+DBHcwpNbxEWJucrBTPArL3VphxvaC9kO8CoQVX6ln6yAsEMYmmVaY983jZfvulR2ZCs2A9Gf4hetwUeR5qyb8YRayOW66O2L8uJHbiB5VNRwa4drfmKR3UNbPshqzM+EJ9h9+YDFW4yosCBiMXOzX0TltAsx/lVxWQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712617091; c=relaxed/simple;
	bh=s6duRbet4m07DfuNJeSCQa6rQLwrEZOW7C2irFURl5w=;
	h=Date:From:To:Cc:Subject:Message-ID; b=JgZ+Lm3UVICYbrFWzR4wrannZmwFh+7ALQKtmICCfs0RhuhHRuV8c3oT+DM9xYXS+ws1nKCfKLqxkrtt/raLhVgqSnZj0WfE6ZC9VZVmXYu6xo0UEsb9pcNMzaFVRFevLu1SeKqROp38MHJxquDnmJsDDosE2e3bDHTuN995n2E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=klSp4LKR; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1712617090; x=1744153090;
  h=date:from:to:cc:subject:message-id;
  bh=s6duRbet4m07DfuNJeSCQa6rQLwrEZOW7C2irFURl5w=;
  b=klSp4LKRpBKKzDh7G4PALRGpC3sXgGFRx2IXH9B4Qcqyuf/oxuLh5lUA
   Sy1JZ8s6h/5nyPvkH884QqUNK2C7AL3RQqNylVdtekyqJyvY4OmbTlNhM
   /0FS/yXt++JSzQY5Ohru6xYuUKBpw2x/5qXyoLu/0pxRmojtJU9FIXHSB
   i5OSe1SuAU91fHzkfSlGdAzSTCQhaLkYTHJhgJA/fFid+NWmRw/+DQya4
   GNUPQJ6BiBxgV8jRvYpzJo8am9Zj2zIlDUwvkq9oCtpnS0h9HzNNmnTza
   PpCyFse0tpglBbon/9zPQwpL4kIino6VkNzJ3zaqVn6dXoETg+AGQaRVD
   Q==;
X-CSE-ConnectionGUID: VXD4asHQTlCST0mPRM57zQ==
X-CSE-MsgGUID: TAyplS3QQdmJn0HaTRVRSQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11038"; a="19348284"
X-IronPort-AV: E=Sophos;i="6.07,187,1708416000"; 
   d="scan'208";a="19348284"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Apr 2024 15:58:07 -0700
X-CSE-ConnectionGUID: iy8KsDjISCCqwkjzWGcvOA==
X-CSE-MsgGUID: ol/YeI99SMqbY5iK6YqvCw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,187,1708416000"; 
   d="scan'208";a="20085085"
Received: from lkp-server01.sh.intel.com (HELO e61807b1d151) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 08 Apr 2024 15:58:05 -0700
Received: from kbuild by e61807b1d151 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rtxwB-0005Xu-27;
	Mon, 08 Apr 2024 22:58:03 +0000
Date: Tue, 09 Apr 2024 06:57:15 +0800
From: kernel test robot <lkp@intel.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: linux-renesas-soc@vger.kernel.org
Subject: [geert-renesas-devel:topic/renesas-defconfig] BUILD SUCCESS
 667d9e59d9f65d66f5bfeee435184590d2c45d97
Message-ID: <202404090613.Vri0nYHf-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git topic/renesas-defconfig
branch HEAD: 667d9e59d9f65d66f5bfeee435184590d2c45d97  arm64: renesas: defconfig: Refresh for v6.9-rc1

elapsed time: 721m

configs tested: 206
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
arc                     haps_hs_smp_defconfig   gcc  
arc                   randconfig-001-20240408   gcc  
arc                   randconfig-002-20240408   gcc  
arc                        vdk_hs38_defconfig   gcc  
arm                              allmodconfig   gcc  
arm                               allnoconfig   clang
arm                              allyesconfig   gcc  
arm                                 defconfig   clang
arm                          ep93xx_defconfig   clang
arm                          gemini_defconfig   clang
arm                      integrator_defconfig   clang
arm                      jornada720_defconfig   clang
arm                            mps2_defconfig   clang
arm                   randconfig-001-20240408   clang
arm                   randconfig-002-20240408   clang
arm                   randconfig-003-20240408   clang
arm                   randconfig-004-20240408   clang
arm                         s3c6400_defconfig   gcc  
arm                         socfpga_defconfig   gcc  
arm                           sunxi_defconfig   gcc  
arm                    vt8500_v6_v7_defconfig   gcc  
arm64                            allmodconfig   clang
arm64                             allnoconfig   gcc  
arm64                            allyesconfig   clang
arm64                               defconfig   gcc  
arm64                 randconfig-001-20240408   clang
arm64                 randconfig-002-20240408   clang
arm64                 randconfig-003-20240408   gcc  
arm64                 randconfig-004-20240408   gcc  
csky                             allmodconfig   gcc  
csky                              allnoconfig   gcc  
csky                             allyesconfig   gcc  
csky                                defconfig   gcc  
csky                  randconfig-001-20240408   gcc  
csky                  randconfig-002-20240408   gcc  
hexagon                          allmodconfig   clang
hexagon                           allnoconfig   clang
hexagon                          allyesconfig   clang
hexagon                             defconfig   clang
hexagon               randconfig-001-20240408   clang
hexagon               randconfig-002-20240408   clang
i386                             allmodconfig   gcc  
i386                              allnoconfig   gcc  
i386                             allyesconfig   gcc  
i386         buildonly-randconfig-001-20240408   gcc  
i386         buildonly-randconfig-001-20240409   clang
i386         buildonly-randconfig-002-20240408   gcc  
i386         buildonly-randconfig-002-20240409   clang
i386         buildonly-randconfig-003-20240408   gcc  
i386         buildonly-randconfig-004-20240408   clang
i386         buildonly-randconfig-004-20240409   clang
i386         buildonly-randconfig-005-20240408   clang
i386         buildonly-randconfig-006-20240408   gcc  
i386                                defconfig   clang
i386                  randconfig-001-20240408   clang
i386                  randconfig-001-20240409   clang
i386                  randconfig-002-20240408   clang
i386                  randconfig-003-20240408   clang
i386                  randconfig-003-20240409   clang
i386                  randconfig-004-20240408   clang
i386                  randconfig-005-20240408   gcc  
i386                  randconfig-006-20240408   clang
i386                  randconfig-006-20240409   clang
i386                  randconfig-011-20240408   clang
i386                  randconfig-012-20240408   gcc  
i386                  randconfig-012-20240409   clang
i386                  randconfig-013-20240408   clang
i386                  randconfig-013-20240409   clang
i386                  randconfig-014-20240408   gcc  
i386                  randconfig-014-20240409   clang
i386                  randconfig-015-20240408   gcc  
i386                  randconfig-016-20240408   gcc  
i386                  randconfig-016-20240409   clang
loongarch                        allmodconfig   gcc  
loongarch                         allnoconfig   gcc  
loongarch                           defconfig   gcc  
loongarch             randconfig-001-20240408   gcc  
loongarch             randconfig-002-20240408   gcc  
m68k                             allmodconfig   gcc  
m68k                              allnoconfig   gcc  
m68k                             allyesconfig   gcc  
m68k                                defconfig   gcc  
m68k                        m5407c3_defconfig   gcc  
m68k                            mac_defconfig   gcc  
microblaze                       allmodconfig   gcc  
microblaze                        allnoconfig   gcc  
microblaze                       allyesconfig   gcc  
microblaze                          defconfig   gcc  
microblaze                      mmu_defconfig   gcc  
mips                              allnoconfig   gcc  
mips                             allyesconfig   gcc  
mips                       bmips_be_defconfig   gcc  
mips                     cu1830-neo_defconfig   gcc  
mips                            gpr_defconfig   clang
nios2                            allmodconfig   gcc  
nios2                             allnoconfig   gcc  
nios2                            allyesconfig   gcc  
nios2                               defconfig   gcc  
nios2                 randconfig-001-20240408   gcc  
nios2                 randconfig-002-20240408   gcc  
openrisc                          allnoconfig   gcc  
openrisc                         allyesconfig   gcc  
openrisc                            defconfig   gcc  
openrisc                       virt_defconfig   gcc  
parisc                           allmodconfig   gcc  
parisc                            allnoconfig   gcc  
parisc                           allyesconfig   gcc  
parisc                              defconfig   gcc  
parisc                randconfig-001-20240408   gcc  
parisc                randconfig-002-20240408   gcc  
parisc64                            defconfig   gcc  
powerpc                          allmodconfig   gcc  
powerpc                           allnoconfig   gcc  
powerpc                          allyesconfig   clang
powerpc                  iss476-smp_defconfig   gcc  
powerpc                     mpc512x_defconfig   clang
powerpc                         ps3_defconfig   gcc  
powerpc               randconfig-001-20240408   gcc  
powerpc               randconfig-002-20240408   clang
powerpc               randconfig-003-20240408   gcc  
powerpc                  storcenter_defconfig   gcc  
powerpc64             randconfig-001-20240408   clang
powerpc64             randconfig-002-20240408   gcc  
powerpc64             randconfig-003-20240408   clang
riscv                            allmodconfig   clang
riscv                             allnoconfig   gcc  
riscv                            allyesconfig   clang
riscv                               defconfig   clang
riscv                 randconfig-001-20240408   clang
riscv                 randconfig-002-20240408   clang
s390                             allmodconfig   clang
s390                              allnoconfig   clang
s390                             allyesconfig   gcc  
s390                                defconfig   clang
s390                  randconfig-001-20240408   clang
s390                  randconfig-002-20240408   gcc  
sh                               allmodconfig   gcc  
sh                                allnoconfig   gcc  
sh                               allyesconfig   gcc  
sh                                  defconfig   gcc  
sh                            hp6xx_defconfig   gcc  
sh                          polaris_defconfig   gcc  
sh                    randconfig-001-20240408   gcc  
sh                    randconfig-002-20240408   gcc  
sh                          rsk7201_defconfig   gcc  
sh                          sdk7780_defconfig   gcc  
sh                           se7705_defconfig   gcc  
sh                           sh2007_defconfig   gcc  
sparc                            allmodconfig   gcc  
sparc                             allnoconfig   gcc  
sparc                               defconfig   gcc  
sparc                       sparc32_defconfig   gcc  
sparc64                          allmodconfig   gcc  
sparc64                          allyesconfig   gcc  
sparc64                             defconfig   gcc  
sparc64               randconfig-001-20240408   gcc  
sparc64               randconfig-002-20240408   gcc  
um                               allmodconfig   clang
um                                allnoconfig   clang
um                               allyesconfig   gcc  
um                                  defconfig   clang
um                             i386_defconfig   gcc  
um                    randconfig-001-20240408   clang
um                    randconfig-002-20240408   clang
um                           x86_64_defconfig   clang
x86_64                           alldefconfig   gcc  
x86_64                            allnoconfig   clang
x86_64                           allyesconfig   clang
x86_64       buildonly-randconfig-001-20240408   clang
x86_64       buildonly-randconfig-002-20240408   clang
x86_64       buildonly-randconfig-003-20240408   clang
x86_64       buildonly-randconfig-004-20240408   clang
x86_64       buildonly-randconfig-005-20240408   clang
x86_64       buildonly-randconfig-006-20240408   clang
x86_64                              defconfig   gcc  
x86_64                randconfig-001-20240408   gcc  
x86_64                randconfig-002-20240408   clang
x86_64                randconfig-003-20240408   clang
x86_64                randconfig-004-20240408   clang
x86_64                randconfig-005-20240408   clang
x86_64                randconfig-006-20240408   gcc  
x86_64                randconfig-011-20240408   clang
x86_64                randconfig-012-20240408   clang
x86_64                randconfig-013-20240408   gcc  
x86_64                randconfig-014-20240408   clang
x86_64                randconfig-015-20240408   clang
x86_64                randconfig-016-20240408   clang
x86_64                randconfig-071-20240408   gcc  
x86_64                randconfig-072-20240408   clang
x86_64                randconfig-073-20240408   clang
x86_64                randconfig-074-20240408   gcc  
x86_64                randconfig-075-20240408   gcc  
x86_64                randconfig-076-20240408   clang
x86_64                          rhel-8.3-rust   clang
x86_64                               rhel-8.3   gcc  
xtensa                            allnoconfig   gcc  
xtensa                generic_kc705_defconfig   gcc  
xtensa                randconfig-001-20240408   gcc  
xtensa                randconfig-002-20240408   gcc  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

