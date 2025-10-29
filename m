Return-Path: <linux-renesas-soc+bounces-23837-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 55046C19805
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 29 Oct 2025 10:54:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 5A56D4E8757
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 29 Oct 2025 09:48:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2214220C48A;
	Wed, 29 Oct 2025 09:48:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SYPZK7Bt"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A00C2DE1E0
	for <linux-renesas-soc@vger.kernel.org>; Wed, 29 Oct 2025 09:48:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761731310; cv=none; b=mDfY8GzopXSHhw0kTFFhN9ab6xzpd7WmpR7nu6ST4Nt0saNXmHCqO7Zv0owH9PdOA06cHm9I3Olc429AchoILzWgrovSuAKX0JiEf4Ar7Hb6LhHKH2ma7rsP074TFbVFYiWNAqcC7eJQ8Oaww3RPcBzHl+7POG98TcBeP3rMEUs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761731310; c=relaxed/simple;
	bh=ciLECnSnzKrHSHRfl0EKVI2LezehMCy6/E09izkbHQo=;
	h=Date:From:To:Cc:Subject:Message-ID; b=F9ZC2Pzw5qAc3F+aFZUWTLCSXf5AWqHwluTbjSIuJazYJ70SznjFgjkoaDcSmvN5sZX1qP8WuJE64FuXJwW6BKjqFS/jjKs5hxxcS7ERcqpa3qCES+IFaHCk0HFMzLO+nEt+uB333lfRsATHqS45j6leOaOxQ9ERR7R7TEclG8Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=SYPZK7Bt; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761731309; x=1793267309;
  h=date:from:to:cc:subject:message-id;
  bh=ciLECnSnzKrHSHRfl0EKVI2LezehMCy6/E09izkbHQo=;
  b=SYPZK7BtlxPAT10w8nT4CpvDgJ3g158KME9JSDdc3vcrG2sRIMBRmZ3B
   LfnV0y9dK8+nyX3qC7MvW2Pm0DlzDwmUkrzzfme4BDJuhP0CV69mbDBn1
   8inuXsVjr8Ui5b8OeByQtz0JvZ38rPjX+hGQq9KdcO+jIJUbsFTXSngTd
   iK1PQxleVo7D6iR/8rcKlzYztUThFe81dAGF0jf2ri2E2Nt80/YX8qMRl
   cluJhRM1FHuyRRdJjyHTtRuBE0fQzw/xrm+G9lDmKEuFp3whT4i21kYHz
   xGEl/b5MapuEZlhcfi1vmIRQXn1egsu0PcsSlzyEXbthcOjopllT+TH0x
   Q==;
X-CSE-ConnectionGUID: v1r5UehhTKaTXm4E3y/1Sg==
X-CSE-MsgGUID: 7lqr2x2uRmqQTfjEWf0/Iw==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="86475718"
X-IronPort-AV: E=Sophos;i="6.19,263,1754982000"; 
   d="scan'208";a="86475718"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Oct 2025 02:48:28 -0700
X-CSE-ConnectionGUID: KR5g3An1SJa7BR1BwBaQNg==
X-CSE-MsgGUID: 5pxSB0HjSDO3n4OhzsvuZg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,263,1754982000"; 
   d="scan'208";a="186358867"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by fmviesa010.fm.intel.com with ESMTP; 29 Oct 2025 02:48:26 -0700
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vE2n2-000KTL-0z;
	Wed, 29 Oct 2025 09:48:24 +0000
Date: Wed, 29 Oct 2025 17:48:21 +0800
From: kernel test robot <lkp@intel.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: linux-renesas-soc@vger.kernel.org
Subject: [geert-renesas-devel:master] BUILD SUCCESS
 3651a35a85179a1615cd9ad38d81cac856b34b58
Message-ID: <202510291716.QUMgKS8f-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git master
branch HEAD: 3651a35a85179a1615cd9ad38d81cac856b34b58  Merge branch 'renesas-next' into renesas-devel

elapsed time: 1450m

configs tested: 139
configs skipped: 5

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-15.1.0
alpha                            allyesconfig    gcc-15.1.0
arc                               allnoconfig    gcc-15.1.0
arc                   randconfig-001-20251028    gcc-8.5.0
arc                   randconfig-002-20251028    gcc-13.4.0
arc                    vdk_hs38_smp_defconfig    gcc-15.1.0
arm                               allnoconfig    clang-22
arm                       aspeed_g5_defconfig    gcc-15.1.0
arm                   randconfig-001-20251028    clang-22
arm                   randconfig-002-20251028    clang-22
arm                   randconfig-003-20251028    clang-22
arm                           tegra_defconfig    gcc-15.1.0
arm64                             allnoconfig    gcc-15.1.0
arm64                 randconfig-001-20251028    clang-22
arm64                 randconfig-002-20251028    clang-22
arm64                 randconfig-003-20251028    gcc-11.5.0
arm64                 randconfig-004-20251028    gcc-8.5.0
csky                             allmodconfig    gcc-15.1.0
csky                              allnoconfig    gcc-15.1.0
csky                             allyesconfig    gcc-15.1.0
csky                  randconfig-001-20251028    gcc-15.1.0
csky                  randconfig-002-20251028    gcc-15.1.0
hexagon                          allmodconfig    clang-17
hexagon                           allnoconfig    clang-22
hexagon                          allyesconfig    clang-22
hexagon               randconfig-001-20251028    clang-22
hexagon               randconfig-002-20251028    clang-17
i386                              allnoconfig    gcc-14
i386                  randconfig-001-20251028    gcc-14
i386                  randconfig-002-20251028    clang-20
i386                  randconfig-003-20251028    clang-20
i386                  randconfig-004-20251028    clang-20
i386                  randconfig-005-20251028    clang-20
i386                  randconfig-006-20251028    clang-20
i386                  randconfig-007-20251028    gcc-14
i386                  randconfig-011-20251028    gcc-14
i386                  randconfig-012-20251028    clang-20
i386                  randconfig-013-20251028    clang-20
i386                  randconfig-014-20251028    clang-20
i386                  randconfig-015-20251028    clang-20
i386                  randconfig-016-20251028    gcc-14
i386                  randconfig-017-20251028    gcc-14
loongarch                        allmodconfig    clang-19
loongarch                         allnoconfig    clang-22
loongarch                        allyesconfig    clang-22
loongarch                           defconfig    clang-19
loongarch             randconfig-001-20251028    gcc-12.5.0
loongarch             randconfig-002-20251028    clang-22
m68k                             allmodconfig    gcc-15.1.0
m68k                              allnoconfig    gcc-15.1.0
m68k                             allyesconfig    gcc-15.1.0
m68k                                defconfig    gcc-15.1.0
m68k                            q40_defconfig    gcc-15.1.0
microblaze                       allmodconfig    gcc-15.1.0
microblaze                        allnoconfig    gcc-15.1.0
microblaze                       allyesconfig    gcc-15.1.0
microblaze                          defconfig    gcc-15.1.0
mips                              allnoconfig    gcc-15.1.0
nios2                            allmodconfig    gcc-11.5.0
nios2                             allnoconfig    gcc-11.5.0
nios2                            allyesconfig    gcc-11.5.0
nios2                               defconfig    gcc-11.5.0
nios2                 randconfig-001-20251028    gcc-8.5.0
nios2                 randconfig-002-20251028    gcc-9.5.0
openrisc                         allmodconfig    gcc-15.1.0
openrisc                          allnoconfig    gcc-15.1.0
openrisc                         allyesconfig    gcc-15.1.0
openrisc                            defconfig    gcc-15.1.0
parisc                           allmodconfig    gcc-15.1.0
parisc                            allnoconfig    gcc-15.1.0
parisc                           allyesconfig    gcc-15.1.0
parisc                              defconfig    gcc-15.1.0
parisc                randconfig-001-20251028    gcc-9.5.0
parisc                randconfig-002-20251028    gcc-8.5.0
parisc64                            defconfig    gcc-15.1.0
powerpc                          allmodconfig    gcc-15.1.0
powerpc                           allnoconfig    gcc-15.1.0
powerpc                          allyesconfig    clang-22
powerpc               randconfig-001-20251028    gcc-15.1.0
powerpc               randconfig-002-20251028    gcc-11.5.0
powerpc                     redwood_defconfig    clang-22
powerpc                      tqm8xx_defconfig    clang-19
powerpc64             randconfig-001-20251028    clang-22
powerpc64             randconfig-002-20251028    clang-22
riscv                            alldefconfig    gcc-15.1.0
riscv                            allmodconfig    clang-22
riscv                             allnoconfig    gcc-15.1.0
riscv                            allyesconfig    clang-16
riscv                               defconfig    clang-22
riscv                 randconfig-002-20251028    clang-22
s390                             allmodconfig    clang-18
s390                              allnoconfig    clang-22
s390                             allyesconfig    gcc-15.1.0
s390                                defconfig    clang-22
s390                  randconfig-001-20251028    clang-22
s390                  randconfig-002-20251028    clang-22
sh                               allmodconfig    gcc-15.1.0
sh                                allnoconfig    gcc-15.1.0
sh                               allyesconfig    gcc-15.1.0
sh                                  defconfig    gcc-15.1.0
sh                    randconfig-001-20251028    gcc-15.1.0
sh                    randconfig-002-20251028    gcc-13.4.0
sparc                            allmodconfig    gcc-15.1.0
sparc                             allnoconfig    gcc-15.1.0
sparc                            allyesconfig    gcc-15.1.0
sparc                               defconfig    gcc-15.1.0
sparc                 randconfig-001-20251028    gcc-8.5.0
sparc                 randconfig-002-20251028    gcc-12.5.0
sparc64                          allmodconfig    clang-22
sparc64                          allyesconfig    gcc-15.1.0
sparc64                             defconfig    clang-20
sparc64               randconfig-001-20251028    clang-22
sparc64               randconfig-002-20251028    gcc-9.5.0
um                               allmodconfig    clang-19
um                                allnoconfig    clang-22
um                               allyesconfig    gcc-14
um                                  defconfig    clang-22
um                             i386_defconfig    gcc-14
um                    randconfig-001-20251028    gcc-14
um                    randconfig-002-20251028    gcc-14
um                           x86_64_defconfig    clang-22
x86_64                            allnoconfig    clang-20
x86_64      buildonly-randconfig-001-20251028    gcc-14
x86_64      buildonly-randconfig-002-20251028    gcc-14
x86_64      buildonly-randconfig-003-20251028    clang-20
x86_64      buildonly-randconfig-004-20251028    clang-20
x86_64      buildonly-randconfig-005-20251028    clang-20
x86_64      buildonly-randconfig-006-20251028    clang-20
x86_64                              defconfig    gcc-14
x86_64                randconfig-011-20251028    gcc-14
x86_64                randconfig-012-20251028    gcc-14
x86_64                randconfig-013-20251028    gcc-12
x86_64                randconfig-014-20251028    clang-20
x86_64                randconfig-015-20251028    clang-20
x86_64                randconfig-016-20251028    clang-20
xtensa                            allnoconfig    gcc-15.1.0
xtensa                           allyesconfig    gcc-15.1.0
xtensa                randconfig-001-20251028    gcc-15.1.0
xtensa                randconfig-002-20251028    gcc-13.4.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

