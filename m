Return-Path: <linux-renesas-soc+bounces-3731-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B02AD879DFA
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 12 Mar 2024 23:00:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4F9DE1F21E94
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 12 Mar 2024 22:00:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9BD93143732;
	Tue, 12 Mar 2024 22:00:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GyMyP/C7"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CE064CDE0
	for <linux-renesas-soc@vger.kernel.org>; Tue, 12 Mar 2024 22:00:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710280825; cv=none; b=JjDldGjqQ1Q6dCrhusrCWlqw+CpvhyU1na8rJCTp4XMCuM8yPbo+jFZRMXNoMxJMSjcAEAxOih1LXytr6jJ9USOonKwiCyP+uYR8nn4j+kmIT6yHZFL9hc60qsQtCrHfB+/0XkKr4C722i7jl7xQBHt1f7Gr5DnQ0aznnElOooI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710280825; c=relaxed/simple;
	bh=w8uyoUCMvH0wO9koJjm5yiDrCfHqYKrSDL4q2EfZA3I=;
	h=Date:From:To:Cc:Subject:Message-ID; b=VC2edTq6PDopBDQ4YCKXdrnUDxqq5+MGsOqeIaWgGpjs38IvTIAuhu6ywNUCxehTcEv/svJpdafgZWbwEOfrmai6psubvBsKzM92QeneIAiPEusWR5io7lyaQ7swg3ih4SOCW7+ZYhAsPbxRwCqZnV3RripmF8PDKqBhkQIpbTg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GyMyP/C7; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1710280824; x=1741816824;
  h=date:from:to:cc:subject:message-id;
  bh=w8uyoUCMvH0wO9koJjm5yiDrCfHqYKrSDL4q2EfZA3I=;
  b=GyMyP/C7Bki5FfeZpyFUADxEyaUMFZzQcfi6xLSjIMpnmlfraB6u47Dq
   +t0uDOaQFqnn8ughnh3tDhMNqj+qCPHotd27KVHo/LweCg75gSDNf+X+K
   JkGlDQ8yvfuRIrBOgA6KKcCkAOFL4XMzhp9ya4NxDm49+7eycRTdLuorZ
   CI2rTJPhOeUoLk5iQ7ycQH9hkLdLFQhlJ6yupfDKGHyI2+2QDQO0BjYHl
   z+XrF8DqMfxjNDZAFAQKo3A8w3YNqPQgNiJyuRqsGTzUUowdID4JZI1xE
   5ROnqHyD/MWiY+QF0BmA6ZFuvKyWtXmFY1wnk4qHCkeNecQF81tBNW1db
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,11011"; a="16419679"
X-IronPort-AV: E=Sophos;i="6.07,119,1708416000"; 
   d="scan'208";a="16419679"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Mar 2024 15:00:23 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,119,1708416000"; 
   d="scan'208";a="12284059"
Received: from lkp-server01.sh.intel.com (HELO b21307750695) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 12 Mar 2024 15:00:21 -0700
Received: from kbuild by b21307750695 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rkAAV-000BiJ-0g;
	Tue, 12 Mar 2024 22:00:19 +0000
Date: Wed, 13 Mar 2024 06:00:15 +0800
From: kernel test robot <lkp@intel.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: linux-renesas-soc@vger.kernel.org
Subject: [geert-renesas-devel:master] BUILD SUCCESS
 62823f1b4e74f3cfdc7166b044ecab3e2751e930
Message-ID: <202403130611.IPehVcao-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git master
branch HEAD: 62823f1b4e74f3cfdc7166b044ecab3e2751e930  Merge branch 'renesas-dts-for-v6.10' into renesas-devel

elapsed time: 736m

configs tested: 176
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
arc                          axs103_defconfig   gcc  
arc                                 defconfig   gcc  
arc                            hsdk_defconfig   gcc  
arc                   randconfig-001-20240312   gcc  
arc                   randconfig-002-20240312   gcc  
arm                              allmodconfig   gcc  
arm                               allnoconfig   clang
arm                              allyesconfig   gcc  
arm                                 defconfig   clang
arm                   randconfig-001-20240312   clang
arm                   randconfig-002-20240312   gcc  
arm                   randconfig-003-20240312   gcc  
arm                   randconfig-004-20240312   clang
arm                          sp7021_defconfig   gcc  
arm64                            allmodconfig   clang
arm64                             allnoconfig   gcc  
arm64                               defconfig   gcc  
arm64                 randconfig-001-20240312   gcc  
arm64                 randconfig-002-20240312   gcc  
arm64                 randconfig-003-20240312   gcc  
arm64                 randconfig-004-20240312   clang
csky                             allmodconfig   gcc  
csky                              allnoconfig   gcc  
csky                             allyesconfig   gcc  
csky                                defconfig   gcc  
csky                  randconfig-001-20240312   gcc  
csky                  randconfig-002-20240312   gcc  
hexagon                          allmodconfig   clang
hexagon                           allnoconfig   clang
hexagon                          allyesconfig   clang
hexagon                             defconfig   clang
hexagon               randconfig-001-20240312   clang
hexagon               randconfig-002-20240312   clang
i386                             allmodconfig   gcc  
i386                              allnoconfig   gcc  
i386                             allyesconfig   gcc  
i386         buildonly-randconfig-001-20240312   gcc  
i386         buildonly-randconfig-001-20240313   gcc  
i386         buildonly-randconfig-002-20240312   gcc  
i386         buildonly-randconfig-002-20240313   gcc  
i386         buildonly-randconfig-003-20240312   gcc  
i386         buildonly-randconfig-004-20240312   gcc  
i386         buildonly-randconfig-005-20240312   clang
i386         buildonly-randconfig-006-20240312   gcc  
i386         buildonly-randconfig-006-20240313   gcc  
i386                                defconfig   clang
i386                  randconfig-001-20240312   gcc  
i386                  randconfig-002-20240312   clang
i386                  randconfig-003-20240312   gcc  
i386                  randconfig-004-20240312   gcc  
i386                  randconfig-004-20240313   gcc  
i386                  randconfig-005-20240312   gcc  
i386                  randconfig-005-20240313   gcc  
i386                  randconfig-006-20240312   gcc  
i386                  randconfig-011-20240312   gcc  
i386                  randconfig-011-20240313   gcc  
i386                  randconfig-012-20240312   gcc  
i386                  randconfig-013-20240312   clang
i386                  randconfig-013-20240313   gcc  
i386                  randconfig-014-20240312   clang
i386                  randconfig-014-20240313   gcc  
i386                  randconfig-015-20240312   gcc  
i386                  randconfig-016-20240312   clang
i386                  randconfig-016-20240313   gcc  
loongarch                        allmodconfig   gcc  
loongarch                         allnoconfig   gcc  
loongarch                        allyesconfig   gcc  
loongarch                           defconfig   gcc  
loongarch             randconfig-001-20240312   gcc  
loongarch             randconfig-002-20240312   gcc  
m68k                             allmodconfig   gcc  
m68k                              allnoconfig   gcc  
m68k                             allyesconfig   gcc  
m68k                         amcore_defconfig   gcc  
m68k                                defconfig   gcc  
microblaze                       allmodconfig   gcc  
microblaze                        allnoconfig   gcc  
microblaze                       allyesconfig   gcc  
microblaze                          defconfig   gcc  
mips                             allmodconfig   gcc  
mips                              allnoconfig   gcc  
mips                             allyesconfig   gcc  
mips                    maltaup_xpa_defconfig   gcc  
mips                          rm200_defconfig   gcc  
nios2                         10m50_defconfig   gcc  
nios2                            allmodconfig   gcc  
nios2                             allnoconfig   gcc  
nios2                            allyesconfig   gcc  
nios2                               defconfig   gcc  
nios2                 randconfig-001-20240312   gcc  
nios2                 randconfig-002-20240312   gcc  
openrisc                         allmodconfig   gcc  
openrisc                          allnoconfig   gcc  
openrisc                         allyesconfig   gcc  
openrisc                            defconfig   gcc  
parisc                           alldefconfig   gcc  
parisc                           allmodconfig   gcc  
parisc                            allnoconfig   gcc  
parisc                           allyesconfig   gcc  
parisc                              defconfig   gcc  
parisc                randconfig-001-20240312   gcc  
parisc                randconfig-002-20240312   gcc  
parisc64                            defconfig   gcc  
powerpc                          allmodconfig   gcc  
powerpc                           allnoconfig   gcc  
powerpc                          allyesconfig   clang
powerpc                        cell_defconfig   gcc  
powerpc                     ep8248e_defconfig   gcc  
powerpc                          g5_defconfig   gcc  
powerpc                 mpc8313_rdb_defconfig   gcc  
powerpc               randconfig-001-20240312   gcc  
powerpc               randconfig-002-20240312   clang
powerpc               randconfig-003-20240312   gcc  
powerpc                     tqm8540_defconfig   gcc  
powerpc64             randconfig-001-20240312   clang
powerpc64             randconfig-002-20240312   clang
powerpc64             randconfig-003-20240312   gcc  
riscv                            allmodconfig   clang
riscv                             allnoconfig   gcc  
riscv                            allyesconfig   clang
riscv                               defconfig   clang
riscv                 randconfig-001-20240312   clang
riscv                 randconfig-002-20240312   gcc  
s390                             allmodconfig   clang
s390                              allnoconfig   clang
s390                             allyesconfig   gcc  
s390                          debug_defconfig   gcc  
s390                                defconfig   clang
s390                  randconfig-001-20240312   clang
s390                  randconfig-002-20240312   clang
sh                               allmodconfig   gcc  
sh                                allnoconfig   gcc  
sh                               allyesconfig   gcc  
sh                                  defconfig   gcc  
sh                     magicpanelr2_defconfig   gcc  
sh                            migor_defconfig   gcc  
sh                    randconfig-001-20240312   gcc  
sh                    randconfig-002-20240312   gcc  
sh                          sdk7780_defconfig   gcc  
sh                           se7722_defconfig   gcc  
sh                           sh2007_defconfig   gcc  
sh                   sh7770_generic_defconfig   gcc  
sh                  sh7785lcr_32bit_defconfig   gcc  
sparc                            allmodconfig   gcc  
sparc                             allnoconfig   gcc  
sparc                            allyesconfig   gcc  
sparc                               defconfig   gcc  
sparc64                          allmodconfig   gcc  
sparc64                          allyesconfig   gcc  
sparc64                             defconfig   gcc  
sparc64               randconfig-001-20240312   gcc  
sparc64               randconfig-002-20240312   gcc  
um                               allmodconfig   clang
um                                allnoconfig   clang
um                               allyesconfig   gcc  
um                                  defconfig   clang
um                             i386_defconfig   gcc  
um                    randconfig-001-20240312   gcc  
um                    randconfig-002-20240312   gcc  
um                           x86_64_defconfig   clang
x86_64                            allnoconfig   clang
x86_64                           allyesconfig   clang
x86_64                              defconfig   gcc  
x86_64                          rhel-8.3-rust   clang
x86_64                               rhel-8.3   gcc  
xtensa                            allnoconfig   gcc  
xtensa                           allyesconfig   gcc  
xtensa                randconfig-001-20240312   gcc  
xtensa                randconfig-002-20240312   gcc  
xtensa                    smp_lx200_defconfig   gcc  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

