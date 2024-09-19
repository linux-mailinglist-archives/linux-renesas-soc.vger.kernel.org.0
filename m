Return-Path: <linux-renesas-soc+bounces-9002-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 0293A97C7AD
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 19 Sep 2024 12:05:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 77F67B27A0E
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 19 Sep 2024 10:05:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A94AB168BD;
	Thu, 19 Sep 2024 10:05:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ndQsFVl8"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8F341862B5
	for <linux-renesas-soc@vger.kernel.org>; Thu, 19 Sep 2024 10:05:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726740344; cv=none; b=Kz6prJVcpzsQuYYqyFBhijcwx8hWIIR1g/PrckvwKKWD+ey6PAAXPDtwRuYvV+IBUp6OcDt48XFIWUtzCq9/W5AxhrpaQxTkbv1WDAumHWSoafMVUlc9//fmq8z80tAWhgyN6bH8zNLKQ22JvoOdBCgkjllQV4ajqjv3ZsHe3j8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726740344; c=relaxed/simple;
	bh=N0uE+HI2zRxCo+thdRDrBl7BLBfS0byCQqFmDgFT6NI=;
	h=Date:From:To:Cc:Subject:Message-ID; b=f8jRjcCcpQIexyPuUZYEOrGa/PEjoZrb/PC648Uhjweyy0es+26QLCVLgKQu/Q9co5I+SqzlzTMOejJwhCpWK2WdHoGb4YIjH1bWcWUGjeF25zp/Yz/KNEcwJ5k9xoBuboZ+K6bL+eZ6hMNgcMayZhdnu8s402Rwq9QMLepv3DU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ndQsFVl8; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1726740342; x=1758276342;
  h=date:from:to:cc:subject:message-id;
  bh=N0uE+HI2zRxCo+thdRDrBl7BLBfS0byCQqFmDgFT6NI=;
  b=ndQsFVl8ZpbL8XxtVIWvme9wO/MycvvP1xY1AprW6POzV2zcBrBEpww3
   7f0bifS/1GWHILVfvy+YoPra+TiAiAIpNll5bR7h8TMDQzK8ygyuyZSaz
   9/myuO1TzKvk0RbLyrMo681R0NYbx8V8gy6fer3uq8CRfYSotU/bTo+8V
   S01zE4C7MV1za8Fh3hw+BMn6cv/zQOOlSC6O1iKE5qEDNcq2qyoQLwNYQ
   93B1336Fc6rauDOfl7cM1JGVpetAuKXmDGdQ4lKbh90DRZg7zP/lt6qRC
   rEuXSQZ0YyVALRAgcss8Rcog/EmtpwWgxGjs5IgigwgW22h1G60I4RfFV
   Q==;
X-CSE-ConnectionGUID: 7NsOUaTtT/2Ic6F1tbWpvA==
X-CSE-MsgGUID: 4m13NpJaRu2oassRBjQI1A==
X-IronPort-AV: E=McAfee;i="6700,10204,11199"; a="51104048"
X-IronPort-AV: E=Sophos;i="6.10,241,1719903600"; 
   d="scan'208";a="51104048"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Sep 2024 03:05:38 -0700
X-CSE-ConnectionGUID: Q2g2WH0lSJ+OZaT55SD4Ew==
X-CSE-MsgGUID: y46vEjKMRSq5PoyJR2OcNA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,241,1719903600"; 
   d="scan'208";a="69913944"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 19 Sep 2024 03:05:37 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1srE2Y-000D9h-0l;
	Thu, 19 Sep 2024 10:05:34 +0000
Date: Thu, 19 Sep 2024 18:05:23 +0800
From: kernel test robot <lkp@intel.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: linux-renesas-soc@vger.kernel.org
Subject: [geert-renesas-drivers:master] BUILD SUCCESS
 2f8da8f15a395c1c16b327d77497a5b363356afd
Message-ID: <202409191817.KGgkgYwN-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git master
branch HEAD: 2f8da8f15a395c1c16b327d77497a5b363356afd  [LOCAL] arm64: renesas: defconfig: Update renesas_defconfig

elapsed time: 2477m

configs tested: 114
configs skipped: 5

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-13.3.0
alpha                            allyesconfig    gcc-13.3.0
arc                              allmodconfig    gcc-13.2.0
arc                               allnoconfig    gcc-13.2.0
arc                              allyesconfig    gcc-13.2.0
arc                   randconfig-001-20240919    gcc-13.2.0
arc                   randconfig-002-20240919    gcc-13.2.0
arm                               allnoconfig    clang-20
arm                              allyesconfig    gcc-14.1.0
arm                   randconfig-001-20240919    clang-20
arm                   randconfig-002-20240919    clang-20
arm                   randconfig-003-20240919    clang-20
arm                   randconfig-004-20240919    clang-20
arm64                            allmodconfig    clang-20
arm64                             allnoconfig    gcc-14.1.0
arm64                 randconfig-001-20240919    gcc-14.1.0
arm64                 randconfig-002-20240919    clang-15
arm64                 randconfig-003-20240919    clang-20
arm64                 randconfig-004-20240919    gcc-14.1.0
csky                              allnoconfig    gcc-14.1.0
csky                  randconfig-001-20240919    gcc-14.1.0
csky                  randconfig-002-20240919    gcc-14.1.0
hexagon                          allmodconfig    clang-20
hexagon                           allnoconfig    clang-20
hexagon                          allyesconfig    clang-20
hexagon               randconfig-001-20240919    clang-20
hexagon               randconfig-002-20240919    clang-20
i386                             allmodconfig    gcc-12
i386                              allnoconfig    gcc-12
i386                             allyesconfig    gcc-12
i386        buildonly-randconfig-001-20240918    clang-18
i386        buildonly-randconfig-002-20240918    gcc-12
i386        buildonly-randconfig-003-20240918    gcc-12
i386        buildonly-randconfig-004-20240918    gcc-12
i386        buildonly-randconfig-005-20240918    clang-18
i386        buildonly-randconfig-006-20240918    gcc-12
i386                  randconfig-001-20240918    clang-18
i386                  randconfig-002-20240918    clang-18
i386                  randconfig-003-20240918    clang-18
i386                  randconfig-004-20240918    gcc-12
i386                  randconfig-005-20240918    gcc-12
i386                  randconfig-011-20240918    gcc-12
i386                  randconfig-012-20240918    clang-18
i386                  randconfig-013-20240918    gcc-12
i386                  randconfig-014-20240918    clang-18
i386                  randconfig-015-20240918    clang-18
i386                  randconfig-016-20240918    clang-18
loongarch                         allnoconfig    gcc-14.1.0
loongarch             randconfig-001-20240919    gcc-14.1.0
loongarch             randconfig-002-20240919    gcc-14.1.0
m68k                              allnoconfig    gcc-14.1.0
m68k                        m5407c3_defconfig    gcc-14.1.0
microblaze                        allnoconfig    gcc-14.1.0
mips                              allnoconfig    gcc-14.1.0
mips                         cobalt_defconfig    gcc-13.2.0
mips                         db1xxx_defconfig    clang-20
mips                     loongson1c_defconfig    gcc-13.2.0
mips                malta_qemu_32r6_defconfig    gcc-13.2.0
nios2                             allnoconfig    gcc-14.1.0
nios2                 randconfig-001-20240919    gcc-14.1.0
nios2                 randconfig-002-20240919    gcc-14.1.0
openrisc                          allnoconfig    gcc-14.1.0
openrisc                         allyesconfig    gcc-14.1.0
openrisc                            defconfig    gcc-14.1.0
openrisc                       virt_defconfig    gcc-14.1.0
parisc                            allnoconfig    gcc-14.1.0
parisc                              defconfig    gcc-14.1.0
parisc                randconfig-001-20240919    gcc-14.1.0
parisc                randconfig-002-20240919    gcc-14.1.0
powerpc                          allmodconfig    gcc-14.1.0
powerpc                           allnoconfig    gcc-14.1.0
powerpc                          allyesconfig    clang-20
powerpc                      ep88xc_defconfig    gcc-14.1.0
powerpc                      ppc64e_defconfig    gcc-14.1.0
powerpc               randconfig-001-20240919    gcc-14.1.0
powerpc               randconfig-002-20240919    clang-20
powerpc                    sam440ep_defconfig    gcc-14.1.0
riscv                             allnoconfig    gcc-14.1.0
riscv                               defconfig    clang-20
s390                             allmodconfig    clang-20
s390                              allnoconfig    clang-20
s390                             allyesconfig    gcc-14.1.0
s390                                defconfig    clang-20
sh                               allmodconfig    gcc-14.1.0
sh                                allnoconfig    gcc-14.1.0
sh                               allyesconfig    gcc-14.1.0
sh                                  defconfig    gcc-14.1.0
sh                               j2_defconfig    gcc-14.1.0
sh                 kfr2r09-romimage_defconfig    gcc-14.1.0
sh                           se7705_defconfig    gcc-14.1.0
sh                           se7722_defconfig    gcc-14.1.0
sparc                            allmodconfig    gcc-14.1.0
sparc64                             defconfig    gcc-14.1.0
um                                  defconfig    clang-20
um                             i386_defconfig    gcc-12
x86_64                            allnoconfig    clang-18
x86_64                           allyesconfig    clang-18
x86_64      buildonly-randconfig-001-20240919    clang-18
x86_64      buildonly-randconfig-002-20240919    gcc-12
x86_64      buildonly-randconfig-003-20240919    gcc-12
x86_64      buildonly-randconfig-004-20240919    gcc-12
x86_64      buildonly-randconfig-005-20240919    clang-18
x86_64      buildonly-randconfig-006-20240919    clang-18
x86_64                              defconfig    gcc-11
x86_64                randconfig-001-20240919    gcc-12
x86_64                randconfig-002-20240919    gcc-12
x86_64                randconfig-003-20240919    clang-18
x86_64                randconfig-004-20240919    clang-18
x86_64                randconfig-005-20240919    clang-18
x86_64                           rhel-8.3-bpf    gcc-12
x86_64                         rhel-8.3-kunit    gcc-12
x86_64                           rhel-8.3-ltp    gcc-12
x86_64                          rhel-8.3-rust    clang-18
xtensa                            allnoconfig    gcc-14.1.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

