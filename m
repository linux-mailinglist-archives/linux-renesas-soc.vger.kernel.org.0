Return-Path: <linux-renesas-soc+bounces-5801-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id EF04A8FAAE6
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  4 Jun 2024 08:33:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A620928DE1D
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  4 Jun 2024 06:33:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 59AA312E1F9;
	Tue,  4 Jun 2024 06:33:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jxfuCutb"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89E37801
	for <linux-renesas-soc@vger.kernel.org>; Tue,  4 Jun 2024 06:33:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717482812; cv=none; b=Jkwq5J4cjr5v7APxB8OZBR4L8jQfkwebptmPlSGNX6wcIxwHEAlwZP2iy90onYOhzaoKpn1OGYIE6OR8xy95tXKezU0rlnT0hJJHdUxJB5/Yr+RNV5biwBcTGAOhBafd3ZJfElIRJS8hTBtbKDwybXx6zjtrMhWGO6zdeKU+TuU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717482812; c=relaxed/simple;
	bh=Pt97ycfs6XTJoqYJLQsjEFrpKnhP/JAAkTfHqpLlR/M=;
	h=Date:From:To:Cc:Subject:Message-ID; b=snOs4e3t/tGacu00IAzRoJjuVhNqO/H2+T6f0NFrW4p0lg05KItW55/Z4rdE0c+PCWqVxVyFXOSAv4ni2Rcky6+iYKGq5TO/jc2ny9Gu+X2x8vHMQR8X3FKXtROwPyQ+pAEqo0gXIFDq1n+JR1Bfd77Hhcj4BonwcHEcTOwBTbA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jxfuCutb; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1717482810; x=1749018810;
  h=date:from:to:cc:subject:message-id;
  bh=Pt97ycfs6XTJoqYJLQsjEFrpKnhP/JAAkTfHqpLlR/M=;
  b=jxfuCutbjQl7GiQVN0vIzrGdFFk7kol/rQHEXwjMiabfFFHbdG5+j/D1
   p3eNyY3V+u5x4r6zh8b17bVtgxdftOd3WLjTmbqrSeB5pyvTn8WRQiqUL
   zbOGh3Mn454oOr0B9ELO5WQbmO46bHDDI1p3hQ0rWY8ADJ2IyKFRJr6UT
   bZnZx4m9MfhQuw/9a7OPeFctvPXOZWAM1jl7wofnbi7cEbBnKJuSc+e26
   bopNA4o1Vh17abQLtgIa3zxh/83X5EVKdhFbHuHrtcD3GAGHhOrRKDe9T
   Ed+jN9eKtJ26eBV7/4GAVZ6sSuteXarRUJ6TH/rzMNVv7qya0kYzJJdQ+
   Q==;
X-CSE-ConnectionGUID: Cj3uuS7eQUCEAAv8gg3XWQ==
X-CSE-MsgGUID: ydGGQkVXQ7uPXwly4dR7rw==
X-IronPort-AV: E=McAfee;i="6600,9927,11092"; a="13811539"
X-IronPort-AV: E=Sophos;i="6.08,213,1712646000"; 
   d="scan'208";a="13811539"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Jun 2024 23:33:30 -0700
X-CSE-ConnectionGUID: NiQeYOGKR4SpZ5Vs8MX2eg==
X-CSE-MsgGUID: vU8BcYxLTy+SEMM56eWu3Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,213,1712646000"; 
   d="scan'208";a="37720996"
Received: from unknown (HELO 0610945e7d16) ([10.239.97.151])
  by orviesa008.jf.intel.com with ESMTP; 03 Jun 2024 23:33:29 -0700
Received: from kbuild by 0610945e7d16 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sENja-000MfB-0y;
	Tue, 04 Jun 2024 06:33:26 +0000
Date: Tue, 04 Jun 2024 14:32:26 +0800
From: kernel test robot <lkp@intel.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: linux-renesas-soc@vger.kernel.org
Subject: [geert-renesas-devel:topic/renesas-defconfig] BUILD SUCCESS
 bf7d02685a26dc8158f5b4ddd24963b5a54c41d1
Message-ID: <202406041423.IN2FQ7cr-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git topic/renesas-defconfig
branch HEAD: bf7d02685a26dc8158f5b4ddd24963b5a54c41d1  arm64: renesas: defconfig: Refresh for v6.10-rc1

elapsed time: 1254m

configs tested: 213
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
arc                          axs101_defconfig   gcc  
arc                                 defconfig   gcc  
arc                   randconfig-001-20240603   gcc  
arc                   randconfig-001-20240604   gcc  
arc                   randconfig-002-20240603   gcc  
arc                   randconfig-002-20240604   gcc  
arm                              allmodconfig   gcc  
arm                               allnoconfig   clang
arm                              allyesconfig   gcc  
arm                                 defconfig   clang
arm                   randconfig-001-20240603   gcc  
arm                   randconfig-002-20240603   gcc  
arm                   randconfig-002-20240604   gcc  
arm                   randconfig-003-20240603   gcc  
arm                   randconfig-004-20240603   gcc  
arm                   randconfig-004-20240604   gcc  
arm64                            allmodconfig   clang
arm64                             allnoconfig   gcc  
arm64                            allyesconfig   clang
arm64                               defconfig   gcc  
arm64                 randconfig-001-20240603   gcc  
arm64                 randconfig-002-20240603   gcc  
arm64                 randconfig-002-20240604   gcc  
arm64                 randconfig-003-20240604   gcc  
arm64                 randconfig-004-20240603   gcc  
csky                             allmodconfig   gcc  
csky                              allnoconfig   gcc  
csky                             allyesconfig   gcc  
csky                                defconfig   gcc  
csky                  randconfig-001-20240603   gcc  
csky                  randconfig-001-20240604   gcc  
csky                  randconfig-002-20240603   gcc  
csky                  randconfig-002-20240604   gcc  
hexagon                          allmodconfig   clang
hexagon                           allnoconfig   clang
hexagon                          allyesconfig   clang
hexagon                             defconfig   clang
i386                             allmodconfig   gcc  
i386                              allnoconfig   gcc  
i386                             allyesconfig   gcc  
i386         buildonly-randconfig-001-20240603   clang
i386         buildonly-randconfig-002-20240603   clang
i386         buildonly-randconfig-003-20240603   gcc  
i386         buildonly-randconfig-004-20240603   gcc  
i386         buildonly-randconfig-005-20240603   gcc  
i386         buildonly-randconfig-006-20240603   clang
i386                                defconfig   clang
i386                  randconfig-001-20240603   clang
i386                  randconfig-002-20240603   gcc  
i386                  randconfig-003-20240603   gcc  
i386                  randconfig-004-20240603   clang
i386                  randconfig-005-20240603   clang
i386                  randconfig-006-20240603   gcc  
i386                  randconfig-011-20240603   clang
i386                  randconfig-012-20240603   clang
i386                  randconfig-013-20240603   clang
i386                  randconfig-014-20240603   clang
i386                  randconfig-015-20240603   clang
i386                  randconfig-016-20240603   gcc  
loongarch                        allmodconfig   gcc  
loongarch                         allnoconfig   gcc  
loongarch                           defconfig   gcc  
loongarch             randconfig-001-20240603   gcc  
loongarch             randconfig-001-20240604   gcc  
loongarch             randconfig-002-20240603   gcc  
loongarch             randconfig-002-20240604   gcc  
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
mips                       bmips_be_defconfig   gcc  
mips                  decstation_64_defconfig   gcc  
mips                  maltasmvp_eva_defconfig   gcc  
mips                    maltaup_xpa_defconfig   gcc  
mips                           rs90_defconfig   gcc  
nios2                            allmodconfig   gcc  
nios2                             allnoconfig   gcc  
nios2                            allyesconfig   gcc  
nios2                               defconfig   gcc  
nios2                 randconfig-001-20240603   gcc  
nios2                 randconfig-001-20240604   gcc  
nios2                 randconfig-002-20240603   gcc  
nios2                 randconfig-002-20240604   gcc  
openrisc                          allnoconfig   gcc  
openrisc                         allyesconfig   gcc  
openrisc                            defconfig   gcc  
parisc                           allmodconfig   gcc  
parisc                            allnoconfig   gcc  
parisc                           allyesconfig   gcc  
parisc                              defconfig   gcc  
parisc                generic-32bit_defconfig   gcc  
parisc                randconfig-001-20240603   gcc  
parisc                randconfig-001-20240604   gcc  
parisc                randconfig-002-20240603   gcc  
parisc                randconfig-002-20240604   gcc  
parisc64                         alldefconfig   gcc  
parisc64                            defconfig   gcc  
powerpc                          allmodconfig   gcc  
powerpc                           allnoconfig   gcc  
powerpc                          allyesconfig   clang
powerpc               randconfig-001-20240603   gcc  
powerpc               randconfig-001-20240604   gcc  
powerpc               randconfig-002-20240603   gcc  
powerpc               randconfig-002-20240604   gcc  
powerpc               randconfig-003-20240603   gcc  
powerpc               randconfig-003-20240604   gcc  
powerpc64             randconfig-001-20240603   gcc  
powerpc64             randconfig-001-20240604   gcc  
powerpc64             randconfig-002-20240603   gcc  
powerpc64             randconfig-002-20240604   gcc  
riscv                            allmodconfig   clang
riscv                             allnoconfig   gcc  
riscv                            allyesconfig   clang
riscv                               defconfig   clang
riscv                 randconfig-002-20240604   gcc  
s390                             allmodconfig   clang
s390                              allnoconfig   clang
s390                             allyesconfig   gcc  
s390                                defconfig   clang
s390                  randconfig-002-20240604   gcc  
sh                               allmodconfig   gcc  
sh                                allnoconfig   gcc  
sh                               allyesconfig   gcc  
sh                                  defconfig   gcc  
sh                          kfr2r09_defconfig   gcc  
sh                    randconfig-001-20240603   gcc  
sh                    randconfig-001-20240604   gcc  
sh                    randconfig-002-20240603   gcc  
sh                    randconfig-002-20240604   gcc  
sh                           se7724_defconfig   gcc  
sh                        sh7763rdp_defconfig   gcc  
sh                  sh7785lcr_32bit_defconfig   gcc  
sh                        sh7785lcr_defconfig   gcc  
sh                            shmin_defconfig   gcc  
sh                              ul2_defconfig   gcc  
sparc                            allmodconfig   gcc  
sparc                             allnoconfig   gcc  
sparc                               defconfig   gcc  
sparc64                          allmodconfig   gcc  
sparc64                          allyesconfig   gcc  
sparc64                             defconfig   gcc  
sparc64               randconfig-001-20240603   gcc  
sparc64               randconfig-001-20240604   gcc  
sparc64               randconfig-002-20240603   gcc  
sparc64               randconfig-002-20240604   gcc  
um                               allmodconfig   clang
um                                allnoconfig   clang
um                               allyesconfig   gcc  
um                                  defconfig   clang
um                             i386_defconfig   gcc  
um                    randconfig-002-20240603   gcc  
um                           x86_64_defconfig   clang
x86_64                            allnoconfig   clang
x86_64                           allyesconfig   clang
x86_64       buildonly-randconfig-001-20240603   gcc  
x86_64       buildonly-randconfig-001-20240604   clang
x86_64       buildonly-randconfig-002-20240603   gcc  
x86_64       buildonly-randconfig-002-20240604   clang
x86_64       buildonly-randconfig-003-20240603   gcc  
x86_64       buildonly-randconfig-004-20240603   clang
x86_64       buildonly-randconfig-004-20240604   clang
x86_64       buildonly-randconfig-005-20240603   clang
x86_64       buildonly-randconfig-006-20240603   gcc  
x86_64       buildonly-randconfig-006-20240604   clang
x86_64                              defconfig   gcc  
x86_64                randconfig-001-20240603   gcc  
x86_64                randconfig-001-20240604   clang
x86_64                randconfig-002-20240603   clang
x86_64                randconfig-003-20240603   clang
x86_64                randconfig-004-20240603   gcc  
x86_64                randconfig-005-20240603   gcc  
x86_64                randconfig-006-20240603   gcc  
x86_64                randconfig-011-20240603   gcc  
x86_64                randconfig-011-20240604   clang
x86_64                randconfig-012-20240603   gcc  
x86_64                randconfig-012-20240604   clang
x86_64                randconfig-013-20240603   clang
x86_64                randconfig-013-20240604   clang
x86_64                randconfig-014-20240603   gcc  
x86_64                randconfig-014-20240604   clang
x86_64                randconfig-015-20240603   gcc  
x86_64                randconfig-015-20240604   clang
x86_64                randconfig-016-20240603   clang
x86_64                randconfig-016-20240604   clang
x86_64                randconfig-071-20240603   clang
x86_64                randconfig-071-20240604   clang
x86_64                randconfig-072-20240603   clang
x86_64                randconfig-073-20240603   clang
x86_64                randconfig-074-20240603   clang
x86_64                randconfig-074-20240604   clang
x86_64                randconfig-075-20240603   gcc  
x86_64                randconfig-075-20240604   clang
x86_64                randconfig-076-20240603   gcc  
x86_64                randconfig-076-20240604   clang
x86_64                          rhel-8.3-rust   clang
x86_64                               rhel-8.3   gcc  
xtensa                            allnoconfig   gcc  
xtensa                randconfig-001-20240603   gcc  
xtensa                randconfig-001-20240604   gcc  
xtensa                randconfig-002-20240603   gcc  
xtensa                randconfig-002-20240604   gcc  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

