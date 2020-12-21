Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A69922E01CE
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 21 Dec 2020 22:09:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725791AbgLUVJH (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 21 Dec 2020 16:09:07 -0500
Received: from mga01.intel.com ([192.55.52.88]:20535 "EHLO mga01.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725782AbgLUVJG (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 21 Dec 2020 16:09:06 -0500
IronPort-SDR: aD/uKQEyfviTP5iRXVdN9Uyr5dYozwmpDXxCt2Q17a4XJcSm39IkuUmWqdTtewF09aPMaEwOYL
 a6d1/3jvygYA==
X-IronPort-AV: E=McAfee;i="6000,8403,9842"; a="194214624"
X-IronPort-AV: E=Sophos;i="5.78,437,1599548400"; 
   d="scan'208";a="194214624"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Dec 2020 13:08:26 -0800
IronPort-SDR: QSxuhTwxv0u5pI5JBlszl+wOur7lol5mL+yRlbVet2bwUBQYYteADd5VCdPJUTPOLYZfXxwR11
 /uemOis5RZbg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.78,437,1599548400"; 
   d="scan'208";a="391837046"
Received: from lkp-server01.sh.intel.com (HELO 65587561063d) ([10.239.97.150])
  by fmsmga002.fm.intel.com with ESMTP; 21 Dec 2020 13:08:25 -0800
Received: from kbuild by 65587561063d with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1krSPo-00015r-DU; Mon, 21 Dec 2020 21:08:24 +0000
Date:   Tue, 22 Dec 2020 05:07:53 +0800
From:   kernel test robot <lkp@intel.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     linux-renesas-soc@vger.kernel.org
Subject: [renesas-drivers:renesas-clk-for-v5.12] BUILD SUCCESS
 874b9d7808273e7eaf626c7e7f562d9afb8946d0
Message-ID: <5fe10ea9.4CsGVn8v3W0FoAGy%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git  renesas-clk-for-v5.12
branch HEAD: 874b9d7808273e7eaf626c7e7f562d9afb8946d0  clk: renesas: r8a779a0: Add VSPX clock support

elapsed time: 722m

configs tested: 122
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                                 defconfig
arm64                            allyesconfig
arm64                               defconfig
arm                              allyesconfig
arm                              allmodconfig
arm                       imx_v4_v5_defconfig
nios2                         3c120_defconfig
sh                   sh7724_generic_defconfig
sparc64                             defconfig
powerpc                  storcenter_defconfig
arm                     am200epdkit_defconfig
m68k                             alldefconfig
powerpc                     tqm5200_defconfig
sh                             espt_defconfig
powerpc                     rainier_defconfig
riscv                    nommu_virt_defconfig
arm                        magician_defconfig
powerpc                  mpc866_ads_defconfig
i386                             alldefconfig
parisc                generic-32bit_defconfig
powerpc                     sequoia_defconfig
powerpc                 mpc832x_mds_defconfig
arm                           u8500_defconfig
mips                       capcella_defconfig
mips                            e55_defconfig
sh                        sh7757lcr_defconfig
arc                          axs103_defconfig
powerpc                    mvme5100_defconfig
arm                           omap1_defconfig
s390                             alldefconfig
c6x                        evmc6474_defconfig
sh                               j2_defconfig
powerpc                       holly_defconfig
arm                        mini2440_defconfig
sh                  sh7785lcr_32bit_defconfig
nds32                             allnoconfig
x86_64                           alldefconfig
sparc                       sparc64_defconfig
m68k                       bvme6000_defconfig
h8300                     edosk2674_defconfig
mips                      malta_kvm_defconfig
sh                          sdk7780_defconfig
xtensa                              defconfig
h8300                            alldefconfig
mips                      maltasmvp_defconfig
mips                         tb0287_defconfig
openrisc                            defconfig
arm                          ep93xx_defconfig
c6x                              alldefconfig
powerpc                    klondike_defconfig
powerpc                      cm5200_defconfig
arm                  colibri_pxa270_defconfig
xtensa                           alldefconfig
ia64                             allmodconfig
ia64                                defconfig
ia64                             allyesconfig
m68k                             allmodconfig
m68k                                defconfig
m68k                             allyesconfig
nios2                               defconfig
arc                              allyesconfig
c6x                              allyesconfig
nds32                               defconfig
nios2                            allyesconfig
csky                                defconfig
alpha                               defconfig
alpha                            allyesconfig
xtensa                           allyesconfig
h8300                            allyesconfig
arc                                 defconfig
sh                               allmodconfig
parisc                              defconfig
s390                             allyesconfig
parisc                           allyesconfig
s390                                defconfig
i386                             allyesconfig
sparc                            allyesconfig
sparc                               defconfig
i386                               tinyconfig
i386                                defconfig
mips                             allyesconfig
mips                             allmodconfig
powerpc                          allyesconfig
powerpc                          allmodconfig
powerpc                           allnoconfig
x86_64               randconfig-a001-20201221
x86_64               randconfig-a002-20201221
x86_64               randconfig-a003-20201221
i386                 randconfig-a002-20201221
i386                 randconfig-a005-20201221
i386                 randconfig-a006-20201221
i386                 randconfig-a004-20201221
i386                 randconfig-a003-20201221
i386                 randconfig-a001-20201221
i386                 randconfig-a011-20201221
i386                 randconfig-a016-20201221
i386                 randconfig-a014-20201221
i386                 randconfig-a012-20201221
i386                 randconfig-a015-20201221
i386                 randconfig-a013-20201221
x86_64               randconfig-a006-20201221
x86_64               randconfig-a004-20201221
x86_64               randconfig-a005-20201221
riscv                    nommu_k210_defconfig
riscv                            allyesconfig
riscv                             allnoconfig
riscv                               defconfig
riscv                          rv32_defconfig
riscv                            allmodconfig
x86_64                                   rhel
x86_64                           allyesconfig
x86_64                    rhel-7.6-kselftests
x86_64                              defconfig
x86_64                               rhel-8.3
x86_64                      rhel-8.3-kbuiltin
x86_64                                  kexec

clang tested configs:
x86_64               randconfig-a015-20201221
x86_64               randconfig-a014-20201221
x86_64               randconfig-a016-20201221
x86_64               randconfig-a012-20201221
x86_64               randconfig-a013-20201221
x86_64               randconfig-a011-20201221

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
