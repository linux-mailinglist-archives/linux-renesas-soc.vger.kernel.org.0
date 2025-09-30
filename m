Return-Path: <linux-renesas-soc+bounces-22485-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id EE157BACBF1
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 30 Sep 2025 13:59:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 55E271928079
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 30 Sep 2025 11:59:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 080B52D29A9;
	Tue, 30 Sep 2025 11:59:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="V0GaokAc"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BACF323D288
	for <linux-renesas-soc@vger.kernel.org>; Tue, 30 Sep 2025 11:59:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759233552; cv=none; b=SSLjE12IAzh1DgfMvcbGddFDR4cSpyUkWsjvwyglvGBLCYJKCE1JfHXnYdmIOQSXQSgBS9r4lS4DvnUoPF3kLjsYe0lZjJ7UGLRKFvwsnddKLOpJtlmDTnkhfzn+e6Ph0qAqYtVkF3ZIAoe4r6IL4BARAlSwc/9x8L38wmCKYYY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759233552; c=relaxed/simple;
	bh=eV6YGH56PYEPSy6DMBK/4WkvAMqmZG+0ywaQL1rDj/s=;
	h=Date:From:To:Cc:Subject:Message-ID; b=KLH1mNHkxucEy22ddZ3gPOiSj/GZGmndStfQKr8QcAlHLhK7Ur/bgbAKgsxuToZSDAgq1VT2EYO9r/PRmsCbMQEAGvY+1Q40RHyr6Xv0/XydKNuk/q+B+d4xuTgFaxLNZVxGUybKPBhAFDqf3OvWnaCZR6uK29SyIEvySng6xo8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=V0GaokAc; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1759233551; x=1790769551;
  h=date:from:to:cc:subject:message-id;
  bh=eV6YGH56PYEPSy6DMBK/4WkvAMqmZG+0ywaQL1rDj/s=;
  b=V0GaokActpiwbr09sfSdEHp21+axxXtAWJ4oU/wyTl3ASaDqL3WdbTRV
   bbSVMVzEtOQAOCr9+iX+mw+LbN2AIfN8ai+/Wn/jSz7mOp7KFsR2u+ixA
   odI7KfKlcFkMMFfoPvw8REzeaUZm0WCBwI+LW5UQdM3KMlc/HHW5S6MGC
   EEz89JBzXOpTHF+Bpn+YpUFbG3W3DkvfCNTrsjkAVj3lX1oxlZQOPwPuv
   449bU1gZ9J2tbfDtB1qptXvRgC4O6KcMPdO3xvJps4EdEYJOTE9ZFUrUs
   q1Eo/laNNjj64Lh9FyLdxIOBxI1cnt97pxcgtJS6J5H+R9zWp8Ug2a5Zu
   g==;
X-CSE-ConnectionGUID: lhbvatqoTNG8oyVGeclI/Q==
X-CSE-MsgGUID: Hp0l5OHUS3CyVEK00wqxSQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="65308068"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; 
   d="scan'208";a="65308068"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Sep 2025 04:59:11 -0700
X-CSE-ConnectionGUID: vC5z+eidSwCoCJscLfx2jA==
X-CSE-MsgGUID: Jyyj0b8XSKuDQ+y/d5Y3yQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,304,1751266800"; 
   d="scan'208";a="182796255"
Received: from lkp-server01.sh.intel.com (HELO 2f2a1232a4e4) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 30 Sep 2025 04:59:09 -0700
Received: from kbuild by 2f2a1232a4e4 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1v3Z0c-0001FF-1L;
	Tue, 30 Sep 2025 11:59:06 +0000
Date: Tue, 30 Sep 2025 19:58:49 +0800
From: kernel test robot <lkp@intel.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: linux-renesas-soc@vger.kernel.org
Subject: [geert-renesas-drivers:renesas-clk-for-v6.19] BUILD SUCCESS
 1ca55d2243b0e53727378552643ee00cd116752d
Message-ID: <202509301940.yYOT0Z81-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git renesas-clk-for-v6.19
branch HEAD: 1ca55d2243b0e53727378552643ee00cd116752d  clk: renesas: Use IS_ERR() for pointers that cannot be NULL

elapsed time: 1459m

configs tested: 248
configs skipped: 5

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    clang-22
alpha                             allnoconfig    gcc-15.1.0
alpha                            allyesconfig    clang-19
alpha                            allyesconfig    gcc-15.1.0
alpha                               defconfig    clang-19
arc                              allmodconfig    clang-19
arc                               allnoconfig    clang-22
arc                               allnoconfig    gcc-15.1.0
arc                              allyesconfig    clang-19
arc                                 defconfig    clang-19
arc                   randconfig-001-20250930    gcc-10.5.0
arc                   randconfig-001-20250930    gcc-9.5.0
arc                   randconfig-002-20250930    gcc-10.5.0
arc                   randconfig-002-20250930    gcc-8.5.0
arm                              allmodconfig    clang-19
arm                               allnoconfig    clang-22
arm                              allyesconfig    clang-19
arm                          collie_defconfig    gcc-15.1.0
arm                                 defconfig    clang-19
arm                         orion5x_defconfig    gcc-15.1.0
arm                   randconfig-001-20250930    gcc-10.5.0
arm                   randconfig-001-20250930    gcc-13.4.0
arm                   randconfig-002-20250930    gcc-10.5.0
arm                   randconfig-002-20250930    gcc-8.5.0
arm                   randconfig-003-20250930    gcc-10.5.0
arm                   randconfig-003-20250930    gcc-8.5.0
arm                   randconfig-004-20250930    gcc-10.5.0
arm                          sp7021_defconfig    gcc-15.1.0
arm                       spear13xx_defconfig    clang-22
arm64                            allmodconfig    clang-19
arm64                             allnoconfig    clang-22
arm64                             allnoconfig    gcc-15.1.0
arm64                               defconfig    clang-19
arm64                 randconfig-001-20250930    clang-18
arm64                 randconfig-001-20250930    gcc-10.5.0
arm64                 randconfig-002-20250930    clang-22
arm64                 randconfig-002-20250930    gcc-10.5.0
arm64                 randconfig-003-20250930    clang-18
arm64                 randconfig-003-20250930    gcc-10.5.0
arm64                 randconfig-004-20250930    gcc-10.5.0
arm64                 randconfig-004-20250930    gcc-8.5.0
csky                              allnoconfig    clang-22
csky                              allnoconfig    gcc-15.1.0
csky                                defconfig    clang-19
csky                  randconfig-001-20250929    gcc-9.5.0
csky                  randconfig-001-20250930    gcc-8.5.0
csky                  randconfig-002-20250929    gcc-15.1.0
csky                  randconfig-002-20250930    gcc-8.5.0
hexagon                          allmodconfig    clang-17
hexagon                          allmodconfig    clang-19
hexagon                           allnoconfig    clang-22
hexagon                          allyesconfig    clang-19
hexagon                          allyesconfig    clang-22
hexagon                             defconfig    clang-19
hexagon               randconfig-001-20250929    clang-22
hexagon               randconfig-001-20250930    gcc-8.5.0
hexagon               randconfig-002-20250929    clang-22
hexagon               randconfig-002-20250930    gcc-8.5.0
i386                             allmodconfig    clang-20
i386                              allnoconfig    clang-20
i386                             allyesconfig    clang-20
i386        buildonly-randconfig-001-20250929    gcc-14
i386        buildonly-randconfig-001-20250930    clang-20
i386        buildonly-randconfig-002-20250929    clang-20
i386        buildonly-randconfig-002-20250930    clang-20
i386        buildonly-randconfig-003-20250929    gcc-14
i386        buildonly-randconfig-003-20250930    clang-20
i386        buildonly-randconfig-004-20250929    gcc-14
i386        buildonly-randconfig-004-20250930    clang-20
i386        buildonly-randconfig-005-20250929    gcc-14
i386        buildonly-randconfig-005-20250930    clang-20
i386        buildonly-randconfig-006-20250929    gcc-14
i386        buildonly-randconfig-006-20250930    clang-20
i386                                defconfig    clang-20
i386                  randconfig-001-20250930    gcc-14
i386                  randconfig-002-20250930    gcc-14
i386                  randconfig-003-20250930    gcc-14
i386                  randconfig-004-20250930    gcc-14
i386                  randconfig-005-20250930    gcc-14
i386                  randconfig-006-20250930    gcc-14
i386                  randconfig-007-20250930    gcc-14
i386                  randconfig-011-20250930    gcc-14
i386                  randconfig-012-20250930    gcc-14
i386                  randconfig-013-20250930    gcc-14
i386                  randconfig-014-20250930    gcc-14
i386                  randconfig-015-20250930    gcc-14
i386                  randconfig-016-20250930    gcc-14
i386                  randconfig-017-20250930    gcc-14
loongarch                        allmodconfig    clang-19
loongarch                         allnoconfig    clang-22
loongarch                           defconfig    clang-19
loongarch             randconfig-001-20250929    gcc-12.5.0
loongarch             randconfig-001-20250930    gcc-8.5.0
loongarch             randconfig-002-20250929    gcc-15.1.0
loongarch             randconfig-002-20250930    gcc-8.5.0
m68k                             allmodconfig    clang-19
m68k                             allmodconfig    gcc-15.1.0
m68k                              allnoconfig    gcc-15.1.0
m68k                             allyesconfig    clang-19
m68k                             allyesconfig    gcc-15.1.0
m68k                                defconfig    clang-19
m68k                        m5307c3_defconfig    gcc-15.1.0
m68k                           virt_defconfig    gcc-15.1.0
microblaze                       allmodconfig    clang-19
microblaze                       allmodconfig    gcc-15.1.0
microblaze                        allnoconfig    gcc-15.1.0
microblaze                       allyesconfig    clang-19
microblaze                       allyesconfig    gcc-15.1.0
microblaze                          defconfig    gcc-15.1.0
mips                              allnoconfig    gcc-15.1.0
mips                           ip30_defconfig    clang-22
mips                           xway_defconfig    clang-22
nios2                             allnoconfig    gcc-11.5.0
nios2                             allnoconfig    gcc-15.1.0
nios2                               defconfig    gcc-15.1.0
nios2                 randconfig-001-20250929    gcc-11.5.0
nios2                 randconfig-001-20250930    gcc-8.5.0
nios2                 randconfig-002-20250929    gcc-9.5.0
nios2                 randconfig-002-20250930    gcc-8.5.0
openrisc                          allnoconfig    clang-22
openrisc                          allnoconfig    gcc-15.1.0
openrisc                         allyesconfig    gcc-15.1.0
openrisc                            defconfig    gcc-14
openrisc                 simple_smp_defconfig    gcc-15.1.0
parisc                            allnoconfig    clang-22
parisc                            allnoconfig    gcc-15.1.0
parisc                           allyesconfig    gcc-15.1.0
parisc                              defconfig    gcc-15.1.0
parisc                randconfig-001-20250929    gcc-14.3.0
parisc                randconfig-001-20250930    gcc-8.5.0
parisc                randconfig-002-20250929    gcc-14.3.0
parisc                randconfig-002-20250930    gcc-8.5.0
parisc64                            defconfig    gcc-15.1.0
powerpc                          allmodconfig    gcc-15.1.0
powerpc                           allnoconfig    clang-22
powerpc                           allnoconfig    gcc-15.1.0
powerpc                          allyesconfig    clang-22
powerpc                 mpc837x_rdb_defconfig    clang-22
powerpc               randconfig-001-20250929    gcc-15.1.0
powerpc               randconfig-001-20250930    gcc-8.5.0
powerpc               randconfig-002-20250929    gcc-8.5.0
powerpc               randconfig-002-20250930    gcc-8.5.0
powerpc               randconfig-003-20250929    gcc-13.4.0
powerpc               randconfig-003-20250930    gcc-8.5.0
powerpc64             randconfig-001-20250929    clang-18
powerpc64             randconfig-001-20250930    gcc-8.5.0
powerpc64             randconfig-002-20250929    clang-22
powerpc64             randconfig-002-20250930    gcc-8.5.0
powerpc64             randconfig-003-20250929    clang-22
powerpc64             randconfig-003-20250930    gcc-8.5.0
riscv                            allmodconfig    clang-22
riscv                             allnoconfig    clang-22
riscv                             allnoconfig    gcc-15.1.0
riscv                            allyesconfig    clang-16
riscv                               defconfig    gcc-14
riscv                 randconfig-001-20250929    gcc-9.5.0
riscv                 randconfig-001-20250930    gcc-12
riscv                 randconfig-002-20250929    gcc-11.5.0
riscv                 randconfig-002-20250930    gcc-12
s390                             alldefconfig    clang-22
s390                             allmodconfig    clang-18
s390                             allmodconfig    gcc-15.1.0
s390                              allnoconfig    clang-22
s390                             allyesconfig    gcc-15.1.0
s390                                defconfig    gcc-14
s390                  randconfig-001-20250929    gcc-11.5.0
s390                  randconfig-001-20250930    gcc-12
s390                  randconfig-002-20250929    gcc-13.4.0
s390                  randconfig-002-20250930    gcc-12
sh                               allmodconfig    gcc-15.1.0
sh                                allnoconfig    gcc-15.1.0
sh                               allyesconfig    gcc-15.1.0
sh                                  defconfig    gcc-14
sh                        dreamcast_defconfig    gcc-15.1.0
sh                    randconfig-001-20250929    gcc-15.1.0
sh                    randconfig-001-20250930    gcc-12
sh                    randconfig-002-20250929    gcc-15.1.0
sh                    randconfig-002-20250930    gcc-12
sh                           se7206_defconfig    gcc-15.1.0
sparc                            allmodconfig    gcc-15.1.0
sparc                             allnoconfig    gcc-15.1.0
sparc                               defconfig    gcc-15.1.0
sparc                 randconfig-001-20250929    gcc-8.5.0
sparc                 randconfig-001-20250930    gcc-12
sparc                 randconfig-002-20250929    gcc-8.5.0
sparc                 randconfig-002-20250930    gcc-12
sparc64                             defconfig    gcc-14
sparc64               randconfig-001-20250929    clang-22
sparc64               randconfig-001-20250930    gcc-12
sparc64               randconfig-002-20250929    clang-22
sparc64               randconfig-002-20250930    gcc-12
um                               allmodconfig    clang-19
um                                allnoconfig    clang-22
um                               allyesconfig    clang-19
um                               allyesconfig    gcc-14
um                                  defconfig    gcc-14
um                             i386_defconfig    gcc-14
um                    randconfig-001-20250929    gcc-14
um                    randconfig-001-20250930    gcc-12
um                    randconfig-002-20250929    gcc-14
um                    randconfig-002-20250930    gcc-12
um                           x86_64_defconfig    gcc-14
x86_64                            allnoconfig    clang-20
x86_64                           allyesconfig    clang-20
x86_64      buildonly-randconfig-001-20250929    gcc-14
x86_64      buildonly-randconfig-001-20250930    gcc-14
x86_64      buildonly-randconfig-002-20250929    gcc-14
x86_64      buildonly-randconfig-002-20250930    gcc-14
x86_64      buildonly-randconfig-003-20250929    clang-20
x86_64      buildonly-randconfig-003-20250930    gcc-14
x86_64      buildonly-randconfig-004-20250929    gcc-14
x86_64      buildonly-randconfig-004-20250930    gcc-14
x86_64      buildonly-randconfig-005-20250929    gcc-14
x86_64      buildonly-randconfig-005-20250930    gcc-14
x86_64      buildonly-randconfig-006-20250929    gcc-14
x86_64      buildonly-randconfig-006-20250930    gcc-14
x86_64                              defconfig    clang-20
x86_64                                  kexec    clang-20
x86_64                randconfig-001-20250930    clang-20
x86_64                randconfig-002-20250930    clang-20
x86_64                randconfig-003-20250930    clang-20
x86_64                randconfig-004-20250930    clang-20
x86_64                randconfig-005-20250930    clang-20
x86_64                randconfig-006-20250930    clang-20
x86_64                randconfig-007-20250930    clang-20
x86_64                randconfig-008-20250930    clang-20
x86_64                randconfig-071-20250930    gcc-12
x86_64                randconfig-072-20250930    gcc-12
x86_64                randconfig-073-20250930    gcc-12
x86_64                randconfig-074-20250930    gcc-12
x86_64                randconfig-075-20250930    gcc-12
x86_64                randconfig-076-20250930    gcc-12
x86_64                randconfig-077-20250930    gcc-12
x86_64                randconfig-078-20250930    gcc-12
x86_64                               rhel-9.4    clang-20
x86_64                           rhel-9.4-bpf    gcc-14
x86_64                          rhel-9.4-func    clang-20
x86_64                    rhel-9.4-kselftests    clang-20
x86_64                         rhel-9.4-kunit    gcc-14
x86_64                           rhel-9.4-ltp    gcc-14
x86_64                          rhel-9.4-rust    clang-20
xtensa                            allnoconfig    gcc-15.1.0
xtensa                randconfig-001-20250929    gcc-8.5.0
xtensa                randconfig-001-20250930    gcc-12
xtensa                randconfig-002-20250929    gcc-13.4.0
xtensa                randconfig-002-20250930    gcc-12
xtensa                    smp_lx200_defconfig    clang-22
xtensa                    xip_kc705_defconfig    clang-22

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

