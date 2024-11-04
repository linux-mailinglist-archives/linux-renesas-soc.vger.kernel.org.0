Return-Path: <linux-renesas-soc+bounces-10265-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B7459BAA8B
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  4 Nov 2024 02:49:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 555921C209AA
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  4 Nov 2024 01:49:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 39F81249E5;
	Mon,  4 Nov 2024 01:49:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XViQL04Z"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C89183214
	for <linux-renesas-soc@vger.kernel.org>; Mon,  4 Nov 2024 01:49:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730684975; cv=none; b=H+cxzk+AsRNXM4lC7bN37qGRcXkV0Ggd9/17VTXpUIYiVYRMzj1rgzVJECAKjorts2pBoJnvVQIYS2fR4xXximpUT37fXKI94zJmgGzd4E3D9mjIyIJWqbPpvWpTU7p0yQdTCvG5HXKkLZF9NiQRvt2vSyCXjiOxhkOkU8L/bW8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730684975; c=relaxed/simple;
	bh=SBbv9lnP6CkYGIovSKul0qoTMjmULk/zjpS6WHmwQxY=;
	h=Date:From:To:Cc:Subject:Message-ID; b=BJEyCwEgMcR3DtmasQuQjE4WqtvVs1xtOoaBn2iKqvzim48/aQXauJ7I3SSWG9Z+LqzT1TXgPAm4+Y7ebLSec90usuD8MojVLeNSiLJZwbzl2cpfme/yBPWqSXZ6Fj2bU3RKSCM0BkjsGd/ThZFGvHjV55gPCz5Kg8vOG0Rsv4I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XViQL04Z; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730684973; x=1762220973;
  h=date:from:to:cc:subject:message-id;
  bh=SBbv9lnP6CkYGIovSKul0qoTMjmULk/zjpS6WHmwQxY=;
  b=XViQL04Z3G0ZP3SdE4Ty1NcQwY7Oia/oo0HFe79jgADxSQ6sOaWLvrYj
   6UYb6GhmzUZ1Td7JhVR+RazFweYQDafJGCpDFF2OjnZ3SkuPZRnhnA7u0
   4r+iijvDAD/ykk/jmEL+AKBfavbGf8VHKFBCg3yaO6b6GC4efD2ZjxY7G
   R3ojSxlFfPGt3b6zVYAA1+SJCCEhvK0iyK2Vs/1FVswBOMkKrLkt09nLK
   s3eT0SV7KUPWr8ebcnEZPYuAXOd7T+CjJk2dfYcg/E1iNJgoyJBxfK9ki
   yBhDMcBU/QJuk1dDmeZpIKFl48pRtXvMZTIhg+0mi4VGuJ1a1eLj6u4vs
   w==;
X-CSE-ConnectionGUID: LD97FlsBSKmMlLG0/5CH/w==
X-CSE-MsgGUID: JR2+l6HKToufLVDUODDl1Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11245"; a="30244504"
X-IronPort-AV: E=Sophos;i="6.11,256,1725346800"; 
   d="scan'208";a="30244504"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Nov 2024 17:49:32 -0800
X-CSE-ConnectionGUID: gzRNG7QeS3eo5+bshgvOsg==
X-CSE-MsgGUID: Y8Tv6x0gQAK+2uCiTmNQug==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,256,1725346800"; 
   d="scan'208";a="83391841"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 03 Nov 2024 17:49:31 -0800
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t7mDg-000kMb-2b;
	Mon, 04 Nov 2024 01:49:28 +0000
Date: Mon, 04 Nov 2024 09:48:48 +0800
From: kernel test robot <lkp@intel.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: linux-renesas-soc@vger.kernel.org
Subject: [geert-renesas-drivers:renesas-clk] BUILD SUCCESS
 be20a73e03e19005cfa5c1c4d6158af1ba02f056
Message-ID: <202411040941.cpN1AdC6-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git renesas-clk
branch HEAD: be20a73e03e19005cfa5c1c4d6158af1ba02f056  clk: renesas: vbattb: Add VBATTB clock driver

elapsed time: 784m

configs tested: 212
configs skipped: 6

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-14.1.0
alpha                            allyesconfig    clang-20
alpha                               defconfig    gcc-14.1.0
arc                              allmodconfig    clang-20
arc                               allnoconfig    gcc-14.1.0
arc                              allyesconfig    clang-20
arc                                 defconfig    gcc-14.1.0
arc                   randconfig-001-20241104    gcc-14.1.0
arc                   randconfig-002-20241104    gcc-14.1.0
arm                              allmodconfig    clang-20
arm                               allnoconfig    gcc-14.1.0
arm                              allyesconfig    clang-20
arm                                 defconfig    gcc-14.1.0
arm                       netwinder_defconfig    gcc-14.1.0
arm                   randconfig-001-20241104    gcc-14.1.0
arm                   randconfig-002-20241104    gcc-14.1.0
arm                   randconfig-003-20241104    gcc-14.1.0
arm                   randconfig-004-20241104    gcc-14.1.0
arm                           spitz_defconfig    gcc-14.1.0
arm64                            allmodconfig    clang-20
arm64                             allnoconfig    gcc-14.1.0
arm64                               defconfig    gcc-14.1.0
arm64                 randconfig-001-20241104    gcc-14.1.0
arm64                 randconfig-002-20241104    gcc-14.1.0
arm64                 randconfig-003-20241104    gcc-14.1.0
arm64                 randconfig-004-20241104    gcc-14.1.0
csky                              allnoconfig    gcc-14.1.0
csky                                defconfig    gcc-14.1.0
csky                  randconfig-001-20241104    gcc-14.1.0
csky                  randconfig-002-20241104    gcc-14.1.0
hexagon                          allmodconfig    clang-20
hexagon                           allnoconfig    gcc-14.1.0
hexagon                          allyesconfig    clang-20
hexagon                             defconfig    gcc-14.1.0
hexagon               randconfig-001-20241104    gcc-14.1.0
hexagon               randconfig-002-20241104    gcc-14.1.0
i386                             allmodconfig    clang-19
i386                             allmodconfig    gcc-12
i386                              allnoconfig    clang-19
i386                              allnoconfig    gcc-12
i386                             allyesconfig    clang-19
i386                             allyesconfig    gcc-12
i386        buildonly-randconfig-001-20241104    gcc-12
i386        buildonly-randconfig-002-20241104    gcc-12
i386        buildonly-randconfig-003-20241104    gcc-12
i386        buildonly-randconfig-004-20241104    gcc-12
i386        buildonly-randconfig-005-20241104    gcc-12
i386        buildonly-randconfig-006-20241104    gcc-12
i386                                defconfig    clang-19
i386                  randconfig-001-20241104    gcc-12
i386                  randconfig-002-20241104    gcc-12
i386                  randconfig-003-20241104    gcc-12
i386                  randconfig-004-20241104    gcc-12
i386                  randconfig-005-20241104    gcc-12
i386                  randconfig-006-20241104    gcc-12
i386                  randconfig-011-20241104    gcc-12
i386                  randconfig-012-20241104    gcc-12
i386                  randconfig-013-20241104    gcc-12
i386                  randconfig-014-20241104    gcc-12
i386                  randconfig-015-20241104    gcc-12
i386                  randconfig-016-20241104    gcc-12
loongarch                        allmodconfig    gcc-14.1.0
loongarch                         allnoconfig    gcc-14.1.0
loongarch                           defconfig    gcc-14.1.0
loongarch             randconfig-001-20241104    gcc-14.1.0
loongarch             randconfig-002-20241104    gcc-14.1.0
m68k                             allmodconfig    gcc-14.1.0
m68k                              allnoconfig    gcc-14.1.0
m68k                             allyesconfig    gcc-14.1.0
m68k                         apollo_defconfig    gcc-14.1.0
m68k                                defconfig    gcc-14.1.0
m68k                        m5307c3_defconfig    gcc-14.1.0
m68k                            q40_defconfig    gcc-14.1.0
m68k                           virt_defconfig    gcc-14.1.0
microblaze                       allmodconfig    gcc-14.1.0
microblaze                        allnoconfig    gcc-14.1.0
microblaze                       allyesconfig    gcc-14.1.0
microblaze                          defconfig    gcc-14.1.0
mips                              allnoconfig    gcc-14.1.0
mips                          eyeq5_defconfig    gcc-14.1.0
mips                           ip28_defconfig    gcc-14.1.0
mips                        maltaup_defconfig    gcc-14.1.0
mips                       rbtx49xx_defconfig    gcc-14.1.0
nios2                             allnoconfig    gcc-14.1.0
nios2                               defconfig    gcc-14.1.0
nios2                 randconfig-001-20241104    gcc-14.1.0
nios2                 randconfig-002-20241104    gcc-14.1.0
openrisc                          allnoconfig    clang-20
openrisc                          allnoconfig    gcc-14.1.0
openrisc                         allyesconfig    gcc-14.1.0
openrisc                            defconfig    gcc-12
openrisc                  or1klitex_defconfig    gcc-14.1.0
openrisc                    or1ksim_defconfig    gcc-14.1.0
parisc                           allmodconfig    gcc-14.1.0
parisc                            allnoconfig    clang-20
parisc                            allnoconfig    gcc-14.1.0
parisc                           allyesconfig    gcc-14.1.0
parisc                              defconfig    gcc-12
parisc                randconfig-001-20241104    gcc-14.1.0
parisc                randconfig-002-20241104    gcc-14.1.0
parisc64                            defconfig    gcc-14.1.0
powerpc                    adder875_defconfig    gcc-14.1.0
powerpc                          allmodconfig    gcc-14.1.0
powerpc                           allnoconfig    clang-20
powerpc                           allnoconfig    gcc-14.1.0
powerpc                          allyesconfig    gcc-14.1.0
powerpc                    amigaone_defconfig    gcc-14.1.0
powerpc                      arches_defconfig    gcc-14.1.0
powerpc                      ep88xc_defconfig    gcc-14.1.0
powerpc                        fsp2_defconfig    gcc-14.1.0
powerpc                          g5_defconfig    gcc-14.1.0
powerpc                    ge_imp3a_defconfig    gcc-14.1.0
powerpc                        icon_defconfig    gcc-14.1.0
powerpc                 linkstation_defconfig    gcc-14.1.0
powerpc                 mpc832x_rdb_defconfig    gcc-14.1.0
powerpc                  mpc866_ads_defconfig    gcc-14.1.0
powerpc                      ppc64e_defconfig    gcc-14.1.0
powerpc                     rainier_defconfig    gcc-14.1.0
powerpc               randconfig-001-20241104    gcc-14.1.0
powerpc               randconfig-002-20241104    gcc-14.1.0
powerpc               randconfig-003-20241104    gcc-14.1.0
powerpc                     taishan_defconfig    gcc-14.1.0
powerpc                     tqm8541_defconfig    gcc-14.1.0
powerpc                     tqm8555_defconfig    gcc-14.1.0
powerpc                         wii_defconfig    gcc-14.1.0
powerpc64             randconfig-001-20241104    gcc-14.1.0
powerpc64             randconfig-002-20241104    gcc-14.1.0
powerpc64             randconfig-003-20241104    gcc-14.1.0
riscv                            allmodconfig    gcc-14.1.0
riscv                             allnoconfig    clang-20
riscv                             allnoconfig    gcc-14.1.0
riscv                            allyesconfig    gcc-14.1.0
riscv                               defconfig    gcc-12
riscv                 randconfig-001-20241104    gcc-14.1.0
riscv                 randconfig-002-20241104    gcc-14.1.0
s390                             allmodconfig    gcc-14.1.0
s390                              allnoconfig    clang-20
s390                             allyesconfig    gcc-14.1.0
s390                                defconfig    gcc-12
s390                  randconfig-001-20241104    gcc-14.1.0
s390                  randconfig-002-20241104    gcc-14.1.0
sh                               allmodconfig    gcc-14.1.0
sh                                allnoconfig    gcc-14.1.0
sh                               allyesconfig    gcc-14.1.0
sh                                  defconfig    gcc-12
sh                ecovec24-romimage_defconfig    gcc-14.1.0
sh                        edosk7760_defconfig    gcc-14.1.0
sh                          landisk_defconfig    gcc-14.1.0
sh                          r7785rp_defconfig    gcc-14.1.0
sh                    randconfig-001-20241104    gcc-14.1.0
sh                    randconfig-002-20241104    gcc-14.1.0
sh                          rsk7201_defconfig    gcc-14.1.0
sh                          rsk7269_defconfig    gcc-14.1.0
sh                           se7750_defconfig    gcc-14.1.0
sh                   sh7724_generic_defconfig    gcc-14.1.0
sh                            shmin_defconfig    gcc-14.1.0
sh                              ul2_defconfig    gcc-14.1.0
sparc                            allmodconfig    gcc-14.1.0
sparc64                          alldefconfig    gcc-14.1.0
sparc64                             defconfig    gcc-12
sparc64               randconfig-001-20241104    gcc-14.1.0
sparc64               randconfig-002-20241104    gcc-14.1.0
um                               allmodconfig    clang-20
um                                allnoconfig    clang-17
um                                allnoconfig    clang-20
um                               allyesconfig    clang-20
um                                  defconfig    gcc-12
um                             i386_defconfig    gcc-12
um                    randconfig-001-20241104    gcc-14.1.0
um                    randconfig-002-20241104    gcc-14.1.0
um                           x86_64_defconfig    gcc-12
um                           x86_64_defconfig    gcc-14.1.0
x86_64                            allnoconfig    clang-19
x86_64                           allyesconfig    clang-19
x86_64      buildonly-randconfig-001-20241104    gcc-12
x86_64      buildonly-randconfig-002-20241104    gcc-12
x86_64      buildonly-randconfig-003-20241104    gcc-12
x86_64      buildonly-randconfig-004-20241104    gcc-12
x86_64      buildonly-randconfig-005-20241104    gcc-12
x86_64      buildonly-randconfig-006-20241104    gcc-12
x86_64                              defconfig    clang-19
x86_64                              defconfig    gcc-11
x86_64                                  kexec    clang-19
x86_64                                  kexec    gcc-12
x86_64                randconfig-001-20241104    gcc-12
x86_64                randconfig-002-20241104    gcc-12
x86_64                randconfig-003-20241104    gcc-12
x86_64                randconfig-004-20241104    gcc-12
x86_64                randconfig-005-20241104    gcc-12
x86_64                randconfig-006-20241104    gcc-12
x86_64                randconfig-011-20241104    gcc-12
x86_64                randconfig-012-20241104    gcc-12
x86_64                randconfig-013-20241104    gcc-12
x86_64                randconfig-014-20241104    gcc-12
x86_64                randconfig-015-20241104    gcc-12
x86_64                randconfig-016-20241104    gcc-12
x86_64                randconfig-071-20241104    gcc-12
x86_64                randconfig-072-20241104    gcc-12
x86_64                randconfig-073-20241104    gcc-12
x86_64                randconfig-074-20241104    gcc-12
x86_64                randconfig-075-20241104    gcc-12
x86_64                randconfig-076-20241104    gcc-12
x86_64                               rhel-8.3    gcc-12
x86_64                           rhel-8.3-bpf    clang-19
x86_64                    rhel-8.3-kselftests    gcc-12
x86_64                         rhel-8.3-kunit    clang-19
x86_64                           rhel-8.3-ltp    clang-19
x86_64                          rhel-8.3-rust    clang-19
xtensa                            allnoconfig    gcc-14.1.0
xtensa                generic_kc705_defconfig    gcc-14.1.0
xtensa                randconfig-001-20241104    gcc-14.1.0
xtensa                randconfig-002-20241104    gcc-14.1.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

