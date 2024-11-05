Return-Path: <linux-renesas-soc+bounces-10293-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id A5C6B9BC4E4
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  5 Nov 2024 06:48:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2BFAC1F22ADE
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  5 Nov 2024 05:48:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 37B681C1AD8;
	Tue,  5 Nov 2024 05:48:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ACfKpxKk"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5027D1C231D
	for <linux-renesas-soc@vger.kernel.org>; Tue,  5 Nov 2024 05:48:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730785699; cv=none; b=ahxH/FUM4nLanm2/pShki0+sT8lDC9K/Q6DVPXNxSZvwdyeZNxy7uvgZUKFT5VWALW/al2AWwphOFROXBxpTAOi/PFuwVDR1kwZ4stxbuuZQIkEPFckVQd0qmeSRlM7B7y9Vh3UncPVFDY/k0xakeCol4dvE2cYOcILr86jqIjA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730785699; c=relaxed/simple;
	bh=oMMEXloLRZtQ+C54ZsgSR7OqWxAqaiQq89yyOcX4ZaE=;
	h=Date:From:To:Cc:Subject:Message-ID; b=H+DpVXjUOSgUg+QzA71vo0WSkYXO+WOzLiNeNPwHVEDJRvNfEnjBz9WhyzjT9QjL9yPWTjYGfGUi0Z9vMxLmD1WtgzrOxo0Gv7wB/F6S+8XLW7WPATvRN8k8bqUNEUjeEphCHdeaPOwwsU9d2DKgLa9gJO9AJt0tQ2vsNR2TQ9s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ACfKpxKk; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730785696; x=1762321696;
  h=date:from:to:cc:subject:message-id;
  bh=oMMEXloLRZtQ+C54ZsgSR7OqWxAqaiQq89yyOcX4ZaE=;
  b=ACfKpxKk1U8M8cHXgdMywahn4Oqns764uQXIIHl705eJKra+ELm2LvL/
   r211WWbHJkNr66cLMmZ6B+QwdqmQtDDv6IRdwNBivp3Xp/FWrelZdjDsM
   Av09Djz3JVygBAwfc56OB0fuRqQrgz/UDi6Aozifr7IlJo4uK6gaNTxB0
   Qh17vrLz2nXLopzZwWw+q0GCnM37VYdcwwiMQlS/Immua8stO9I46nfGZ
   9+2A+lG+ZfmmRQxI1Nt15GfnioIXBj00SaJcj2EJ+ypsTgrjnO84Rek3Y
   YbNqPEPxVrPDed/mU3M7McA9d91zt7mDP73QXTIS8TpL5o6RcS6HqUVLh
   w==;
X-CSE-ConnectionGUID: mfN5XMrFRvKN2y+zbHzSYg==
X-CSE-MsgGUID: aw5TH6byRH+OiBr4pMiRPw==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="53078369"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="53078369"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Nov 2024 21:48:14 -0800
X-CSE-ConnectionGUID: yLwwABiNRgub3NvuVz1fCA==
X-CSE-MsgGUID: MS708/W7Tfusj2VZAhRmfg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,259,1725346800"; 
   d="scan'208";a="84699075"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 04 Nov 2024 21:48:08 -0800
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t8CQA-000lgH-07;
	Tue, 05 Nov 2024 05:48:06 +0000
Date: Tue, 05 Nov 2024 13:47:24 +0800
From: kernel test robot <lkp@intel.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: linux-renesas-soc@vger.kernel.org
Subject: [geert-renesas-devel:master] BUILD SUCCESS
 27f400806fc5ab96d9293d245d821fb0ba4ee6a3
Message-ID: <202411051315.0o8ODsxQ-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git master
branch HEAD: 27f400806fc5ab96d9293d245d821fb0ba4ee6a3  Merge tag 'v6.12-rc6' into renesas-devel

elapsed time: 1204m

configs tested: 265
configs skipped: 6

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-14.1.0
alpha                            allyesconfig    clang-20
alpha                            allyesconfig    gcc-13.3.0
alpha                               defconfig    gcc-14.1.0
arc                              allmodconfig    clang-20
arc                              allmodconfig    gcc-13.2.0
arc                               allnoconfig    gcc-14.1.0
arc                              allyesconfig    clang-20
arc                              allyesconfig    gcc-13.2.0
arc                                 defconfig    gcc-14.1.0
arc                   randconfig-001-20241105    gcc-14.1.0
arc                   randconfig-002-20241105    gcc-14.1.0
arm                              allmodconfig    clang-20
arm                              allmodconfig    gcc-14.1.0
arm                               allnoconfig    gcc-14.1.0
arm                              allyesconfig    clang-20
arm                              allyesconfig    gcc-14.1.0
arm                       aspeed_g5_defconfig    clang-20
arm                                 defconfig    gcc-14.1.0
arm                      footbridge_defconfig    gcc-14.1.0
arm                           imxrt_defconfig    clang-20
arm                           imxrt_defconfig    gcc-14.1.0
arm                          ixp4xx_defconfig    gcc-14.1.0
arm                        keystone_defconfig    gcc-14.1.0
arm                            mps2_defconfig    clang-20
arm                   randconfig-001-20241105    gcc-14.1.0
arm                   randconfig-002-20241105    gcc-14.1.0
arm                   randconfig-003-20241105    gcc-14.1.0
arm                   randconfig-004-20241105    gcc-14.1.0
arm                           sama7_defconfig    clang-20
arm                        shmobile_defconfig    gcc-14.1.0
arm                         wpcm450_defconfig    gcc-14.1.0
arm64                            allmodconfig    clang-20
arm64                             allnoconfig    gcc-14.1.0
arm64                               defconfig    gcc-14.1.0
arm64                 randconfig-001-20241105    gcc-14.1.0
arm64                 randconfig-002-20241105    gcc-14.1.0
arm64                 randconfig-003-20241105    gcc-14.1.0
arm64                 randconfig-004-20241105    gcc-14.1.0
csky                              allnoconfig    gcc-14.1.0
csky                                defconfig    gcc-14.1.0
csky                  randconfig-001-20241105    gcc-14.1.0
csky                  randconfig-002-20241105    gcc-14.1.0
hexagon                          allmodconfig    clang-20
hexagon                           allnoconfig    gcc-14.1.0
hexagon                          allyesconfig    clang-20
hexagon                             defconfig    gcc-14.1.0
hexagon               randconfig-001-20241105    gcc-14.1.0
hexagon               randconfig-002-20241105    gcc-14.1.0
i386                             allmodconfig    clang-19
i386                             allmodconfig    gcc-12
i386                              allnoconfig    clang-19
i386                              allnoconfig    gcc-12
i386                             allyesconfig    clang-19
i386                             allyesconfig    gcc-12
i386        buildonly-randconfig-001-20241104    clang-19
i386        buildonly-randconfig-001-20241105    clang-19
i386        buildonly-randconfig-002-20241104    gcc-12
i386        buildonly-randconfig-002-20241105    clang-19
i386        buildonly-randconfig-003-20241104    clang-19
i386        buildonly-randconfig-003-20241105    clang-19
i386        buildonly-randconfig-004-20241104    gcc-12
i386        buildonly-randconfig-004-20241105    clang-19
i386        buildonly-randconfig-005-20241104    clang-19
i386        buildonly-randconfig-005-20241105    clang-19
i386        buildonly-randconfig-006-20241104    gcc-12
i386        buildonly-randconfig-006-20241105    clang-19
i386                                defconfig    clang-19
i386                  randconfig-001-20241104    gcc-12
i386                  randconfig-001-20241105    clang-19
i386                  randconfig-002-20241104    clang-19
i386                  randconfig-002-20241105    clang-19
i386                  randconfig-003-20241104    gcc-12
i386                  randconfig-003-20241105    clang-19
i386                  randconfig-004-20241104    clang-19
i386                  randconfig-004-20241105    clang-19
i386                  randconfig-005-20241104    clang-19
i386                  randconfig-005-20241105    clang-19
i386                  randconfig-006-20241104    clang-19
i386                  randconfig-006-20241105    clang-19
i386                  randconfig-011-20241104    gcc-12
i386                  randconfig-011-20241105    clang-19
i386                  randconfig-012-20241104    gcc-12
i386                  randconfig-012-20241105    clang-19
i386                  randconfig-013-20241104    clang-19
i386                  randconfig-013-20241105    clang-19
i386                  randconfig-014-20241104    gcc-12
i386                  randconfig-014-20241105    clang-19
i386                  randconfig-015-20241104    gcc-12
i386                  randconfig-015-20241105    clang-19
i386                  randconfig-016-20241104    gcc-12
i386                  randconfig-016-20241105    clang-19
loongarch                        allmodconfig    gcc-14.1.0
loongarch                         allnoconfig    gcc-14.1.0
loongarch                           defconfig    gcc-14.1.0
loongarch             randconfig-001-20241105    gcc-14.1.0
loongarch             randconfig-002-20241105    gcc-14.1.0
m68k                             allmodconfig    gcc-14.1.0
m68k                              allnoconfig    gcc-14.1.0
m68k                             allyesconfig    gcc-14.1.0
m68k                         apollo_defconfig    gcc-14.1.0
m68k                                defconfig    gcc-14.1.0
m68k                          hp300_defconfig    clang-20
m68k                          sun3x_defconfig    gcc-14.1.0
m68k                           virt_defconfig    gcc-14.1.0
microblaze                       allmodconfig    gcc-14.1.0
microblaze                        allnoconfig    gcc-14.1.0
microblaze                       allyesconfig    gcc-14.1.0
microblaze                          defconfig    gcc-14.1.0
mips                              allnoconfig    gcc-14.1.0
mips                          ath79_defconfig    gcc-14.1.0
mips                  cavium_octeon_defconfig    clang-20
mips                           ip27_defconfig    gcc-14.1.0
mips                           jazz_defconfig    clang-20
mips                     loongson1b_defconfig    gcc-14.1.0
mips                       rbtx49xx_defconfig    gcc-14.1.0
nios2                             allnoconfig    gcc-14.1.0
nios2                               defconfig    gcc-14.1.0
nios2                 randconfig-001-20241105    gcc-14.1.0
nios2                 randconfig-002-20241105    gcc-14.1.0
openrisc                          allnoconfig    clang-20
openrisc                          allnoconfig    gcc-14.1.0
openrisc                         allyesconfig    gcc-14.1.0
openrisc                            defconfig    gcc-12
parisc                           allmodconfig    gcc-14.1.0
parisc                            allnoconfig    clang-20
parisc                            allnoconfig    gcc-14.1.0
parisc                           allyesconfig    gcc-14.1.0
parisc                              defconfig    gcc-12
parisc                randconfig-001-20241105    gcc-14.1.0
parisc                randconfig-002-20241105    gcc-14.1.0
parisc64                         alldefconfig    clang-20
parisc64                            defconfig    gcc-14.1.0
powerpc                          allmodconfig    gcc-14.1.0
powerpc                           allnoconfig    clang-20
powerpc                           allnoconfig    gcc-14.1.0
powerpc                          allyesconfig    clang-20
powerpc                          allyesconfig    gcc-14.1.0
powerpc                      arches_defconfig    gcc-14.1.0
powerpc                 canyonlands_defconfig    clang-20
powerpc                        cell_defconfig    clang-20
powerpc                    ge_imp3a_defconfig    gcc-14.1.0
powerpc                     ksi8560_defconfig    clang-20
powerpc                      mgcoge_defconfig    gcc-14.1.0
powerpc                     mpc512x_defconfig    gcc-14.1.0
powerpc                     ppa8548_defconfig    gcc-14.1.0
powerpc               randconfig-001-20241105    gcc-14.1.0
powerpc               randconfig-002-20241105    gcc-14.1.0
powerpc               randconfig-003-20241105    gcc-14.1.0
powerpc                  storcenter_defconfig    gcc-14.1.0
powerpc                     taishan_defconfig    gcc-14.1.0
powerpc64             randconfig-001-20241105    gcc-14.1.0
powerpc64             randconfig-002-20241105    gcc-14.1.0
powerpc64             randconfig-003-20241105    gcc-14.1.0
riscv                            allmodconfig    clang-20
riscv                            allmodconfig    gcc-14.1.0
riscv                             allnoconfig    clang-20
riscv                             allnoconfig    gcc-14.1.0
riscv                            allyesconfig    clang-20
riscv                            allyesconfig    gcc-14.1.0
riscv                               defconfig    gcc-12
riscv                 randconfig-001-20241105    gcc-14.1.0
riscv                 randconfig-002-20241105    gcc-14.1.0
s390                             allmodconfig    clang-20
s390                             allmodconfig    gcc-14.1.0
s390                              allnoconfig    clang-20
s390                             allyesconfig    gcc-14.1.0
s390                                defconfig    gcc-12
s390                  randconfig-001-20241105    gcc-14.1.0
s390                  randconfig-002-20241105    gcc-14.1.0
sh                               allmodconfig    gcc-14.1.0
sh                                allnoconfig    gcc-14.1.0
sh                               allyesconfig    gcc-14.1.0
sh                         apsh4a3a_defconfig    gcc-14.1.0
sh                                  defconfig    gcc-12
sh                ecovec24-romimage_defconfig    gcc-14.1.0
sh                             espt_defconfig    gcc-14.1.0
sh                          lboxre2_defconfig    gcc-14.1.0
sh                     magicpanelr2_defconfig    gcc-14.1.0
sh                          r7780mp_defconfig    gcc-14.1.0
sh                    randconfig-001-20241105    gcc-14.1.0
sh                    randconfig-002-20241105    gcc-14.1.0
sh                           se7206_defconfig    clang-20
sh                           se7712_defconfig    gcc-14.1.0
sh                           se7722_defconfig    clang-20
sh                           se7722_defconfig    gcc-14.1.0
sh                   sh7724_generic_defconfig    clang-20
sh                              ul2_defconfig    clang-20
sparc                            allmodconfig    gcc-14.1.0
sparc64                             defconfig    gcc-12
sparc64               randconfig-001-20241105    gcc-14.1.0
sparc64               randconfig-002-20241105    gcc-14.1.0
um                               allmodconfig    clang-20
um                                allnoconfig    clang-17
um                                allnoconfig    clang-20
um                               allyesconfig    clang-20
um                               allyesconfig    gcc-12
um                                  defconfig    gcc-12
um                             i386_defconfig    gcc-12
um                             i386_defconfig    gcc-14.1.0
um                    randconfig-001-20241105    gcc-14.1.0
um                    randconfig-002-20241105    gcc-14.1.0
um                           x86_64_defconfig    gcc-12
x86_64                            allnoconfig    clang-19
x86_64                           allyesconfig    clang-19
x86_64      buildonly-randconfig-001-20241104    gcc-12
x86_64      buildonly-randconfig-001-20241105    gcc-12
x86_64      buildonly-randconfig-002-20241104    gcc-12
x86_64      buildonly-randconfig-002-20241105    gcc-12
x86_64      buildonly-randconfig-003-20241104    gcc-12
x86_64      buildonly-randconfig-003-20241105    gcc-12
x86_64      buildonly-randconfig-004-20241104    gcc-12
x86_64      buildonly-randconfig-004-20241105    gcc-12
x86_64      buildonly-randconfig-005-20241104    gcc-12
x86_64      buildonly-randconfig-005-20241105    gcc-12
x86_64      buildonly-randconfig-006-20241104    gcc-12
x86_64      buildonly-randconfig-006-20241105    gcc-12
x86_64                              defconfig    clang-19
x86_64                              defconfig    gcc-11
x86_64                                  kexec    clang-19
x86_64                                  kexec    gcc-12
x86_64                randconfig-001-20241104    gcc-12
x86_64                randconfig-001-20241105    gcc-12
x86_64                randconfig-002-20241104    gcc-12
x86_64                randconfig-002-20241105    gcc-12
x86_64                randconfig-003-20241104    gcc-12
x86_64                randconfig-003-20241105    gcc-12
x86_64                randconfig-004-20241104    gcc-12
x86_64                randconfig-004-20241105    gcc-12
x86_64                randconfig-005-20241104    gcc-12
x86_64                randconfig-005-20241105    gcc-12
x86_64                randconfig-006-20241104    gcc-12
x86_64                randconfig-006-20241105    gcc-12
x86_64                randconfig-011-20241104    gcc-12
x86_64                randconfig-011-20241105    gcc-12
x86_64                randconfig-012-20241104    gcc-12
x86_64                randconfig-012-20241105    gcc-12
x86_64                randconfig-013-20241104    gcc-12
x86_64                randconfig-013-20241105    gcc-12
x86_64                randconfig-014-20241104    gcc-12
x86_64                randconfig-014-20241105    gcc-12
x86_64                randconfig-015-20241104    gcc-12
x86_64                randconfig-015-20241105    gcc-12
x86_64                randconfig-016-20241104    gcc-12
x86_64                randconfig-016-20241105    gcc-12
x86_64                randconfig-071-20241104    gcc-12
x86_64                randconfig-071-20241105    gcc-12
x86_64                randconfig-072-20241104    gcc-12
x86_64                randconfig-072-20241105    gcc-12
x86_64                randconfig-073-20241104    gcc-12
x86_64                randconfig-073-20241105    gcc-12
x86_64                randconfig-074-20241104    gcc-12
x86_64                randconfig-074-20241105    gcc-12
x86_64                randconfig-075-20241104    gcc-12
x86_64                randconfig-075-20241105    gcc-12
x86_64                randconfig-076-20241104    gcc-12
x86_64                randconfig-076-20241105    gcc-12
x86_64                               rhel-8.3    gcc-12
x86_64                           rhel-8.3-bpf    clang-19
x86_64                         rhel-8.3-kunit    clang-19
x86_64                           rhel-8.3-ltp    clang-19
x86_64                          rhel-8.3-rust    clang-19
xtensa                            allnoconfig    gcc-14.1.0
xtensa                randconfig-001-20241105    gcc-14.1.0
xtensa                randconfig-002-20241105    gcc-14.1.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

