Return-Path: <linux-renesas-soc+bounces-16898-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id B8496AB1827
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  9 May 2025 17:16:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7B44DA005BE
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  9 May 2025 15:14:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DC07523185D;
	Fri,  9 May 2025 15:14:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="EBYipaut"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE31223498E
	for <linux-renesas-soc@vger.kernel.org>; Fri,  9 May 2025 15:14:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746803669; cv=none; b=HMKk7nfTFzB8fCqb0OJhWGifXmxxM72ZjSUkMD21saxW5GEwOfjYi9XG+tst4iVMRzV0ZXKdfk5XDB3x1rHcFwQMOnTdILuc1X2SJ+tEGE2JZ6ee4AyvtOMGni0sdvOnXTx2PUCYKzntxwab8rnj48XrUYgiIhCjuzEDaQ4sATQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746803669; c=relaxed/simple;
	bh=Tw2HAeYvld5uJd9ZoiC++8z3R22HB97ju1NO/3UnFh0=;
	h=Date:From:To:Cc:Subject:Message-ID; b=AResMMWxkP5tkJ1K5X/mqLeRxZ7j/7GKJ9yMMN+U48G2H0ZmqvWCP4V8SyU92ZNaL+Gp6xtPWSOyzGFIiumHnTyC+xvFJXIlm/qzzaSSbzJg6nuZ5b+gXm5p8L6x/glMAHu6f5p3Rmnlo2K5OQ+mwBaG2RBRITshiSJr7wetoOM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=EBYipaut; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1746803668; x=1778339668;
  h=date:from:to:cc:subject:message-id;
  bh=Tw2HAeYvld5uJd9ZoiC++8z3R22HB97ju1NO/3UnFh0=;
  b=EBYipautz2Q3lO7kT2ZuMV4wlZORAI9eynwChmN9Gx3oY5KbtqM9W71I
   DTw+4/x+GpDuP0gBHiNIRb/ol1qhhvc4qBUC5n0o3PYkyTP2iieH76NRj
   QgJ5sQ/aBi2S4fRO8+d81rPEG1/o8A0fA25JKJGrZgDFytlhQGjiOcZzz
   stoRisttgzediT70qorPG4+KRQmKMFOoO1WB8qJKAUN91bEomvOVLaOIS
   7gAkqnG0af8YYsd539xzHdNkC3KjNs2hrNH0vLERBdUpA9bqKKqULuofX
   dCly1Zx0GKbF1gdX1FDBRlkwtQFfXUOhl137LvLSSl5OJiudoKBLR9oYY
   Q==;
X-CSE-ConnectionGUID: vSa7BTW5RMGeMiMdpe0TFw==
X-CSE-MsgGUID: xNINd6ZCTPaxMlFbY53X1A==
X-IronPort-AV: E=McAfee;i="6700,10204,11427"; a="66170908"
X-IronPort-AV: E=Sophos;i="6.15,275,1739865600"; 
   d="scan'208";a="66170908"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 May 2025 08:14:27 -0700
X-CSE-ConnectionGUID: BA3yPJB+SGevgk42J91CCw==
X-CSE-MsgGUID: dGyDeLfuQNqpg3WcyL+dCA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,275,1739865600"; 
   d="scan'208";a="137577448"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 09 May 2025 08:14:26 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uDPQd-000CCF-23;
	Fri, 09 May 2025 15:14:23 +0000
Date: Fri, 09 May 2025 23:14:15 +0800
From: kernel test robot <lkp@intel.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: linux-renesas-soc@vger.kernel.org
Subject: [geert-renesas-devel:next] BUILD SUCCESS
 73c8af6a66fb0a6e98b768c10bc0347a0de8e464
Message-ID: <202505092308.rHeFbpf7-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git next
branch HEAD: 73c8af6a66fb0a6e98b768c10bc0347a0de8e464  Merge branches 'renesas-arm-defconfig-for-v6.16', 'renesas-drivers-for-v6.16', 'renesas-dt-bindings-for-v6.16' and 'renesas-dts-for-v6.16' into renesas-next

elapsed time: 1153m

configs tested: 214
configs skipped: 5

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-14.2.0
alpha                            allyesconfig    clang-19
alpha                            allyesconfig    gcc-14.2.0
alpha                               defconfig    gcc-14.2.0
arc                              allmodconfig    clang-19
arc                              allmodconfig    gcc-14.2.0
arc                               allnoconfig    gcc-14.2.0
arc                              allyesconfig    clang-19
arc                              allyesconfig    gcc-14.2.0
arc                                 defconfig    gcc-14.2.0
arc                 nsimosci_hs_smp_defconfig    clang-21
arc                   randconfig-001-20250509    gcc-13.3.0
arc                   randconfig-002-20250509    gcc-13.3.0
arm                              allmodconfig    clang-19
arm                              allmodconfig    gcc-14.2.0
arm                               allnoconfig    clang-21
arm                               allnoconfig    gcc-14.2.0
arm                              allyesconfig    clang-19
arm                              allyesconfig    gcc-14.2.0
arm                         at91_dt_defconfig    clang-21
arm                                 defconfig    gcc-14.2.0
arm                           h3600_defconfig    clang-21
arm                         lpc18xx_defconfig    clang-21
arm                       multi_v4t_defconfig    clang-21
arm                   randconfig-001-20250509    gcc-7.5.0
arm                   randconfig-002-20250509    gcc-6.5.0
arm                   randconfig-003-20250509    gcc-10.5.0
arm                   randconfig-004-20250509    clang-21
arm                          sp7021_defconfig    clang-21
arm                         vf610m4_defconfig    clang-21
arm64                            allmodconfig    clang-19
arm64                             allnoconfig    gcc-14.2.0
arm64                            allyesconfig    gcc-14.2.0
arm64                               defconfig    gcc-14.2.0
arm64                 randconfig-001-20250509    gcc-7.5.0
arm64                 randconfig-002-20250509    gcc-7.5.0
arm64                 randconfig-003-20250509    clang-21
arm64                 randconfig-004-20250509    gcc-5.5.0
csky                             allmodconfig    gcc-14.2.0
csky                              allnoconfig    gcc-14.2.0
csky                             allyesconfig    gcc-14.2.0
csky                                defconfig    gcc-14.2.0
csky                  randconfig-001-20250509    gcc-13.3.0
csky                  randconfig-001-20250509    gcc-14.2.0
csky                  randconfig-002-20250509    gcc-13.3.0
hexagon                          allmodconfig    clang-17
hexagon                          allmodconfig    clang-19
hexagon                           allnoconfig    clang-21
hexagon                           allnoconfig    gcc-14.2.0
hexagon                          allyesconfig    clang-19
hexagon                          allyesconfig    clang-21
hexagon                             defconfig    gcc-14.2.0
hexagon               randconfig-001-20250509    clang-20
hexagon               randconfig-001-20250509    gcc-13.3.0
hexagon               randconfig-002-20250509    clang-21
hexagon               randconfig-002-20250509    gcc-13.3.0
i386                             allmodconfig    clang-20
i386                             allmodconfig    gcc-12
i386                              allnoconfig    clang-20
i386                              allnoconfig    gcc-12
i386                             allyesconfig    clang-20
i386                             allyesconfig    gcc-12
i386        buildonly-randconfig-001-20250509    gcc-11
i386        buildonly-randconfig-002-20250509    gcc-12
i386        buildonly-randconfig-003-20250509    clang-20
i386        buildonly-randconfig-004-20250509    clang-20
i386        buildonly-randconfig-005-20250509    gcc-12
i386        buildonly-randconfig-006-20250509    gcc-11
i386                                defconfig    clang-20
i386                  randconfig-001-20250509    clang-20
i386                  randconfig-002-20250509    clang-20
i386                  randconfig-003-20250509    clang-20
i386                  randconfig-004-20250509    clang-20
i386                  randconfig-005-20250509    clang-20
i386                  randconfig-006-20250509    clang-20
i386                  randconfig-007-20250509    clang-20
i386                  randconfig-011-20250509    gcc-12
i386                  randconfig-012-20250509    gcc-12
i386                  randconfig-013-20250509    gcc-12
i386                  randconfig-014-20250509    gcc-12
i386                  randconfig-015-20250509    gcc-12
i386                  randconfig-016-20250509    gcc-12
i386                  randconfig-017-20250509    gcc-12
loongarch                        allmodconfig    gcc-14.2.0
loongarch                         allnoconfig    gcc-14.2.0
loongarch                        allyesconfig    gcc-14.2.0
loongarch                           defconfig    gcc-14.2.0
loongarch             randconfig-001-20250509    gcc-13.3.0
loongarch             randconfig-002-20250509    gcc-13.3.0
loongarch             randconfig-002-20250509    gcc-14.2.0
m68k                             allmodconfig    gcc-14.2.0
m68k                              allnoconfig    gcc-14.2.0
m68k                             allyesconfig    gcc-14.2.0
m68k                                defconfig    gcc-14.2.0
microblaze                       allmodconfig    gcc-14.2.0
microblaze                        allnoconfig    gcc-14.2.0
microblaze                       allyesconfig    gcc-14.2.0
microblaze                          defconfig    gcc-14.2.0
mips                             allmodconfig    gcc-14.2.0
mips                              allnoconfig    gcc-14.2.0
mips                             allyesconfig    gcc-14.2.0
mips                        maltaup_defconfig    clang-21
mips                           xway_defconfig    clang-21
nios2                             allnoconfig    gcc-14.2.0
nios2                               defconfig    gcc-14.2.0
nios2                 randconfig-001-20250509    gcc-13.3.0
nios2                 randconfig-002-20250509    gcc-13.3.0
openrisc                          allnoconfig    gcc-14.2.0
openrisc                         allyesconfig    gcc-14.2.0
openrisc                            defconfig    gcc-12
parisc                           allmodconfig    gcc-14.2.0
parisc                            allnoconfig    gcc-14.2.0
parisc                           allyesconfig    gcc-14.2.0
parisc                              defconfig    gcc-12
parisc                randconfig-001-20250509    gcc-13.3.0
parisc                randconfig-001-20250509    gcc-6.5.0
parisc                randconfig-002-20250509    gcc-13.3.0
parisc                randconfig-002-20250509    gcc-14.2.0
parisc64                            defconfig    gcc-14.2.0
powerpc                    adder875_defconfig    clang-21
powerpc                          allmodconfig    gcc-14.2.0
powerpc                           allnoconfig    gcc-14.2.0
powerpc                          allyesconfig    clang-21
powerpc                          allyesconfig    gcc-14.2.0
powerpc                  iss476-smp_defconfig    clang-21
powerpc               randconfig-001-20250509    clang-16
powerpc               randconfig-001-20250509    gcc-13.3.0
powerpc               randconfig-002-20250509    gcc-13.3.0
powerpc               randconfig-002-20250509    gcc-5.5.0
powerpc               randconfig-003-20250509    gcc-13.3.0
powerpc               randconfig-003-20250509    gcc-7.5.0
powerpc64             randconfig-001-20250509    gcc-13.3.0
powerpc64             randconfig-001-20250509    gcc-7.5.0
powerpc64             randconfig-002-20250509    clang-21
powerpc64             randconfig-002-20250509    gcc-13.3.0
powerpc64             randconfig-003-20250509    gcc-10.5.0
powerpc64             randconfig-003-20250509    gcc-13.3.0
riscv                            allmodconfig    clang-21
riscv                            allmodconfig    gcc-14.2.0
riscv                             allnoconfig    gcc-14.2.0
riscv                            allyesconfig    clang-16
riscv                            allyesconfig    gcc-14.2.0
riscv                               defconfig    gcc-12
riscv                 randconfig-001-20250509    clang-21
riscv                 randconfig-002-20250509    clang-21
s390                             allmodconfig    clang-18
s390                             allmodconfig    gcc-14.2.0
s390                              allnoconfig    clang-21
s390                             allyesconfig    gcc-14.2.0
s390                                defconfig    gcc-12
s390                  randconfig-001-20250509    clang-21
s390                  randconfig-002-20250509    clang-17
sh                               allmodconfig    gcc-14.2.0
sh                                allnoconfig    gcc-14.2.0
sh                               allyesconfig    gcc-14.2.0
sh                                  defconfig    gcc-12
sh                    randconfig-001-20250509    gcc-9.3.0
sh                    randconfig-002-20250509    gcc-5.5.0
sh                          rsk7203_defconfig    clang-21
sh                   rts7751r2dplus_defconfig    clang-21
sh                           se7750_defconfig    clang-21
sparc                            allmodconfig    gcc-14.2.0
sparc                             allnoconfig    gcc-14.2.0
sparc                 randconfig-001-20250509    gcc-6.5.0
sparc                 randconfig-002-20250509    gcc-6.5.0
sparc64                             defconfig    gcc-12
sparc64               randconfig-001-20250509    gcc-10.5.0
sparc64               randconfig-002-20250509    gcc-6.5.0
um                               allmodconfig    clang-19
um                                allnoconfig    clang-21
um                               allyesconfig    clang-19
um                               allyesconfig    gcc-12
um                                  defconfig    gcc-12
um                             i386_defconfig    gcc-12
um                    randconfig-001-20250509    clang-21
um                    randconfig-002-20250509    gcc-12
um                           x86_64_defconfig    gcc-12
x86_64                            allnoconfig    clang-20
x86_64                           allyesconfig    clang-20
x86_64      buildonly-randconfig-001-20250509    gcc-11
x86_64      buildonly-randconfig-002-20250509    gcc-11
x86_64      buildonly-randconfig-003-20250509    clang-20
x86_64      buildonly-randconfig-004-20250509    clang-20
x86_64      buildonly-randconfig-005-20250509    gcc-12
x86_64      buildonly-randconfig-006-20250509    gcc-12
x86_64                              defconfig    clang-20
x86_64                              defconfig    gcc-11
x86_64                                  kexec    clang-20
x86_64                randconfig-001-20250509    clang-20
x86_64                randconfig-002-20250509    clang-20
x86_64                randconfig-003-20250509    clang-20
x86_64                randconfig-004-20250509    clang-20
x86_64                randconfig-005-20250509    clang-20
x86_64                randconfig-006-20250509    clang-20
x86_64                randconfig-007-20250509    clang-20
x86_64                randconfig-008-20250509    clang-20
x86_64                randconfig-071-20250509    clang-20
x86_64                randconfig-072-20250509    clang-20
x86_64                randconfig-073-20250509    clang-20
x86_64                randconfig-074-20250509    clang-20
x86_64                randconfig-075-20250509    clang-20
x86_64                randconfig-076-20250509    clang-20
x86_64                randconfig-077-20250509    clang-20
x86_64                randconfig-078-20250509    clang-20
x86_64                               rhel-9.4    clang-20
x86_64                           rhel-9.4-bpf    gcc-12
x86_64                         rhel-9.4-kunit    gcc-12
x86_64                           rhel-9.4-ltp    gcc-12
x86_64                          rhel-9.4-rust    clang-18
x86_64                          rhel-9.4-rust    clang-20
xtensa                            allnoconfig    gcc-14.2.0
xtensa                randconfig-001-20250509    gcc-12.4.0
xtensa                randconfig-002-20250509    gcc-14.2.0
xtensa                         virt_defconfig    clang-21

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

