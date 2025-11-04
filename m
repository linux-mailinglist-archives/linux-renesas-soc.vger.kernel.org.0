Return-Path: <linux-renesas-soc+bounces-24066-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B033C30DC9
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 04 Nov 2025 13:03:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 4D7314E920A
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  4 Nov 2025 12:02:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B27862DE200;
	Tue,  4 Nov 2025 12:02:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="K/yDrvIs"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 144B61D63F5
	for <linux-renesas-soc@vger.kernel.org>; Tue,  4 Nov 2025 12:02:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762257742; cv=none; b=fBc+wpvcihh+bcBL5M7YorH6Of7wbPXYGwBlppcX+nAQNu8W+rDWJ6XASMWeKYpNVtrhClXpzXufvyyLonLCmm0c69OFCQYEDIhnNT5ZvBGqB1ZaENQMfaRqqNiF0c/mw/NdCjembcSRcjVg29vUKYWnhm+AkYTBTopvebN7qWY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762257742; c=relaxed/simple;
	bh=MJJarnKUBfdAGQzwhEGbq0Y0WiiRb1utJqxH16Jlylk=;
	h=Date:From:To:Cc:Subject:Message-ID; b=pSlCWn5ziLp/q0HRqZqv4IQfJyjR7BUfeg3fQ7FBVi/oRHZFEd+xMQSBeEfJH0+wy5CoMCQ8N2nhVRciZVQERm3ZM2r+LX53+Wm7dP213V9rknLsp7ElGhCCbza8Nff5XRCUVUlvBwoT6UETwZGkXV0Fk3doRXEee2gC2RPHbaE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=K/yDrvIs; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1762257742; x=1793793742;
  h=date:from:to:cc:subject:message-id;
  bh=MJJarnKUBfdAGQzwhEGbq0Y0WiiRb1utJqxH16Jlylk=;
  b=K/yDrvIsVDPtO7hsyEVLThpjTDn/+2yy/ttWtUmK1PpBRW7A/sm5uQpA
   uKWnl1Oj6DeGfegfDNtnIBLWWENrV/+AAfwoTbzE4SVoO+VrXVDrkrv6z
   u+EbQOHSKvV2W5NpHoUrsrQnL1YfocL0EUMPe/twLbnbu3h42YiMGL+f+
   g6/cBT2Y/MHc4dImfUfdqGHLctOFSjQITJWioeDyo7x8eFgsrmmNYLhnd
   DfwLl0UCtAbWx8a341Y8QwYAySa49Vsv0pg7YvO9EJJ/n35TZqWdX5Yad
   x/a8BAzZ0avtZCh4yjdlS0G2qbmvWNMUcVYFcz8I4L3GGrt9Y/3pudo/G
   g==;
X-CSE-ConnectionGUID: FNSz7H2XSTmbrAwAY6HRDQ==
X-CSE-MsgGUID: UC6B/XMETg+YRYJBsjgS1Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11602"; a="64046545"
X-IronPort-AV: E=Sophos;i="6.19,279,1754982000"; 
   d="scan'208";a="64046545"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Nov 2025 04:02:21 -0800
X-CSE-ConnectionGUID: KtlTzMvGRm+AnfBV2Mlhtw==
X-CSE-MsgGUID: rS0AhvA5RxeMjFVRQy4rEg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,279,1754982000"; 
   d="scan'208";a="217784757"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by orviesa002.jf.intel.com with ESMTP; 04 Nov 2025 04:02:19 -0800
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vGFjs-000RN6-2h;
	Tue, 04 Nov 2025 12:02:16 +0000
Date: Tue, 04 Nov 2025 20:01:36 +0800
From: kernel test robot <lkp@intel.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: linux-renesas-soc@vger.kernel.org
Subject: [geert-renesas-devel:master] BUILD SUCCESS
 d4bd3b4347a2761a815738414e265d5c948f7b19
Message-ID: <202511042031.hjupZm9Y-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git master
branch HEAD: d4bd3b4347a2761a815738414e265d5c948f7b19  Merge branch 'topic/renesas-defconfig', tag 'v6.18-rc4' into renesas-devel

elapsed time: 1461m

configs tested: 120
configs skipped: 6

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-15.1.0
alpha                               defconfig    gcc-15.1.0
arc                               allnoconfig    gcc-15.1.0
arc                                 defconfig    gcc-15.1.0
arc                   randconfig-001-20251103    gcc-9.5.0
arc                   randconfig-002-20251103    gcc-15.1.0
arm                               allnoconfig    clang-22
arm                      jornada720_defconfig    clang-22
arm                          pxa910_defconfig    gcc-15.1.0
arm                   randconfig-001-20251103    clang-22
arm                   randconfig-002-20251103    clang-16
arm                   randconfig-003-20251103    gcc-14.3.0
arm                   randconfig-004-20251103    clang-22
arm64                             allnoconfig    gcc-15.1.0
arm64                 randconfig-001-20251104    gcc-13.4.0
arm64                 randconfig-002-20251104    clang-22
arm64                 randconfig-003-20251104    gcc-13.4.0
arm64                 randconfig-004-20251104    clang-22
csky                              allnoconfig    gcc-15.1.0
csky                                defconfig    gcc-15.1.0
csky                  randconfig-001-20251104    gcc-10.5.0
csky                  randconfig-002-20251104    gcc-15.1.0
hexagon                           allnoconfig    clang-22
hexagon               randconfig-001-20251103    clang-22
hexagon               randconfig-002-20251103    clang-22
i386                              allnoconfig    gcc-14
i386        buildonly-randconfig-001-20251104    gcc-14
i386        buildonly-randconfig-002-20251104    clang-20
i386        buildonly-randconfig-003-20251104    gcc-12
i386        buildonly-randconfig-004-20251104    gcc-14
i386        buildonly-randconfig-005-20251104    gcc-12
i386        buildonly-randconfig-006-20251104    gcc-14
i386                                defconfig    clang-20
i386                  randconfig-011-20251104    gcc-13
i386                  randconfig-012-20251104    clang-20
i386                  randconfig-013-20251104    gcc-14
i386                  randconfig-014-20251104    clang-20
i386                  randconfig-015-20251104    gcc-14
i386                  randconfig-016-20251104    clang-20
i386                  randconfig-017-20251104    clang-20
loongarch                        allmodconfig    clang-19
loongarch                         allnoconfig    clang-22
loongarch                           defconfig    clang-19
loongarch             randconfig-001-20251103    gcc-12.5.0
loongarch             randconfig-002-20251103    gcc-14.3.0
m68k                             allmodconfig    gcc-15.1.0
m68k                              allnoconfig    gcc-15.1.0
m68k                             allyesconfig    gcc-15.1.0
m68k                                defconfig    gcc-15.1.0
m68k                        m5307c3_defconfig    gcc-15.1.0
microblaze                       allmodconfig    gcc-15.1.0
microblaze                        allnoconfig    gcc-15.1.0
microblaze                       allyesconfig    gcc-15.1.0
microblaze                          defconfig    gcc-15.1.0
mips                              allnoconfig    gcc-15.1.0
mips                          eyeq5_defconfig    gcc-15.1.0
nios2                             allnoconfig    gcc-11.5.0
nios2                               defconfig    gcc-11.5.0
nios2                 randconfig-001-20251103    gcc-11.5.0
nios2                 randconfig-002-20251103    gcc-11.5.0
openrisc                          allnoconfig    gcc-15.1.0
openrisc                            defconfig    gcc-15.1.0
parisc                            allnoconfig    gcc-15.1.0
parisc                              defconfig    gcc-15.1.0
parisc                randconfig-001-20251103    gcc-14.3.0
parisc                randconfig-002-20251103    gcc-15.1.0
parisc64                            defconfig    gcc-15.1.0
powerpc                           allnoconfig    gcc-15.1.0
powerpc                    amigaone_defconfig    gcc-15.1.0
powerpc               randconfig-001-20251103    gcc-8.5.0
powerpc               randconfig-002-20251103    clang-20
powerpc64             randconfig-001-20251103    clang-22
riscv                             allnoconfig    gcc-15.1.0
riscv                 randconfig-001-20251104    gcc-8.5.0
riscv                 randconfig-002-20251104    gcc-8.5.0
s390                             allmodconfig    clang-18
s390                              allnoconfig    clang-22
s390                             allyesconfig    gcc-15.1.0
s390                  randconfig-001-20251104    clang-22
s390                  randconfig-002-20251104    clang-22
sh                               allmodconfig    gcc-15.1.0
sh                                allnoconfig    gcc-15.1.0
sh                               allyesconfig    gcc-15.1.0
sh                                  defconfig    gcc-15.1.0
sh                    randconfig-001-20251104    gcc-13.4.0
sh                    randconfig-002-20251104    gcc-11.5.0
sh                           se7750_defconfig    gcc-15.1.0
sh                             shx3_defconfig    gcc-15.1.0
sparc                            allmodconfig    gcc-15.1.0
sparc                             allnoconfig    gcc-15.1.0
sparc64                          alldefconfig    gcc-15.1.0
sparc64                             defconfig    clang-20
um                                allnoconfig    clang-22
um                               allyesconfig    gcc-14
um                                  defconfig    clang-22
um                             i386_defconfig    gcc-14
um                           x86_64_defconfig    clang-22
x86_64                            allnoconfig    clang-20
x86_64      buildonly-randconfig-002-20251104    gcc-12
x86_64      buildonly-randconfig-004-20251104    gcc-14
x86_64                              defconfig    gcc-14
x86_64                randconfig-001-20251104    gcc-14
x86_64                randconfig-002-20251104    clang-20
x86_64                randconfig-003-20251104    gcc-13
x86_64                randconfig-004-20251104    clang-20
x86_64                randconfig-005-20251104    clang-20
x86_64                randconfig-006-20251104    gcc-14
x86_64                randconfig-011-20251104    gcc-14
x86_64                randconfig-012-20251104    gcc-14
x86_64                randconfig-013-20251104    clang-20
x86_64                randconfig-014-20251104    clang-20
x86_64                randconfig-015-20251104    gcc-14
x86_64                randconfig-016-20251104    clang-20
x86_64                randconfig-071-20251104    clang-20
x86_64                randconfig-072-20251104    clang-20
x86_64                randconfig-073-20251104    clang-20
x86_64                randconfig-074-20251104    gcc-14
x86_64                randconfig-075-20251104    clang-20
x86_64                randconfig-076-20251104    clang-20
xtensa                            allnoconfig    gcc-15.1.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

