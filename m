Return-Path: <linux-renesas-soc+bounces-7653-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 34100942884
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 31 Jul 2024 09:59:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B6E8F1F24270
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 31 Jul 2024 07:59:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4FED223BB;
	Wed, 31 Jul 2024 07:59:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Kxz4t/cR"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75D7E1A721F
	for <linux-renesas-soc@vger.kernel.org>; Wed, 31 Jul 2024 07:59:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722412774; cv=none; b=X1+SSvP4wG7W/bTkAKQoUl1H6ERkSJVvkDMwqfn5LUfxZwp1pzawGEt5x8hMGpBNPsoYQmK0bvQ/fVfD9dLCj4Pcy7wY6hHZF0i56iYhoqhgDlqrTcvyZ+v+8M9WVLyGtYTTexrz7gRVQQoRj0xkjGDKy2ToGDHGUXamA7v+js4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722412774; c=relaxed/simple;
	bh=/mceHvOiQo7A56mI49wBNSTfJ1NB4bIue1K4yocc78w=;
	h=Date:From:To:Cc:Subject:Message-ID; b=ho0Yiqt4DWj/U1HuzMnCRYIdkQ89ufiHbLJgmPu0jnMw2aqiF0vMMteXwHkYRnhDQ2ljQFtlmoar8BRV2CIZ3FqJ2RdE5O1I2rN/9k2MlcjeqttUb3qCVbUmI4Rg07f/gW17d2oGKgMlmJcTHeK1CrdRViRVW65YSC0PAaIXgRg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Kxz4t/cR; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1722412772; x=1753948772;
  h=date:from:to:cc:subject:message-id;
  bh=/mceHvOiQo7A56mI49wBNSTfJ1NB4bIue1K4yocc78w=;
  b=Kxz4t/cRi4Re5VCiPA8bCm4P8u74WN9STZaiEBYAdslxlUy0cEaNLupi
   KVABoeviyAQi0WIhVef8wTE/InV9dE9/8esjGSBNqrIdqaPTFkVPaZE6R
   tdn8XpBztFVwZ0RhLIFNFAk7velktP0/kXoEB2s3OLJq34BCa2vKLlxHO
   WbLula09VtdSEpUOd8FjZWHqh5813gdAhQaW87ih5tn8QBMKliqwb1GcL
   brW+hneSIb4GjvGQv9WYSf7QxsvEW4A0St9axnxapF9PA7uD9kC2jq0cl
   65YNeFZE8GAjQ35OISk+Qx8sGpHhXe+hVo7+H5qIhIxn1N9qLpFDnwPXy
   w==;
X-CSE-ConnectionGUID: depTFQgZTrCzv6+BQIhc7w==
X-CSE-MsgGUID: fuUyEj1aRPyrN1bMBc+1WQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11149"; a="30937194"
X-IronPort-AV: E=Sophos;i="6.09,250,1716274800"; 
   d="scan'208";a="30937194"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Jul 2024 00:59:27 -0700
X-CSE-ConnectionGUID: PNHR9IJQSvOxy7aRzgs85g==
X-CSE-MsgGUID: Agc77NoWQX6kXOE0NH8BuA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,250,1716274800"; 
   d="scan'208";a="59396975"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 31 Jul 2024 00:59:26 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sZ4F2-000u1Q-08;
	Wed, 31 Jul 2024 07:59:24 +0000
Date: Wed, 31 Jul 2024 15:58:55 +0800
From: kernel test robot <lkp@intel.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: linux-renesas-soc@vger.kernel.org
Subject: [geert-renesas-devel:renesas-dt-bindings-for-v6.12] BUILD
 SUCCESS 9f766e8f5c2366d7237735a826084569b5705cf4
Message-ID: <202407311552.xkzfyxPG-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git renesas-dt-bindings-for-v6.12
branch HEAD: 9f766e8f5c2366d7237735a826084569b5705cf4  dt-bindings: reset: renesas: Document RZ/G2M v3.0 (r8a774a3) reset module

elapsed time: 1314m

configs tested: 231
configs skipped: 5

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig   gcc-13.2.0
alpha                            allyesconfig   gcc-13.3.0
alpha                               defconfig   gcc-13.2.0
arc                              allmodconfig   gcc-13.2.0
arc                               allnoconfig   gcc-13.2.0
arc                              allyesconfig   gcc-13.2.0
arc                                 defconfig   gcc-13.2.0
arc                   randconfig-001-20240731   gcc-13.2.0
arc                   randconfig-002-20240731   gcc-13.2.0
arm                              allmodconfig   gcc-13.2.0
arm                              allmodconfig   gcc-14.1.0
arm                               allnoconfig   gcc-13.2.0
arm                              allyesconfig   gcc-13.2.0
arm                              allyesconfig   gcc-14.1.0
arm                     am200epdkit_defconfig   gcc-14.1.0
arm                       aspeed_g4_defconfig   gcc-14.1.0
arm                                 defconfig   gcc-13.2.0
arm                            hisi_defconfig   gcc-14.1.0
arm                         lpc18xx_defconfig   gcc-14.1.0
arm                          moxart_defconfig   gcc-14.1.0
arm                       netwinder_defconfig   gcc-14.1.0
arm                          pxa910_defconfig   gcc-14.1.0
arm                   randconfig-001-20240731   gcc-13.2.0
arm                   randconfig-002-20240731   gcc-13.2.0
arm                   randconfig-003-20240731   gcc-13.2.0
arm                   randconfig-004-20240731   gcc-13.2.0
arm                        shmobile_defconfig   gcc-14.1.0
arm                           tegra_defconfig   gcc-14.1.0
arm64                            allmodconfig   clang-20
arm64                            allmodconfig   gcc-13.2.0
arm64                             allnoconfig   gcc-13.2.0
arm64                            allyesconfig   clang-20
arm64                               defconfig   gcc-13.2.0
arm64                 randconfig-001-20240731   gcc-13.2.0
arm64                 randconfig-002-20240731   gcc-13.2.0
arm64                 randconfig-003-20240731   gcc-13.2.0
arm64                 randconfig-004-20240731   gcc-13.2.0
csky                              allnoconfig   gcc-13.2.0
csky                                defconfig   gcc-13.2.0
csky                                defconfig   gcc-14.1.0
csky                  randconfig-001-20240731   gcc-13.2.0
csky                  randconfig-002-20240731   gcc-13.2.0
hexagon                          allmodconfig   clang-20
hexagon                          allyesconfig   clang-20
i386                             allmodconfig   clang-18
i386                             allmodconfig   gcc-13
i386                              allnoconfig   clang-18
i386                              allnoconfig   gcc-13
i386                             allyesconfig   clang-18
i386                             allyesconfig   gcc-13
i386         buildonly-randconfig-001-20240730   gcc-13
i386         buildonly-randconfig-001-20240731   clang-18
i386         buildonly-randconfig-002-20240730   gcc-13
i386         buildonly-randconfig-002-20240731   clang-18
i386         buildonly-randconfig-003-20240730   clang-18
i386         buildonly-randconfig-003-20240731   clang-18
i386         buildonly-randconfig-004-20240730   clang-18
i386         buildonly-randconfig-004-20240731   clang-18
i386         buildonly-randconfig-005-20240730   gcc-13
i386         buildonly-randconfig-005-20240731   clang-18
i386         buildonly-randconfig-006-20240730   clang-18
i386         buildonly-randconfig-006-20240731   clang-18
i386                                defconfig   clang-18
i386                  randconfig-001-20240730   gcc-8
i386                  randconfig-001-20240731   clang-18
i386                  randconfig-002-20240730   gcc-13
i386                  randconfig-002-20240731   clang-18
i386                  randconfig-003-20240730   gcc-13
i386                  randconfig-003-20240731   clang-18
i386                  randconfig-004-20240730   gcc-13
i386                  randconfig-004-20240731   clang-18
i386                  randconfig-005-20240730   gcc-10
i386                  randconfig-005-20240731   clang-18
i386                  randconfig-006-20240730   gcc-10
i386                  randconfig-006-20240731   clang-18
i386                  randconfig-011-20240730   gcc-11
i386                  randconfig-011-20240731   clang-18
i386                  randconfig-012-20240730   clang-18
i386                  randconfig-012-20240731   clang-18
i386                  randconfig-013-20240730   clang-18
i386                  randconfig-013-20240731   clang-18
i386                  randconfig-014-20240730   gcc-9
i386                  randconfig-014-20240731   clang-18
i386                  randconfig-015-20240730   gcc-9
i386                  randconfig-015-20240731   clang-18
i386                  randconfig-016-20240730   clang-18
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
m68k                        m5272c3_defconfig   gcc-14.1.0
m68k                          multi_defconfig   gcc-14.1.0
m68k                        mvme16x_defconfig   gcc-14.1.0
microblaze                       allmodconfig   gcc-14.1.0
microblaze                        allnoconfig   gcc-13.2.0
microblaze                       allyesconfig   gcc-14.1.0
microblaze                          defconfig   gcc-13.2.0
mips                             allmodconfig   clang-20
mips                              allnoconfig   gcc-13.2.0
mips                             allyesconfig   clang-20
mips                       bmips_be_defconfig   gcc-14.1.0
mips                  decstation_64_defconfig   gcc-14.1.0
mips                           ip22_defconfig   gcc-14.1.0
mips                      loongson3_defconfig   gcc-14.1.0
mips                         rt305x_defconfig   gcc-14.1.0
nios2                            alldefconfig   gcc-14.1.0
nios2                             allnoconfig   gcc-13.2.0
nios2                               defconfig   gcc-13.2.0
nios2                 randconfig-001-20240731   gcc-13.2.0
nios2                 randconfig-002-20240731   gcc-13.2.0
openrisc                          allnoconfig   gcc-14.1.0
openrisc                         allyesconfig   gcc-14.1.0
openrisc                            defconfig   gcc-14.1.0
parisc                           allmodconfig   gcc-14.1.0
parisc                            allnoconfig   gcc-14.1.0
parisc                           allyesconfig   gcc-14.1.0
parisc                              defconfig   gcc-14.1.0
parisc                randconfig-001-20240731   gcc-13.2.0
parisc                randconfig-002-20240731   gcc-13.2.0
parisc64                            defconfig   gcc-13.2.0
powerpc                    adder875_defconfig   gcc-14.1.0
powerpc                          allmodconfig   gcc-14.1.0
powerpc                           allnoconfig   gcc-14.1.0
powerpc                          allyesconfig   clang-20
powerpc                          allyesconfig   gcc-14.1.0
powerpc                   bluestone_defconfig   gcc-14.1.0
powerpc                          g5_defconfig   gcc-14.1.0
powerpc                   lite5200b_defconfig   gcc-14.1.0
powerpc                     mpc5200_defconfig   gcc-14.1.0
powerpc                     mpc83xx_defconfig   gcc-14.1.0
powerpc               randconfig-002-20240731   gcc-13.2.0
powerpc               randconfig-003-20240731   gcc-13.2.0
powerpc                     tqm5200_defconfig   gcc-14.1.0
powerpc                     tqm8541_defconfig   gcc-14.1.0
powerpc64             randconfig-001-20240731   gcc-13.2.0
powerpc64             randconfig-002-20240731   gcc-13.2.0
powerpc64             randconfig-003-20240731   gcc-13.2.0
riscv                            alldefconfig   gcc-14.1.0
riscv                            allmodconfig   clang-20
riscv                            allmodconfig   gcc-14.1.0
riscv                             allnoconfig   gcc-14.1.0
riscv                            allyesconfig   clang-20
riscv                            allyesconfig   gcc-14.1.0
riscv                               defconfig   gcc-14.1.0
riscv                 randconfig-001-20240731   gcc-13.2.0
riscv                 randconfig-002-20240731   gcc-13.2.0
s390                             allmodconfig   clang-20
s390                              allnoconfig   clang-20
s390                              allnoconfig   gcc-14.1.0
s390                             allyesconfig   clang-20
s390                             allyesconfig   gcc-14.1.0
s390                                defconfig   gcc-14.1.0
s390                  randconfig-001-20240731   gcc-13.2.0
s390                  randconfig-002-20240731   gcc-13.2.0
sh                               allmodconfig   gcc-14.1.0
sh                                allnoconfig   gcc-13.2.0
sh                               allyesconfig   gcc-14.1.0
sh                                  defconfig   gcc-14.1.0
sh                ecovec24-romimage_defconfig   gcc-14.1.0
sh                        edosk7705_defconfig   gcc-14.1.0
sh                          kfr2r09_defconfig   gcc-14.1.0
sh                          landisk_defconfig   gcc-14.1.0
sh                            migor_defconfig   gcc-14.1.0
sh                    randconfig-001-20240731   gcc-13.2.0
sh                    randconfig-002-20240731   gcc-13.2.0
sh                          rsk7201_defconfig   gcc-14.1.0
sh                   rts7751r2dplus_defconfig   gcc-14.1.0
sh                           se7712_defconfig   gcc-14.1.0
sh                        sh7763rdp_defconfig   gcc-14.1.0
sh                  sh7785lcr_32bit_defconfig   gcc-14.1.0
sh                            shmin_defconfig   gcc-14.1.0
sh                          urquell_defconfig   gcc-14.1.0
sparc                            allmodconfig   gcc-14.1.0
sparc64                             defconfig   gcc-14.1.0
sparc64               randconfig-001-20240731   gcc-13.2.0
sparc64               randconfig-002-20240731   gcc-13.2.0
um                               allmodconfig   clang-20
um                               allmodconfig   gcc-13.3.0
um                                allnoconfig   clang-17
um                                allnoconfig   gcc-14.1.0
um                               allyesconfig   gcc-13
um                               allyesconfig   gcc-13.3.0
um                                  defconfig   gcc-14.1.0
um                             i386_defconfig   gcc-14.1.0
um                    randconfig-001-20240731   gcc-13.2.0
um                    randconfig-002-20240731   gcc-13.2.0
um                           x86_64_defconfig   gcc-14.1.0
x86_64                            allnoconfig   clang-18
x86_64                           allyesconfig   clang-18
x86_64       buildonly-randconfig-001-20240731   gcc-13
x86_64       buildonly-randconfig-002-20240731   gcc-13
x86_64       buildonly-randconfig-003-20240731   gcc-13
x86_64       buildonly-randconfig-004-20240731   gcc-13
x86_64       buildonly-randconfig-005-20240731   gcc-13
x86_64       buildonly-randconfig-006-20240731   gcc-13
x86_64                              defconfig   clang-18
x86_64                              defconfig   gcc-13
x86_64                                  kexec   clang-18
x86_64                randconfig-001-20240731   gcc-13
x86_64                randconfig-002-20240731   gcc-13
x86_64                randconfig-003-20240731   gcc-13
x86_64                randconfig-004-20240731   gcc-13
x86_64                randconfig-005-20240731   gcc-13
x86_64                randconfig-006-20240731   gcc-13
x86_64                randconfig-011-20240731   gcc-13
x86_64                randconfig-012-20240731   gcc-13
x86_64                randconfig-013-20240731   gcc-13
x86_64                randconfig-014-20240731   gcc-13
x86_64                randconfig-015-20240731   gcc-13
x86_64                randconfig-016-20240731   gcc-13
x86_64                randconfig-071-20240731   gcc-13
x86_64                randconfig-072-20240731   gcc-13
x86_64                randconfig-073-20240731   gcc-13
x86_64                randconfig-074-20240731   gcc-13
x86_64                randconfig-075-20240731   gcc-13
x86_64                randconfig-076-20240731   gcc-13
x86_64                          rhel-8.3-rust   clang-18
x86_64                               rhel-8.3   clang-18
xtensa                            allnoconfig   gcc-13.2.0
xtensa                          iss_defconfig   gcc-14.1.0
xtensa                  nommu_kc705_defconfig   gcc-14.1.0
xtensa                randconfig-001-20240731   gcc-13.2.0
xtensa                randconfig-002-20240731   gcc-13.2.0

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

