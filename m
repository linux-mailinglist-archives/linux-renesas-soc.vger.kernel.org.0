Return-Path: <linux-renesas-soc+bounces-20463-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EB5DB24C96
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 13 Aug 2025 16:56:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 27CD3161A63
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 13 Aug 2025 14:52:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 900B52ECEAE;
	Wed, 13 Aug 2025 14:52:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MPvIXtIr"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA72EDF71
	for <linux-renesas-soc@vger.kernel.org>; Wed, 13 Aug 2025 14:52:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755096761; cv=none; b=Mz4dILe+NTpKzF9ns+45GD1kFRT8JIfwfzX9hc6hqvdcja6Yd2i8nVlhhrAEJ8vpWOgDuU2m8Vs09lFh0kR2bt/m+XkcYB056QkyXkK3n77VrhP1ziV2iatNLzzfLT0C66fThcXK+7KCbKEXQ1fOPH8FCdZ375SsAbd231WAbNE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755096761; c=relaxed/simple;
	bh=DI7IitRgJcJCnAaomsgDzVUd3jPg+JpfSHNps623p7Y=;
	h=Date:From:To:Cc:Subject:Message-ID; b=cqo212ORcWNT/W3U3XdHnD6lSw0Cvo8fsD8aP1NtIWBcp191fbJS2wrEuM18ZRYi+VOqJXthqCYpzTYG5Su9a/qOlqGAJJohRP7hEI68shPAsOuIztFmc/zFWWe9yRaUs9dIEF7iFjjnvVOduRsyfQmCLJntowu8+bf24cf4SNA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=MPvIXtIr; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1755096759; x=1786632759;
  h=date:from:to:cc:subject:message-id;
  bh=DI7IitRgJcJCnAaomsgDzVUd3jPg+JpfSHNps623p7Y=;
  b=MPvIXtIr4IVNV7TDzJuRfHHyRVpkifgmBhAN4WlAXFzv/Kfd4BHg/uMb
   qKtrYSMRbsq9hgdrKzbGhkvHue9+gVeiQExm1ivgdbREnbMqjNIi7yYs4
   0YdkiLoCjg+VcBA6ya5p80gXuojdiY/V997VpAKKyjP+dicYv8m9spIfG
   TYjYAy4NfsL+5c+Z1RO7jpOyKTF3f/zw8c/kngmSldOLQrhYe5JeCHTeC
   30I1MOJvlnnckTituQt8XTjr7K9bCzZW1WMzx1uEwvShcNtNPJy4Z5cRU
   2tMkHbQ4EyA+AkOiLSHVajQU7FpIZMV/Gqf11pYgA41cFdVa1Udx2lVY5
   w==;
X-CSE-ConnectionGUID: 5Ynsu1+qTF+hdbjXYqWVXA==
X-CSE-MsgGUID: KOwQF7N5RIep+MPSnUOcsA==
X-IronPort-AV: E=McAfee;i="6800,10657,11520"; a="56418043"
X-IronPort-AV: E=Sophos;i="6.17,285,1747724400"; 
   d="scan'208";a="56418043"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Aug 2025 07:52:38 -0700
X-CSE-ConnectionGUID: d2iETNnXRbWbWX4VmnHfpw==
X-CSE-MsgGUID: HyyEZm21S72F8uXvSMyreA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,285,1747724400"; 
   d="scan'208";a="166858997"
Received: from lkp-server02.sh.intel.com (HELO 4ea60e6ab079) ([10.239.97.151])
  by fmviesa008.fm.intel.com with ESMTP; 13 Aug 2025 07:52:37 -0700
Received: from kbuild by 4ea60e6ab079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1umCpW-000A0M-1s;
	Wed, 13 Aug 2025 14:52:02 +0000
Date: Wed, 13 Aug 2025 22:51:11 +0800
From: kernel test robot <lkp@intel.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: linux-renesas-soc@vger.kernel.org
Subject: [geert-renesas-drivers:renesas-r9a09g077-dt-binding-defs]
 BUILD SUCCESS 5293e8f2a854344ef9aba2391b44c7a437889ebb
Message-ID: <202508132254.rSv6xSNn-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git renesas-r9a09g077-dt-binding-defs
branch HEAD: 5293e8f2a854344ef9aba2391b44c7a437889ebb  dt-bindings: pinctrl: renesas: Document RZ/T2H and RZ/N2H SoCs

elapsed time: 1458m

configs tested: 254
configs skipped: 7

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    clang-22
alpha                             allnoconfig    gcc-15.1.0
alpha                            allyesconfig    clang-19
alpha                            allyesconfig    gcc-15.1.0
alpha                               defconfig    clang-19
arc                              allmodconfig    clang-19
arc                              allmodconfig    gcc-15.1.0
arc                               allnoconfig    clang-22
arc                               allnoconfig    gcc-15.1.0
arc                              allyesconfig    clang-19
arc                              allyesconfig    gcc-15.1.0
arc                                 defconfig    clang-19
arc                   randconfig-001-20250812    gcc-8.5.0
arc                   randconfig-001-20250813    clang-22
arc                   randconfig-002-20250812    gcc-12.5.0
arc                   randconfig-002-20250813    clang-22
arm                              allmodconfig    clang-19
arm                              allmodconfig    gcc-15.1.0
arm                               allnoconfig    clang-22
arm                              allyesconfig    clang-19
arm                              allyesconfig    gcc-15.1.0
arm                         assabet_defconfig    clang-22
arm                                 defconfig    clang-19
arm                            mps2_defconfig    clang-22
arm                       multi_v4t_defconfig    clang-22
arm                   randconfig-001-20250812    clang-22
arm                   randconfig-001-20250813    clang-22
arm                   randconfig-002-20250812    clang-22
arm                   randconfig-002-20250813    clang-22
arm                   randconfig-003-20250812    gcc-14.3.0
arm                   randconfig-003-20250813    clang-22
arm                   randconfig-004-20250812    gcc-10.5.0
arm                   randconfig-004-20250813    clang-22
arm                    vt8500_v6_v7_defconfig    clang-22
arm64                            allmodconfig    clang-19
arm64                             allnoconfig    clang-22
arm64                             allnoconfig    gcc-15.1.0
arm64                               defconfig    clang-19
arm64                 randconfig-001-20250812    gcc-8.5.0
arm64                 randconfig-001-20250813    clang-22
arm64                 randconfig-002-20250812    gcc-8.5.0
arm64                 randconfig-002-20250813    clang-22
arm64                 randconfig-003-20250812    gcc-14.3.0
arm64                 randconfig-003-20250813    clang-22
arm64                 randconfig-004-20250812    gcc-8.5.0
arm64                 randconfig-004-20250813    clang-22
csky                              allnoconfig    clang-22
csky                              allnoconfig    gcc-15.1.0
csky                                defconfig    clang-19
csky                  randconfig-001-20250812    gcc-13.4.0
csky                  randconfig-001-20250813    clang-20
csky                  randconfig-002-20250812    gcc-10.5.0
csky                  randconfig-002-20250813    clang-20
hexagon                          allmodconfig    clang-17
hexagon                          allmodconfig    clang-19
hexagon                           allnoconfig    clang-22
hexagon                          allyesconfig    clang-19
hexagon                          allyesconfig    clang-22
hexagon                             defconfig    clang-19
hexagon               randconfig-001-20250812    clang-22
hexagon               randconfig-001-20250813    clang-20
hexagon               randconfig-002-20250812    clang-22
hexagon               randconfig-002-20250813    clang-20
i386                             allmodconfig    clang-20
i386                             allmodconfig    gcc-12
i386                              allnoconfig    clang-20
i386                              allnoconfig    gcc-12
i386                             allyesconfig    clang-20
i386        buildonly-randconfig-001-20250812    gcc-12
i386        buildonly-randconfig-001-20250813    gcc-11
i386        buildonly-randconfig-002-20250812    gcc-12
i386        buildonly-randconfig-002-20250813    gcc-11
i386        buildonly-randconfig-003-20250812    gcc-12
i386        buildonly-randconfig-003-20250813    gcc-11
i386        buildonly-randconfig-004-20250812    clang-20
i386        buildonly-randconfig-004-20250813    gcc-11
i386        buildonly-randconfig-005-20250812    clang-20
i386        buildonly-randconfig-005-20250813    gcc-11
i386        buildonly-randconfig-006-20250812    gcc-12
i386        buildonly-randconfig-006-20250813    gcc-11
i386                                defconfig    clang-20
i386                  randconfig-001-20250813    clang-20
i386                  randconfig-002-20250813    clang-20
i386                  randconfig-003-20250813    clang-20
i386                  randconfig-004-20250813    clang-20
i386                  randconfig-005-20250813    clang-20
i386                  randconfig-006-20250813    clang-20
i386                  randconfig-007-20250813    clang-20
i386                  randconfig-011-20250813    gcc-11
i386                  randconfig-012-20250813    gcc-11
i386                  randconfig-013-20250813    gcc-11
i386                  randconfig-014-20250813    gcc-11
i386                  randconfig-015-20250813    gcc-11
i386                  randconfig-016-20250813    gcc-11
i386                  randconfig-017-20250813    gcc-11
loongarch                        allmodconfig    clang-19
loongarch                         allnoconfig    clang-22
loongarch                           defconfig    clang-19
loongarch             randconfig-001-20250812    gcc-15.1.0
loongarch             randconfig-001-20250813    clang-20
loongarch             randconfig-002-20250812    gcc-15.1.0
loongarch             randconfig-002-20250813    clang-20
m68k                             allmodconfig    clang-19
m68k                             allmodconfig    gcc-15.1.0
m68k                              allnoconfig    gcc-15.1.0
m68k                             allyesconfig    clang-19
m68k                             allyesconfig    gcc-15.1.0
m68k                                defconfig    clang-19
m68k                          multi_defconfig    gcc-15.1.0
microblaze                       allmodconfig    clang-19
microblaze                       allmodconfig    gcc-15.1.0
microblaze                        allnoconfig    gcc-15.1.0
microblaze                       allyesconfig    clang-19
microblaze                       allyesconfig    gcc-15.1.0
microblaze                          defconfig    gcc-15.1.0
mips                              allnoconfig    gcc-15.1.0
mips                          ath25_defconfig    gcc-15.1.0
mips                         bigsur_defconfig    gcc-15.1.0
mips                           ci20_defconfig    gcc-15.1.0
nios2                             allnoconfig    gcc-11.5.0
nios2                               defconfig    gcc-15.1.0
nios2                 randconfig-001-20250812    gcc-10.5.0
nios2                 randconfig-001-20250813    clang-20
nios2                 randconfig-002-20250812    gcc-11.5.0
nios2                 randconfig-002-20250813    clang-20
openrisc                          allnoconfig    clang-22
openrisc                          allnoconfig    gcc-15.1.0
openrisc                         allyesconfig    gcc-15.1.0
openrisc                            defconfig    gcc-12
parisc                           allmodconfig    gcc-15.1.0
parisc                            allnoconfig    clang-22
parisc                            allnoconfig    gcc-15.1.0
parisc                           allyesconfig    gcc-15.1.0
parisc                              defconfig    gcc-15.1.0
parisc                randconfig-001-20250812    gcc-10.5.0
parisc                randconfig-001-20250813    clang-20
parisc                randconfig-002-20250812    gcc-14.3.0
parisc                randconfig-002-20250813    clang-20
parisc64                            defconfig    gcc-15.1.0
powerpc                          allmodconfig    gcc-15.1.0
powerpc                           allnoconfig    clang-22
powerpc                           allnoconfig    gcc-15.1.0
powerpc                          allyesconfig    gcc-15.1.0
powerpc               randconfig-001-20250812    clang-19
powerpc               randconfig-001-20250813    clang-20
powerpc               randconfig-002-20250812    clang-22
powerpc               randconfig-002-20250813    clang-20
powerpc               randconfig-003-20250812    gcc-12.5.0
powerpc               randconfig-003-20250813    clang-20
powerpc                     tqm8540_defconfig    clang-22
powerpc                     tqm8555_defconfig    clang-22
powerpc                         wii_defconfig    gcc-15.1.0
powerpc64             randconfig-001-20250812    clang-22
powerpc64             randconfig-001-20250813    clang-20
powerpc64             randconfig-002-20250812    clang-16
powerpc64             randconfig-002-20250813    clang-20
powerpc64             randconfig-003-20250812    clang-18
powerpc64             randconfig-003-20250813    clang-20
riscv                            allmodconfig    gcc-15.1.0
riscv                             allnoconfig    clang-22
riscv                             allnoconfig    gcc-15.1.0
riscv                            allyesconfig    gcc-15.1.0
riscv                               defconfig    clang-22
riscv                               defconfig    gcc-12
riscv                 randconfig-001-20250812    gcc-9.5.0
riscv                 randconfig-001-20250813    clang-22
riscv                 randconfig-002-20250812    gcc-8.5.0
riscv                 randconfig-002-20250813    clang-22
s390                             allmodconfig    clang-18
s390                             allmodconfig    gcc-15.1.0
s390                              allnoconfig    clang-22
s390                             allyesconfig    gcc-15.1.0
s390                                defconfig    gcc-12
s390                  randconfig-001-20250812    clang-18
s390                  randconfig-001-20250813    clang-22
s390                  randconfig-002-20250812    clang-22
s390                  randconfig-002-20250813    clang-22
sh                               allmodconfig    gcc-15.1.0
sh                                allnoconfig    gcc-15.1.0
sh                               allyesconfig    gcc-15.1.0
sh                                  defconfig    gcc-12
sh                    randconfig-001-20250812    gcc-15.1.0
sh                    randconfig-001-20250813    clang-22
sh                    randconfig-002-20250812    gcc-15.1.0
sh                    randconfig-002-20250813    clang-22
sh                             shx3_defconfig    gcc-15.1.0
sparc                            allmodconfig    gcc-15.1.0
sparc                             allnoconfig    gcc-15.1.0
sparc                               defconfig    gcc-15.1.0
sparc                 randconfig-001-20250812    gcc-8.5.0
sparc                 randconfig-001-20250813    clang-22
sparc                 randconfig-002-20250812    gcc-8.5.0
sparc                 randconfig-002-20250813    clang-22
sparc64                             defconfig    gcc-12
sparc64               randconfig-001-20250812    clang-22
sparc64               randconfig-001-20250813    clang-22
sparc64               randconfig-002-20250812    clang-22
sparc64               randconfig-002-20250813    clang-22
um                               allmodconfig    clang-19
um                                allnoconfig    clang-22
um                               allyesconfig    clang-19
um                               allyesconfig    gcc-12
um                                  defconfig    gcc-12
um                             i386_defconfig    gcc-12
um                    randconfig-001-20250812    gcc-11
um                    randconfig-001-20250813    clang-22
um                    randconfig-002-20250812    gcc-12
um                    randconfig-002-20250813    clang-22
um                           x86_64_defconfig    gcc-12
x86_64                            allnoconfig    clang-20
x86_64                           allyesconfig    clang-20
x86_64      buildonly-randconfig-001-20250812    clang-20
x86_64      buildonly-randconfig-001-20250813    clang-20
x86_64      buildonly-randconfig-002-20250812    gcc-12
x86_64      buildonly-randconfig-002-20250813    clang-20
x86_64      buildonly-randconfig-003-20250812    gcc-12
x86_64      buildonly-randconfig-003-20250813    clang-20
x86_64      buildonly-randconfig-004-20250812    gcc-12
x86_64      buildonly-randconfig-004-20250813    clang-20
x86_64      buildonly-randconfig-005-20250812    clang-20
x86_64      buildonly-randconfig-005-20250813    clang-20
x86_64      buildonly-randconfig-006-20250812    gcc-12
x86_64      buildonly-randconfig-006-20250813    clang-20
x86_64                              defconfig    clang-20
x86_64                              defconfig    gcc-11
x86_64                                  kexec    clang-20
x86_64                randconfig-001-20250813    gcc-12
x86_64                randconfig-002-20250813    gcc-12
x86_64                randconfig-003-20250813    gcc-12
x86_64                randconfig-004-20250813    gcc-12
x86_64                randconfig-005-20250813    gcc-12
x86_64                randconfig-006-20250813    gcc-12
x86_64                randconfig-007-20250813    gcc-12
x86_64                randconfig-008-20250813    gcc-12
x86_64                randconfig-071-20250813    clang-20
x86_64                randconfig-072-20250813    clang-20
x86_64                randconfig-073-20250813    clang-20
x86_64                randconfig-074-20250813    clang-20
x86_64                randconfig-075-20250813    clang-20
x86_64                randconfig-076-20250813    clang-20
x86_64                randconfig-077-20250813    clang-20
x86_64                randconfig-078-20250813    clang-20
x86_64                               rhel-9.4    clang-20
x86_64                           rhel-9.4-bpf    gcc-12
x86_64                          rhel-9.4-func    clang-20
x86_64                    rhel-9.4-kselftests    clang-20
x86_64                         rhel-9.4-kunit    gcc-12
x86_64                           rhel-9.4-ltp    gcc-12
x86_64                          rhel-9.4-rust    clang-20
xtensa                            allnoconfig    gcc-15.1.0
xtensa                randconfig-001-20250812    gcc-10.5.0
xtensa                randconfig-001-20250813    clang-22
xtensa                randconfig-002-20250812    gcc-12.5.0
xtensa                randconfig-002-20250813    clang-22

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

