Return-Path: <linux-renesas-soc+bounces-2443-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AC13784D221
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  7 Feb 2024 20:15:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0EE01283EF1
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  7 Feb 2024 19:15:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 263F084FB4;
	Wed,  7 Feb 2024 19:15:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VRwOhrJa"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2451B8562D
	for <linux-renesas-soc@vger.kernel.org>; Wed,  7 Feb 2024 19:15:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707333315; cv=none; b=kxS1/HJyI4gduHcCQ4Jlwl6/qfhO8rYHGokPherEvRlSfbC5aH42pH7ECrUWEwuV0vwPiCc0CYKAfmlUzYBbXePxSLDStHuc8CaZAwUMzMHSrqEihH8ARvQyNhvPCH1UTKCVSiTDgwzhFV5FC2HkZUPavQLeTNVUTJk14F6d/x0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707333315; c=relaxed/simple;
	bh=5T+JL9GMNgwhgrnckvpIGZ+zQ7i+7JhvuK8RqwZgbp8=;
	h=Date:From:To:Cc:Subject:Message-ID; b=f1KZWQ76RPKUQ7l/SjsLPE4ex4a0NerEPSK9uASJ+ASheEako6YrWhAtzVrEcI0/xQDZWx7JlGNoHNb8BWJCUCGX7xEacl/wFfnL+fIvOZLfKq6l811d0563USX0DhzdoZRcYjekqkMYZoEIycjd6PdsnZ+bEPqm8B4rKN78WqI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VRwOhrJa; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1707333313; x=1738869313;
  h=date:from:to:cc:subject:message-id;
  bh=5T+JL9GMNgwhgrnckvpIGZ+zQ7i+7JhvuK8RqwZgbp8=;
  b=VRwOhrJagwjj9mKNNkuRwFu9dw8qjDriv/RLQuuM8Ovzxz2t3LbDAqWY
   vcFSuTpcqsJzfxNMSpd7zj7IIQbHrOWY0plamxcWnOFiSh/43YAEpOF8A
   2qyr1tLLfYTiNl9HqY9gx4cqFHElTKwT5rdHuzcgaefuP47NTx5tqEnBU
   aHBaTOcMbhZtZ2Upvtsrn92pmwH3UBQh0QLaTLENaC7H/j84YJnK4CS/1
   VVsawsw8JvnqCqYFV9hkrBa7LISfyFkkhyCi6GJ+Muc8hAOljDh1a+7kz
   qe9vL1MFPgHniFfEbRLK726ChWJeiSlbU+GTC0dEL7c3JtR1x8DqXWPwU
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10977"; a="953074"
X-IronPort-AV: E=Sophos;i="6.05,251,1701158400"; 
   d="scan'208";a="953074"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Feb 2024 11:15:12 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,251,1701158400"; 
   d="scan'208";a="38862276"
Received: from lkp-server01.sh.intel.com (HELO 01f0647817ea) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 07 Feb 2024 11:15:11 -0800
Received: from kbuild by 01f0647817ea with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rXnO0-0002xh-1T;
	Wed, 07 Feb 2024 19:15:08 +0000
Date: Thu, 08 Feb 2024 03:14:42 +0800
From: kernel test robot <lkp@intel.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: linux-renesas-soc@vger.kernel.org
Subject: [geert-renesas-drivers:master] BUILD SUCCESS
 25f4822c7b08fd7615cb8454a2c67a39d5202a58
Message-ID: <202402080339.aaIFzMR7-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git master
branch HEAD: 25f4822c7b08fd7615cb8454a2c67a39d5202a58  [LOCAL] arm64: renesas: defconfig: Update renesas_defconfig

elapsed time: 1448m

configs tested: 177
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
arc                   randconfig-001-20240207   gcc  
arc                   randconfig-002-20240207   gcc  
arm                              allmodconfig   gcc  
arm                               allnoconfig   clang
arm                              allyesconfig   gcc  
arm                                 defconfig   clang
arm                          moxart_defconfig   gcc  
arm                   randconfig-001-20240207   clang
arm                   randconfig-002-20240207   clang
arm                   randconfig-003-20240207   clang
arm                   randconfig-004-20240207   gcc  
arm                       versatile_defconfig   gcc  
arm64                            allmodconfig   clang
arm64                             allnoconfig   gcc  
arm64                               defconfig   gcc  
arm64                 randconfig-001-20240207   clang
arm64                 randconfig-002-20240207   clang
arm64                 randconfig-003-20240207   clang
arm64                 randconfig-004-20240207   clang
csky                             allmodconfig   gcc  
csky                              allnoconfig   gcc  
csky                             allyesconfig   gcc  
csky                                defconfig   gcc  
csky                  randconfig-001-20240207   gcc  
csky                  randconfig-002-20240207   gcc  
hexagon                          allmodconfig   clang
hexagon                           allnoconfig   clang
hexagon                          allyesconfig   clang
hexagon                             defconfig   clang
hexagon               randconfig-001-20240207   clang
hexagon               randconfig-002-20240207   clang
i386                             allmodconfig   gcc  
i386                              allnoconfig   gcc  
i386                             allyesconfig   gcc  
i386         buildonly-randconfig-001-20240207   clang
i386         buildonly-randconfig-002-20240207   clang
i386         buildonly-randconfig-003-20240207   clang
i386         buildonly-randconfig-004-20240207   clang
i386         buildonly-randconfig-005-20240207   clang
i386         buildonly-randconfig-006-20240207   clang
i386                                defconfig   clang
i386                  randconfig-001-20240207   gcc  
i386                  randconfig-002-20240207   clang
i386                  randconfig-003-20240207   gcc  
i386                  randconfig-004-20240207   gcc  
i386                  randconfig-005-20240207   gcc  
i386                  randconfig-006-20240207   clang
i386                  randconfig-011-20240207   gcc  
i386                  randconfig-012-20240207   gcc  
i386                  randconfig-013-20240207   gcc  
i386                  randconfig-014-20240207   gcc  
i386                  randconfig-015-20240207   gcc  
i386                  randconfig-016-20240207   gcc  
loongarch                        allmodconfig   gcc  
loongarch                         allnoconfig   gcc  
loongarch                           defconfig   gcc  
loongarch                 loongson3_defconfig   gcc  
loongarch             randconfig-001-20240207   gcc  
loongarch             randconfig-002-20240207   gcc  
m68k                             alldefconfig   gcc  
m68k                             allmodconfig   gcc  
m68k                              allnoconfig   gcc  
m68k                             allyesconfig   gcc  
m68k                         amcore_defconfig   gcc  
m68k                                defconfig   gcc  
m68k                           virt_defconfig   gcc  
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
nios2                 randconfig-001-20240207   gcc  
nios2                 randconfig-002-20240207   gcc  
openrisc                          allnoconfig   gcc  
openrisc                         allyesconfig   gcc  
openrisc                            defconfig   gcc  
parisc                           allmodconfig   gcc  
parisc                            allnoconfig   gcc  
parisc                           allyesconfig   gcc  
parisc                              defconfig   gcc  
parisc                generic-64bit_defconfig   gcc  
parisc                randconfig-001-20240207   gcc  
parisc                randconfig-002-20240207   gcc  
parisc64                            defconfig   gcc  
powerpc                          allmodconfig   gcc  
powerpc                           allnoconfig   gcc  
powerpc                          allyesconfig   clang
powerpc                     ksi8560_defconfig   gcc  
powerpc                      ppc44x_defconfig   clang
powerpc               randconfig-001-20240207   clang
powerpc               randconfig-002-20240207   clang
powerpc               randconfig-003-20240207   gcc  
powerpc                     stx_gp3_defconfig   clang
powerpc64             randconfig-001-20240207   clang
powerpc64             randconfig-002-20240207   gcc  
powerpc64             randconfig-003-20240207   gcc  
riscv                            allmodconfig   clang
riscv                             allnoconfig   gcc  
riscv                            allyesconfig   clang
riscv                               defconfig   clang
riscv                 randconfig-001-20240207   clang
riscv                 randconfig-002-20240207   gcc  
s390                             allmodconfig   clang
s390                              allnoconfig   clang
s390                             allyesconfig   gcc  
s390                                defconfig   clang
s390                  randconfig-001-20240207   gcc  
s390                  randconfig-002-20240207   gcc  
sh                               allmodconfig   gcc  
sh                                allnoconfig   gcc  
sh                               allyesconfig   gcc  
sh                                  defconfig   gcc  
sh                        dreamcast_defconfig   gcc  
sh                    randconfig-001-20240207   gcc  
sh                    randconfig-002-20240207   gcc  
sh                           se7750_defconfig   gcc  
sh                   secureedge5410_defconfig   gcc  
sh                             shx3_defconfig   gcc  
sparc                            allmodconfig   gcc  
sparc                             allnoconfig   gcc  
sparc                               defconfig   gcc  
sparc64                          allmodconfig   gcc  
sparc64                          allyesconfig   gcc  
sparc64                             defconfig   gcc  
sparc64               randconfig-001-20240207   gcc  
sparc64               randconfig-002-20240207   gcc  
um                               allmodconfig   clang
um                                allnoconfig   clang
um                               allyesconfig   gcc  
um                                  defconfig   clang
um                    randconfig-001-20240207   clang
um                    randconfig-002-20240207   gcc  
um                           x86_64_defconfig   clang
x86_64                            allnoconfig   clang
x86_64                           allyesconfig   clang
x86_64       buildonly-randconfig-001-20240207   clang
x86_64       buildonly-randconfig-002-20240207   clang
x86_64       buildonly-randconfig-003-20240207   gcc  
x86_64       buildonly-randconfig-004-20240207   clang
x86_64       buildonly-randconfig-005-20240207   clang
x86_64       buildonly-randconfig-006-20240207   clang
x86_64                              defconfig   gcc  
x86_64                randconfig-001-20240207   clang
x86_64                randconfig-002-20240207   gcc  
x86_64                randconfig-003-20240207   gcc  
x86_64                randconfig-004-20240207   gcc  
x86_64                randconfig-005-20240207   clang
x86_64                randconfig-006-20240207   clang
x86_64                randconfig-011-20240207   clang
x86_64                randconfig-012-20240207   gcc  
x86_64                randconfig-013-20240207   clang
x86_64                randconfig-014-20240207   clang
x86_64                randconfig-015-20240207   gcc  
x86_64                randconfig-016-20240207   gcc  
x86_64                randconfig-071-20240207   gcc  
x86_64                randconfig-072-20240207   clang
x86_64                randconfig-073-20240207   clang
x86_64                randconfig-074-20240207   gcc  
x86_64                randconfig-075-20240207   gcc  
x86_64                randconfig-076-20240207   clang
x86_64                          rhel-8.3-rust   clang
xtensa                            allnoconfig   gcc  
xtensa                       common_defconfig   gcc  
xtensa                randconfig-001-20240207   gcc  
xtensa                randconfig-002-20240207   gcc  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

