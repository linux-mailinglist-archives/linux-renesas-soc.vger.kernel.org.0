Return-Path: <linux-renesas-soc+bounces-4806-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E6C178ADB2A
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 23 Apr 2024 02:34:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5B0D81F213C7
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 23 Apr 2024 00:34:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9BDDB7E9;
	Tue, 23 Apr 2024 00:34:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Is4TmF30"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 251A4184
	for <linux-renesas-soc@vger.kernel.org>; Tue, 23 Apr 2024 00:34:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713832492; cv=none; b=CEolEiYCHSNAaEMfjW7XHeqnkMEcaUb9TEBSu3NRfHuRknY9eLKdy1VEBLppdv1fQccewAD/qydJo00cgnA5XvedEkbPqhtokkAkOcWvZ6OibiPNBNMgYC65ehI6u6iXvvb+U7utgN/cNo47O4nktgqvzcv9MiLOC9VEvZmHvOk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713832492; c=relaxed/simple;
	bh=IZGPTGA1DyJQpBuGqi1u+AIpLDI8Qs2WBkzmY0cvH20=;
	h=Date:From:To:Cc:Subject:Message-ID; b=YG/JEGyKAbK5ojnu42Kk9bEHZqZKRUoMu7bWhxzd3vC/HbGihFMzWqC56fUAQb7RhDpmcqlQoAVL5wIQZv795AJhyQQ0Z59K/2Fo2rs3xX3UO/cErbbDU2qUs4T8NMMLfzAEaBnVjTMoxTU0ApqlYbHz7lkoj6v6aHFyt0GZgdE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Is4TmF30; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1713832490; x=1745368490;
  h=date:from:to:cc:subject:message-id;
  bh=IZGPTGA1DyJQpBuGqi1u+AIpLDI8Qs2WBkzmY0cvH20=;
  b=Is4TmF30kdS/tV7znjHa3X9KpIByZcV4MQqpXSNylj67fQW6Ze9DpM3i
   SpwHjMGi6ALmDw/LTZEXj9Vp22u2VB614CFWeHoTjq+fvisPe6GDVN8CN
   xVaS9naXU2z1NKU9/c1ij9zPXD3XDG9pkbgtwm+4TOUJ+O9XK78qx4YbM
   x7zXbLkNfqGWo48POFvSTiLJDb8Bz66K26VQ+0ma+yM15p8ZNs+a2irAM
   sLPjVFGYj8osKOHvJlM54cP08fsFj5X0/fh/9iAxzee3tRQsTnRYwHqXq
   vuKFRdK4y7gZd91jUi0wTLHK1x8Mf0WPJqD7i9tUe8JUITmkUO22jdr89
   Q==;
X-CSE-ConnectionGUID: balOYTSDR3WSsBBAPlJqtA==
X-CSE-MsgGUID: qCJ2tsDSQ1W0ATCY+00HYA==
X-IronPort-AV: E=McAfee;i="6600,9927,11052"; a="9314498"
X-IronPort-AV: E=Sophos;i="6.07,222,1708416000"; 
   d="scan'208";a="9314498"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Apr 2024 17:34:49 -0700
X-CSE-ConnectionGUID: 6nn6Dj5DR2Cu29uqMOpfKA==
X-CSE-MsgGUID: LCugBNmwR+ia/PVCJMFNnA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,222,1708416000"; 
   d="scan'208";a="47470414"
Received: from lkp-server01.sh.intel.com (HELO 01437695816f) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 22 Apr 2024 17:34:45 -0700
Received: from kbuild by 01437695816f with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rz47P-0000Lc-29;
	Tue, 23 Apr 2024 00:34:43 +0000
Date: Tue, 23 Apr 2024 08:34:39 +0800
From: kernel test robot <lkp@intel.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: linux-renesas-soc@vger.kernel.org
Subject: [geert-renesas-drivers:renesas-pinctrl-fixes-for-v6.9] BUILD
 SUCCESS 02cd2d3be1c31a3fd328ee83e576340d34bc57d9
Message-ID: <202404230836.nHGOvycE-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git renesas-pinctrl-fixes-for-v6.9
branch HEAD: 02cd2d3be1c31a3fd328ee83e576340d34bc57d9  pinctrl: renesas: rzg2l: Configure the interrupt type on resume

elapsed time: 927m

configs tested: 225
configs skipped: 4

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
arc                   randconfig-001-20240422   gcc  
arc                   randconfig-001-20240423   gcc  
arc                   randconfig-002-20240422   gcc  
arc                   randconfig-002-20240423   gcc  
arm                              alldefconfig   gcc  
arm                              allmodconfig   gcc  
arm                               allnoconfig   clang
arm                              allyesconfig   gcc  
arm                                 defconfig   clang
arm                        mvebu_v5_defconfig   gcc  
arm                          pxa910_defconfig   gcc  
arm                   randconfig-001-20240422   gcc  
arm                   randconfig-001-20240423   clang
arm                   randconfig-002-20240422   gcc  
arm                   randconfig-002-20240423   clang
arm                   randconfig-003-20240422   clang
arm                   randconfig-003-20240423   clang
arm                   randconfig-004-20240422   gcc  
arm                   randconfig-004-20240423   gcc  
arm64                            allmodconfig   clang
arm64                             allnoconfig   gcc  
arm64                            allyesconfig   clang
arm64                               defconfig   gcc  
arm64                 randconfig-001-20240422   gcc  
arm64                 randconfig-001-20240423   clang
arm64                 randconfig-002-20240422   clang
arm64                 randconfig-002-20240423   gcc  
arm64                 randconfig-003-20240422   gcc  
arm64                 randconfig-003-20240423   clang
arm64                 randconfig-004-20240422   gcc  
arm64                 randconfig-004-20240423   clang
csky                             allmodconfig   gcc  
csky                              allnoconfig   gcc  
csky                             allyesconfig   gcc  
csky                                defconfig   gcc  
csky                  randconfig-001-20240422   gcc  
csky                  randconfig-001-20240423   gcc  
csky                  randconfig-002-20240422   gcc  
csky                  randconfig-002-20240423   gcc  
hexagon                          allmodconfig   clang
hexagon                           allnoconfig   clang
hexagon                          allyesconfig   clang
hexagon                             defconfig   clang
hexagon               randconfig-001-20240422   clang
hexagon               randconfig-001-20240423   clang
hexagon               randconfig-002-20240422   clang
hexagon               randconfig-002-20240423   clang
i386                             allmodconfig   gcc  
i386                              allnoconfig   gcc  
i386                             allyesconfig   gcc  
i386         buildonly-randconfig-001-20240422   clang
i386         buildonly-randconfig-002-20240422   gcc  
i386         buildonly-randconfig-003-20240422   clang
i386         buildonly-randconfig-003-20240423   gcc  
i386         buildonly-randconfig-004-20240422   gcc  
i386         buildonly-randconfig-005-20240422   gcc  
i386         buildonly-randconfig-006-20240422   clang
i386         buildonly-randconfig-006-20240423   gcc  
i386                                defconfig   clang
i386                  randconfig-001-20240422   clang
i386                  randconfig-001-20240423   gcc  
i386                  randconfig-002-20240422   clang
i386                  randconfig-002-20240423   gcc  
i386                  randconfig-003-20240422   gcc  
i386                  randconfig-004-20240422   clang
i386                  randconfig-004-20240423   gcc  
i386                  randconfig-005-20240422   gcc  
i386                  randconfig-006-20240422   gcc  
i386                  randconfig-011-20240422   clang
i386                  randconfig-011-20240423   gcc  
i386                  randconfig-012-20240422   clang
i386                  randconfig-013-20240422   clang
i386                  randconfig-014-20240422   clang
i386                  randconfig-014-20240423   gcc  
i386                  randconfig-015-20240422   clang
i386                  randconfig-015-20240423   gcc  
i386                  randconfig-016-20240422   gcc  
loongarch                        allmodconfig   gcc  
loongarch                         allnoconfig   gcc  
loongarch                           defconfig   gcc  
loongarch             randconfig-001-20240422   gcc  
loongarch             randconfig-001-20240423   gcc  
loongarch             randconfig-002-20240422   gcc  
loongarch             randconfig-002-20240423   gcc  
m68k                             allmodconfig   gcc  
m68k                              allnoconfig   gcc  
m68k                             allyesconfig   gcc  
m68k                                defconfig   gcc  
m68k                        mvme147_defconfig   gcc  
microblaze                       allmodconfig   gcc  
microblaze                        allnoconfig   gcc  
microblaze                       allyesconfig   gcc  
microblaze                          defconfig   gcc  
mips                              allnoconfig   gcc  
mips                             allyesconfig   gcc  
mips                           ip28_defconfig   gcc  
mips                          malta_defconfig   gcc  
mips                       rbtx49xx_defconfig   gcc  
nios2                            allmodconfig   gcc  
nios2                             allnoconfig   gcc  
nios2                            allyesconfig   gcc  
nios2                               defconfig   gcc  
nios2                 randconfig-001-20240422   gcc  
nios2                 randconfig-001-20240423   gcc  
nios2                 randconfig-002-20240422   gcc  
nios2                 randconfig-002-20240423   gcc  
openrisc                          allnoconfig   gcc  
openrisc                         allyesconfig   gcc  
openrisc                            defconfig   gcc  
openrisc                 simple_smp_defconfig   gcc  
parisc                           allmodconfig   gcc  
parisc                            allnoconfig   gcc  
parisc                           allyesconfig   gcc  
parisc                              defconfig   gcc  
parisc                randconfig-001-20240422   gcc  
parisc                randconfig-001-20240423   gcc  
parisc                randconfig-002-20240422   gcc  
parisc                randconfig-002-20240423   gcc  
parisc64                            defconfig   gcc  
powerpc                          allmodconfig   gcc  
powerpc                           allnoconfig   gcc  
powerpc                          allyesconfig   clang
powerpc               randconfig-001-20240422   clang
powerpc               randconfig-001-20240423   gcc  
powerpc               randconfig-002-20240422   clang
powerpc               randconfig-002-20240423   gcc  
powerpc               randconfig-003-20240422   clang
powerpc               randconfig-003-20240423   clang
powerpc64             randconfig-001-20240422   gcc  
powerpc64             randconfig-001-20240423   gcc  
powerpc64             randconfig-002-20240422   gcc  
powerpc64             randconfig-002-20240423   clang
powerpc64             randconfig-003-20240422   gcc  
powerpc64             randconfig-003-20240423   clang
riscv                            allmodconfig   clang
riscv                             allnoconfig   gcc  
riscv                            allyesconfig   clang
riscv                               defconfig   clang
riscv                 randconfig-001-20240422   clang
riscv                 randconfig-001-20240423   gcc  
riscv                 randconfig-002-20240422   gcc  
riscv                 randconfig-002-20240423   gcc  
s390                             allmodconfig   clang
s390                              allnoconfig   clang
s390                             allyesconfig   gcc  
s390                                defconfig   clang
s390                  randconfig-001-20240422   clang
s390                  randconfig-001-20240423   clang
s390                  randconfig-002-20240422   clang
s390                  randconfig-002-20240423   gcc  
sh                               allmodconfig   gcc  
sh                                allnoconfig   gcc  
sh                               allyesconfig   gcc  
sh                                  defconfig   gcc  
sh                    randconfig-001-20240422   gcc  
sh                    randconfig-001-20240423   gcc  
sh                    randconfig-002-20240422   gcc  
sh                    randconfig-002-20240423   gcc  
sh                          rsk7201_defconfig   gcc  
sh                          rsk7264_defconfig   gcc  
sh                           se7780_defconfig   gcc  
sh                  sh7785lcr_32bit_defconfig   gcc  
sh                             shx3_defconfig   gcc  
sparc                            allmodconfig   gcc  
sparc                             allnoconfig   gcc  
sparc                               defconfig   gcc  
sparc64                          allmodconfig   gcc  
sparc64                          allyesconfig   gcc  
sparc64                             defconfig   gcc  
sparc64               randconfig-001-20240422   gcc  
sparc64               randconfig-001-20240423   gcc  
sparc64               randconfig-002-20240422   gcc  
sparc64               randconfig-002-20240423   gcc  
um                               allmodconfig   clang
um                                allnoconfig   clang
um                               allyesconfig   gcc  
um                                  defconfig   clang
um                             i386_defconfig   gcc  
um                    randconfig-001-20240422   gcc  
um                    randconfig-001-20240423   gcc  
um                    randconfig-002-20240422   clang
um                    randconfig-002-20240423   gcc  
um                           x86_64_defconfig   clang
x86_64                            allnoconfig   clang
x86_64                           allyesconfig   clang
x86_64       buildonly-randconfig-001-20240422   clang
x86_64       buildonly-randconfig-002-20240422   gcc  
x86_64       buildonly-randconfig-003-20240422   gcc  
x86_64       buildonly-randconfig-004-20240422   clang
x86_64       buildonly-randconfig-005-20240422   gcc  
x86_64       buildonly-randconfig-006-20240422   clang
x86_64                              defconfig   gcc  
x86_64                randconfig-001-20240422   clang
x86_64                randconfig-002-20240422   gcc  
x86_64                randconfig-003-20240422   clang
x86_64                randconfig-004-20240422   gcc  
x86_64                randconfig-005-20240422   gcc  
x86_64                randconfig-006-20240422   clang
x86_64                randconfig-011-20240422   gcc  
x86_64                randconfig-012-20240422   clang
x86_64                randconfig-013-20240422   gcc  
x86_64                randconfig-014-20240422   clang
x86_64                randconfig-015-20240422   gcc  
x86_64                randconfig-016-20240422   gcc  
x86_64                randconfig-071-20240422   clang
x86_64                randconfig-072-20240422   gcc  
x86_64                randconfig-073-20240422   gcc  
x86_64                randconfig-074-20240422   gcc  
x86_64                randconfig-075-20240422   gcc  
x86_64                randconfig-076-20240422   gcc  
x86_64                          rhel-8.3-rust   clang
x86_64                               rhel-8.3   gcc  
xtensa                            allnoconfig   gcc  
xtensa                       common_defconfig   gcc  
xtensa                randconfig-001-20240422   gcc  
xtensa                randconfig-001-20240423   gcc  
xtensa                randconfig-002-20240422   gcc  
xtensa                randconfig-002-20240423   gcc  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

