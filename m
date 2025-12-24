Return-Path: <linux-renesas-soc+bounces-26095-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A7E56CDBA3D
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 24 Dec 2025 09:09:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 593183005B84
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 24 Dec 2025 08:09:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6D7CF2C0F7E;
	Wed, 24 Dec 2025 08:09:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="c4qaHGsC"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 585FA3A8F7
	for <linux-renesas-soc@vger.kernel.org>; Wed, 24 Dec 2025 08:08:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766563741; cv=none; b=mXdbTDDaKj8AHMMSrftVtApSBWnohDIjljK93AIycIpYCYUnr6cWN2QQj+5FJH05sqvWkuXhXJwaD5BBN3/6rt3cMXpsQ3hNEizht5A41FNFqDkXoKNLV5Hrhhjg+ppqkGANg3Pqe20542ao+B24P+qJMKPrShNO2cWh0G/1Uog=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766563741; c=relaxed/simple;
	bh=8xROJwx59fsdWHcbA3QPWpu9JqTIvEo4HwCQWqqp5gw=;
	h=Date:From:To:Cc:Subject:Message-ID; b=LuUMZg5GM/EM37NMyUKYIzxsEOIEQ5irx5wnIAYJytX73c/UIqka+kxcLeyjJB90FxpgCg7s2/JipsD/0PBZL+dvS7j7QKHHI8iBizacPJMKcxLGJ1zKhfUxePLx0P397bp4KcOFzlhOXnXjzPKF3RjPkNiZRMVqxsWC5UW5cRM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=c4qaHGsC; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766563739; x=1798099739;
  h=date:from:to:cc:subject:message-id;
  bh=8xROJwx59fsdWHcbA3QPWpu9JqTIvEo4HwCQWqqp5gw=;
  b=c4qaHGsC/Go2jtHSC1pR4EuWahoFKuYek22oJYougXfviztZiLEuZCMm
   O+m0LFHTVrSiSnliZhY7HrebwUTVKTUM8Pgy88Ja/aZug95C4UCvtwPtR
   Dk3Y9xw1f8t38LHWaFrsV0E/HpiFwBdKexxv9/7GzJHcLgojdvNoRqb3e
   anUB8vXxAx/sCfuK20NoQN4T4Lb4Ykx/qyR+gQaXFkFesckMIbzAogejy
   dAhj03+uh0W4ui1EcLvXqi18PrwOwt85rxSLk+BQi/77VQOI6YSll/Oz9
   jDF1wtYVoITNnoE96JbvluCmoafy6fPojSfH16B651sqK3Qf0+zMgcaN4
   A==;
X-CSE-ConnectionGUID: ZwziQ/BhT8WPXtm98XfKzw==
X-CSE-MsgGUID: t770PHfPRBG2s7f4KbynEw==
X-IronPort-AV: E=McAfee;i="6800,10657,11651"; a="72257973"
X-IronPort-AV: E=Sophos;i="6.21,173,1763452800"; 
   d="scan'208";a="72257973"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Dec 2025 00:08:59 -0800
X-CSE-ConnectionGUID: ur6DU+GoTkud1Smnw/wYNA==
X-CSE-MsgGUID: phfMJ4cdRhu5yr20lklhbg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,173,1763452800"; 
   d="scan'208";a="200264475"
Received: from lkp-server02.sh.intel.com (HELO dd3453e2b682) ([10.239.97.151])
  by fmviesa008.fm.intel.com with ESMTP; 24 Dec 2025 00:08:57 -0800
Received: from kbuild by dd3453e2b682 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vYJvT-000000002q0-1n5z;
	Wed, 24 Dec 2025 08:08:55 +0000
Date: Wed, 24 Dec 2025 16:08:40 +0800
From: kernel test robot <lkp@intel.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: linux-renesas-soc@vger.kernel.org
Subject: [geert-renesas-devel:master] BUILD SUCCESS
 21d082ca9bbbaf4cc0a4f4f67c3c7671fc6aeb8d
Message-ID: <202512241635.4q0Wty9X-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git master
branch HEAD: 21d082ca9bbbaf4cc0a4f4f67c3c7671fc6aeb8d  Merge branch 'topic/renesas-defconfig' into renesas-devel

elapsed time: 1321m

configs tested: 160
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-15.1.0
alpha                            allyesconfig    gcc-15.1.0
alpha                               defconfig    gcc-15.1.0
arc                              allmodconfig    gcc-15.1.0
arc                               allnoconfig    gcc-15.1.0
arc                              allyesconfig    gcc-15.1.0
arc                                 defconfig    gcc-15.1.0
arc                   randconfig-001-20251224    gcc-12.5.0
arc                   randconfig-002-20251224    gcc-10.5.0
arm                              alldefconfig    gcc-15.1.0
arm                               allnoconfig    clang-22
arm                              allyesconfig    gcc-15.1.0
arm                                 defconfig    clang-22
arm                           omap1_defconfig    gcc-15.1.0
arm                   randconfig-001-20251224    gcc-8.5.0
arm                   randconfig-002-20251224    gcc-8.5.0
arm                   randconfig-003-20251224    gcc-12.5.0
arm                   randconfig-004-20251224    clang-22
arm                           sama5_defconfig    gcc-15.1.0
arm64                            allmodconfig    clang-19
arm64                             allnoconfig    gcc-15.1.0
arm64                               defconfig    gcc-15.1.0
arm64                 randconfig-001-20251224    gcc-8.5.0
arm64                 randconfig-002-20251224    gcc-14.3.0
arm64                 randconfig-003-20251224    clang-17
arm64                 randconfig-004-20251224    gcc-10.5.0
csky                             allmodconfig    gcc-15.1.0
csky                              allnoconfig    gcc-15.1.0
csky                                defconfig    gcc-15.1.0
csky                  randconfig-001-20251224    gcc-15.1.0
csky                  randconfig-002-20251224    gcc-15.1.0
hexagon                          allmodconfig    clang-17
hexagon                           allnoconfig    clang-22
hexagon                             defconfig    clang-22
hexagon               randconfig-001-20251224    clang-22
hexagon               randconfig-002-20251224    clang-22
i386                             allmodconfig    gcc-14
i386                              allnoconfig    gcc-14
i386                             allyesconfig    gcc-14
i386        buildonly-randconfig-001-20251224    clang-20
i386        buildonly-randconfig-002-20251224    gcc-14
i386        buildonly-randconfig-003-20251224    clang-20
i386        buildonly-randconfig-004-20251224    gcc-12
i386        buildonly-randconfig-005-20251224    gcc-14
i386        buildonly-randconfig-006-20251224    clang-20
i386                                defconfig    clang-20
i386                  randconfig-001-20251224    gcc-14
i386                  randconfig-002-20251224    gcc-14
i386                  randconfig-003-20251224    gcc-14
i386                  randconfig-004-20251224    gcc-12
i386                  randconfig-005-20251224    clang-20
i386                  randconfig-006-20251224    clang-20
i386                  randconfig-007-20251224    gcc-14
i386                  randconfig-011-20251224    clang-20
i386                  randconfig-012-20251224    clang-20
i386                  randconfig-013-20251224    clang-20
i386                  randconfig-014-20251224    clang-20
i386                  randconfig-015-20251224    clang-20
i386                  randconfig-016-20251224    clang-20
i386                  randconfig-017-20251224    gcc-13
loongarch                        allmodconfig    clang-19
loongarch                         allnoconfig    clang-22
loongarch                           defconfig    clang-19
loongarch             randconfig-001-20251224    gcc-15.1.0
loongarch             randconfig-002-20251224    gcc-12.5.0
m68k                             allmodconfig    gcc-15.1.0
m68k                              allnoconfig    gcc-15.1.0
m68k                             allyesconfig    gcc-15.1.0
m68k                                defconfig    gcc-15.1.0
microblaze                        allnoconfig    gcc-15.1.0
microblaze                       allyesconfig    gcc-15.1.0
microblaze                          defconfig    gcc-15.1.0
mips                             allmodconfig    gcc-15.1.0
mips                              allnoconfig    gcc-15.1.0
mips                             allyesconfig    gcc-15.1.0
nios2                            allmodconfig    gcc-11.5.0
nios2                             allnoconfig    gcc-11.5.0
nios2                               defconfig    gcc-11.5.0
nios2                 randconfig-001-20251224    gcc-11.5.0
nios2                 randconfig-002-20251224    gcc-11.5.0
openrisc                         allmodconfig    gcc-15.1.0
openrisc                          allnoconfig    gcc-15.1.0
parisc                           allmodconfig    gcc-15.1.0
parisc                            allnoconfig    gcc-15.1.0
parisc                           allyesconfig    gcc-15.1.0
parisc                randconfig-001-20251224    gcc-8.5.0
parisc                randconfig-002-20251224    gcc-9.5.0
parisc64                            defconfig    gcc-15.1.0
powerpc                          allmodconfig    gcc-15.1.0
powerpc                           allnoconfig    gcc-15.1.0
powerpc               randconfig-001-20251224    clang-22
powerpc               randconfig-002-20251224    clang-22
powerpc                     skiroot_defconfig    clang-22
powerpc                     tqm8548_defconfig    clang-22
powerpc64             randconfig-001-20251224    gcc-8.5.0
powerpc64             randconfig-002-20251224    gcc-13.4.0
riscv                            allmodconfig    clang-22
riscv                             allnoconfig    gcc-15.1.0
riscv                            allyesconfig    clang-16
riscv                 randconfig-001-20251224    gcc-8.5.0
riscv                 randconfig-002-20251224    clang-22
s390                             allmodconfig    clang-18
s390                              allnoconfig    clang-22
s390                             allyesconfig    gcc-15.1.0
s390                  randconfig-001-20251224    gcc-10.5.0
s390                  randconfig-002-20251224    gcc-15.1.0
sh                               allmodconfig    gcc-15.1.0
sh                                allnoconfig    gcc-15.1.0
sh                               allyesconfig    gcc-15.1.0
sh                                  defconfig    gcc-15.1.0
sh                        edosk7760_defconfig    gcc-15.1.0
sh                    randconfig-001-20251224    gcc-14.3.0
sh                    randconfig-002-20251224    gcc-10.5.0
sparc                             allnoconfig    gcc-15.1.0
sparc                 randconfig-001-20251224    gcc-8.5.0
sparc                 randconfig-002-20251224    gcc-8.5.0
sparc64                          allmodconfig    clang-22
sparc64                             defconfig    clang-20
sparc64               randconfig-001-20251224    gcc-8.5.0
sparc64               randconfig-002-20251224    clang-20
um                               allmodconfig    clang-19
um                                allnoconfig    clang-22
um                               allyesconfig    gcc-14
um                                  defconfig    clang-22
um                             i386_defconfig    gcc-14
um                    randconfig-001-20251224    gcc-14
um                    randconfig-002-20251224    gcc-14
um                           x86_64_defconfig    clang-22
x86_64                           allmodconfig    clang-20
x86_64                            allnoconfig    clang-20
x86_64                           allyesconfig    clang-20
x86_64      buildonly-randconfig-001-20251224    clang-20
x86_64      buildonly-randconfig-002-20251224    gcc-14
x86_64      buildonly-randconfig-003-20251224    gcc-14
x86_64      buildonly-randconfig-004-20251224    clang-20
x86_64      buildonly-randconfig-005-20251224    gcc-14
x86_64      buildonly-randconfig-006-20251224    clang-20
x86_64                              defconfig    gcc-14
x86_64                randconfig-001-20251224    clang-20
x86_64                randconfig-002-20251224    gcc-14
x86_64                randconfig-003-20251224    clang-20
x86_64                randconfig-004-20251224    gcc-14
x86_64                randconfig-005-20251224    gcc-14
x86_64                randconfig-006-20251224    gcc-14
x86_64                randconfig-011-20251224    gcc-14
x86_64                randconfig-012-20251224    gcc-14
x86_64                randconfig-013-20251224    clang-20
x86_64                randconfig-014-20251224    gcc-14
x86_64                randconfig-015-20251224    gcc-14
x86_64                randconfig-016-20251224    gcc-14
x86_64                randconfig-071-20251224    clang-20
x86_64                randconfig-072-20251224    gcc-14
x86_64                randconfig-073-20251224    clang-20
x86_64                randconfig-074-20251224    gcc-14
x86_64                randconfig-075-20251224    clang-20
x86_64                randconfig-076-20251224    gcc-14
x86_64                          rhel-9.4-rust    clang-20
xtensa                            allnoconfig    gcc-15.1.0
xtensa                randconfig-001-20251224    gcc-15.1.0
xtensa                randconfig-002-20251224    gcc-8.5.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

