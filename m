Return-Path: <linux-renesas-soc+bounces-26936-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A144BD38928
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 16 Jan 2026 23:22:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D767E301A726
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 16 Jan 2026 22:22:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 76DB12FFFBE;
	Fri, 16 Jan 2026 22:22:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="iYnV5Hmm"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3EAA2FE595
	for <linux-renesas-soc@vger.kernel.org>; Fri, 16 Jan 2026 22:22:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768602148; cv=none; b=Fo5qlt38687XxftURQytK5kbeG4kO+bEp3sZc98BRtWbSlR5pWYLBmwLPpFExVOCRp+DBHc7Z3MOBVqcrPoQPVw31zc3RxhYINEEQTyZ/ArChjvikx6Td6WIy3bZeqK6108NVkEITlLfWGWv5ZzQrbIpekCxn7+J6BRUFqhnmJM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768602148; c=relaxed/simple;
	bh=QaSrkbVxBCS8C8li+n6zvC9M2cq/+mXXPfe0ZTdnjas=;
	h=Date:From:To:Cc:Subject:Message-ID; b=A/1HCDkczo0PkkkoTPbR1rCv7HLgX5mqJbLaUrE5iIOOwWHjZjDQUR+VsMWo3g4sYw1jORXeY5CjLKiUwXedhkbusjAMZ0QekGTiOS3j4I5Hrtrc8Z7wKTi1mYvGR7eWPSWRN0JDBFG6Kc057Xu0YlUwLauaz4Bc4mLlbf7JEGA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=iYnV5Hmm; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768602146; x=1800138146;
  h=date:from:to:cc:subject:message-id;
  bh=QaSrkbVxBCS8C8li+n6zvC9M2cq/+mXXPfe0ZTdnjas=;
  b=iYnV5Hmm+VlBX/jeFQhIp8NoYxMcJtA2K8CMQGKaMwGzaCV6IgJmiUEY
   WLsfBwuqZe9Z4LDL7oiJqdWlE+c7GpG858iBVJRgqu6pYucJnC27LNxWg
   0G8kDhlzqAJV1V6Ofb9+i9G7bufa5s8X1qcl82Tc5lLo3TjKEc+Hu8Jjm
   Q/KuPYMcuG4ILXM2kX1OQVAQxTZXtO3unu+/HQ+t2LdesnzWpeuJz/SX7
   j77aD6o6nQTY8UWf9QgSRqtyNHU5YYuohT7aL1r/rRORe5hb44DHo5chF
   Iq1F0kwAZCiblHbXuXnH7nNaHHftW+I0wKK4hCUGTG7L63OOkR3bLTfXP
   w==;
X-CSE-ConnectionGUID: Jvf4cfqiSj6YA24ewiaVUA==
X-CSE-MsgGUID: EqnI+FC7SUS3IolTyiYS7g==
X-IronPort-AV: E=McAfee;i="6800,10657,11673"; a="95395158"
X-IronPort-AV: E=Sophos;i="6.21,232,1763452800"; 
   d="scan'208";a="95395158"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jan 2026 14:22:25 -0800
X-CSE-ConnectionGUID: +oDjFmHrQIqCTBo3NlD7bQ==
X-CSE-MsgGUID: 9fg3vYXqQ1+6CLZEp56MKA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,232,1763452800"; 
   d="scan'208";a="205383566"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 16 Jan 2026 14:22:24 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vgsCz-00000000LJ2-202c;
	Fri, 16 Jan 2026 22:22:21 +0000
Date: Sat, 17 Jan 2026 06:21:49 +0800
From: kernel test robot <lkp@intel.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: linux-renesas-soc@vger.kernel.org
Subject: [geert-renesas-devel:renesas-dts-for-v6.20] BUILD SUCCESS
 5979010bcc665e9bcf41b22f111b3fe7fc4eadb1
Message-ID: <202601170643.pCJkpyTV-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git renesas-dts-for-v6.20
branch HEAD: 5979010bcc665e9bcf41b22f111b3fe7fc4eadb1  arm64: dts: renesas: rzt2h-rzn2h-evk: Reorder ADC nodes

elapsed time: 721m

configs tested: 253
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-15.2.0
alpha                            allyesconfig    gcc-15.2.0
alpha                               defconfig    gcc-15.2.0
arc                              allmodconfig    clang-16
arc                               allnoconfig    gcc-15.2.0
arc                              allyesconfig    clang-22
arc                                 defconfig    gcc-15.2.0
arc                         haps_hs_defconfig    gcc-15.2.0
arc                            hsdk_defconfig    gcc-15.2.0
arc                   randconfig-001-20260116    gcc-8.5.0
arc                   randconfig-001-20260117    gcc-12.5.0
arc                   randconfig-002-20260116    gcc-8.5.0
arc                   randconfig-002-20260117    gcc-12.5.0
arm                              alldefconfig    gcc-15.2.0
arm                               allnoconfig    gcc-15.2.0
arm                              allyesconfig    clang-16
arm                                 defconfig    gcc-15.2.0
arm                             mxs_defconfig    gcc-15.2.0
arm                   randconfig-001-20260116    gcc-8.5.0
arm                   randconfig-001-20260117    gcc-12.5.0
arm                   randconfig-002-20260116    gcc-8.5.0
arm                   randconfig-002-20260117    gcc-12.5.0
arm                   randconfig-003-20260116    gcc-8.5.0
arm                   randconfig-003-20260117    gcc-12.5.0
arm                   randconfig-004-20260116    gcc-8.5.0
arm                   randconfig-004-20260117    gcc-12.5.0
arm                        spear3xx_defconfig    gcc-15.2.0
arm                           stm32_defconfig    gcc-15.2.0
arm64                            allmodconfig    clang-22
arm64                             allnoconfig    gcc-15.2.0
arm64                               defconfig    gcc-15.2.0
arm64                 randconfig-001-20260116    clang-22
arm64                 randconfig-002-20260116    clang-22
arm64                 randconfig-003-20260116    clang-17
arm64                 randconfig-004-20260116    clang-22
csky                             allmodconfig    gcc-15.2.0
csky                              allnoconfig    gcc-15.2.0
csky                                defconfig    gcc-15.2.0
csky                  randconfig-001-20260116    gcc-15.2.0
csky                  randconfig-002-20260116    gcc-15.2.0
hexagon                          allmodconfig    gcc-15.2.0
hexagon                           allnoconfig    gcc-15.2.0
hexagon                             defconfig    gcc-15.2.0
hexagon               randconfig-001-20260116    clang-20
hexagon               randconfig-001-20260117    clang-22
hexagon               randconfig-002-20260116    clang-20
hexagon               randconfig-002-20260117    clang-22
i386                             allmodconfig    clang-20
i386                              allnoconfig    gcc-15.2.0
i386                             allyesconfig    clang-20
i386        buildonly-randconfig-001-20260116    gcc-12
i386        buildonly-randconfig-001-20260117    gcc-13
i386        buildonly-randconfig-002-20260116    gcc-12
i386        buildonly-randconfig-002-20260117    gcc-13
i386        buildonly-randconfig-003-20260116    gcc-12
i386        buildonly-randconfig-003-20260117    gcc-13
i386        buildonly-randconfig-004-20260116    gcc-12
i386        buildonly-randconfig-004-20260117    gcc-13
i386        buildonly-randconfig-005-20260116    gcc-12
i386        buildonly-randconfig-005-20260117    gcc-13
i386        buildonly-randconfig-006-20260116    gcc-12
i386        buildonly-randconfig-006-20260117    gcc-13
i386                                defconfig    gcc-15.2.0
i386                  randconfig-001-20260116    clang-20
i386                  randconfig-001-20260116    gcc-14
i386                  randconfig-002-20260116    clang-20
i386                  randconfig-003-20260116    clang-20
i386                  randconfig-004-20260116    clang-20
i386                  randconfig-004-20260116    gcc-14
i386                  randconfig-005-20260116    clang-20
i386                  randconfig-005-20260116    gcc-14
i386                  randconfig-006-20260116    clang-20
i386                  randconfig-007-20260116    clang-20
i386                  randconfig-007-20260116    gcc-14
i386                  randconfig-011-20260116    clang-20
i386                  randconfig-011-20260117    gcc-14
i386                  randconfig-012-20260116    clang-20
i386                  randconfig-012-20260117    gcc-14
i386                  randconfig-013-20260116    clang-20
i386                  randconfig-013-20260117    gcc-14
i386                  randconfig-014-20260116    clang-20
i386                  randconfig-014-20260117    gcc-14
i386                  randconfig-015-20260116    clang-20
i386                  randconfig-015-20260117    gcc-14
i386                  randconfig-016-20260116    clang-20
i386                  randconfig-016-20260117    gcc-14
i386                  randconfig-017-20260116    clang-20
i386                  randconfig-017-20260117    gcc-14
loongarch                        allmodconfig    clang-22
loongarch                         allnoconfig    gcc-15.2.0
loongarch                           defconfig    clang-19
loongarch             randconfig-001-20260116    clang-20
loongarch             randconfig-001-20260117    clang-22
loongarch             randconfig-002-20260116    clang-20
loongarch             randconfig-002-20260117    clang-22
m68k                             allmodconfig    gcc-15.2.0
m68k                              allnoconfig    gcc-15.2.0
m68k                             allyesconfig    clang-16
m68k                         amcore_defconfig    gcc-15.2.0
m68k                                defconfig    clang-19
m68k                           virt_defconfig    gcc-15.2.0
microblaze                        allnoconfig    gcc-15.2.0
microblaze                       allyesconfig    gcc-15.2.0
microblaze                          defconfig    clang-19
mips                             allmodconfig    gcc-15.2.0
mips                              allnoconfig    gcc-15.2.0
mips                             allyesconfig    gcc-15.2.0
mips                         bigsur_defconfig    gcc-15.2.0
mips                     cu1830-neo_defconfig    gcc-15.2.0
mips                      loongson3_defconfig    gcc-15.2.0
nios2                            allmodconfig    clang-22
nios2                             allnoconfig    clang-22
nios2                               defconfig    clang-19
nios2                 randconfig-001-20260116    clang-20
nios2                 randconfig-001-20260117    clang-22
nios2                 randconfig-002-20260116    clang-20
nios2                 randconfig-002-20260117    clang-22
openrisc                         allmodconfig    clang-22
openrisc                          allnoconfig    clang-22
openrisc                            defconfig    gcc-15.2.0
parisc                           allmodconfig    gcc-15.2.0
parisc                            allnoconfig    clang-22
parisc                           allyesconfig    clang-19
parisc                              defconfig    gcc-15.2.0
parisc                randconfig-001-20260116    clang-22
parisc                randconfig-001-20260117    clang-22
parisc                randconfig-002-20260116    clang-22
parisc                randconfig-002-20260117    clang-22
parisc64                            defconfig    clang-19
powerpc                          allmodconfig    gcc-15.2.0
powerpc                           allnoconfig    clang-22
powerpc                    amigaone_defconfig    gcc-15.2.0
powerpc                      bamboo_defconfig    gcc-15.2.0
powerpc                    ge_imp3a_defconfig    gcc-15.2.0
powerpc                  mpc885_ads_defconfig    gcc-15.2.0
powerpc               randconfig-001-20260116    clang-22
powerpc               randconfig-001-20260117    clang-22
powerpc               randconfig-002-20260116    clang-22
powerpc               randconfig-002-20260117    clang-22
powerpc                     tqm5200_defconfig    gcc-15.2.0
powerpc                     tqm8540_defconfig    gcc-15.2.0
powerpc64             randconfig-001-20260116    clang-22
powerpc64             randconfig-001-20260117    clang-22
powerpc64             randconfig-002-20260116    clang-22
powerpc64             randconfig-002-20260117    clang-22
riscv                            allmodconfig    clang-22
riscv                             allnoconfig    clang-22
riscv                            allyesconfig    clang-16
riscv                               defconfig    gcc-15.2.0
riscv                 randconfig-001-20260116    clang-22
riscv                 randconfig-001-20260116    gcc-15.2.0
riscv                 randconfig-001-20260117    gcc-10.5.0
riscv                 randconfig-002-20260116    clang-22
riscv                 randconfig-002-20260116    gcc-15.2.0
riscv                 randconfig-002-20260117    gcc-10.5.0
s390                             allmodconfig    clang-19
s390                              allnoconfig    clang-22
s390                             allyesconfig    gcc-15.2.0
s390                                defconfig    gcc-15.2.0
s390                  randconfig-001-20260116    clang-22
s390                  randconfig-001-20260116    gcc-15.2.0
s390                  randconfig-001-20260117    gcc-10.5.0
s390                  randconfig-002-20260116    gcc-15.2.0
s390                  randconfig-002-20260116    gcc-8.5.0
s390                  randconfig-002-20260117    gcc-10.5.0
sh                               allmodconfig    gcc-15.2.0
sh                                allnoconfig    clang-22
sh                               allyesconfig    clang-19
sh                                  defconfig    gcc-14
sh                    randconfig-001-20260116    gcc-15.2.0
sh                    randconfig-001-20260117    gcc-10.5.0
sh                    randconfig-002-20260116    gcc-14.3.0
sh                    randconfig-002-20260116    gcc-15.2.0
sh                    randconfig-002-20260117    gcc-10.5.0
sh                           se7750_defconfig    gcc-15.2.0
sh                        sh7785lcr_defconfig    gcc-15.2.0
sparc                             allnoconfig    clang-22
sparc                               defconfig    gcc-15.2.0
sparc                 randconfig-001-20260116    gcc-10.5.0
sparc                 randconfig-001-20260117    gcc-14.3.0
sparc                 randconfig-002-20260116    gcc-10.5.0
sparc                 randconfig-002-20260117    gcc-14.3.0
sparc64                          alldefconfig    gcc-15.2.0
sparc64                          allmodconfig    clang-22
sparc64                             defconfig    gcc-14
sparc64               randconfig-001-20260116    gcc-10.5.0
sparc64               randconfig-001-20260117    gcc-14.3.0
sparc64               randconfig-002-20260116    gcc-10.5.0
sparc64               randconfig-002-20260117    gcc-14.3.0
um                               allmodconfig    clang-19
um                                allnoconfig    clang-22
um                               allyesconfig    gcc-15.2.0
um                                  defconfig    gcc-14
um                             i386_defconfig    gcc-14
um                    randconfig-001-20260116    gcc-10.5.0
um                    randconfig-001-20260117    gcc-14.3.0
um                    randconfig-002-20260116    gcc-10.5.0
um                    randconfig-002-20260117    gcc-14.3.0
um                           x86_64_defconfig    gcc-14
x86_64                           allmodconfig    clang-20
x86_64                            allnoconfig    clang-22
x86_64                           allyesconfig    clang-20
x86_64      buildonly-randconfig-001-20260116    gcc-14
x86_64      buildonly-randconfig-002-20260116    gcc-14
x86_64      buildonly-randconfig-003-20260116    gcc-14
x86_64      buildonly-randconfig-004-20260116    gcc-14
x86_64      buildonly-randconfig-005-20260116    gcc-14
x86_64      buildonly-randconfig-006-20260116    gcc-14
x86_64                              defconfig    gcc-14
x86_64                                  kexec    clang-20
x86_64                randconfig-001-20260116    clang-20
x86_64                randconfig-001-20260117    clang-20
x86_64                randconfig-002-20260116    clang-20
x86_64                randconfig-002-20260117    clang-20
x86_64                randconfig-003-20260116    clang-20
x86_64                randconfig-003-20260117    clang-20
x86_64                randconfig-004-20260116    clang-20
x86_64                randconfig-004-20260117    clang-20
x86_64                randconfig-005-20260116    clang-20
x86_64                randconfig-005-20260117    gcc-12
x86_64                randconfig-006-20260116    clang-20
x86_64                randconfig-006-20260117    gcc-14
x86_64                randconfig-011-20260116    clang-20
x86_64                randconfig-012-20260116    clang-20
x86_64                randconfig-013-20260116    clang-20
x86_64                randconfig-014-20260116    clang-20
x86_64                randconfig-015-20260116    clang-20
x86_64                randconfig-016-20260116    clang-20
x86_64                randconfig-071-20260116    clang-20
x86_64                randconfig-071-20260117    clang-20
x86_64                randconfig-072-20260116    clang-20
x86_64                randconfig-072-20260117    clang-20
x86_64                randconfig-073-20260116    clang-20
x86_64                randconfig-073-20260117    clang-20
x86_64                randconfig-074-20260116    clang-20
x86_64                randconfig-074-20260117    clang-20
x86_64                randconfig-075-20260116    clang-20
x86_64                randconfig-075-20260117    clang-20
x86_64                randconfig-076-20260116    clang-20
x86_64                randconfig-076-20260117    clang-20
x86_64                               rhel-9.4    clang-20
x86_64                           rhel-9.4-bpf    gcc-14
x86_64                          rhel-9.4-func    clang-20
x86_64                    rhel-9.4-kselftests    clang-20
x86_64                         rhel-9.4-kunit    gcc-14
x86_64                           rhel-9.4-ltp    gcc-14
x86_64                          rhel-9.4-rust    clang-20
xtensa                            allnoconfig    clang-22
xtensa                           allyesconfig    clang-22
xtensa                randconfig-001-20260116    gcc-10.5.0
xtensa                randconfig-001-20260117    gcc-14.3.0
xtensa                randconfig-002-20260116    gcc-10.5.0
xtensa                randconfig-002-20260117    gcc-14.3.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

