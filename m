Return-Path: <linux-renesas-soc+bounces-24668-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 6043DC60156
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 15 Nov 2025 08:58:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 156B04E1220
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 15 Nov 2025 07:58:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5246D199FBA;
	Sat, 15 Nov 2025 07:58:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KcOi+HyL"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 820AE2AE78
	for <linux-renesas-soc@vger.kernel.org>; Sat, 15 Nov 2025 07:58:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763193519; cv=none; b=l4OXo/ItelR+bf6M8XtdFtNunEBTjJ0kWNk0upU+NeYD0wrNRWg54oERVtutDRfcf5j/cB4NbLDYiHfF1hU32Z5AwISpS1IFWxbWNo2+DM2J2SdrgPZDscNlZJBCHwL/hydlDLCecLTDjlHHVJujkvnB0e7+4ni/19AKklVJgZM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763193519; c=relaxed/simple;
	bh=o1p8pZAoKmKICnP4KVR2X/mVH1OWHOefe61+oe9qJr4=;
	h=Date:From:To:Cc:Subject:Message-ID; b=rtXZYVVg+bqCAGBWkNKnT3z+pl7Fk8rv2W2e9CMh1tEeczw2Ekz6a132C9liQHdNSqOY67VqINKWxbOP0YVkaiTDAOYDnIedB5r9d9K+6KK3LtUBpO08GkOKkHaWOFJmDfyl4S5/vWCJE03Kzjy//Mb2zUsrTulDM6myFSxiGfM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KcOi+HyL; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1763193517; x=1794729517;
  h=date:from:to:cc:subject:message-id;
  bh=o1p8pZAoKmKICnP4KVR2X/mVH1OWHOefe61+oe9qJr4=;
  b=KcOi+HyLd6anF2gPTGckVPJiesh5JPtWowbv75L1D1YwAsbuIQ6s2bMW
   gJJI/RGhDYz4OxJMB2hvRaERMcbk924Mp8J1mRDLRR7l6yZ3m+nwWUTZI
   BCNiik7C1L1qdwb8bhJ/MzG1Hd+Ji1rjkRZbRmXuzGa9NsM90/4IRjPR1
   lBrVsKCIZ5/EHA4AnCG8zfOkbOi1Hc0Q33v2zxG7XzEq1kgYAJCTQuXxx
   iyq4lOSw7LcjsK1U8hVaHV5WvdLzOtKcMjKtn7tQzjV9JQjV5cOvXJs4w
   IzJays26Jf7iGJz7DwQ6eE3RTJ6F9lcymDxfRw94oxoYffQmExMJeXbiu
   w==;
X-CSE-ConnectionGUID: NXVorVA4SAu54TnC13sMGA==
X-CSE-MsgGUID: lvXIJKU3QaKnj/BskmmRgQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11613"; a="68902632"
X-IronPort-AV: E=Sophos;i="6.19,306,1754982000"; 
   d="scan'208";a="68902632"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Nov 2025 23:58:37 -0800
X-CSE-ConnectionGUID: jy/LROB0RNCq8Ew3gOlV2g==
X-CSE-MsgGUID: qIpPHoo1SgCTQema+V0anA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,306,1754982000"; 
   d="scan'208";a="189251549"
Received: from lkp-server01.sh.intel.com (HELO 7b01c990427b) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 14 Nov 2025 23:58:37 -0800
Received: from kbuild by 7b01c990427b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vKBB3-0007nr-2y;
	Sat, 15 Nov 2025 07:58:33 +0000
Date: Sat, 15 Nov 2025 15:58:32 +0800
From: kernel test robot <lkp@intel.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: linux-renesas-soc@vger.kernel.org
Subject: [geert-renesas-devel:renesas-dts-for-v6.19] BUILD SUCCESS
 b272b94fd223977a79cb521dc7f14a8041b3fb3f
Message-ID: <202511151527.dq7CytxD-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git renesas-dts-for-v6.19
branch HEAD: b272b94fd223977a79cb521dc7f14a8041b3fb3f  arm64: dts: renesas: rzt2h-n2h-evk: Enable Ethernet support

elapsed time: 2058m

configs tested: 110
configs skipped: 6

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-15.1.0
arc                               allnoconfig    gcc-15.1.0
arc                   randconfig-001-20251114    gcc-8.5.0
arc                   randconfig-002-20251114    gcc-15.1.0
arm                               allnoconfig    clang-22
arm                       omap2plus_defconfig    gcc-15.1.0
arm                   randconfig-001-20251114    gcc-15.1.0
arm                   randconfig-002-20251114    gcc-14.3.0
arm                          sp7021_defconfig    gcc-15.1.0
arm64                             allnoconfig    gcc-15.1.0
arm64                 randconfig-001-20251115    gcc-8.5.0
arm64                 randconfig-002-20251115    clang-18
arm64                 randconfig-003-20251115    gcc-13.4.0
arm64                 randconfig-004-20251115    gcc-8.5.0
csky                              allnoconfig    gcc-15.1.0
csky                  randconfig-001-20251115    gcc-15.1.0
csky                  randconfig-002-20251115    gcc-9.5.0
hexagon                           allnoconfig    clang-22
hexagon               randconfig-001-20251115    clang-16
hexagon               randconfig-002-20251115    clang-22
i386                              allnoconfig    gcc-14
i386        buildonly-randconfig-001-20251115    gcc-14
i386        buildonly-randconfig-002-20251115    gcc-14
i386        buildonly-randconfig-003-20251115    clang-20
i386        buildonly-randconfig-004-20251115    clang-20
i386        buildonly-randconfig-005-20251115    clang-20
i386        buildonly-randconfig-006-20251115    clang-20
i386                  randconfig-001-20251115    gcc-14
i386                  randconfig-002-20251115    clang-20
i386                  randconfig-003-20251115    clang-20
i386                  randconfig-004-20251115    clang-20
i386                  randconfig-005-20251115    gcc-14
i386                  randconfig-006-20251115    gcc-14
i386                  randconfig-007-20251115    gcc-14
i386                  randconfig-011-20251115    clang-20
i386                  randconfig-012-20251115    gcc-14
i386                  randconfig-013-20251115    gcc-14
i386                  randconfig-014-20251115    clang-20
i386                  randconfig-015-20251115    clang-20
i386                  randconfig-016-20251115    clang-20
i386                  randconfig-017-20251115    clang-20
loongarch                         allnoconfig    clang-22
loongarch                           defconfig    clang-19
loongarch             randconfig-001-20251115    clang-18
loongarch             randconfig-002-20251115    gcc-13.4.0
m68k                             alldefconfig    gcc-15.1.0
m68k                              allnoconfig    gcc-15.1.0
m68k                          atari_defconfig    gcc-15.1.0
m68k                                defconfig    gcc-15.1.0
microblaze                        allnoconfig    gcc-15.1.0
microblaze                          defconfig    gcc-15.1.0
mips                              allnoconfig    gcc-15.1.0
nios2                             allnoconfig    gcc-11.5.0
nios2                               defconfig    gcc-11.5.0
nios2                 randconfig-001-20251115    gcc-8.5.0
nios2                 randconfig-002-20251115    gcc-11.5.0
openrisc                          allnoconfig    gcc-15.1.0
openrisc                            defconfig    gcc-15.1.0
openrisc                  or1klitex_defconfig    gcc-15.1.0
parisc                            allnoconfig    gcc-15.1.0
parisc                              defconfig    gcc-15.1.0
parisc                randconfig-001-20251114    gcc-12.5.0
parisc                randconfig-002-20251114    gcc-11.5.0
parisc64                            defconfig    gcc-15.1.0
powerpc                           allnoconfig    gcc-15.1.0
powerpc               randconfig-001-20251114    clang-17
powerpc               randconfig-002-20251114    clang-22
powerpc                     tqm8540_defconfig    gcc-15.1.0
powerpc                     tqm8555_defconfig    gcc-15.1.0
powerpc64             randconfig-001-20251114    gcc-8.5.0
powerpc64             randconfig-002-20251114    clang-22
riscv                             allnoconfig    gcc-15.1.0
riscv                               defconfig    clang-22
riscv                 randconfig-001-20251114    gcc-13.4.0
riscv                 randconfig-002-20251114    clang-22
s390                              allnoconfig    clang-22
s390                                defconfig    clang-22
s390                  randconfig-001-20251114    gcc-8.5.0
s390                  randconfig-002-20251114    gcc-11.5.0
sh                                allnoconfig    gcc-15.1.0
sh                                  defconfig    gcc-15.1.0
sh                    randconfig-001-20251114    gcc-10.5.0
sh                    randconfig-002-20251114    gcc-15.1.0
sparc                             allnoconfig    gcc-15.1.0
sparc                               defconfig    gcc-15.1.0
sparc                 randconfig-001-20251115    gcc-13.4.0
sparc64                             defconfig    clang-20
sparc64               randconfig-001-20251115    gcc-9.5.0
um                                allnoconfig    clang-22
um                                  defconfig    clang-22
um                             i386_defconfig    gcc-14
um                    randconfig-001-20251115    gcc-14
um                           x86_64_defconfig    clang-22
x86_64                            allnoconfig    clang-20
x86_64      buildonly-randconfig-001-20251115    gcc-14
x86_64      buildonly-randconfig-002-20251115    gcc-12
x86_64      buildonly-randconfig-003-20251115    gcc-14
x86_64      buildonly-randconfig-004-20251115    gcc-14
x86_64      buildonly-randconfig-005-20251115    gcc-12
x86_64      buildonly-randconfig-006-20251115    gcc-14
x86_64                              defconfig    gcc-14
x86_64                randconfig-071-20251115    gcc-14
x86_64                randconfig-072-20251115    clang-20
x86_64                randconfig-073-20251115    gcc-14
x86_64                randconfig-074-20251115    clang-20
x86_64                randconfig-075-20251115    clang-20
x86_64                randconfig-076-20251115    clang-20
xtensa                            allnoconfig    gcc-15.1.0
xtensa                randconfig-001-20251115    gcc-8.5.0
xtensa                randconfig-002-20251115    gcc-13.4.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

