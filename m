Return-Path: <linux-renesas-soc+bounces-26897-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F432D297B4
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 16 Jan 2026 02:01:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 0BE433010BCF
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 16 Jan 2026 01:01:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D732C30C619;
	Fri, 16 Jan 2026 01:01:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YKz+EqDo"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A119311959
	for <linux-renesas-soc@vger.kernel.org>; Fri, 16 Jan 2026 01:01:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768525289; cv=none; b=gb/uNajU2j1EOYAfeKmTfDfRAeo/qJC7MZDUcTCPaK8s2rQWB8XRrM0IVaKCKlUU0dNLpHb/7edyM28NV9duflbfQ6VJr4vxiUzzB/aVM+9VZZQQsCj9adnXG9ulWGm6arBimBmUVFtVGYMjf2TlbC/SLHc5dSElK0lquN5Bm6M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768525289; c=relaxed/simple;
	bh=KexPjdoE2vcZ+Npnt3Hip6SsE4DaAgnsMZl3g23CO9Q=;
	h=Date:From:To:Cc:Subject:Message-ID; b=KgEqX6biqvyWGAksTuE0TDQMnzMR4JxVSWZ6BH3+8qx9PMJOaMz2skBEi7/1OR8yMgGM6HYwxVMeY5BiqQpPbDJKaLPODfBVRQ0ilxw9ljxfTt42W/QqLDI98RQGxPiiRR5dQdAfGLIv1p7ZYlNSiFnKn8+3GHudJ7XQzhyj5bg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YKz+EqDo; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768525288; x=1800061288;
  h=date:from:to:cc:subject:message-id;
  bh=KexPjdoE2vcZ+Npnt3Hip6SsE4DaAgnsMZl3g23CO9Q=;
  b=YKz+EqDombhKnLf5zcwU1Tyt1v3iXWRyLCP76rk4PkHyNPFCA5I51Ruq
   id2AVBe/aH37a4EjK5ZKvJl8TCWVcJmA5EO/hKQCk+Zaw6o4Ei9LOQfZ8
   zuioPnFAu8b63m7eHotqt/bhJmLHEskh3Do9nxOR2coO55tAkqgQhwtNi
   2Tv2AM/mlYgExJ1dmR6bXqZrnhu25L6lact4UeTGjHD6HgOcsyVUdtyAO
   TRmW7CVfXrJWUj2+0b6SswWkLFn//1qSz4BHKiw8tmLPj9MvlCI4Plnpt
   Dvx1GgE4eHfS45Gb0d0jEBv7HAdyjj1ka5tistb+u+cZwnRt2RjGYW5+w
   A==;
X-CSE-ConnectionGUID: j5QcAw9tRNGNHZHd9zDvDg==
X-CSE-MsgGUID: FwYy9FhiSJumNUECqjBWHg==
X-IronPort-AV: E=McAfee;i="6800,10657,11672"; a="80147821"
X-IronPort-AV: E=Sophos;i="6.21,229,1763452800"; 
   d="scan'208";a="80147821"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jan 2026 17:01:27 -0800
X-CSE-ConnectionGUID: 5wkGDcciQW20syMvV4wr7A==
X-CSE-MsgGUID: Z3qBl7SbSuKZfRkj9rs9vQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,229,1763452800"; 
   d="scan'208";a="235800338"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 15 Jan 2026 17:01:25 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vgYDL-00000000KBY-0enA;
	Fri, 16 Jan 2026 01:01:23 +0000
Date: Fri, 16 Jan 2026 09:00:53 +0800
From: kernel test robot <lkp@intel.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: linux-renesas-soc@vger.kernel.org
Subject: [geert-renesas-devel:master] BUILD SUCCESS
 cf4b8d94d63cfa88fd91b38f1cdd5fcb4d0d36f7
Message-ID: <202601160948.zOk5hzkY-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git master
branch HEAD: cf4b8d94d63cfa88fd91b38f1cdd5fcb4d0d36f7  Merge branch 'renesas-next' into renesas-devel

elapsed time: 799m

configs tested: 211
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-15.2.0
alpha                            allyesconfig    gcc-15.2.0
alpha                               defconfig    gcc-15.2.0
arc                              allmodconfig    clang-16
arc                               allnoconfig    gcc-15.2.0
arc                              allyesconfig    clang-22
arc                                 defconfig    gcc-15.2.0
arc                        nsimosci_defconfig    gcc-15.2.0
arc                   randconfig-001-20260116    gcc-8.5.0
arc                   randconfig-002-20260116    gcc-8.5.0
arc                    vdk_hs38_smp_defconfig    clang-22
arm                               allnoconfig    gcc-15.2.0
arm                              allyesconfig    clang-16
arm                       aspeed_g5_defconfig    gcc-15.2.0
arm                        clps711x_defconfig    clang-22
arm                                 defconfig    gcc-15.2.0
arm                       imx_v4_v5_defconfig    clang-22
arm                         nhk8815_defconfig    clang-22
arm                            qcom_defconfig    clang-22
arm                   randconfig-001-20260116    gcc-8.5.0
arm                   randconfig-002-20260116    gcc-8.5.0
arm                   randconfig-003-20260116    gcc-8.5.0
arm                   randconfig-004-20260116    gcc-8.5.0
arm                        shmobile_defconfig    gcc-15.2.0
arm                       spear13xx_defconfig    clang-22
arm64                            allmodconfig    clang-22
arm64                             allnoconfig    gcc-15.2.0
arm64                               defconfig    gcc-15.2.0
arm64                 randconfig-001-20260116    clang-22
arm64                 randconfig-002-20260116    clang-22
arm64                 randconfig-003-20260116    clang-22
arm64                 randconfig-004-20260116    clang-22
csky                             allmodconfig    gcc-15.2.0
csky                              allnoconfig    gcc-15.2.0
csky                                defconfig    gcc-15.2.0
csky                  randconfig-001-20260116    clang-22
csky                  randconfig-002-20260116    clang-22
hexagon                          allmodconfig    gcc-15.2.0
hexagon                           allnoconfig    gcc-15.2.0
hexagon                             defconfig    gcc-15.2.0
hexagon               randconfig-001-20260116    clang-20
hexagon               randconfig-002-20260116    clang-20
i386                             allmodconfig    clang-20
i386                              allnoconfig    gcc-15.2.0
i386                             allyesconfig    clang-20
i386        buildonly-randconfig-001-20260116    gcc-12
i386        buildonly-randconfig-002-20260116    gcc-12
i386        buildonly-randconfig-003-20260116    gcc-12
i386        buildonly-randconfig-004-20260116    gcc-12
i386        buildonly-randconfig-005-20260116    gcc-12
i386        buildonly-randconfig-006-20260116    gcc-12
i386                                defconfig    gcc-15.2.0
i386                  randconfig-001-20260116    clang-20
i386                  randconfig-002-20260116    clang-20
i386                  randconfig-003-20260116    clang-20
i386                  randconfig-004-20260116    clang-20
i386                  randconfig-005-20260116    clang-20
i386                  randconfig-006-20260116    clang-20
i386                  randconfig-007-20260116    clang-20
i386                  randconfig-011-20260116    clang-20
i386                  randconfig-012-20260116    clang-20
i386                  randconfig-013-20260116    clang-20
i386                  randconfig-014-20260116    clang-20
i386                  randconfig-015-20260116    clang-20
i386                  randconfig-016-20260116    clang-20
i386                  randconfig-017-20260116    clang-20
loongarch                        allmodconfig    clang-22
loongarch                         allnoconfig    gcc-15.2.0
loongarch                           defconfig    clang-19
loongarch             randconfig-001-20260116    clang-20
loongarch             randconfig-002-20260116    clang-20
m68k                             allmodconfig    gcc-15.2.0
m68k                              allnoconfig    gcc-15.2.0
m68k                             allyesconfig    clang-16
m68k                                defconfig    clang-19
m68k                       m5249evb_defconfig    clang-22
m68k                        mvme147_defconfig    gcc-15.2.0
m68k                        mvme16x_defconfig    clang-22
microblaze                        allnoconfig    gcc-15.2.0
microblaze                       allyesconfig    gcc-15.2.0
microblaze                          defconfig    clang-19
mips                             allmodconfig    gcc-15.2.0
mips                              allnoconfig    gcc-15.2.0
mips                             allyesconfig    gcc-15.2.0
mips                      bmips_stb_defconfig    clang-22
mips                  cavium_octeon_defconfig    clang-22
mips                           ci20_defconfig    clang-22
mips                     cu1830-neo_defconfig    clang-22
mips                           ip28_defconfig    clang-22
mips                  maltasmvp_eva_defconfig    clang-22
mips                          rm200_defconfig    clang-22
mips                        vocore2_defconfig    clang-22
nios2                            allmodconfig    clang-22
nios2                             allnoconfig    clang-22
nios2                               defconfig    clang-19
nios2                 randconfig-001-20260116    clang-20
nios2                 randconfig-002-20260116    clang-20
openrisc                         allmodconfig    clang-22
openrisc                          allnoconfig    clang-22
openrisc                            defconfig    gcc-15.2.0
parisc                           allmodconfig    gcc-15.2.0
parisc                            allnoconfig    clang-22
parisc                           allyesconfig    clang-19
parisc                              defconfig    gcc-15.2.0
parisc                randconfig-001-20260116    clang-22
parisc                randconfig-002-20260116    clang-22
parisc64                            defconfig    clang-19
powerpc                    adder875_defconfig    gcc-15.2.0
powerpc                          allmodconfig    gcc-15.2.0
powerpc                           allnoconfig    clang-22
powerpc                      cm5200_defconfig    clang-22
powerpc                   currituck_defconfig    clang-22
powerpc                       eiger_defconfig    clang-22
powerpc                        fsp2_defconfig    clang-22
powerpc                      katmai_defconfig    clang-22
powerpc                 mpc837x_rdb_defconfig    clang-22
powerpc                     mpc83xx_defconfig    clang-22
powerpc                    mvme5100_defconfig    clang-22
powerpc               randconfig-001-20260116    clang-22
powerpc               randconfig-002-20260116    clang-22
powerpc                    sam440ep_defconfig    clang-22
powerpc                         wii_defconfig    clang-22
powerpc64             randconfig-001-20260116    clang-22
powerpc64             randconfig-002-20260116    clang-22
riscv                            allmodconfig    clang-22
riscv                             allnoconfig    clang-22
riscv                            allyesconfig    clang-16
riscv                               defconfig    gcc-15.2.0
riscv                 randconfig-001-20260116    gcc-15.2.0
riscv                 randconfig-002-20260116    gcc-15.2.0
s390                             allmodconfig    clang-19
s390                              allnoconfig    clang-22
s390                             allyesconfig    gcc-15.2.0
s390                          debug_defconfig    clang-22
s390                                defconfig    gcc-15.2.0
s390                  randconfig-001-20260116    gcc-15.2.0
s390                  randconfig-002-20260116    gcc-15.2.0
sh                               allmodconfig    gcc-15.2.0
sh                                allnoconfig    clang-22
sh                               allyesconfig    clang-19
sh                        apsh4ad0a_defconfig    clang-22
sh                                  defconfig    gcc-14
sh                         ecovec24_defconfig    clang-22
sh                 kfr2r09-romimage_defconfig    clang-22
sh                    randconfig-001-20260116    gcc-15.2.0
sh                    randconfig-002-20260116    gcc-15.2.0
sh                          rsk7201_defconfig    gcc-15.2.0
sh                          rsk7269_defconfig    clang-22
sh                          sdk7786_defconfig    clang-22
sh                           se7721_defconfig    gcc-15.2.0
sh                        sh7763rdp_defconfig    clang-22
sh                            shmin_defconfig    clang-22
sh                             shx3_defconfig    clang-22
sparc                             allnoconfig    clang-22
sparc                               defconfig    gcc-15.2.0
sparc                 randconfig-001-20260116    gcc-10.5.0
sparc                 randconfig-002-20260116    gcc-10.5.0
sparc64                          allmodconfig    clang-22
sparc64                             defconfig    gcc-14
sparc64               randconfig-001-20260116    gcc-10.5.0
sparc64               randconfig-002-20260116    gcc-10.5.0
um                               allmodconfig    clang-19
um                                allnoconfig    clang-22
um                               allyesconfig    gcc-15.2.0
um                                  defconfig    gcc-14
um                             i386_defconfig    gcc-14
um                    randconfig-001-20260116    gcc-10.5.0
um                    randconfig-002-20260116    gcc-10.5.0
um                           x86_64_defconfig    gcc-14
x86_64                           alldefconfig    clang-22
x86_64                           allmodconfig    clang-20
x86_64                            allnoconfig    clang-22
x86_64                           allyesconfig    clang-20
x86_64      buildonly-randconfig-001-20260116    gcc-14
x86_64      buildonly-randconfig-002-20260116    gcc-14
x86_64      buildonly-randconfig-003-20260116    gcc-14
x86_64      buildonly-randconfig-004-20260116    gcc-14
x86_64      buildonly-randconfig-005-20260116    gcc-14
x86_64      buildonly-randconfig-006-20260116    gcc-14
x86_64                              defconfig    gcc-14
x86_64                                  kexec    clang-20
x86_64                randconfig-001-20260116    clang-20
x86_64                randconfig-002-20260116    clang-20
x86_64                randconfig-003-20260116    clang-20
x86_64                randconfig-004-20260116    clang-20
x86_64                randconfig-005-20260116    clang-20
x86_64                randconfig-006-20260116    clang-20
x86_64                randconfig-011-20260116    clang-20
x86_64                randconfig-012-20260116    clang-20
x86_64                randconfig-013-20260116    clang-20
x86_64                randconfig-014-20260116    clang-20
x86_64                randconfig-015-20260116    clang-20
x86_64                randconfig-016-20260116    clang-20
x86_64                randconfig-071-20260116    clang-20
x86_64                randconfig-072-20260116    clang-20
x86_64                randconfig-073-20260116    clang-20
x86_64                randconfig-074-20260116    clang-20
x86_64                randconfig-075-20260116    clang-20
x86_64                randconfig-076-20260116    clang-20
x86_64                               rhel-9.4    clang-20
x86_64                           rhel-9.4-bpf    gcc-14
x86_64                          rhel-9.4-func    clang-20
x86_64                    rhel-9.4-kselftests    clang-20
x86_64                         rhel-9.4-kunit    gcc-14
x86_64                           rhel-9.4-ltp    gcc-14
x86_64                          rhel-9.4-rust    clang-20
xtensa                           alldefconfig    clang-22
xtensa                            allnoconfig    clang-22
xtensa                           allyesconfig    clang-22
xtensa                randconfig-001-20260116    gcc-10.5.0
xtensa                randconfig-002-20260116    gcc-10.5.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

