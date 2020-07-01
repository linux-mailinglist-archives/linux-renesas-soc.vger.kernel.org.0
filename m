Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C9244210229
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  1 Jul 2020 04:41:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726560AbgGAClP (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 30 Jun 2020 22:41:15 -0400
Received: from mga01.intel.com ([192.55.52.88]:49068 "EHLO mga01.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726430AbgGAClP (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 30 Jun 2020 22:41:15 -0400
IronPort-SDR: EgIUYWM1VAEsE5iBkRxhggHqqUf435b5e36RgttbK7nCw3auveLuOJpscSctDbJiQzlfOjgqFm
 K9PoEJu7qooQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9668"; a="164448881"
X-IronPort-AV: E=Sophos;i="5.75,298,1589266800"; 
   d="scan'208";a="164448881"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jun 2020 19:41:14 -0700
IronPort-SDR: 3GyLObkUVaoc5Y1aU/siTRrLoHoRvbmSEEEadrM89W8F68NWTX5ggjTtaa4aC06A8T0Fd+3yb+
 l79tZ3v/YdCw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.75,298,1589266800"; 
   d="scan'208";a="277624268"
Received: from lkp-server01.sh.intel.com (HELO 28879958b202) ([10.239.97.150])
  by orsmga003.jf.intel.com with ESMTP; 30 Jun 2020 19:41:13 -0700
Received: from kbuild by 28879958b202 with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1jqSgS-0002LZ-En; Wed, 01 Jul 2020 02:41:12 +0000
Date:   Wed, 01 Jul 2020 10:39:20 +0800
From:   kernel test robot <lkp@intel.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     linux-renesas-soc@vger.kernel.org
Subject: [renesas-devel:master] BUILD SUCCESS
 b8fcc4d242c09d14b3e08581f253d59de858908a
Message-ID: <5efbf758.IrXQ/eIQ98o/6Je8%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git  master
branch HEAD: b8fcc4d242c09d14b3e08581f253d59de858908a  Merge branches 'renesas-next' and 'topic/renesas-defconfig', tag 'v5.8-rc3' into renesas-devel

elapsed time: 2477m

configs tested: 159
configs skipped: 16

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
s390                       zfcpdump_defconfig
c6x                                 defconfig
sh                            titan_defconfig
m68k                       bvme6000_defconfig
arm                          lpd270_defconfig
mips                         tb0287_defconfig
powerpc                  mpc866_ads_defconfig
mips                      pistachio_defconfig
sparc64                          allyesconfig
arm                         ebsa110_defconfig
powerpc                          g5_defconfig
mips                            e55_defconfig
s390                             alldefconfig
riscv                          rv32_defconfig
parisc                generic-64bit_defconfig
arm                        realview_defconfig
m68k                         amcore_defconfig
h8300                            alldefconfig
c6x                        evmc6457_defconfig
powerpc                     ep8248e_defconfig
arm                           omap1_defconfig
arm                        oxnas_v6_defconfig
openrisc                    or1ksim_defconfig
powerpc                           allnoconfig
m68k                          hp300_defconfig
sh                             espt_defconfig
arm                           stm32_defconfig
sparc                       sparc64_defconfig
m68k                              allnoconfig
mips                           mtx1_defconfig
arm                         orion5x_defconfig
mips                        bcm63xx_defconfig
arm                             pxa_defconfig
mips                 pnx8335_stb225_defconfig
mips                           xway_defconfig
mips                      pic32mzda_defconfig
um                             i386_defconfig
mips                        maltaup_defconfig
m68k                          multi_defconfig
m68k                                defconfig
sh                      rts7751r2d1_defconfig
arm                           viper_defconfig
powerpc                      ppc44x_defconfig
arm                          moxart_defconfig
sh                        sh7763rdp_defconfig
arm                        mvebu_v7_defconfig
arm                          exynos_defconfig
c6x                        evmc6474_defconfig
sh                           se7724_defconfig
arm                            pleb_defconfig
arm                             ezx_defconfig
xtensa                       common_defconfig
mips                       capcella_defconfig
arm                         lpc32xx_defconfig
arm                         nhk8815_defconfig
mips                           gcw0_defconfig
mips                     decstation_defconfig
arc                        nsim_700_defconfig
mips                       rbtx49xx_defconfig
i386                              allnoconfig
i386                             allyesconfig
i386                                defconfig
i386                              debian-10.3
ia64                             allmodconfig
ia64                                defconfig
ia64                              allnoconfig
ia64                             allyesconfig
m68k                             allmodconfig
m68k                           sun3_defconfig
m68k                             allyesconfig
nios2                               defconfig
openrisc                            defconfig
openrisc                         allyesconfig
nios2                            allyesconfig
c6x                              allyesconfig
c6x                               allnoconfig
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
i386                 randconfig-a006-20200629
i386                 randconfig-a002-20200629
i386                 randconfig-a003-20200629
i386                 randconfig-a001-20200629
i386                 randconfig-a004-20200629
i386                 randconfig-a005-20200629
x86_64               randconfig-a011-20200629
x86_64               randconfig-a012-20200629
x86_64               randconfig-a013-20200629
x86_64               randconfig-a014-20200629
x86_64               randconfig-a015-20200629
x86_64               randconfig-a016-20200629
i386                 randconfig-a011-20200630
i386                 randconfig-a016-20200630
i386                 randconfig-a015-20200630
i386                 randconfig-a012-20200630
i386                 randconfig-a014-20200630
i386                 randconfig-a013-20200630
i386                 randconfig-a013-20200629
i386                 randconfig-a016-20200629
i386                 randconfig-a014-20200629
i386                 randconfig-a012-20200629
i386                 randconfig-a015-20200629
i386                 randconfig-a011-20200629
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
sparc64                          allmodconfig
um                               allmodconfig
um                                allnoconfig
um                               allyesconfig
um                                  defconfig
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
