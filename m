Return-Path: <linux-renesas-soc+bounces-26937-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id CF2AAD38929
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 16 Jan 2026 23:23:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 95D85301A70C
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 16 Jan 2026 22:23:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 46BCE2FFFBE;
	Fri, 16 Jan 2026 22:23:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JhTPS0Wr"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B8F62FE595
	for <linux-renesas-soc@vger.kernel.org>; Fri, 16 Jan 2026 22:23:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768602207; cv=none; b=SJXKXFFpj1GeP5pihXCf3UiXEdZ8G+ZodsFlOBb9icZdE0h19AQybFMUo6bq9EJW2o/IWcMlKzHo+Yw89OUsXwoFezqpLhNQ4gbxiCsN4k6/kqL8YZOLCqmjXhILQb1v21FefPFd1PHrt8ywXJJ8KLr2e7qjO34cRefxB3bRlOQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768602207; c=relaxed/simple;
	bh=sfjWC+35UpzRGpNSQRf1kSakgkn5xTa9ZSWdyGlZ4V8=;
	h=Date:From:To:Cc:Subject:Message-ID; b=Y69swM5EtfyMvkGMuhCnpgQqJTrJP780EqFyRksJz4tECDpPxunAIx9OwVFBqYv9HYAH6bzhlWo9KrS7PMkI0xvQCjoIA70YrTsVAecE+GCda57FGIjOKhp37fSJi+1Bqxg/l890D+MhQRW0/EE9OSiw5q2BVfQQ0Y2ciwjQ+u0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JhTPS0Wr; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768602205; x=1800138205;
  h=date:from:to:cc:subject:message-id;
  bh=sfjWC+35UpzRGpNSQRf1kSakgkn5xTa9ZSWdyGlZ4V8=;
  b=JhTPS0WrcefAshOgz3IRtMETlRMd/6AxqBhjKZgU6rVEFxQmNRDY/tei
   l94CdaijFATFeuPVH1LG8O3f4nr/O72HDPaIzSKxIVzQpVssB9riwHuuc
   f+wZhnQOurPtsE5R8E9tFeAZ07nwZa4jSXfk9D8ys+H0i3LayT4oQmJcN
   gI7zRmntJMUeyHbCwVc9HW7n3kDhOBV73+K4IASJC6DIjJHl9EGJTSfa0
   AI+mvh0V1p/pY/pU1ORr/KbjAgmh2vrTaF6rQJRYDEF1m1ssip6ptDDVY
   URBXNTVlnK9/s1T1zYqcSzRQhzMdaDXtXJTT7doH1PjA7f7HBZBi8eS0k
   A==;
X-CSE-ConnectionGUID: Ak2BXegbQa279CwwM/naAQ==
X-CSE-MsgGUID: meG7s7mKQLuRaTHQZsD6mQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11673"; a="87495039"
X-IronPort-AV: E=Sophos;i="6.21,232,1763452800"; 
   d="scan'208";a="87495039"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jan 2026 14:23:25 -0800
X-CSE-ConnectionGUID: YtfUp65OTQOJufpzRuO+UQ==
X-CSE-MsgGUID: zMQQBMMiT5mhLGnzmNOnLg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,232,1763452800"; 
   d="scan'208";a="236622351"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 16 Jan 2026 14:23:24 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vgsDx-00000000LJA-2HbI;
	Fri, 16 Jan 2026 22:23:21 +0000
Date: Sat, 17 Jan 2026 06:23:12 +0800
From: kernel test robot <lkp@intel.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: linux-renesas-soc@vger.kernel.org
Subject: [geert-renesas-devel:next] BUILD SUCCESS
 08e16a461a8f66ae38b7e1febd4230c9aba9414f
Message-ID: <202601170607.MXVEEmHM-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git next
branch HEAD: 08e16a461a8f66ae38b7e1febd4230c9aba9414f  Merge branch 'renesas-dts-for-v6.20' into renesas-next

elapsed time: 723m

configs tested: 247
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
x86_64                randconfig-002-20260116    clang-20
x86_64                randconfig-003-20260116    clang-20
x86_64                randconfig-004-20260116    clang-20
x86_64                randconfig-005-20260116    clang-20
x86_64                randconfig-006-20260116    clang-20
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

