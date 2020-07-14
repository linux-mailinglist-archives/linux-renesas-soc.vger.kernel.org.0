Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 064B421EE10
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 14 Jul 2020 12:35:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726252AbgGNKf2 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 14 Jul 2020 06:35:28 -0400
Received: from mga14.intel.com ([192.55.52.115]:53645 "EHLO mga14.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725841AbgGNKf1 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 14 Jul 2020 06:35:27 -0400
IronPort-SDR: hDH74j12hrHOva8buYgsNY7CKzmkM2M8J2pLhtApsCSArexG4VRX//KgDDcBtjFGTLravdfnmS
 WuQJX9kvZ4BA==
X-IronPort-AV: E=McAfee;i="6000,8403,9681"; a="147998752"
X-IronPort-AV: E=Sophos;i="5.75,350,1589266800"; 
   d="scan'208";a="147998752"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Jul 2020 03:35:27 -0700
IronPort-SDR: kNJoM7pd/5xj5zq3xeLOBl+uVrszoxysvGLxI5+9wmirJUZBQqg218IqCtJTQiv/Hx0H1mv269
 ITLBO06gnH8w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.75,350,1589266800"; 
   d="scan'208";a="285713414"
Received: from lkp-server02.sh.intel.com (HELO 393d9bdf0d5c) ([10.239.97.151])
  by orsmga006.jf.intel.com with ESMTP; 14 Jul 2020 03:35:26 -0700
Received: from kbuild by 393d9bdf0d5c with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1jvIHV-00006D-5B; Tue, 14 Jul 2020 10:35:25 +0000
Date:   Tue, 14 Jul 2020 18:34:23 +0800
From:   kernel test robot <lkp@intel.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     linux-renesas-soc@vger.kernel.org
Subject: [renesas-devel:renesas-arm-dt-for-v5.9] BUILD SUCCESS
 f7a10e792ff4ed25b6ac8bdd5482653ae9e2bb47
Message-ID: <5f0d8a2f.lWwd4Ms5aAlMW/p3%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git  renesas-arm-dt-for-v5.9
branch HEAD: f7a10e792ff4ed25b6ac8bdd5482653ae9e2bb47  arm64: dts: renesas: Add HiHope RZ/G2H sub board support

elapsed time: 1172m

configs tested: 144
configs skipped: 114

The following configs have been built successfully.
More configs may be tested in the coming days.

arm                                 defconfig
arm                              allyesconfig
arm                              allmodconfig
arm                               allnoconfig
arm64                            allyesconfig
arm64                               defconfig
arm64                            allmodconfig
arm64                             allnoconfig
mips                         tb0287_defconfig
arm64                            alldefconfig
arm                        mini2440_defconfig
arm                            hisi_defconfig
powerpc                      ppc40x_defconfig
arm                         axm55xx_defconfig
arm                           sama5_defconfig
sh                         apsh4a3a_defconfig
riscv                    nommu_virt_defconfig
m68k                                defconfig
m68k                       m5249evb_defconfig
m68k                         amcore_defconfig
h8300                               defconfig
mips                         tb0219_defconfig
powerpc                     pq2fads_defconfig
arm                         bcm2835_defconfig
sh                             espt_defconfig
ia64                        generic_defconfig
powerpc                      mgcoge_defconfig
m68k                        mvme16x_defconfig
arc                            hsdk_defconfig
arm                           h5000_defconfig
arm                          collie_defconfig
arm                    vt8500_v6_v7_defconfig
powerpc                     mpc5200_defconfig
sh                        apsh4ad0a_defconfig
mips                              allnoconfig
parisc                           alldefconfig
ia64                      gensparse_defconfig
sh                           se7721_defconfig
arm                     am200epdkit_defconfig
xtensa                       common_defconfig
i386                              allnoconfig
parisc                           allmodconfig
xtensa                generic_kc705_defconfig
sh                          rsk7203_defconfig
i386                             allyesconfig
i386                                defconfig
i386                              debian-10.3
ia64                             allmodconfig
ia64                                defconfig
ia64                              allnoconfig
ia64                             allyesconfig
m68k                             allmodconfig
m68k                              allnoconfig
m68k                           sun3_defconfig
m68k                             allyesconfig
nios2                               defconfig
nios2                            allyesconfig
openrisc                            defconfig
c6x                              allyesconfig
c6x                               allnoconfig
openrisc                         allyesconfig
nds32                               defconfig
nds32                             allnoconfig
csky                             allyesconfig
csky                                defconfig
alpha                               defconfig
alpha                            allyesconfig
xtensa                           allyesconfig
h8300                            allyesconfig
h8300                            allmodconfig
xtensa                              defconfig
arc                                 defconfig
arc                              allyesconfig
sh                               allmodconfig
sh                                allnoconfig
microblaze                        allnoconfig
mips                             allyesconfig
mips                             allmodconfig
parisc                            allnoconfig
parisc                              defconfig
parisc                           allyesconfig
powerpc                             defconfig
powerpc                          allyesconfig
powerpc                          rhel-kconfig
powerpc                          allmodconfig
powerpc                           allnoconfig
i386                 randconfig-a001-20200713
i386                 randconfig-a005-20200713
i386                 randconfig-a006-20200713
i386                 randconfig-a002-20200713
i386                 randconfig-a003-20200713
i386                 randconfig-a004-20200713
i386                 randconfig-a001-20200714
i386                 randconfig-a005-20200714
i386                 randconfig-a002-20200714
i386                 randconfig-a006-20200714
i386                 randconfig-a003-20200714
i386                 randconfig-a004-20200714
x86_64               randconfig-a012-20200714
x86_64               randconfig-a011-20200714
x86_64               randconfig-a016-20200714
x86_64               randconfig-a014-20200714
x86_64               randconfig-a013-20200714
x86_64               randconfig-a015-20200714
i386                 randconfig-a016-20200713
i386                 randconfig-a015-20200713
i386                 randconfig-a011-20200713
i386                 randconfig-a012-20200713
i386                 randconfig-a013-20200713
i386                 randconfig-a014-20200713
i386                 randconfig-a016-20200714
i386                 randconfig-a011-20200714
i386                 randconfig-a015-20200714
i386                 randconfig-a012-20200714
i386                 randconfig-a013-20200714
i386                 randconfig-a014-20200714
x86_64               randconfig-a005-20200713
x86_64               randconfig-a002-20200713
x86_64               randconfig-a006-20200713
x86_64               randconfig-a001-20200713
x86_64               randconfig-a003-20200713
x86_64               randconfig-a004-20200713
riscv                            allyesconfig
riscv                             allnoconfig
riscv                               defconfig
riscv                            allmodconfig
s390                             allyesconfig
s390                              allnoconfig
s390                             allmodconfig
s390                                defconfig
sparc                            allyesconfig
sparc                               defconfig
sparc64                             defconfig
sparc64                           allnoconfig
sparc64                          allyesconfig
sparc64                          allmodconfig
x86_64                               rhel-7.6
x86_64                    rhel-7.6-kselftests
x86_64                               rhel-8.3
x86_64                                  kexec
x86_64                                   rhel
x86_64                         rhel-7.2-clear
x86_64                                    lkp
x86_64                              fedora-25

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
