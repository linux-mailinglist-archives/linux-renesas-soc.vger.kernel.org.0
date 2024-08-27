Return-Path: <linux-renesas-soc+bounces-8321-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id DB6679601A4
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 27 Aug 2024 08:29:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8C329283484
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 27 Aug 2024 06:29:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D0A183219F;
	Tue, 27 Aug 2024 06:29:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HvVC2Yug"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE522145B3F
	for <linux-renesas-soc@vger.kernel.org>; Tue, 27 Aug 2024 06:28:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724740141; cv=none; b=k7wBFIphr1to0lhiXNvxKzUF1xhGiBRXnnnUPXT71HdBBs74FRd9BVx7sGCJ2srh2CgJXeXzXZtUXSbHsXEmjPWxXBXPgRbdTuOdFzB35qD/tMTGjmIXupF9aN1+g7d7s6BNX9+NL0FVVED5AnaSTvTwbvkfnxoscGT7adQ3aIc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724740141; c=relaxed/simple;
	bh=7VXwe9Owv53nwRYKa694EdISB9tSuNoSjYz/IFs1fqY=;
	h=Date:From:To:Cc:Subject:Message-ID; b=hxM5ASHPUNQOyx/oeTi19QUIzHNA4jzJoitfxvminaDK0A0EHQNqSCwGEeeN2BtYqNTdmqCVL2V1Flkrq8kyii0JfKNdTFWaNu6F5GX426khXPw1YfbNYFB2pLNCoqUetR/PaJc0kqSaWBVxtgdeyNVq/SHEt2yP189Tvj9uOs4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HvVC2Yug; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1724740140; x=1756276140;
  h=date:from:to:cc:subject:message-id;
  bh=7VXwe9Owv53nwRYKa694EdISB9tSuNoSjYz/IFs1fqY=;
  b=HvVC2Yug7F7ZQD60nk4BA7+16yuxi3kQXJslzOxrtO4d8dhESPXo68YB
   WznNCbKmZApEYSf4jXy/13M7DoU/UfvVhm1Qq4C+23vv8Uyx4lVUlUkIO
   o3XoMTFA60S1s42IdrmejPs57uEDzqOhaYSzRqTh0qzR8qvu/NwNaION3
   zibapkyyW/8oUpyK5gtHJQ36MYc5SDIQLoNUlMX6AYBLPdIHbAd0vN6fD
   ELCPP3f+3hSq+eXlhR68UyTkTwi1Knjprq35NQncAKk0EDED5OTghe+In
   H4/gIMsu8TTlLxB58uXidvTs20KfpLf0TUtFupmsxf6GeEwVm/2pzgoA4
   g==;
X-CSE-ConnectionGUID: jeg81dncRQmOgOHqxlGdrw==
X-CSE-MsgGUID: PDG/D+qJTjqb70lW3e0mlw==
X-IronPort-AV: E=McAfee;i="6700,10204,11176"; a="34605608"
X-IronPort-AV: E=Sophos;i="6.10,179,1719903600"; 
   d="scan'208";a="34605608"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Aug 2024 23:28:59 -0700
X-CSE-ConnectionGUID: pvNxd2RiQhqvuTUWk9P4cQ==
X-CSE-MsgGUID: Q8OfNl1ISWS5Ug90yab1PA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,179,1719903600"; 
   d="scan'208";a="62735007"
Received: from lkp-server01.sh.intel.com (HELO 9a732dc145d3) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 26 Aug 2024 23:28:58 -0700
Received: from kbuild by 9a732dc145d3 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1siphI-000I90-0A;
	Tue, 27 Aug 2024 06:28:56 +0000
Date: Tue, 27 Aug 2024 14:28:29 +0800
From: kernel test robot <lkp@intel.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: linux-renesas-soc@vger.kernel.org
Subject: [geert-renesas-devel:master] BUILD SUCCESS
 4c0157fcf00f49c74c677252100ceb2c476d1519
Message-ID: <202408271426.VzkhYPwk-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git master
branch HEAD: 4c0157fcf00f49c74c677252100ceb2c476d1519  Merge tag 'v6.11-rc5' into renesas-devel

elapsed time: 1317m

configs tested: 207
configs skipped: 7

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig   gcc-13.2.0
alpha                            allyesconfig   gcc-13.3.0
alpha                               defconfig   gcc-12.4.0
alpha                               defconfig   gcc-13.2.0
arc                              allmodconfig   gcc-13.2.0
arc                               allnoconfig   gcc-13.2.0
arc                              allyesconfig   gcc-13.2.0
arc                                 defconfig   gcc-13.2.0
arc                   randconfig-001-20240827   gcc-13.2.0
arc                   randconfig-002-20240827   gcc-13.2.0
arm                              allmodconfig   gcc-13.2.0
arm                              allmodconfig   gcc-14.1.0
arm                               allnoconfig   gcc-13.2.0
arm                              allyesconfig   gcc-13.2.0
arm                              allyesconfig   gcc-14.1.0
arm                         at91_dt_defconfig   gcc-12.4.0
arm                                 defconfig   gcc-13.2.0
arm                          ep93xx_defconfig   gcc-12.4.0
arm                      footbridge_defconfig   clang-20
arm                       imx_v4_v5_defconfig   gcc-12.4.0
arm                         lpc18xx_defconfig   gcc-12.4.0
arm                         nhk8815_defconfig   clang-20
arm                           omap1_defconfig   clang-20
arm                   randconfig-001-20240827   gcc-13.2.0
arm                   randconfig-002-20240827   gcc-13.2.0
arm                   randconfig-003-20240827   gcc-13.2.0
arm                   randconfig-004-20240827   gcc-13.2.0
arm                             rpc_defconfig   gcc-12.4.0
arm                         s5pv210_defconfig   clang-20
arm                          sp7021_defconfig   clang-20
arm64                            allmodconfig   clang-20
arm64                            allmodconfig   gcc-13.2.0
arm64                             allnoconfig   gcc-13.2.0
arm64                               defconfig   gcc-13.2.0
arm64                 randconfig-001-20240827   gcc-13.2.0
arm64                 randconfig-002-20240827   gcc-13.2.0
arm64                 randconfig-003-20240827   gcc-13.2.0
arm64                 randconfig-004-20240827   gcc-13.2.0
csky                              allnoconfig   gcc-13.2.0
csky                                defconfig   gcc-13.2.0
csky                  randconfig-001-20240827   gcc-13.2.0
csky                  randconfig-002-20240827   gcc-13.2.0
hexagon                          allmodconfig   clang-20
hexagon                          allyesconfig   clang-20
i386                             alldefconfig   gcc-12.4.0
i386                             allmodconfig   clang-18
i386                             allmodconfig   gcc-12
i386                              allnoconfig   clang-18
i386                              allnoconfig   gcc-12
i386                             allyesconfig   clang-18
i386                             allyesconfig   gcc-12
i386         buildonly-randconfig-001-20240826   clang-18
i386         buildonly-randconfig-001-20240827   gcc-12
i386         buildonly-randconfig-002-20240826   gcc-12
i386         buildonly-randconfig-002-20240827   gcc-12
i386         buildonly-randconfig-003-20240826   clang-18
i386         buildonly-randconfig-003-20240827   gcc-12
i386         buildonly-randconfig-004-20240826   clang-18
i386         buildonly-randconfig-004-20240827   gcc-12
i386         buildonly-randconfig-005-20240826   clang-18
i386         buildonly-randconfig-005-20240827   gcc-12
i386         buildonly-randconfig-006-20240826   clang-18
i386         buildonly-randconfig-006-20240827   gcc-12
i386                                defconfig   clang-18
i386                  randconfig-001-20240826   gcc-12
i386                  randconfig-001-20240827   gcc-12
i386                  randconfig-002-20240826   gcc-12
i386                  randconfig-002-20240827   gcc-12
i386                  randconfig-003-20240826   clang-18
i386                  randconfig-003-20240827   gcc-12
i386                  randconfig-004-20240826   gcc-12
i386                  randconfig-004-20240827   gcc-12
i386                  randconfig-005-20240826   gcc-12
i386                  randconfig-005-20240827   gcc-12
i386                  randconfig-006-20240826   clang-18
i386                  randconfig-006-20240827   gcc-12
i386                  randconfig-011-20240826   gcc-12
i386                  randconfig-011-20240827   gcc-12
i386                  randconfig-012-20240826   gcc-12
i386                  randconfig-012-20240827   gcc-12
i386                  randconfig-013-20240826   gcc-12
i386                  randconfig-013-20240827   gcc-12
i386                  randconfig-014-20240826   gcc-12
i386                  randconfig-014-20240827   gcc-12
i386                  randconfig-015-20240826   gcc-12
i386                  randconfig-015-20240827   gcc-12
i386                  randconfig-016-20240826   gcc-12
i386                  randconfig-016-20240827   gcc-12
loongarch                        allmodconfig   gcc-14.1.0
loongarch                         allnoconfig   gcc-13.2.0
loongarch                           defconfig   gcc-13.2.0
loongarch             randconfig-001-20240827   gcc-13.2.0
loongarch             randconfig-002-20240827   gcc-13.2.0
m68k                             allmodconfig   gcc-14.1.0
m68k                              allnoconfig   gcc-13.2.0
m68k                             allyesconfig   gcc-14.1.0
m68k                                defconfig   gcc-13.2.0
m68k                            q40_defconfig   gcc-12.4.0
m68k                          sun3x_defconfig   gcc-12.4.0
microblaze                       allmodconfig   gcc-14.1.0
microblaze                        allnoconfig   gcc-13.2.0
microblaze                       allyesconfig   gcc-14.1.0
microblaze                          defconfig   gcc-13.2.0
mips                              allnoconfig   gcc-13.2.0
mips                           ci20_defconfig   clang-20
mips                  maltasmvp_eva_defconfig   clang-20
nios2                             allnoconfig   gcc-13.2.0
nios2                               defconfig   gcc-13.2.0
nios2                 randconfig-001-20240827   gcc-13.2.0
nios2                 randconfig-002-20240827   gcc-13.2.0
openrisc                          allnoconfig   gcc-14.1.0
openrisc                         allyesconfig   gcc-14.1.0
openrisc                            defconfig   gcc-14.1.0
parisc                           allmodconfig   gcc-14.1.0
parisc                            allnoconfig   gcc-14.1.0
parisc                           allyesconfig   gcc-14.1.0
parisc                              defconfig   gcc-14.1.0
parisc                randconfig-001-20240827   gcc-13.2.0
parisc                randconfig-002-20240827   gcc-13.2.0
parisc64                            defconfig   gcc-13.2.0
powerpc                          allmodconfig   gcc-14.1.0
powerpc                           allnoconfig   gcc-14.1.0
powerpc                          allyesconfig   clang-20
powerpc                          allyesconfig   gcc-14.1.0
powerpc                        cell_defconfig   clang-20
powerpc                      chrp32_defconfig   gcc-12.4.0
powerpc                        icon_defconfig   clang-20
powerpc               randconfig-001-20240827   gcc-13.2.0
powerpc               randconfig-002-20240827   gcc-13.2.0
powerpc               randconfig-003-20240827   gcc-13.2.0
powerpc                     redwood_defconfig   gcc-12.4.0
powerpc                     sequoia_defconfig   clang-20
powerpc                      tqm8xx_defconfig   gcc-12.4.0
powerpc64             randconfig-002-20240827   gcc-13.2.0
powerpc64             randconfig-003-20240827   gcc-13.2.0
riscv                            allmodconfig   clang-20
riscv                            allmodconfig   gcc-14.1.0
riscv                             allnoconfig   gcc-14.1.0
riscv                            allyesconfig   clang-20
riscv                            allyesconfig   gcc-14.1.0
riscv                               defconfig   gcc-14.1.0
riscv                 randconfig-001-20240827   gcc-13.2.0
riscv                 randconfig-002-20240827   gcc-13.2.0
s390                             allmodconfig   clang-20
s390                              allnoconfig   clang-20
s390                              allnoconfig   gcc-14.1.0
s390                             allyesconfig   clang-20
s390                             allyesconfig   gcc-14.1.0
s390                                defconfig   gcc-14.1.0
s390                  randconfig-001-20240827   gcc-13.2.0
s390                  randconfig-002-20240827   gcc-13.2.0
sh                               allmodconfig   gcc-14.1.0
sh                                allnoconfig   gcc-13.2.0
sh                               allyesconfig   gcc-14.1.0
sh                                  defconfig   gcc-14.1.0
sh                 kfr2r09-romimage_defconfig   gcc-12.4.0
sh                    randconfig-001-20240827   gcc-13.2.0
sh                    randconfig-002-20240827   gcc-13.2.0
sh                           se7724_defconfig   gcc-12.4.0
sparc                            allmodconfig   gcc-14.1.0
sparc64                             defconfig   gcc-14.1.0
sparc64               randconfig-001-20240827   gcc-13.2.0
sparc64               randconfig-002-20240827   gcc-13.2.0
um                               allmodconfig   clang-20
um                               allmodconfig   gcc-13.3.0
um                                allnoconfig   clang-17
um                                allnoconfig   gcc-14.1.0
um                               allyesconfig   gcc-12
um                               allyesconfig   gcc-13.3.0
um                                  defconfig   gcc-14.1.0
um                             i386_defconfig   gcc-14.1.0
um                    randconfig-001-20240827   gcc-13.2.0
um                    randconfig-002-20240827   gcc-13.2.0
um                           x86_64_defconfig   gcc-14.1.0
x86_64                            allnoconfig   clang-18
x86_64                           allyesconfig   clang-18
x86_64       buildonly-randconfig-001-20240827   clang-18
x86_64       buildonly-randconfig-002-20240827   clang-18
x86_64       buildonly-randconfig-003-20240827   clang-18
x86_64       buildonly-randconfig-004-20240827   clang-18
x86_64       buildonly-randconfig-005-20240827   clang-18
x86_64       buildonly-randconfig-006-20240827   clang-18
x86_64                              defconfig   clang-18
x86_64                              defconfig   gcc-11
x86_64                randconfig-001-20240827   clang-18
x86_64                randconfig-002-20240827   clang-18
x86_64                randconfig-003-20240827   clang-18
x86_64                randconfig-004-20240827   clang-18
x86_64                randconfig-005-20240827   clang-18
x86_64                randconfig-006-20240827   clang-18
x86_64                randconfig-011-20240827   clang-18
x86_64                randconfig-012-20240827   clang-18
x86_64                randconfig-013-20240827   clang-18
x86_64                randconfig-014-20240827   clang-18
x86_64                randconfig-015-20240827   clang-18
x86_64                randconfig-016-20240827   clang-18
x86_64                randconfig-071-20240827   clang-18
x86_64                randconfig-072-20240827   clang-18
x86_64                randconfig-073-20240827   clang-18
x86_64                randconfig-074-20240827   clang-18
x86_64                randconfig-075-20240827   clang-18
x86_64                randconfig-076-20240827   clang-18
x86_64                          rhel-8.3-rust   clang-18
xtensa                            allnoconfig   gcc-13.2.0
xtensa                randconfig-001-20240827   gcc-13.2.0
xtensa                randconfig-002-20240827   gcc-13.2.0
xtensa                    xip_kc705_defconfig   gcc-12.4.0

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

