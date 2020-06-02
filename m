Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EB3C61EC1CC
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  2 Jun 2020 20:30:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726223AbgFBSaj (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 2 Jun 2020 14:30:39 -0400
Received: from mga12.intel.com ([192.55.52.136]:35581 "EHLO mga12.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726139AbgFBSaj (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 2 Jun 2020 14:30:39 -0400
IronPort-SDR: L0CCZzb3JymSgWRydw9S+lTEJV0CV+7mg3OOLgoeNF+57WKn7ci2b7WmdTBI5wvV99kJR0BRRW
 VbkRyxRg3e6g==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jun 2020 11:30:38 -0700
IronPort-SDR: 8hGaFSp6GGaxdVfp0qOtlDDl01Do0a/3+1Odzv4HSrFHlqbaeTe+gAI9e6jfMaNpmQGafxZuqH
 6xTUFN9WGqoQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,465,1583222400"; 
   d="scan'208";a="293674742"
Received: from lkp-server01.sh.intel.com (HELO e5a7ad696f24) ([10.239.97.150])
  by fmsmga004.fm.intel.com with ESMTP; 02 Jun 2020 11:30:37 -0700
Received: from kbuild by e5a7ad696f24 with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1jgBgK-000067-Mn; Tue, 02 Jun 2020 18:30:36 +0000
Date:   Wed, 03 Jun 2020 02:30:05 +0800
From:   kbuild test robot <lkp@intel.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     linux-renesas-soc@vger.kernel.org
Subject: [renesas-devel:renesas-arm-dt-for-v5.9] BUILD SUCCESS
 4f0c94c7bbb83cf53a74bcaea9ef394f0b15ae53
Message-ID: <5ed69aad.0szGkAl0rF7wRZMW%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git  renesas-arm-dt-for-v5.9
branch HEAD: 4f0c94c7bbb83cf53a74bcaea9ef394f0b15ae53  ARM: dts: r8a7742: Add CMT SoC specific support

elapsed time: 483m

configs tested: 135
configs skipped: 6

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
mips                malta_qemu_32r6_defconfig
arm                      footbridge_defconfig
sh                            shmin_defconfig
mips                     loongson1b_defconfig
sh                        sh7763rdp_defconfig
ia64                              allnoconfig
sh                           se7619_defconfig
mips                           ip28_defconfig
xtensa                generic_kc705_defconfig
arc                             nps_defconfig
arm                        keystone_defconfig
arm                        multi_v5_defconfig
arm                        shmobile_defconfig
mips                           xway_defconfig
arm                          ixp4xx_defconfig
sh                           se7780_defconfig
alpha                            alldefconfig
mips                  maltasmvp_eva_defconfig
sh                        dreamcast_defconfig
sh                          lboxre2_defconfig
arm                           corgi_defconfig
arm                         bcm2835_defconfig
sh                         microdev_defconfig
powerpc                mpc7448_hpc2_defconfig
arm                            u300_defconfig
arm                          simpad_defconfig
arm                           efm32_defconfig
nios2                         3c120_defconfig
powerpc                      pasemi_defconfig
m68k                       m5208evb_defconfig
sh                         apsh4a3a_defconfig
arm                    vt8500_v6_v7_defconfig
arm                         hackkit_defconfig
mips                     cu1000-neo_defconfig
x86_64                              defconfig
arm                         lpc18xx_defconfig
arm                              zx_defconfig
ia64                             alldefconfig
mips                        nlm_xlp_defconfig
i386                              allnoconfig
i386                             allyesconfig
i386                                defconfig
i386                              debian-10.3
ia64                             allmodconfig
ia64                                defconfig
ia64                             allyesconfig
m68k                             allmodconfig
m68k                              allnoconfig
m68k                           sun3_defconfig
m68k                                defconfig
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
mips                              allnoconfig
mips                             allmodconfig
parisc                            allnoconfig
parisc                              defconfig
parisc                           allyesconfig
parisc                           allmodconfig
powerpc                             defconfig
powerpc                          allyesconfig
powerpc                          rhel-kconfig
powerpc                          allmodconfig
powerpc                           allnoconfig
i386                 randconfig-a001-20200602
i386                 randconfig-a006-20200602
i386                 randconfig-a002-20200602
i386                 randconfig-a005-20200602
i386                 randconfig-a003-20200602
i386                 randconfig-a004-20200602
x86_64               randconfig-a011-20200602
x86_64               randconfig-a016-20200602
x86_64               randconfig-a013-20200602
x86_64               randconfig-a012-20200602
x86_64               randconfig-a014-20200602
x86_64               randconfig-a015-20200602
i386                 randconfig-a014-20200602
i386                 randconfig-a015-20200602
i386                 randconfig-a011-20200602
i386                 randconfig-a016-20200602
i386                 randconfig-a012-20200602
i386                 randconfig-a013-20200602
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
um                               allmodconfig
um                                allnoconfig
um                               allyesconfig
um                                  defconfig
x86_64                                   rhel
x86_64                               rhel-7.6
x86_64                    rhel-7.6-kselftests
x86_64                         rhel-7.2-clear
x86_64                                    lkp
x86_64                              fedora-25
x86_64                                  kexec

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
