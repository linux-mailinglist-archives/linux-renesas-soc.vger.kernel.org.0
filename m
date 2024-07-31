Return-Path: <linux-renesas-soc+bounces-7644-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BB79942423
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 31 Jul 2024 03:24:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7AC0F1F22EE3
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 31 Jul 2024 01:24:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 690108F5E;
	Wed, 31 Jul 2024 01:24:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UIuU1mrV"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5ED808BE0
	for <linux-renesas-soc@vger.kernel.org>; Wed, 31 Jul 2024 01:24:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722389052; cv=none; b=D/SHs8ACm44vFVyGApZv6F8ycLXXPoC9O5YhdQZZwCJpnkKcIUX4i9DK8HR2jlPfvK8OBGdaPB/BJV1DavV31O90Y4Q4BNjjL22ZrDbLAK91JQsrqP06TBv9eTgbKkCWNRCr7R64osziE6n9OT0RggCEVV1gu0wwJCFo+l76TzU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722389052; c=relaxed/simple;
	bh=NH9qLShzayTcBmHymsmSnybdndkvUQWqQQbkumPRLPY=;
	h=Date:From:To:Cc:Subject:Message-ID; b=AMvZEY+f6UD5lVD5h9vwdFGBJ1Wj1oUDqd7EWAYPKGz5sx9AnR5AnriRbMpNzkVlsR6PwTCel+7ZpYgtpCYcXvpihpjkZsdwMJbdR3R6eZjR7MI7i7NVunLETvtbH3llbiqnxkTStcXqRo1uJTJi5TlGYEnYWEzKAgBbuJ6cDpY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=UIuU1mrV; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1722389050; x=1753925050;
  h=date:from:to:cc:subject:message-id;
  bh=NH9qLShzayTcBmHymsmSnybdndkvUQWqQQbkumPRLPY=;
  b=UIuU1mrV/XZx5qmu7n1MWo67Wo78QnGEPnphqLyUnoY8imOsl4UY4SNk
   yDtPRAdN6RtTtKWUyx4aXvngF1aEi4Wx2VPwx4d+f3tMmJkMRcj1kMhtP
   yb439+YgCKKWp2Dw2mMX3rtRdUXBXiQaUujacOa524K/YICu5nRAvGD+W
   1idgyYPVrPvJIkOpVr8R5DOOirapd6v5rGJjJFmUm3YQS5R+ksHCNWhyt
   aA3Pdh15t5D+ykOZhuxoejfDOO40PA+yQe83J1aOi3l269JvxCFiQaVzl
   aBZAEBwr6f6zElgEwFukC28+V9Zh5Rsf8brmrpdFcHAXN8f+dwrR/qQsJ
   Q==;
X-CSE-ConnectionGUID: zEGjoCXfSZiVQNpJhGTorQ==
X-CSE-MsgGUID: XSE7P6xFSgiRkepV1xPDDA==
X-IronPort-AV: E=McAfee;i="6700,10204,11149"; a="31394141"
X-IronPort-AV: E=Sophos;i="6.09,250,1716274800"; 
   d="scan'208";a="31394141"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jul 2024 18:24:09 -0700
X-CSE-ConnectionGUID: k6NJwczbSm6WjWkJ86ogZQ==
X-CSE-MsgGUID: 4ltCtjLxS8GXSOo5i0lqUA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,250,1716274800"; 
   d="scan'208";a="59322099"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 30 Jul 2024 18:24:07 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sYy4T-000tZd-16;
	Wed, 31 Jul 2024 01:24:05 +0000
Date: Wed, 31 Jul 2024 09:23:57 +0800
From: kernel test robot <lkp@intel.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: linux-renesas-soc@vger.kernel.org
Subject: [geert-renesas-devel:renesas-dts-for-v6.12] BUILD SUCCESS
 ca999750b95caf4829dbd89ecff5c673107d257c
Message-ID: <202407310953.JbjwFp0P-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git renesas-dts-for-v6.12
branch HEAD: ca999750b95caf4829dbd89ecff5c673107d257c  arm64: dts: renesas: r8a779h0: Add PWM device nodes

Unverified Warning (likely false positive, please contact us if interested):

arch/arm64/boot/dts/renesas/r8a779h0-gray-hawk-single.dtb: pwm@e6e30000: compatible:0: 'renesas,pwm-r8a779h0' is not one of ['renesas,pwm-r8a7742', 'renesas,pwm-r8a7743', 'renesas,pwm-r8a7744', 'renesas,pwm-r8a7745', 'renesas,pwm-r8a77470', 'renesas,pwm-r8a774a1', 'renesas,pwm-r8a774b1', 'renesas,pwm-r8a774c0', 'renesas,pwm-r8a774e1', 'renesas,pwm-r8a7778', 'renesas,pwm-r8a7779', 'renesas,pwm-r8a7790', 'renesas,pwm-r8a7791', 'renesas,pwm-r8a7794', 'renesas,pwm-r8a7795', 'renesas,pwm-r8a7796', 'renesas,pwm-r8a77961', 'renesas,pwm-r8a77965', 'renesas,pwm-r8a77970', 'renesas,pwm-r8a77980', 'renesas,pwm-r8a77990', 'renesas,pwm-r8a77995', 'renesas,pwm-r8a779a0', 'renesas,pwm-r8a779g0']
arch/arm64/boot/dts/renesas/r8a779h0-gray-hawk-single.dtb: pwm@e6e31000: compatible:0: 'renesas,pwm-r8a779h0' is not one of ['renesas,pwm-r8a7742', 'renesas,pwm-r8a7743', 'renesas,pwm-r8a7744', 'renesas,pwm-r8a7745', 'renesas,pwm-r8a77470', 'renesas,pwm-r8a774a1', 'renesas,pwm-r8a774b1', 'renesas,pwm-r8a774c0', 'renesas,pwm-r8a774e1', 'renesas,pwm-r8a7778', 'renesas,pwm-r8a7779', 'renesas,pwm-r8a7790', 'renesas,pwm-r8a7791', 'renesas,pwm-r8a7794', 'renesas,pwm-r8a7795', 'renesas,pwm-r8a7796', 'renesas,pwm-r8a77961', 'renesas,pwm-r8a77965', 'renesas,pwm-r8a77970', 'renesas,pwm-r8a77980', 'renesas,pwm-r8a77990', 'renesas,pwm-r8a77995', 'renesas,pwm-r8a779a0', 'renesas,pwm-r8a779g0']
arch/arm64/boot/dts/renesas/r8a779h0-gray-hawk-single.dtb: pwm@e6e32000: compatible:0: 'renesas,pwm-r8a779h0' is not one of ['renesas,pwm-r8a7742', 'renesas,pwm-r8a7743', 'renesas,pwm-r8a7744', 'renesas,pwm-r8a7745', 'renesas,pwm-r8a77470', 'renesas,pwm-r8a774a1', 'renesas,pwm-r8a774b1', 'renesas,pwm-r8a774c0', 'renesas,pwm-r8a774e1', 'renesas,pwm-r8a7778', 'renesas,pwm-r8a7779', 'renesas,pwm-r8a7790', 'renesas,pwm-r8a7791', 'renesas,pwm-r8a7794', 'renesas,pwm-r8a7795', 'renesas,pwm-r8a7796', 'renesas,pwm-r8a77961', 'renesas,pwm-r8a77965', 'renesas,pwm-r8a77970', 'renesas,pwm-r8a77980', 'renesas,pwm-r8a77990', 'renesas,pwm-r8a77995', 'renesas,pwm-r8a779a0', 'renesas,pwm-r8a779g0']
arch/arm64/boot/dts/renesas/r8a779h0-gray-hawk-single.dtb: pwm@e6e33000: compatible:0: 'renesas,pwm-r8a779h0' is not one of ['renesas,pwm-r8a7742', 'renesas,pwm-r8a7743', 'renesas,pwm-r8a7744', 'renesas,pwm-r8a7745', 'renesas,pwm-r8a77470', 'renesas,pwm-r8a774a1', 'renesas,pwm-r8a774b1', 'renesas,pwm-r8a774c0', 'renesas,pwm-r8a774e1', 'renesas,pwm-r8a7778', 'renesas,pwm-r8a7779', 'renesas,pwm-r8a7790', 'renesas,pwm-r8a7791', 'renesas,pwm-r8a7794', 'renesas,pwm-r8a7795', 'renesas,pwm-r8a7796', 'renesas,pwm-r8a77961', 'renesas,pwm-r8a77965', 'renesas,pwm-r8a77970', 'renesas,pwm-r8a77980', 'renesas,pwm-r8a77990', 'renesas,pwm-r8a77995', 'renesas,pwm-r8a779a0', 'renesas,pwm-r8a779g0']
arch/arm64/boot/dts/renesas/r8a779h0-gray-hawk-single.dtb: pwm@e6e34000: compatible:0: 'renesas,pwm-r8a779h0' is not one of ['renesas,pwm-r8a7742', 'renesas,pwm-r8a7743', 'renesas,pwm-r8a7744', 'renesas,pwm-r8a7745', 'renesas,pwm-r8a77470', 'renesas,pwm-r8a774a1', 'renesas,pwm-r8a774b1', 'renesas,pwm-r8a774c0', 'renesas,pwm-r8a774e1', 'renesas,pwm-r8a7778', 'renesas,pwm-r8a7779', 'renesas,pwm-r8a7790', 'renesas,pwm-r8a7791', 'renesas,pwm-r8a7794', 'renesas,pwm-r8a7795', 'renesas,pwm-r8a7796', 'renesas,pwm-r8a77961', 'renesas,pwm-r8a77965', 'renesas,pwm-r8a77970', 'renesas,pwm-r8a77980', 'renesas,pwm-r8a77990', 'renesas,pwm-r8a77995', 'renesas,pwm-r8a779a0', 'renesas,pwm-r8a779g0']

Warning ids grouped by kconfigs:

recent_errors
`-- arm64-randconfig-051-20240730
    |-- arch-arm64-boot-dts-renesas-r8a779h0-gray-hawk-single.dtb:pwm-e6e30000:compatible:renesas-pwm-r8a779h0-is-not-one-of-renesas-pwm-r8a7742-renesas-pwm-r8a7743-renesas-pwm-r8a7744-renesas-pwm-r8a7745-ren
    |-- arch-arm64-boot-dts-renesas-r8a779h0-gray-hawk-single.dtb:pwm-e6e31000:compatible:renesas-pwm-r8a779h0-is-not-one-of-renesas-pwm-r8a7742-renesas-pwm-r8a7743-renesas-pwm-r8a7744-renesas-pwm-r8a7745-ren
    |-- arch-arm64-boot-dts-renesas-r8a779h0-gray-hawk-single.dtb:pwm-e6e32000:compatible:renesas-pwm-r8a779h0-is-not-one-of-renesas-pwm-r8a7742-renesas-pwm-r8a7743-renesas-pwm-r8a7744-renesas-pwm-r8a7745-ren
    |-- arch-arm64-boot-dts-renesas-r8a779h0-gray-hawk-single.dtb:pwm-e6e33000:compatible:renesas-pwm-r8a779h0-is-not-one-of-renesas-pwm-r8a7742-renesas-pwm-r8a7743-renesas-pwm-r8a7744-renesas-pwm-r8a7745-ren
    `-- arch-arm64-boot-dts-renesas-r8a779h0-gray-hawk-single.dtb:pwm-e6e34000:compatible:renesas-pwm-r8a779h0-is-not-one-of-renesas-pwm-r8a7742-renesas-pwm-r8a7743-renesas-pwm-r8a7744-renesas-pwm-r8a7745-ren

elapsed time: 918m

configs tested: 115
configs skipped: 112

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig   gcc-13.2.0
alpha                               defconfig   gcc-13.2.0
arc                               allnoconfig   gcc-13.2.0
arc                                 defconfig   gcc-13.2.0
arc                   randconfig-001-20240731   gcc-13.2.0
arc                   randconfig-002-20240731   gcc-13.2.0
arm                               allnoconfig   gcc-13.2.0
arm                                 defconfig   gcc-13.2.0
arm                   randconfig-001-20240731   gcc-13.2.0
arm                   randconfig-002-20240731   gcc-13.2.0
arm                   randconfig-003-20240731   gcc-13.2.0
arm                   randconfig-004-20240731   gcc-13.2.0
arm                        shmobile_defconfig   gcc-14.1.0
arm                           tegra_defconfig   gcc-14.1.0
arm64                            allmodconfig   clang-20
arm64                             allnoconfig   gcc-13.2.0
arm64                               defconfig   gcc-13.2.0
arm64                 randconfig-001-20240731   gcc-13.2.0
arm64                 randconfig-002-20240731   gcc-13.2.0
arm64                 randconfig-003-20240731   gcc-13.2.0
arm64                 randconfig-004-20240731   gcc-13.2.0
csky                              allnoconfig   gcc-13.2.0
csky                                defconfig   gcc-13.2.0
csky                  randconfig-001-20240731   gcc-13.2.0
csky                  randconfig-002-20240731   gcc-13.2.0
i386                             allmodconfig   clang-18
i386                              allnoconfig   clang-18
i386                             allyesconfig   clang-18
i386         buildonly-randconfig-001-20240731   clang-18
i386         buildonly-randconfig-002-20240731   clang-18
i386         buildonly-randconfig-003-20240731   clang-18
i386         buildonly-randconfig-004-20240731   clang-18
i386         buildonly-randconfig-005-20240731   clang-18
i386         buildonly-randconfig-006-20240731   clang-18
i386                                defconfig   clang-18
i386                  randconfig-001-20240731   clang-18
i386                  randconfig-002-20240731   clang-18
i386                  randconfig-003-20240731   clang-18
i386                  randconfig-004-20240731   clang-18
i386                  randconfig-005-20240731   clang-18
i386                  randconfig-006-20240731   clang-18
i386                  randconfig-011-20240731   clang-18
i386                  randconfig-012-20240731   clang-18
i386                  randconfig-013-20240731   clang-18
i386                  randconfig-014-20240731   clang-18
i386                  randconfig-015-20240731   clang-18
i386                  randconfig-016-20240731   clang-18
loongarch                        allmodconfig   gcc-14.1.0
loongarch                         allnoconfig   gcc-13.2.0
loongarch                           defconfig   gcc-13.2.0
loongarch             randconfig-001-20240731   gcc-13.2.0
loongarch             randconfig-002-20240731   gcc-13.2.0
m68k                             allmodconfig   gcc-14.1.0
m68k                              allnoconfig   gcc-13.2.0
m68k                             allyesconfig   gcc-14.1.0
m68k                         amcore_defconfig   gcc-14.1.0
m68k                          amiga_defconfig   gcc-14.1.0
m68k                                defconfig   gcc-13.2.0
microblaze                       allmodconfig   gcc-14.1.0
microblaze                        allnoconfig   gcc-13.2.0
microblaze                       allyesconfig   gcc-14.1.0
microblaze                          defconfig   gcc-13.2.0
mips                              allnoconfig   gcc-13.2.0
mips                       bmips_be_defconfig   gcc-14.1.0
mips                  decstation_64_defconfig   gcc-14.1.0
mips                           ip22_defconfig   gcc-14.1.0
mips                         rt305x_defconfig   gcc-14.1.0
nios2                             allnoconfig   gcc-13.2.0
nios2                               defconfig   gcc-13.2.0
nios2                 randconfig-001-20240731   gcc-13.2.0
nios2                 randconfig-002-20240731   gcc-13.2.0
openrisc                            defconfig   gcc-14.1.0
parisc                              defconfig   gcc-14.1.0
parisc                randconfig-001-20240731   gcc-13.2.0
parisc                randconfig-002-20240731   gcc-13.2.0
parisc64                            defconfig   gcc-13.2.0
powerpc                    adder875_defconfig   gcc-14.1.0
powerpc                     mpc83xx_defconfig   gcc-14.1.0
powerpc               randconfig-002-20240731   gcc-13.2.0
powerpc               randconfig-003-20240731   gcc-13.2.0
powerpc64             randconfig-001-20240731   gcc-13.2.0
powerpc64             randconfig-002-20240731   gcc-13.2.0
powerpc64             randconfig-003-20240731   gcc-13.2.0
riscv                            alldefconfig   gcc-14.1.0
riscv                               defconfig   gcc-14.1.0
riscv                 randconfig-001-20240731   gcc-13.2.0
riscv                 randconfig-002-20240731   gcc-13.2.0
s390                             allmodconfig   clang-20
s390                             allyesconfig   clang-20
s390                                defconfig   gcc-14.1.0
s390                  randconfig-001-20240731   gcc-13.2.0
s390                  randconfig-002-20240731   gcc-13.2.0
sh                                allnoconfig   gcc-13.2.0
sh                                  defconfig   gcc-14.1.0
sh                          landisk_defconfig   gcc-14.1.0
sh                    randconfig-001-20240731   gcc-13.2.0
sh                    randconfig-002-20240731   gcc-13.2.0
sh                   rts7751r2dplus_defconfig   gcc-14.1.0
sh                            shmin_defconfig   gcc-14.1.0
sparc64                             defconfig   gcc-14.1.0
sparc64               randconfig-001-20240731   gcc-13.2.0
sparc64               randconfig-002-20240731   gcc-13.2.0
um                                  defconfig   gcc-14.1.0
um                             i386_defconfig   gcc-14.1.0
um                    randconfig-001-20240731   gcc-13.2.0
um                    randconfig-002-20240731   gcc-13.2.0
um                           x86_64_defconfig   gcc-14.1.0
x86_64                            allnoconfig   clang-18
x86_64                           allyesconfig   clang-18
x86_64                              defconfig   clang-18
x86_64                          rhel-8.3-rust   clang-18
xtensa                            allnoconfig   gcc-13.2.0
xtensa                  nommu_kc705_defconfig   gcc-14.1.0
xtensa                randconfig-001-20240731   gcc-13.2.0
xtensa                randconfig-002-20240731   gcc-13.2.0

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

