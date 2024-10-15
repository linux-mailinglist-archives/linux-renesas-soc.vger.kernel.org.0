Return-Path: <linux-renesas-soc+bounces-9775-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FFE999F6C1
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 15 Oct 2024 21:08:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 014C0283CFD
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 15 Oct 2024 19:08:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E4A001F80C6;
	Tue, 15 Oct 2024 19:08:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MAEsvAgq"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 020F11F80A0
	for <linux-renesas-soc@vger.kernel.org>; Tue, 15 Oct 2024 19:08:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729019330; cv=none; b=KFsrl2feylWwK7GPQGKEqGfpmPT+KPTlXPY3/4cIXo8O6q7JoLgVNH8MDk2LYQclIgQO41MCYfMh8OUgA10Kv/PswNWyccbFZoV4i4g3a6e8Hj2bZVcqbEFlrLrdp+7EBTNlKUyqQJUm4fBYfw0DaRQl0pYZ+qTEymGL/mv0KWc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729019330; c=relaxed/simple;
	bh=SsO/5HlQQx18tqYxmLbxeRJpaJCTFMv7AhTg3UyffiQ=;
	h=Date:From:To:Cc:Subject:Message-ID; b=cCi176iwVHpo8bG5yWg7AaglYFapS8ZDlXhScus79ctUCmv8Q8pYqhRRGV5gzFX3JFu/MUZSqGa9NeL65ZDSIlDTPuyvAdtfj0r00lnvNM1kw+NkDY/pietXTIjWYp689DAxYqjCrm1qlXVkLWI+enR9U6/vMdfTZ2A8im1NwK0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=MAEsvAgq; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1729019329; x=1760555329;
  h=date:from:to:cc:subject:message-id;
  bh=SsO/5HlQQx18tqYxmLbxeRJpaJCTFMv7AhTg3UyffiQ=;
  b=MAEsvAgqFq8e/L1aaTRaXPz+GTgvk9Be8D7u9Mrxsz5S0RHK2Hc44dlW
   0dY44Al8SCsK92SU+jOrQQiyfpfxc0orhzCm0YQU1cqCCgwmh/zo89tmT
   AvmerL8C0aRjcOJ270EoDVhWUKSSRDd8/rAVTp6g/m8uIrQXxKLdbRtlg
   uHn81TWW+mdGhZitOTQmHZpFsmOgqZitDpXaNvxu72u4qOUpZHfhec/UP
   imwIyMcImKzBTuzQAzPCIhKTutZWV3L/H+f21VqLtV084zI/XAiGiVW5G
   oWYG6dDQnh2KzDGzdVXuVD+5VQIXhDTGY+WIUJex6W90/jucOt2tOF+6N
   A==;
X-CSE-ConnectionGUID: oMKlf3wjQ2O2GHQExvBu8g==
X-CSE-MsgGUID: 4RwzWMWDQa2b9tZJ5ZL/GQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11225"; a="45936792"
X-IronPort-AV: E=Sophos;i="6.11,205,1725346800"; 
   d="scan'208";a="45936792"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Oct 2024 12:08:48 -0700
X-CSE-ConnectionGUID: ZSD+AwcKT5eODJoVaKHFDA==
X-CSE-MsgGUID: e8lKQ0R0RrSByDYMv27s2w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,205,1725346800"; 
   d="scan'208";a="108730973"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 15 Oct 2024 12:08:46 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t0muS-000JpR-0Q;
	Tue, 15 Oct 2024 19:08:44 +0000
Date: Wed, 16 Oct 2024 03:08:19 +0800
From: kernel test robot <lkp@intel.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: linux-renesas-soc@vger.kernel.org
Subject: [geert-renesas-devel:master] BUILD SUCCESS
 e9e8933acec822cf7dcfb0da7bc83409598eaf6d
Message-ID: <202410160309.41GAPZ9t-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git master
branch HEAD: e9e8933acec822cf7dcfb0da7bc83409598eaf6d  Merge branches 'renesas-next' and 'topic/renesas-defconfig', tag 'v6.12-rc3' into renesas-devel

elapsed time: 1998m

configs tested: 105
configs skipped: 5

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
arm                              allmodconfig    clang-20
arm                               allnoconfig    gcc-14.1.0
arm                              allyesconfig    clang-20
arm                                 defconfig    gcc-14.1.0
arm                        mvebu_v7_defconfig    clang-20
arm                           sama7_defconfig    clang-20
arm                        shmobile_defconfig    clang-20
arm                          sp7021_defconfig    clang-20
arm64                            allmodconfig    clang-20
arm64                             allnoconfig    gcc-14.1.0
arm64                               defconfig    gcc-14.1.0
csky                              allnoconfig    gcc-14.1.0
csky                                defconfig    gcc-14.1.0
hexagon                          allmodconfig    clang-20
hexagon                           allnoconfig    gcc-14.1.0
hexagon                          allyesconfig    clang-20
hexagon                             defconfig    gcc-14.1.0
i386                             allmodconfig    clang-18
i386                              allnoconfig    clang-18
i386                             allyesconfig    clang-18
i386        buildonly-randconfig-001-20241015    clang-18
i386        buildonly-randconfig-002-20241015    clang-18
i386        buildonly-randconfig-003-20241015    clang-18
i386        buildonly-randconfig-004-20241015    clang-18
i386        buildonly-randconfig-005-20241015    clang-18
i386        buildonly-randconfig-006-20241015    clang-18
i386                                defconfig    clang-18
i386                  randconfig-001-20241015    clang-18
i386                  randconfig-002-20241015    clang-18
i386                  randconfig-003-20241015    clang-18
i386                  randconfig-004-20241015    clang-18
i386                  randconfig-005-20241015    clang-18
i386                  randconfig-006-20241015    clang-18
i386                  randconfig-011-20241015    clang-18
i386                  randconfig-012-20241015    clang-18
i386                  randconfig-013-20241015    clang-18
i386                  randconfig-014-20241015    clang-18
i386                  randconfig-015-20241015    clang-18
i386                  randconfig-016-20241015    clang-18
loongarch                        allmodconfig    gcc-14.1.0
loongarch                         allnoconfig    gcc-14.1.0
loongarch                           defconfig    gcc-14.1.0
m68k                             allmodconfig    gcc-14.1.0
m68k                              allnoconfig    gcc-14.1.0
m68k                             allyesconfig    gcc-14.1.0
m68k                          amiga_defconfig    clang-20
m68k                                defconfig    gcc-14.1.0
microblaze                       allmodconfig    gcc-14.1.0
microblaze                        allnoconfig    gcc-14.1.0
microblaze                       allyesconfig    gcc-14.1.0
microblaze                          defconfig    gcc-14.1.0
mips                              allnoconfig    gcc-14.1.0
mips                           gcw0_defconfig    clang-20
nios2                             allnoconfig    gcc-14.1.0
nios2                               defconfig    gcc-14.1.0
openrisc                          allnoconfig    clang-20
openrisc                            defconfig    gcc-12
parisc                            allnoconfig    clang-20
parisc                              defconfig    gcc-12
parisc64                            defconfig    gcc-14.1.0
powerpc                           allnoconfig    clang-20
powerpc                      ep88xc_defconfig    clang-20
powerpc                       holly_defconfig    clang-20
powerpc                      pasemi_defconfig    clang-20
powerpc                 xes_mpc85xx_defconfig    clang-20
riscv                             allnoconfig    clang-20
riscv                               defconfig    gcc-12
s390                             allmodconfig    gcc-14.1.0
s390                              allnoconfig    clang-20
s390                             allyesconfig    gcc-14.1.0
s390                                defconfig    gcc-12
sh                               allmodconfig    gcc-14.1.0
sh                                allnoconfig    gcc-14.1.0
sh                               allyesconfig    gcc-14.1.0
sh                                  defconfig    gcc-12
sh                          landisk_defconfig    clang-20
sh                             shx3_defconfig    clang-20
sparc                            allmodconfig    gcc-14.1.0
sparc64                             defconfig    gcc-12
um                               alldefconfig    clang-20
um                               allmodconfig    clang-20
um                                allnoconfig    clang-20
um                               allyesconfig    clang-20
um                                  defconfig    gcc-12
um                             i386_defconfig    gcc-12
um                           x86_64_defconfig    gcc-12
x86_64                            allnoconfig    clang-18
x86_64                           allyesconfig    clang-18
x86_64                              defconfig    clang-18
x86_64                                  kexec    clang-18
x86_64                                  kexec    gcc-12
x86_64                               rhel-8.3    gcc-12
x86_64                           rhel-8.3-bpf    clang-18
x86_64                         rhel-8.3-kunit    clang-18
x86_64                           rhel-8.3-ltp    clang-18
x86_64                          rhel-8.3-rust    clang-18
xtensa                            allnoconfig    gcc-14.1.0
xtensa                  nommu_kc705_defconfig    clang-20

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

