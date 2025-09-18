Return-Path: <linux-renesas-soc+bounces-20986-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F756B37FD7
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 27 Aug 2025 12:26:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E155C5E4F9F
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 27 Aug 2025 10:26:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EA5F12F1FE6;
	Wed, 27 Aug 2025 10:26:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mmlc52go"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01E4923D7EC
	for <linux-renesas-soc@vger.kernel.org>; Wed, 27 Aug 2025 10:26:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756290365; cv=none; b=uFQEEbvPOAQmjXrJ3iWfDh2qpi/jKp4r5aRv+46yft5d1pIqY81xwuyt6yPcZMwKSP/EZA9/ZcihfIEUYGUuzVv6Ida8CtDPdtszfXYIhe/pPZ02Fi5ZvatgghhgNDgfZToB+J3jf62ezeeXdWVVcxAiq9cXSxaA7JWSZD0DoAE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756290365; c=relaxed/simple;
	bh=f54WZKbtKXfvFdB3MLQVvhRtR0k4BDJMvhgEV+EN224=;
	h=Date:From:To:Cc:Subject:Message-ID; b=AxhZmdQEJax8pOrAPKbnmXuw6SCSPlumLRH+EV+5Cvwg++yN04xx5FeMseTiOIveCerjZN/Hv1leK4yePPhbqQolF4vqSCB00DNzGdhc3tqoAaR7a7Gr1+mozUEEc+w5HpvAfZqN+0fAoFTwxABhLTqvqN2r2lKxG7XdoJQ3aQo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mmlc52go; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1756290364; x=1787826364;
  h=date:from:to:cc:subject:message-id;
  bh=f54WZKbtKXfvFdB3MLQVvhRtR0k4BDJMvhgEV+EN224=;
  b=mmlc52go4Vmr+xZbQdyKYuHrFBaA0LDeHrtTziusdNcmhoowk8cIXy0B
   yVnvD42LWMa7RtJdUUuu4F9cTc7PjTf1SkV1mZJCHPKPQDfWr1FtQx1Uf
   7+lxTS1a6o6pR/jpJbCj59hkDuxQEFF5k41I/NMnypw8lxnsK63LI7AFD
   IqxIvQhAsgLDcawtLgLmiD6s74RC1w9Xlpxpbg+m6EV6Y+oDBdBLXX/vL
   BpVV78Z0R42eWfrVmHFyG7c5bgbt6fACDazKFaq7i4hjrjqW0du0O16LA
   Tz872wu5p6/+/gbQWhjHywXJXRF8vKEun9cbXlEqz5Zoqw1C2+FMKyX3B
   A==;
X-CSE-ConnectionGUID: DLS7d53iRCGEc+BiYghcGQ==
X-CSE-MsgGUID: m2ZxDh7CRYSw8iL+vMcnkg==
X-IronPort-AV: E=McAfee;i="6800,10657,11534"; a="58689252"
X-IronPort-AV: E=Sophos;i="6.18,214,1751266800"; 
   d="scan'208";a="58689252"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Aug 2025 03:26:04 -0700
X-CSE-ConnectionGUID: x5CLLUeHSn+K45C0r5P4pw==
X-CSE-MsgGUID: kzMd6zfwT2OEMSnpu+O5eA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,214,1751266800"; 
   d="scan'208";a="174203490"
Received: from lkp-server02.sh.intel.com (HELO 4ea60e6ab079) ([10.239.97.151])
  by orviesa004.jf.intel.com with ESMTP; 27 Aug 2025 03:26:01 -0700
Received: from kbuild by 4ea60e6ab079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1urDLb-000Srv-0Y;
	Wed, 27 Aug 2025 10:25:47 +0000
Date: Wed, 27 Aug 2025 18:25:34 +0800
From: kernel test robot <lkp@intel.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: linux-renesas-soc@vger.kernel.org
Subject: [geert-renesas-drivers:master] BUILD SUCCESS
 b3c4f4122b286b19df1138f6f5eb9a0a8e6d1d79
Message-ID: <202508271826.D9VGZZoT-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git master
branch HEAD: b3c4f4122b286b19df1138f6f5eb9a0a8e6d1d79  [LOCAL] riscv: rzfive: defconfig: Update for renesas-drivers

elapsed time: 1215m

configs tested: 251
configs skipped: 4

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-15.1.0
alpha                            allyesconfig    clang-19
alpha                            allyesconfig    gcc-15.1.0
alpha                               defconfig    clang-19
arc                              allmodconfig    clang-19
arc                              allmodconfig    gcc-15.1.0
arc                               allnoconfig    gcc-15.1.0
arc                              allyesconfig    clang-19
arc                              allyesconfig    gcc-15.1.0
arc                                 defconfig    clang-19
arc                   randconfig-001-20250826    gcc-11.5.0
arc                   randconfig-001-20250827    gcc-12.5.0
arc                   randconfig-001-20250827    gcc-8.5.0
arc                   randconfig-002-20250826    gcc-8.5.0
arc                   randconfig-002-20250827    gcc-8.5.0
arc                        vdk_hs38_defconfig    gcc-15.1.0
arm                              allmodconfig    clang-19
arm                              allmodconfig    gcc-15.1.0
arm                               allnoconfig    clang-22
arm                              allyesconfig    clang-19
arm                              allyesconfig    gcc-15.1.0
arm                                 defconfig    clang-19
arm                   randconfig-001-20250826    gcc-12.5.0
arm                   randconfig-001-20250827    clang-22
arm                   randconfig-001-20250827    gcc-8.5.0
arm                   randconfig-002-20250826    gcc-13.4.0
arm                   randconfig-002-20250827    clang-22
arm                   randconfig-002-20250827    gcc-8.5.0
arm                   randconfig-003-20250826    gcc-8.5.0
arm                   randconfig-003-20250827    clang-22
arm                   randconfig-003-20250827    gcc-8.5.0
arm                   randconfig-004-20250827    clang-22
arm                   randconfig-004-20250827    gcc-8.5.0
arm                    vt8500_v6_v7_defconfig    gcc-15.1.0
arm64                            allmodconfig    clang-19
arm64                             allnoconfig    gcc-15.1.0
arm64                               defconfig    clang-19
arm64                 randconfig-001-20250827    gcc-11.5.0
arm64                 randconfig-001-20250827    gcc-8.5.0
arm64                 randconfig-002-20250827    gcc-8.5.0
arm64                 randconfig-003-20250827    clang-22
arm64                 randconfig-003-20250827    gcc-8.5.0
arm64                 randconfig-004-20250827    gcc-8.5.0
arm64                 randconfig-004-20250827    gcc-9.5.0
csky                              allnoconfig    gcc-15.1.0
csky                                defconfig    clang-19
csky                  randconfig-001-20250826    gcc-15.1.0
csky                  randconfig-001-20250827    gcc-15.1.0
csky                  randconfig-002-20250826    gcc-11.5.0
csky                  randconfig-002-20250827    gcc-15.1.0
hexagon                          allmodconfig    clang-17
hexagon                          allmodconfig    clang-19
hexagon                           allnoconfig    clang-22
hexagon                          allyesconfig    clang-19
hexagon                          allyesconfig    clang-22
hexagon                             defconfig    clang-19
hexagon               randconfig-001-20250826    clang-19
hexagon               randconfig-001-20250827    gcc-15.1.0
hexagon               randconfig-002-20250826    clang-22
hexagon               randconfig-002-20250827    gcc-15.1.0
i386                             allmodconfig    clang-20
i386                             allmodconfig    gcc-12
i386                              allnoconfig    clang-20
i386                              allnoconfig    gcc-12
i386                             allyesconfig    clang-20
i386                             allyesconfig    gcc-12
i386        buildonly-randconfig-001-20250826    gcc-12
i386        buildonly-randconfig-002-20250826    gcc-12
i386        buildonly-randconfig-003-20250826    clang-20
i386        buildonly-randconfig-004-20250826    gcc-12
i386        buildonly-randconfig-005-20250826    clang-20
i386        buildonly-randconfig-006-20250826    gcc-12
i386                                defconfig    clang-20
i386                  randconfig-001-20250827    clang-20
i386                  randconfig-002-20250827    clang-20
i386                  randconfig-003-20250827    clang-20
i386                  randconfig-004-20250827    clang-20
i386                  randconfig-005-20250827    clang-20
i386                  randconfig-006-20250827    clang-20
i386                  randconfig-007-20250827    clang-20
i386                  randconfig-011-20250827    clang-20
i386                  randconfig-012-20250827    clang-20
i386                  randconfig-013-20250827    clang-20
i386                  randconfig-014-20250827    clang-20
i386                  randconfig-015-20250827    clang-20
i386                  randconfig-016-20250827    clang-20
i386                  randconfig-017-20250827    clang-20
loongarch                        allmodconfig    clang-19
loongarch                         allnoconfig    clang-22
loongarch                           defconfig    clang-19
loongarch             randconfig-001-20250826    gcc-14.3.0
loongarch             randconfig-001-20250827    gcc-15.1.0
loongarch             randconfig-002-20250826    gcc-14.3.0
loongarch             randconfig-002-20250827    gcc-15.1.0
m68k                             allmodconfig    gcc-15.1.0
m68k                              allnoconfig    gcc-15.1.0
m68k                             allyesconfig    gcc-15.1.0
m68k                         amcore_defconfig    gcc-15.1.0
m68k                                defconfig    clang-19
microblaze                       allmodconfig    gcc-15.1.0
microblaze                        allnoconfig    gcc-15.1.0
microblaze                       allyesconfig    gcc-15.1.0
microblaze                          defconfig    gcc-15.1.0
mips                              allnoconfig    gcc-15.1.0
mips                  cavium_octeon_defconfig    gcc-15.1.0
mips                           ip22_defconfig    clang-22
mips                           ip27_defconfig    clang-22
nios2                             allnoconfig    gcc-11.5.0
nios2                             allnoconfig    gcc-15.1.0
nios2                               defconfig    gcc-11.5.0
nios2                 randconfig-001-20250826    gcc-8.5.0
nios2                 randconfig-001-20250827    gcc-15.1.0
nios2                 randconfig-002-20250826    gcc-10.5.0
nios2                 randconfig-002-20250827    gcc-15.1.0
openrisc                          allnoconfig    clang-22
openrisc                          allnoconfig    gcc-15.1.0
openrisc                         allyesconfig    gcc-15.1.0
openrisc                            defconfig    gcc-12
parisc                           allmodconfig    gcc-15.1.0
parisc                            allnoconfig    clang-22
parisc                            allnoconfig    gcc-15.1.0
parisc                           allyesconfig    gcc-15.1.0
parisc                              defconfig    gcc-15.1.0
parisc                randconfig-001-20250826    gcc-8.5.0
parisc                randconfig-001-20250827    gcc-15.1.0
parisc                randconfig-002-20250826    gcc-15.1.0
parisc                randconfig-002-20250827    gcc-15.1.0
parisc64                            defconfig    gcc-15.1.0
powerpc                          allmodconfig    gcc-15.1.0
powerpc                           allnoconfig    clang-22
powerpc                           allnoconfig    gcc-15.1.0
powerpc                          allyesconfig    clang-22
powerpc                          allyesconfig    gcc-15.1.0
powerpc                 canyonlands_defconfig    clang-22
powerpc                    ge_imp3a_defconfig    clang-22
powerpc                  iss476-smp_defconfig    gcc-15.1.0
powerpc                   lite5200b_defconfig    clang-22
powerpc                      pasemi_defconfig    clang-22
powerpc               randconfig-001-20250826    gcc-8.5.0
powerpc               randconfig-001-20250827    gcc-15.1.0
powerpc               randconfig-002-20250826    clang-22
powerpc               randconfig-002-20250827    gcc-15.1.0
powerpc               randconfig-003-20250826    gcc-13.4.0
powerpc               randconfig-003-20250827    gcc-15.1.0
powerpc64             randconfig-001-20250826    gcc-10.5.0
powerpc64             randconfig-001-20250827    gcc-15.1.0
powerpc64             randconfig-002-20250826    gcc-11.5.0
powerpc64             randconfig-002-20250827    gcc-15.1.0
powerpc64             randconfig-003-20250826    gcc-14.3.0
powerpc64             randconfig-003-20250827    gcc-15.1.0
riscv                            allmodconfig    clang-22
riscv                            allmodconfig    gcc-15.1.0
riscv                             allnoconfig    clang-22
riscv                             allnoconfig    gcc-15.1.0
riscv                            allyesconfig    clang-16
riscv                            allyesconfig    gcc-15.1.0
riscv                               defconfig    gcc-12
riscv                 randconfig-001-20250826    gcc-8.5.0
riscv                 randconfig-001-20250827    gcc-11.5.0
riscv                 randconfig-002-20250826    gcc-11.5.0
riscv                 randconfig-002-20250827    gcc-11.5.0
s390                             allmodconfig    clang-18
s390                             allmodconfig    gcc-15.1.0
s390                              allnoconfig    clang-22
s390                             allyesconfig    gcc-15.1.0
s390                                defconfig    gcc-12
s390                  randconfig-001-20250826    clang-22
s390                  randconfig-001-20250827    gcc-11.5.0
s390                  randconfig-002-20250826    clang-18
s390                  randconfig-002-20250827    gcc-11.5.0
sh                               allmodconfig    gcc-15.1.0
sh                                allnoconfig    gcc-15.1.0
sh                               allyesconfig    gcc-15.1.0
sh                                  defconfig    gcc-12
sh                    randconfig-001-20250826    gcc-11.5.0
sh                    randconfig-001-20250827    gcc-11.5.0
sh                    randconfig-002-20250826    gcc-9.5.0
sh                    randconfig-002-20250827    gcc-11.5.0
sh                          rsk7264_defconfig    gcc-15.1.0
sh                          sdk7780_defconfig    gcc-15.1.0
sh                           se7724_defconfig    gcc-15.1.0
sparc                            allmodconfig    gcc-15.1.0
sparc                             allnoconfig    gcc-15.1.0
sparc                               defconfig    gcc-15.1.0
sparc                 randconfig-001-20250826    gcc-13.4.0
sparc                 randconfig-001-20250827    gcc-11.5.0
sparc                 randconfig-002-20250826    gcc-8.5.0
sparc                 randconfig-002-20250827    gcc-11.5.0
sparc64                             defconfig    gcc-12
sparc64               randconfig-001-20250826    gcc-8.5.0
sparc64               randconfig-001-20250827    gcc-11.5.0
sparc64               randconfig-002-20250826    clang-22
sparc64               randconfig-002-20250827    gcc-11.5.0
um                               alldefconfig    clang-22
um                               allmodconfig    clang-19
um                                allnoconfig    clang-22
um                               allyesconfig    clang-19
um                               allyesconfig    gcc-12
um                                  defconfig    gcc-12
um                             i386_defconfig    clang-22
um                             i386_defconfig    gcc-12
um                    randconfig-001-20250826    gcc-12
um                    randconfig-001-20250827    gcc-11.5.0
um                    randconfig-002-20250826    clang-17
um                    randconfig-002-20250827    gcc-11.5.0
um                           x86_64_defconfig    gcc-12
x86_64                            allnoconfig    clang-20
x86_64                           allyesconfig    clang-20
x86_64      buildonly-randconfig-001-20250826    clang-20
x86_64      buildonly-randconfig-001-20250827    clang-20
x86_64      buildonly-randconfig-002-20250826    clang-20
x86_64      buildonly-randconfig-002-20250827    clang-20
x86_64      buildonly-randconfig-003-20250826    gcc-12
x86_64      buildonly-randconfig-003-20250827    clang-20
x86_64      buildonly-randconfig-004-20250826    clang-20
x86_64      buildonly-randconfig-004-20250827    clang-20
x86_64      buildonly-randconfig-005-20250826    gcc-12
x86_64      buildonly-randconfig-005-20250827    clang-20
x86_64      buildonly-randconfig-006-20250826    gcc-12
x86_64      buildonly-randconfig-006-20250827    clang-20
x86_64                              defconfig    clang-20
x86_64                              defconfig    gcc-11
x86_64                                  kexec    clang-20
x86_64                randconfig-001-20250827    clang-20
x86_64                randconfig-002-20250827    clang-20
x86_64                randconfig-003-20250827    clang-20
x86_64                randconfig-004-20250827    clang-20
x86_64                randconfig-005-20250827    clang-20
x86_64                randconfig-006-20250827    clang-20
x86_64                randconfig-007-20250827    clang-20
x86_64                randconfig-008-20250827    clang-20
x86_64                randconfig-071-20250827    clang-20
x86_64                randconfig-072-20250827    clang-20
x86_64                randconfig-073-20250827    clang-20
x86_64                randconfig-074-20250827    clang-20
x86_64                randconfig-075-20250827    clang-20
x86_64                randconfig-076-20250827    clang-20
x86_64                randconfig-077-20250827    clang-20
x86_64                randconfig-078-20250827    clang-20
x86_64                               rhel-9.4    clang-20
x86_64                           rhel-9.4-bpf    gcc-12
x86_64                          rhel-9.4-func    clang-20
x86_64                    rhel-9.4-kselftests    clang-20
x86_64                         rhel-9.4-kunit    gcc-12
x86_64                           rhel-9.4-ltp    gcc-12
x86_64                          rhel-9.4-rust    clang-20
xtensa                            allnoconfig    gcc-15.1.0
xtensa                randconfig-001-20250826    gcc-11.5.0
xtensa                randconfig-001-20250827    gcc-11.5.0
xtensa                randconfig-002-20250826    gcc-8.5.0
xtensa                randconfig-002-20250827    gcc-11.5.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

