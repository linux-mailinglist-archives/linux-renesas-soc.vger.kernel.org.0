Return-Path: <linux-renesas-soc+bounces-23984-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E39AC27B63
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 01 Nov 2025 10:53:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 129AC3B92BE
	for <lists+linux-renesas-soc@lfdr.de>; Sat,  1 Nov 2025 09:53:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B94B928689F;
	Sat,  1 Nov 2025 09:53:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MzQSBm27"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 537FA284883
	for <linux-renesas-soc@vger.kernel.org>; Sat,  1 Nov 2025 09:53:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761990827; cv=none; b=tB6Q2kVXXaT8zWOfTaXHu0zgJFvagq9lnzsQbovX0mcHHJml+Yw8d/JEYtjZU2csCu6Er5kIY5FMoT/Ssvn8OHC8MLR0FFzgBEqfayN/qfFUy2HpKH4KQbc64Shbtb6lnSt0kWK5S60Ix3Nd/j0bbcIDTsQSa+y812rGRGIa2Uo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761990827; c=relaxed/simple;
	bh=KXarLteztB2uiUHiUaWLuqGPn+ejV7T3qIS7K2zCRdg=;
	h=Date:From:To:Cc:Subject:Message-ID; b=HAYCg4kiysPB3TKcS32nxuKAWCVcSEDZ0s4Q4P+TjSonGWLgqFbb45gN2f0jnBJLYRfJ3HtoszOTfX4wNrPGGvXPuLw1SEzOdyPguEF8K0/wquM/37H0Cl4ZI229kYCG9m87wlxZH0e5rOPk8HMeJMxpGwEFHScHRTIlT69F1Y0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=MzQSBm27; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761990825; x=1793526825;
  h=date:from:to:cc:subject:message-id;
  bh=KXarLteztB2uiUHiUaWLuqGPn+ejV7T3qIS7K2zCRdg=;
  b=MzQSBm27Jt7LauR8+4ryPZEc8NuSuSxkg68MYdnDVRexDKobdCICSXTu
   w4b9Y4SHlOXa6fsGyb9SsnSgjaJ8G4Q/UfAUuYWuDGIiJYRWcDOh73sE8
   YXCAOPOskhODOJ1nF3Q4ZpcYiJkusSHE97uf1vAiVVAPQe4CI9wEe8W3x
   TGrX4NH5ubrJ5N6y1RVg0U0+ejy47kMVFh2Su6aUiLmZ6bk09WdgqUtTQ
   hQzGlnGtyf5LHxB+jyW7tDm6q2OPOYC++XRB7OZLRqpIrrX/TRCZPF+2r
   T6tALrwnHPaTt6ZQURE2EuGNq9XemoIm4vkwmUAGFQkuTjUGPTx6p9P7n
   Q==;
X-CSE-ConnectionGUID: BETDjZZGS3e4AU5E01xcWg==
X-CSE-MsgGUID: 49cIlmLPSb6TGuD5DjD6jQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11599"; a="64290287"
X-IronPort-AV: E=Sophos;i="6.19,271,1754982000"; 
   d="scan'208";a="64290287"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Nov 2025 02:53:44 -0700
X-CSE-ConnectionGUID: wl3waA67Q++nVCZSeGRI5w==
X-CSE-MsgGUID: YJEYSGl8SOWxjz2Grc4tcw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,271,1754982000"; 
   d="scan'208";a="190517249"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by orviesa003.jf.intel.com with ESMTP; 01 Nov 2025 02:53:44 -0700
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vF8IC-000O5o-1C;
	Sat, 01 Nov 2025 09:53:12 +0000
Date: Sat, 01 Nov 2025 17:52:21 +0800
From: kernel test robot <lkp@intel.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: linux-renesas-soc@vger.kernel.org
Subject: [geert-renesas-devel:next] BUILD SUCCESS
 afade6fa8f177595a8724df4d32978e69387c0a7
Message-ID: <202511011715.YrgvDpQV-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git next
branch HEAD: afade6fa8f177595a8724df4d32978e69387c0a7  Merge branch 'renesas-dts-for-v6.19' into renesas-next

elapsed time: 1454m

configs tested: 134
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-15.1.0
alpha                            allyesconfig    gcc-15.1.0
arc                               allnoconfig    gcc-15.1.0
arc                   randconfig-001-20251031    gcc-8.5.0
arc                   randconfig-002-20251031    gcc-8.5.0
arm                               allnoconfig    clang-22
arm                   randconfig-001-20251031    gcc-14.3.0
arm                   randconfig-002-20251031    clang-22
arm                   randconfig-003-20251031    gcc-11.5.0
arm                   randconfig-004-20251031    clang-22
arm                          sp7021_defconfig    gcc-15.1.0
arm64                             allnoconfig    gcc-15.1.0
arm64                 randconfig-001-20251101    gcc-8.5.0
arm64                 randconfig-002-20251101    clang-22
arm64                 randconfig-003-20251101    clang-17
arm64                 randconfig-004-20251101    gcc-14.3.0
csky                             allmodconfig    gcc-15.1.0
csky                              allnoconfig    gcc-15.1.0
csky                             allyesconfig    gcc-15.1.0
csky                  randconfig-001-20251101    gcc-15.1.0
csky                  randconfig-002-20251101    gcc-15.1.0
hexagon                          allmodconfig    clang-17
hexagon                           allnoconfig    clang-22
hexagon                          allyesconfig    clang-22
hexagon               randconfig-001-20251031    clang-22
hexagon               randconfig-002-20251031    clang-22
i386                             alldefconfig    gcc-14
i386                              allnoconfig    gcc-14
i386        buildonly-randconfig-001-20251101    clang-20
i386        buildonly-randconfig-002-20251101    gcc-13
i386        buildonly-randconfig-003-20251101    clang-20
i386        buildonly-randconfig-004-20251101    gcc-14
i386        buildonly-randconfig-005-20251101    clang-20
i386        buildonly-randconfig-006-20251101    clang-20
i386                  randconfig-003-20251101    gcc-14
i386                  randconfig-011-20251101    gcc-14
i386                  randconfig-012-20251101    clang-20
i386                  randconfig-013-20251101    gcc-14
i386                  randconfig-014-20251101    clang-20
i386                  randconfig-015-20251101    clang-20
i386                  randconfig-016-20251101    gcc-14
i386                  randconfig-017-20251101    clang-20
loongarch                         allnoconfig    clang-22
loongarch                           defconfig    clang-19
loongarch             randconfig-001-20251031    gcc-15.1.0
loongarch             randconfig-002-20251031    gcc-14.3.0
m68k                             allmodconfig    gcc-15.1.0
m68k                              allnoconfig    gcc-15.1.0
m68k                             allyesconfig    gcc-15.1.0
m68k                                defconfig    gcc-15.1.0
m68k                       m5249evb_defconfig    gcc-15.1.0
microblaze                        allnoconfig    gcc-15.1.0
microblaze                          defconfig    gcc-15.1.0
mips                              allnoconfig    gcc-15.1.0
mips                        bcm63xx_defconfig    clang-22
nios2                            allmodconfig    gcc-11.5.0
nios2                             allnoconfig    gcc-11.5.0
nios2                            allyesconfig    gcc-11.5.0
nios2                               defconfig    gcc-11.5.0
nios2                 randconfig-001-20251031    gcc-9.5.0
nios2                 randconfig-002-20251031    gcc-11.5.0
openrisc                         allmodconfig    gcc-15.1.0
openrisc                          allnoconfig    gcc-15.1.0
openrisc                         allyesconfig    gcc-15.1.0
openrisc                            defconfig    gcc-15.1.0
parisc                           allmodconfig    gcc-15.1.0
parisc                            allnoconfig    gcc-15.1.0
parisc                           allyesconfig    gcc-15.1.0
parisc                              defconfig    gcc-15.1.0
parisc                randconfig-001-20251101    gcc-11.5.0
parisc                randconfig-002-20251101    gcc-8.5.0
parisc64                            defconfig    gcc-15.1.0
powerpc                           allnoconfig    gcc-15.1.0
powerpc                 linkstation_defconfig    clang-20
powerpc               randconfig-001-20251101    gcc-11.5.0
powerpc               randconfig-002-20251101    clang-22
powerpc64             randconfig-001-20251101    gcc-11.5.0
powerpc64             randconfig-002-20251101    clang-20
riscv                             allnoconfig    gcc-15.1.0
riscv                               defconfig    clang-22
riscv                 randconfig-001-20251031    gcc-8.5.0
riscv                 randconfig-002-20251031    clang-17
s390                             allmodconfig    clang-18
s390                              allnoconfig    clang-22
s390                             allyesconfig    gcc-15.1.0
s390                                defconfig    clang-22
s390                  randconfig-001-20251031    clang-16
s390                  randconfig-002-20251031    gcc-12.5.0
sh                               allmodconfig    gcc-15.1.0
sh                                allnoconfig    gcc-15.1.0
sh                               allyesconfig    gcc-15.1.0
sh                                  defconfig    gcc-15.1.0
sh                    randconfig-001-20251031    gcc-14.3.0
sh                    randconfig-002-20251031    gcc-14.3.0
sh                   secureedge5410_defconfig    gcc-15.1.0
sparc                            allmodconfig    gcc-15.1.0
sparc                             allnoconfig    gcc-15.1.0
sparc                            allyesconfig    gcc-15.1.0
sparc                               defconfig    gcc-15.1.0
sparc                 randconfig-001-20251101    gcc-15.1.0
sparc                 randconfig-002-20251101    gcc-14.3.0
sparc64                          allmodconfig    clang-22
sparc64                          allyesconfig    gcc-15.1.0
sparc64                             defconfig    clang-20
sparc64               randconfig-001-20251101    gcc-15.1.0
sparc64               randconfig-002-20251101    clang-22
um                               allmodconfig    clang-19
um                                allnoconfig    clang-22
um                               allyesconfig    gcc-14
um                                  defconfig    clang-22
um                             i386_defconfig    gcc-14
um                    randconfig-001-20251101    clang-16
um                    randconfig-002-20251101    gcc-14
um                           x86_64_defconfig    clang-22
x86_64                            allnoconfig    clang-20
x86_64      buildonly-randconfig-001-20251101    clang-20
x86_64      buildonly-randconfig-002-20251101    gcc-14
x86_64      buildonly-randconfig-003-20251101    gcc-13
x86_64      buildonly-randconfig-004-20251101    clang-20
x86_64      buildonly-randconfig-005-20251101    gcc-13
x86_64      buildonly-randconfig-006-20251101    clang-20
x86_64                              defconfig    gcc-14
x86_64                randconfig-011-20251101    clang-20
x86_64                randconfig-012-20251101    gcc-14
x86_64                randconfig-013-20251101    clang-20
x86_64                randconfig-014-20251101    gcc-14
x86_64                randconfig-015-20251101    clang-20
x86_64                randconfig-016-20251101    gcc-14
x86_64                randconfig-073-20251101    gcc-14
xtensa                            allnoconfig    gcc-15.1.0
xtensa                           allyesconfig    gcc-15.1.0
xtensa                  cadence_csp_defconfig    gcc-15.1.0
xtensa                randconfig-001-20251101    gcc-13.4.0
xtensa                randconfig-002-20251101    gcc-12.5.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

