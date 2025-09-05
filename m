Return-Path: <linux-renesas-soc+bounces-21498-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id CC723B45B75
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  5 Sep 2025 17:03:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 424D2188D533
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  5 Sep 2025 15:00:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7A073306B03;
	Fri,  5 Sep 2025 14:59:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fDkFsKM2"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C0F8306B17
	for <linux-renesas-soc@vger.kernel.org>; Fri,  5 Sep 2025 14:59:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757084372; cv=none; b=Ptp0YlK0G7yk8/9B6v8bf9QnCoBIO1wUE1NQmvGPqQh13dLfocqU3TE0ChSsVcMwGcRjERjwn0aTCGjXVpVrScViDT4HYkYhg7CDSwR5KNvtlYBTvPSaW2GZDfklW/IFbL9QnawmOCEw5M3WraeSLcdSTJKDXxb7k6TEViWrK6o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757084372; c=relaxed/simple;
	bh=PFQr5wvj3x2UZu8NeaZ/25qy0XlaA4AI8/nKg28mQgc=;
	h=Date:From:To:Cc:Subject:Message-ID; b=BW7CrDgcJaOHt7PyLjV+EcakYzBSc45zCi/Ks4R54+J+UOt5ihxIgMsnrj6moYSvt3tM8nkBjMLew2P8mIhEXhE50RwP54Edrxjf07AX71kkUuvo24DHkK3QwStZVOuUVDyQHjG3iT7qQVJJCdWZ2sLcSwmEQzinSm1TvvPGAMU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fDkFsKM2; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1757084371; x=1788620371;
  h=date:from:to:cc:subject:message-id;
  bh=PFQr5wvj3x2UZu8NeaZ/25qy0XlaA4AI8/nKg28mQgc=;
  b=fDkFsKM2v+c44W7nnoI7/HiuzVapaWQ5OOIEq8cGlg6Kd36s5/1fs4uq
   znbggGD21/yhzQfOonGTuwwZoveT0NsR1E65bwUrneot47iyjdjwY70HU
   NaF1IsnYYPTxIxHdgLBETsf5M04nVyItqhI5zJtHlhAyireyEJDWmp/IX
   hdVbp4xDcTYs0Dmyz031ZRMXXkqOEkl7Ba0YHARBiYKueosliK17ycYVL
   hidfdI2Y5s0AUuHJJQ/b+zPl4UNyFHejoExWH665z5Cr3nPZXI6D4irx2
   gCxB0Ki4nbb7MHt9O48w/UisoYkRf7AeaeG+0m8ClAdaj+W1kkPDm6t8B
   Q==;
X-CSE-ConnectionGUID: ZOTKUmx+QAeUNidtSVFLDw==
X-CSE-MsgGUID: mbB5nfgYQ6eU1lxLeDlQVg==
X-IronPort-AV: E=McAfee;i="6800,10657,11544"; a="58648811"
X-IronPort-AV: E=Sophos;i="6.18,241,1751266800"; 
   d="scan'208";a="58648811"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Sep 2025 07:59:28 -0700
X-CSE-ConnectionGUID: Cq377B4sRTiJvTWPPDXRvg==
X-CSE-MsgGUID: gcxq3tNxRY6vj9pIosDghw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,241,1751266800"; 
   d="scan'208";a="203109357"
Received: from lkp-server01.sh.intel.com (HELO 114d98da2b6c) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 05 Sep 2025 07:59:27 -0700
Received: from kbuild by 114d98da2b6c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uuXuP-0000XP-0U;
	Fri, 05 Sep 2025 14:59:25 +0000
Date: Fri, 05 Sep 2025 22:58:37 +0800
From: kernel test robot <lkp@intel.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: linux-renesas-soc@vger.kernel.org
Subject: [geert-renesas-devel:renesas-dts-for-v6.18] BUILD SUCCESS
 a3d8443fcb36739ab37901d8fee7c7d2c4db78ab
Message-ID: <202509052231.joWbzSgQ-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git renesas-dts-for-v6.18
branch HEAD: a3d8443fcb36739ab37901d8fee7c7d2c4db78ab  arm64: dts: renesas: r9a09g087: Add USB2.0 support

elapsed time: 1701m

configs tested: 105
configs skipped: 4

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-15.1.0
alpha                            allyesconfig    gcc-15.1.0
arc                              allmodconfig    gcc-15.1.0
arc                               allnoconfig    gcc-15.1.0
arc                              allyesconfig    gcc-15.1.0
arc                          axs103_defconfig    gcc-15.1.0
arc                   randconfig-001-20250904    gcc-9.5.0
arc                   randconfig-002-20250904    gcc-11.5.0
arm                              allmodconfig    gcc-15.1.0
arm                               allnoconfig    clang-22
arm                   randconfig-001-20250904    gcc-10.5.0
arm                   randconfig-002-20250904    gcc-13.4.0
arm                   randconfig-003-20250904    gcc-8.5.0
arm                   randconfig-004-20250904    gcc-13.4.0
arm                    vt8500_v6_v7_defconfig    gcc-15.1.0
arm64                             allnoconfig    gcc-15.1.0
arm64                 randconfig-001-20250904    gcc-8.5.0
arm64                 randconfig-002-20250904    gcc-8.5.0
arm64                 randconfig-003-20250904    clang-22
arm64                 randconfig-004-20250904    gcc-8.5.0
csky                              allnoconfig    gcc-15.1.0
csky                  randconfig-001-20250904    gcc-15.1.0
csky                  randconfig-002-20250904    gcc-10.5.0
hexagon                          allmodconfig    clang-17
hexagon                           allnoconfig    clang-22
hexagon                          allyesconfig    clang-22
hexagon               randconfig-001-20250904    clang-22
hexagon               randconfig-002-20250904    clang-20
i386                             allmodconfig    gcc-13
i386                              allnoconfig    gcc-13
i386                             allyesconfig    gcc-13
i386        buildonly-randconfig-001-20250904    clang-20
i386        buildonly-randconfig-002-20250904    gcc-12
i386        buildonly-randconfig-003-20250904    gcc-13
i386        buildonly-randconfig-004-20250904    gcc-13
i386        buildonly-randconfig-005-20250904    clang-20
i386        buildonly-randconfig-006-20250904    clang-20
i386                                defconfig    clang-20
loongarch                        allmodconfig    clang-19
loongarch                         allnoconfig    clang-22
loongarch             randconfig-001-20250904    gcc-15.1.0
loongarch             randconfig-002-20250904    clang-22
m68k                             allmodconfig    gcc-15.1.0
m68k                              allnoconfig    gcc-15.1.0
m68k                             allyesconfig    gcc-15.1.0
m68k                        m5272c3_defconfig    gcc-15.1.0
microblaze                       allmodconfig    gcc-15.1.0
microblaze                        allnoconfig    gcc-15.1.0
microblaze                       allyesconfig    gcc-15.1.0
mips                              allnoconfig    gcc-15.1.0
nios2                             allnoconfig    gcc-11.5.0
nios2                 randconfig-001-20250904    gcc-11.5.0
nios2                 randconfig-002-20250904    gcc-11.5.0
openrisc                          allnoconfig    gcc-15.1.0
parisc                            allnoconfig    gcc-15.1.0
parisc                randconfig-001-20250904    gcc-8.5.0
parisc                randconfig-002-20250904    gcc-11.5.0
powerpc                           allnoconfig    gcc-15.1.0
powerpc                 mpc836x_rdk_defconfig    clang-22
powerpc               randconfig-001-20250904    clang-19
powerpc               randconfig-002-20250904    gcc-13.4.0
powerpc               randconfig-003-20250904    clang-22
powerpc64             randconfig-001-20250904    gcc-15.1.0
powerpc64             randconfig-002-20250904    clang-22
powerpc64             randconfig-003-20250904    gcc-8.5.0
riscv                             allnoconfig    gcc-15.1.0
riscv                 randconfig-001-20250904    gcc-8.5.0
riscv                 randconfig-002-20250904    clang-22
s390                             allmodconfig    clang-18
s390                              allnoconfig    clang-22
s390                             allyesconfig    gcc-15.1.0
s390                  randconfig-001-20250904    gcc-10.5.0
s390                  randconfig-002-20250904    gcc-8.5.0
sh                               allmodconfig    gcc-15.1.0
sh                                allnoconfig    gcc-15.1.0
sh                               allyesconfig    gcc-15.1.0
sh                    randconfig-001-20250904    gcc-12.5.0
sh                    randconfig-002-20250904    gcc-10.5.0
sh                           se7619_defconfig    gcc-15.1.0
sh                     sh7710voipgw_defconfig    gcc-15.1.0
sh                            titan_defconfig    gcc-15.1.0
sparc                            allmodconfig    gcc-15.1.0
sparc                             allnoconfig    gcc-15.1.0
sparc                 randconfig-001-20250904    gcc-11.5.0
sparc                 randconfig-002-20250904    gcc-15.1.0
sparc64               randconfig-001-20250904    gcc-12.5.0
sparc64               randconfig-002-20250904    clang-20
um                               allmodconfig    clang-19
um                                allnoconfig    clang-22
um                               allyesconfig    gcc-13
um                    randconfig-001-20250904    gcc-13
um                    randconfig-002-20250904    clang-22
x86_64                            allnoconfig    clang-20
x86_64                           allyesconfig    clang-20
x86_64      buildonly-randconfig-001-20250904    gcc-12
x86_64      buildonly-randconfig-002-20250904    clang-20
x86_64      buildonly-randconfig-003-20250904    gcc-13
x86_64      buildonly-randconfig-004-20250904    gcc-13
x86_64      buildonly-randconfig-005-20250904    gcc-13
x86_64      buildonly-randconfig-006-20250904    clang-20
x86_64                              defconfig    gcc-11
x86_64                          rhel-9.4-rust    clang-20
xtensa                            allnoconfig    gcc-15.1.0
xtensa                randconfig-001-20250904    gcc-10.5.0
xtensa                randconfig-002-20250904    gcc-11.5.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

