Return-Path: <linux-renesas-soc+bounces-11244-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id EFF989EDC62
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 12 Dec 2024 01:14:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0881F18889CC
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 12 Dec 2024 00:14:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EE4BB1C32;
	Thu, 12 Dec 2024 00:14:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RrtGcSGL"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 037D910E4
	for <linux-renesas-soc@vger.kernel.org>; Thu, 12 Dec 2024 00:14:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733962484; cv=none; b=hRgEE5aZbH5OlbkOghS5WFuRN6jrEfgvYtuQPImupHCCbMqmEZf0qQGoeT/SWxNIXBzngnY1EeudmgXrlTqk/udFBvzUZx2DAwEoTKxglkK/I3GTetm+oanm1Pt4r4fkN9XRof+GzZOfVKMDriqX0zyioONmsH1qV2K7fovxmbo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733962484; c=relaxed/simple;
	bh=jy1F1Fki64NNkYqTvqAOBrN1CtnwW2QEodHz2NVaK3k=;
	h=Date:From:To:Cc:Subject:Message-ID; b=Nnx541ycw2nL2TamaNtxu9ttjUzT6P2Lg4ZY6URb+me52HVCkH6rWhw837C/DIU8hZXVSL6AZ7cy78J8Kma0aDeo1OJ6dzIPeTgFi7F9/nIWaVq0pXBLAxpYiokehYJSX+rrOaNU23Skl8JcYz4n2oJM7JzVOvPtk57Cy133DVc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=RrtGcSGL; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1733962483; x=1765498483;
  h=date:from:to:cc:subject:message-id;
  bh=jy1F1Fki64NNkYqTvqAOBrN1CtnwW2QEodHz2NVaK3k=;
  b=RrtGcSGL9PCJ8RufoEQbIMrLPOIXm6PM79igW6PhFkgc0fn0sPeSFnps
   Nmq+OUism0/OTrAK2qFnrigv2VAtmwC1sS1PEPUns3Ku1ibDqdOgfAltd
   79zn7RO3NH11MRRkytIF6ksUxcGZyQhbfyPBLRuq54+EpQkXKaeokjl8j
   /thWegS4jCMEb0TT8Y8mnJP7P88E7dVoeSN76tOVjdHjxR5v4gqNFDQET
   vwfdVCYLe+pTkY+pv6pAyIGaT4LGy4Cfb9Pd91jJYv9522LY1wYHmNbTb
   JANBQlLwKKltMF9Mctw6OkF+mKi/Gn0FWQS+xdwz0Pobu52fx4tMLDuxi
   w==;
X-CSE-ConnectionGUID: Kt0CBwfOSjWkEh6e+IJcXQ==
X-CSE-MsgGUID: eVGFuC+eSamSfNjFLUf86w==
X-IronPort-AV: E=McAfee;i="6700,10204,11283"; a="45039955"
X-IronPort-AV: E=Sophos;i="6.12,227,1728975600"; 
   d="scan'208";a="45039955"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Dec 2024 16:14:42 -0800
X-CSE-ConnectionGUID: CjmW9YgHTNWLNzo2I67Ybg==
X-CSE-MsgGUID: awllWT1zQV6BPZXdCQgJew==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,227,1728975600"; 
   d="scan'208";a="96226844"
Received: from lkp-server01.sh.intel.com (HELO 82a3f569d0cb) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 11 Dec 2024 16:14:42 -0800
Received: from kbuild by 82a3f569d0cb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tLWql-0007FI-14;
	Thu, 12 Dec 2024 00:14:39 +0000
Date: Thu, 12 Dec 2024 08:13:53 +0800
From: kernel test robot <lkp@intel.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: linux-renesas-soc@vger.kernel.org
Subject: [geert-renesas-devel:next] BUILD SUCCESS
 8ee2df3648fb8d179ed84b45562f0880f63a321c
Message-ID: <202412120847.kAqascJE-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git next
branch HEAD: 8ee2df3648fb8d179ed84b45562f0880f63a321c  Merge branches 'renesas-arm-defconfig-for-v6.14' and 'renesas-dts-for-v6.14' into renesas-next

elapsed time: 2134m

configs tested: 247
configs skipped: 13

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-14.2.0
alpha                            allyesconfig    clang-20
alpha                               defconfig    gcc-14.2.0
arc                              allmodconfig    clang-18
arc                               allnoconfig    gcc-14.2.0
arc                              allyesconfig    clang-18
arc                                 defconfig    gcc-14.2.0
arc                   randconfig-001-20241210    gcc-13.2.0
arc                   randconfig-001-20241211    gcc-14.2.0
arc                   randconfig-002-20241210    gcc-13.2.0
arc                   randconfig-002-20241211    gcc-14.2.0
arm                              allmodconfig    clang-18
arm                               allnoconfig    gcc-14.2.0
arm                              allyesconfig    clang-18
arm                                 defconfig    gcc-14.2.0
arm                        keystone_defconfig    gcc-14.2.0
arm                        mvebu_v5_defconfig    clang-20
arm                        neponset_defconfig    gcc-14.2.0
arm                           omap1_defconfig    gcc-14.2.0
arm                            qcom_defconfig    gcc-14.2.0
arm                   randconfig-001-20241210    clang-20
arm                   randconfig-001-20241211    gcc-14.2.0
arm                   randconfig-002-20241210    gcc-14.2.0
arm                   randconfig-002-20241211    gcc-14.2.0
arm                   randconfig-003-20241210    clang-20
arm                   randconfig-003-20241211    gcc-14.2.0
arm                   randconfig-004-20241210    clang-20
arm                   randconfig-004-20241211    gcc-14.2.0
arm                        vexpress_defconfig    gcc-14.2.0
arm64                            alldefconfig    gcc-14.2.0
arm64                            allmodconfig    clang-18
arm64                             allnoconfig    gcc-14.2.0
arm64                               defconfig    gcc-14.2.0
arm64                 randconfig-001-20241210    clang-20
arm64                 randconfig-001-20241211    gcc-14.2.0
arm64                 randconfig-002-20241210    clang-20
arm64                 randconfig-002-20241211    gcc-14.2.0
arm64                 randconfig-003-20241210    clang-20
arm64                 randconfig-003-20241211    gcc-14.2.0
arm64                 randconfig-004-20241210    clang-20
arm64                 randconfig-004-20241211    gcc-14.2.0
csky                              allnoconfig    gcc-14.2.0
csky                                defconfig    gcc-14.2.0
csky                  randconfig-001-20241210    gcc-14.2.0
csky                  randconfig-001-20241211    gcc-14.2.0
csky                  randconfig-002-20241210    gcc-14.2.0
csky                  randconfig-002-20241211    gcc-14.2.0
hexagon                          allmodconfig    clang-20
hexagon                           allnoconfig    gcc-14.2.0
hexagon                             defconfig    gcc-14.2.0
hexagon               randconfig-001-20241210    clang-16
hexagon               randconfig-001-20241211    gcc-14.2.0
hexagon               randconfig-002-20241210    clang-14
hexagon               randconfig-002-20241211    gcc-14.2.0
i386                             allmodconfig    clang-19
i386                              allnoconfig    clang-19
i386                             allyesconfig    clang-19
i386        buildonly-randconfig-001-20241210    gcc-12
i386        buildonly-randconfig-001-20241211    clang-19
i386        buildonly-randconfig-002-20241210    clang-19
i386        buildonly-randconfig-002-20241211    clang-19
i386        buildonly-randconfig-003-20241210    gcc-12
i386        buildonly-randconfig-003-20241211    clang-19
i386        buildonly-randconfig-004-20241210    clang-19
i386        buildonly-randconfig-004-20241211    clang-19
i386        buildonly-randconfig-005-20241210    clang-19
i386        buildonly-randconfig-005-20241211    clang-19
i386        buildonly-randconfig-006-20241210    clang-19
i386        buildonly-randconfig-006-20241211    clang-19
i386                                defconfig    clang-19
i386                  randconfig-001-20241211    gcc-12
i386                  randconfig-002-20241211    gcc-12
i386                  randconfig-003-20241211    gcc-12
i386                  randconfig-004-20241211    gcc-12
i386                  randconfig-005-20241211    gcc-12
i386                  randconfig-006-20241211    gcc-12
i386                  randconfig-007-20241211    gcc-12
i386                  randconfig-011-20241211    gcc-12
i386                  randconfig-012-20241211    gcc-12
i386                  randconfig-013-20241211    gcc-12
i386                  randconfig-014-20241211    gcc-12
i386                  randconfig-015-20241211    gcc-12
i386                  randconfig-016-20241211    gcc-12
i386                  randconfig-017-20241211    gcc-12
loongarch                        allmodconfig    gcc-14.2.0
loongarch                         allnoconfig    gcc-14.2.0
loongarch                           defconfig    gcc-14.2.0
loongarch             randconfig-001-20241210    gcc-14.2.0
loongarch             randconfig-001-20241211    gcc-14.2.0
loongarch             randconfig-002-20241210    gcc-14.2.0
loongarch             randconfig-002-20241211    gcc-14.2.0
m68k                             allmodconfig    gcc-14.2.0
m68k                              allnoconfig    gcc-14.2.0
m68k                             allyesconfig    gcc-14.2.0
m68k                                defconfig    gcc-14.2.0
m68k                          hp300_defconfig    gcc-14.2.0
m68k                        m5272c3_defconfig    gcc-14.2.0
m68k                       m5475evb_defconfig    clang-20
microblaze                       allmodconfig    gcc-14.2.0
microblaze                        allnoconfig    gcc-14.2.0
microblaze                       allyesconfig    gcc-14.2.0
microblaze                          defconfig    gcc-14.2.0
mips                              allnoconfig    gcc-14.2.0
mips                         bigsur_defconfig    gcc-14.2.0
mips                        maltaup_defconfig    gcc-14.2.0
mips                        omega2p_defconfig    gcc-14.2.0
mips                        qi_lb60_defconfig    clang-20
nios2                             allnoconfig    gcc-14.2.0
nios2                               defconfig    gcc-14.2.0
nios2                 randconfig-001-20241210    gcc-14.2.0
nios2                 randconfig-001-20241211    gcc-14.2.0
nios2                 randconfig-002-20241210    gcc-14.2.0
nios2                 randconfig-002-20241211    gcc-14.2.0
openrisc                          allnoconfig    clang-20
openrisc                         allyesconfig    gcc-14.2.0
openrisc                            defconfig    gcc-12
parisc                           allmodconfig    gcc-14.2.0
parisc                            allnoconfig    clang-20
parisc                           allyesconfig    gcc-14.2.0
parisc                              defconfig    gcc-12
parisc                randconfig-001-20241210    gcc-14.2.0
parisc                randconfig-001-20241211    gcc-14.2.0
parisc                randconfig-002-20241210    gcc-14.2.0
parisc                randconfig-002-20241211    gcc-14.2.0
parisc64                            defconfig    gcc-14.2.0
powerpc                          allmodconfig    gcc-14.2.0
powerpc                           allnoconfig    clang-20
powerpc                          allyesconfig    clang-16
powerpc                          allyesconfig    gcc-14.2.0
powerpc                    amigaone_defconfig    gcc-14.2.0
powerpc                       eiger_defconfig    gcc-14.2.0
powerpc                    mvme5100_defconfig    gcc-14.2.0
powerpc               randconfig-001-20241210    clang-20
powerpc               randconfig-001-20241211    gcc-14.2.0
powerpc               randconfig-002-20241210    clang-20
powerpc               randconfig-002-20241211    gcc-14.2.0
powerpc               randconfig-003-20241210    clang-20
powerpc               randconfig-003-20241211    gcc-14.2.0
powerpc                     skiroot_defconfig    clang-20
powerpc                         wii_defconfig    clang-20
powerpc64             randconfig-001-20241210    gcc-14.2.0
powerpc64             randconfig-001-20241211    gcc-14.2.0
powerpc64             randconfig-002-20241210    gcc-14.2.0
powerpc64             randconfig-002-20241211    gcc-14.2.0
powerpc64             randconfig-003-20241210    gcc-14.2.0
powerpc64             randconfig-003-20241211    gcc-14.2.0
riscv                            allmodconfig    clang-20
riscv                            allmodconfig    gcc-14.2.0
riscv                             allnoconfig    clang-20
riscv                            allyesconfig    clang-20
riscv                            allyesconfig    gcc-14.2.0
riscv                               defconfig    gcc-12
riscv                    nommu_virt_defconfig    clang-20
riscv                 randconfig-001-20241210    clang-19
riscv                 randconfig-001-20241211    clang-20
riscv                 randconfig-002-20241210    gcc-14.2.0
riscv                 randconfig-002-20241211    clang-20
s390                             allmodconfig    clang-19
s390                             allmodconfig    gcc-14.2.0
s390                              allnoconfig    clang-20
s390                             allyesconfig    gcc-14.2.0
s390                                defconfig    gcc-12
s390                                defconfig    gcc-14.2.0
s390                  randconfig-001-20241210    gcc-14.2.0
s390                  randconfig-001-20241211    clang-20
s390                  randconfig-002-20241210    gcc-14.2.0
s390                  randconfig-002-20241211    clang-20
sh                               allmodconfig    gcc-14.2.0
sh                                allnoconfig    gcc-14.2.0
sh                               allyesconfig    gcc-14.2.0
sh                                  defconfig    gcc-12
sh                             espt_defconfig    clang-20
sh                     magicpanelr2_defconfig    gcc-14.2.0
sh                    randconfig-001-20241210    gcc-14.2.0
sh                    randconfig-001-20241211    clang-20
sh                    randconfig-002-20241210    gcc-14.2.0
sh                    randconfig-002-20241211    clang-20
sh                          rsk7203_defconfig    gcc-14.2.0
sh                           se7721_defconfig    gcc-14.2.0
sh                           se7724_defconfig    gcc-14.2.0
sh                   sh7770_generic_defconfig    clang-20
sparc                            alldefconfig    gcc-14.2.0
sparc                            allmodconfig    gcc-14.2.0
sparc                             allnoconfig    gcc-14.2.0
sparc                 randconfig-001-20241210    gcc-14.2.0
sparc                 randconfig-001-20241211    clang-20
sparc                 randconfig-002-20241210    gcc-14.2.0
sparc                 randconfig-002-20241211    clang-20
sparc64                             defconfig    gcc-12
sparc64               randconfig-001-20241210    gcc-14.2.0
sparc64               randconfig-001-20241211    clang-20
sparc64               randconfig-002-20241210    gcc-14.2.0
sparc64               randconfig-002-20241211    clang-20
um                               allmodconfig    clang-20
um                                allnoconfig    clang-20
um                               allyesconfig    clang-20
um                                  defconfig    gcc-12
um                             i386_defconfig    gcc-12
um                    randconfig-001-20241210    clang-20
um                    randconfig-001-20241211    clang-20
um                    randconfig-002-20241210    gcc-12
um                    randconfig-002-20241211    clang-20
um                           x86_64_defconfig    gcc-12
x86_64                            allnoconfig    clang-19
x86_64                           allyesconfig    clang-19
x86_64      buildonly-randconfig-001-20241210    gcc-12
x86_64      buildonly-randconfig-001-20241211    gcc-12
x86_64      buildonly-randconfig-002-20241210    clang-19
x86_64      buildonly-randconfig-002-20241211    gcc-12
x86_64      buildonly-randconfig-003-20241210    clang-19
x86_64      buildonly-randconfig-003-20241211    gcc-12
x86_64      buildonly-randconfig-004-20241210    gcc-12
x86_64      buildonly-randconfig-004-20241211    gcc-12
x86_64      buildonly-randconfig-005-20241210    gcc-12
x86_64      buildonly-randconfig-005-20241211    gcc-12
x86_64      buildonly-randconfig-006-20241210    clang-19
x86_64      buildonly-randconfig-006-20241211    gcc-12
x86_64                              defconfig    clang-19
x86_64                                  kexec    clang-19
x86_64                randconfig-001-20241211    clang-19
x86_64                randconfig-002-20241211    clang-19
x86_64                randconfig-003-20241211    clang-19
x86_64                randconfig-004-20241211    clang-19
x86_64                randconfig-005-20241211    clang-19
x86_64                randconfig-006-20241211    clang-19
x86_64                randconfig-007-20241211    clang-19
x86_64                randconfig-008-20241211    clang-19
x86_64                randconfig-071-20241211    clang-19
x86_64                randconfig-072-20241211    clang-19
x86_64                randconfig-073-20241211    clang-19
x86_64                randconfig-074-20241211    clang-19
x86_64                randconfig-075-20241211    clang-19
x86_64                randconfig-076-20241211    clang-19
x86_64                randconfig-077-20241211    clang-19
x86_64                randconfig-078-20241211    clang-19
x86_64                               rhel-9.4    clang-19
x86_64                           rhel-9.4-bpf    clang-19
x86_64                         rhel-9.4-kunit    clang-19
x86_64                           rhel-9.4-ltp    clang-19
x86_64                          rhel-9.4-rust    clang-19
xtensa                            allnoconfig    gcc-14.2.0
xtensa                generic_kc705_defconfig    gcc-14.2.0
xtensa                randconfig-001-20241210    gcc-14.2.0
xtensa                randconfig-001-20241211    clang-20
xtensa                randconfig-002-20241210    gcc-14.2.0
xtensa                randconfig-002-20241211    clang-20
xtensa                         virt_defconfig    gcc-14.2.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

