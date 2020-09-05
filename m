Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B259925E846
	for <lists+linux-renesas-soc@lfdr.de>; Sat,  5 Sep 2020 16:07:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727875AbgIEOHJ (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Sat, 5 Sep 2020 10:07:09 -0400
Received: from mga12.intel.com ([192.55.52.136]:49365 "EHLO mga12.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728642AbgIEOHE (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sat, 5 Sep 2020 10:07:04 -0400
IronPort-SDR: NyPRbip0yEi1zXKQ/Hu7WHPnXXuWlqFovoyQ1NkxN2Oy+yNJar7u5r6vmpfYUMfi3zbypbPRaY
 YcgCdyiZSJXg==
X-IronPort-AV: E=McAfee;i="6000,8403,9734"; a="137380911"
X-IronPort-AV: E=Sophos;i="5.76,394,1592895600"; 
   d="scan'208";a="137380911"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Sep 2020 07:07:01 -0700
IronPort-SDR: q+gjQDfHAEyEys99Iz40M5MQyhlevwn2NfKz9BDm0rEBeEv7DhZ6up5q4hRRBTN2MSUpJlUq5b
 FgqQyumwL3bw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.76,394,1592895600"; 
   d="scan'208";a="447718595"
Received: from lkp-server02.sh.intel.com (HELO c089623da072) ([10.239.97.151])
  by orsmga004.jf.intel.com with ESMTP; 05 Sep 2020 07:06:59 -0700
Received: from kbuild by c089623da072 with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1kEYqI-0000Di-DJ; Sat, 05 Sep 2020 14:06:58 +0000
Date:   Sat, 05 Sep 2020 22:06:40 +0800
From:   kernel test robot <lkp@intel.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     linux-renesas-soc@vger.kernel.org
Subject: [renesas-drivers:clk-renesas] BUILD SUCCESS
 e41cb217932969a20cea9c44299c449236058e43
Message-ID: <5f539b70.iQ8fgpqeEE8dZE2q%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git  clk-renesas
branch HEAD: e41cb217932969a20cea9c44299c449236058e43  clk: renesas: rcar-gen2: Rename vsp1-(sy|rt) clocks to vsp(s|r)

elapsed time: 1635m

configs tested: 183
configs skipped: 15

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                                 defconfig
arm64                            allyesconfig
arm64                               defconfig
arm                              allyesconfig
arm                              allmodconfig
arc                     haps_hs_smp_defconfig
m68k                            q40_defconfig
m68k                       m5208evb_defconfig
m68k                       m5249evb_defconfig
arm                         mv78xx0_defconfig
sh                        edosk7705_defconfig
arc                 nsimosci_hs_smp_defconfig
m68k                          atari_defconfig
mips                     loongson1c_defconfig
mips                       bmips_be_defconfig
xtensa                              defconfig
mips                      maltaaprp_defconfig
powerpc                     mpc5200_defconfig
arm                         hackkit_defconfig
mips                            ar7_defconfig
arm                           h5000_defconfig
mips                 decstation_r4k_defconfig
arm                         axm55xx_defconfig
xtensa                    xip_kc705_defconfig
m68k                                defconfig
mips                           ip28_defconfig
mips                           ip27_defconfig
m68k                         amcore_defconfig
c6x                        evmc6472_defconfig
arc                         haps_hs_defconfig
arm                              zx_defconfig
powerpc                      ppc64e_defconfig
i386                             alldefconfig
powerpc                      pasemi_defconfig
powerpc                       ppc64_defconfig
parisc                generic-32bit_defconfig
arm                         assabet_defconfig
powerpc                  mpc866_ads_defconfig
nds32                             allnoconfig
parisc                generic-64bit_defconfig
arm                         lpc32xx_defconfig
arm                            zeus_defconfig
powerpc                    mvme5100_defconfig
powerpc                     ep8248e_defconfig
arm                      pxa255-idp_defconfig
riscv                               defconfig
arm                        mvebu_v5_defconfig
mips                          malta_defconfig
openrisc                 simple_smp_defconfig
arm                         nhk8815_defconfig
sh                          rsk7264_defconfig
powerpc                          allyesconfig
sh                           se7751_defconfig
m68k                          amiga_defconfig
sh                          r7785rp_defconfig
arm                          moxart_defconfig
arm                            lart_defconfig
sh                            shmin_defconfig
ia64                            zx1_defconfig
arc                     nsimosci_hs_defconfig
arm                      tct_hammer_defconfig
sh                             sh03_defconfig
mips                      loongson3_defconfig
powerpc                           allnoconfig
alpha                            alldefconfig
mips                        qi_lb60_defconfig
arm                     am200epdkit_defconfig
sh                     sh7710voipgw_defconfig
arm                        multi_v7_defconfig
arm                           h3600_defconfig
h8300                               defconfig
arm                       spear13xx_defconfig
arm                         orion5x_defconfig
arm                              alldefconfig
nios2                            alldefconfig
sh                          landisk_defconfig
sh                           se7619_defconfig
sh                          kfr2r09_defconfig
arm64                            alldefconfig
sh                        apsh4ad0a_defconfig
mips                  decstation_64_defconfig
arc                              allyesconfig
sh                   sh7724_generic_defconfig
riscv                             allnoconfig
ia64                         bigsur_defconfig
arc                          axs101_defconfig
sh                             espt_defconfig
arc                            hsdk_defconfig
arm                           omap1_defconfig
arm                            qcom_defconfig
powerpc                  storcenter_defconfig
arm                          iop32x_defconfig
xtensa                generic_kc705_defconfig
ia64                          tiger_defconfig
powerpc                      mgcoge_defconfig
mips                malta_qemu_32r6_defconfig
arm                        mini2440_defconfig
mips                           ci20_defconfig
h8300                     edosk2674_defconfig
mips                             allyesconfig
powerpc                      ppc40x_defconfig
arm                           tegra_defconfig
sh                           sh2007_defconfig
mips                      maltasmvp_defconfig
xtensa                           allyesconfig
mips                           xway_defconfig
m68k                       m5275evb_defconfig
openrisc                         alldefconfig
m68k                        stmark2_defconfig
m68k                             alldefconfig
powerpc64                           defconfig
sh                               j2_defconfig
microblaze                          defconfig
s390                                defconfig
ia64                             allmodconfig
ia64                                defconfig
ia64                             allyesconfig
m68k                             allmodconfig
m68k                             allyesconfig
nios2                               defconfig
c6x                              allyesconfig
nds32                               defconfig
nios2                            allyesconfig
csky                                defconfig
alpha                               defconfig
alpha                            allyesconfig
h8300                            allyesconfig
arc                                 defconfig
sh                               allmodconfig
parisc                              defconfig
s390                             allyesconfig
parisc                           allyesconfig
i386                             allyesconfig
sparc                            allyesconfig
sparc                               defconfig
i386                                defconfig
mips                             allmodconfig
powerpc                          allmodconfig
powerpc                             defconfig
x86_64               randconfig-a006-20200905
x86_64               randconfig-a004-20200905
x86_64               randconfig-a003-20200905
x86_64               randconfig-a005-20200905
x86_64               randconfig-a001-20200905
x86_64               randconfig-a002-20200905
i386                 randconfig-a004-20200904
i386                 randconfig-a005-20200904
i386                 randconfig-a006-20200904
i386                 randconfig-a002-20200904
i386                 randconfig-a003-20200904
i386                 randconfig-a001-20200904
x86_64               randconfig-a013-20200904
x86_64               randconfig-a011-20200904
x86_64               randconfig-a016-20200904
x86_64               randconfig-a012-20200904
x86_64               randconfig-a015-20200904
x86_64               randconfig-a014-20200904
i386                 randconfig-a016-20200904
i386                 randconfig-a015-20200904
i386                 randconfig-a011-20200904
i386                 randconfig-a013-20200904
i386                 randconfig-a014-20200904
i386                 randconfig-a012-20200904
i386                 randconfig-a016-20200905
i386                 randconfig-a015-20200905
i386                 randconfig-a011-20200905
i386                 randconfig-a013-20200905
i386                 randconfig-a014-20200905
i386                 randconfig-a012-20200905
riscv                            allyesconfig
riscv                            allmodconfig
x86_64                                   rhel
x86_64                           allyesconfig
x86_64                    rhel-7.6-kselftests
x86_64                              defconfig
x86_64                               rhel-8.3
x86_64                                  kexec

clang tested configs:
x86_64               randconfig-a006-20200904
x86_64               randconfig-a004-20200904
x86_64               randconfig-a003-20200904
x86_64               randconfig-a005-20200904
x86_64               randconfig-a001-20200904
x86_64               randconfig-a002-20200904

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
