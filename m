Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 89CA72E6CE0
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 29 Dec 2020 01:54:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729787AbgL2AyM (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 28 Dec 2020 19:54:12 -0500
Received: from mga14.intel.com ([192.55.52.115]:38664 "EHLO mga14.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729759AbgL2AyM (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 28 Dec 2020 19:54:12 -0500
IronPort-SDR: ao0KXbdX8PI38MtASWexTFDrUpds/TTS1D4iZEpO+Dj1K4KvlkZuBgdCar29Q0Qov2vTTos8Wb
 kuTTmHZ5yEFA==
X-IronPort-AV: E=McAfee;i="6000,8403,9848"; a="175665099"
X-IronPort-AV: E=Sophos;i="5.78,456,1599548400"; 
   d="scan'208";a="175665099"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Dec 2020 16:53:30 -0800
IronPort-SDR: 9z5CnxiWTW6UsFa9zpd79q++mhLqqOLIEQL1mnxW4smXdafnRd4Ogj/FgfHMtEnWI8WP0t1SDE
 q1QkOcbphKSQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.78,456,1599548400"; 
   d="scan'208";a="459931104"
Received: from lkp-server02.sh.intel.com (HELO 4242b19f17ef) ([10.239.97.151])
  by fmsmga001.fm.intel.com with ESMTP; 28 Dec 2020 16:53:29 -0800
Received: from kbuild by 4242b19f17ef with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1ku3GS-0003CM-Vw; Tue, 29 Dec 2020 00:53:28 +0000
Date:   Tue, 29 Dec 2020 08:52:52 +0800
From:   kernel test robot <lkp@intel.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     linux-renesas-soc@vger.kernel.org
Subject: [renesas-devel:renesas-dt-bindings-for-v5.12] BUILD SUCCESS
 0d2a7e15d7912aa27dd3366f75d181b5141ca9a2
Message-ID: <5fea7de4.+SOdpjGdQRInfP+5%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git  renesas-dt-bindings-for-v5.12
branch HEAD: 0d2a7e15d7912aa27dd3366f75d181b5141ca9a2  dt-bindings: arm: renesas: Add Beacon RZ/G2N and RZ/G2H boards

elapsed time: 722m

configs tested: 147
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                                 defconfig
arm64                            allyesconfig
arm64                               defconfig
arm                              allyesconfig
arm                              allmodconfig
riscv                    nommu_k210_defconfig
powerpc                     rainier_defconfig
powerpc                        warp_defconfig
ia64                            zx1_defconfig
arm                            mps2_defconfig
m68k                          hp300_defconfig
powerpc                    ge_imp3a_defconfig
mips                  maltasmvp_eva_defconfig
powerpc                    klondike_defconfig
powerpc                     taishan_defconfig
powerpc                   lite5200b_defconfig
mips                          rb532_defconfig
powerpc                     tqm8548_defconfig
powerpc                     tqm8560_defconfig
sh                        sh7757lcr_defconfig
powerpc                     tqm8541_defconfig
sh                           se7722_defconfig
sh                 kfr2r09-romimage_defconfig
sh                         ap325rxa_defconfig
arm                       imx_v6_v7_defconfig
powerpc                     powernv_defconfig
arm                     am200epdkit_defconfig
riscv                               defconfig
riscv                          rv32_defconfig
mips                        workpad_defconfig
nios2                            alldefconfig
um                           x86_64_defconfig
sh                           se7724_defconfig
powerpc                 mpc8313_rdb_defconfig
mips                         tb0226_defconfig
h8300                       h8s-sim_defconfig
sh                               j2_defconfig
csky                                defconfig
sparc                       sparc32_defconfig
powerpc                      pmac32_defconfig
powerpc                  mpc866_ads_defconfig
xtensa                         virt_defconfig
powerpc                 mpc8540_ads_defconfig
arm                            hisi_defconfig
m68k                        mvme147_defconfig
sh                         ecovec24_defconfig
arm                         at91_dt_defconfig
sh                           se7751_defconfig
arm                      footbridge_defconfig
sh                     magicpanelr2_defconfig
powerpc                    adder875_defconfig
arm                           tegra_defconfig
mips                            gpr_defconfig
arm                           sunxi_defconfig
arm                           h5000_defconfig
sh                        dreamcast_defconfig
powerpc                      makalu_defconfig
sh                      rts7751r2d1_defconfig
powerpc                       ebony_defconfig
mips                        jmr3927_defconfig
arm                   milbeaut_m10v_defconfig
mips                           ci20_defconfig
powerpc                     kilauea_defconfig
arm                         bcm2835_defconfig
mips                        bcm47xx_defconfig
m68k                           sun3_defconfig
powerpc                        icon_defconfig
xtensa                  nommu_kc705_defconfig
arm                         shannon_defconfig
powerpc                      walnut_defconfig
sh                        sh7763rdp_defconfig
mips                             allmodconfig
m68k                        stmark2_defconfig
mips                malta_kvm_guest_defconfig
arc                     haps_hs_smp_defconfig
mips                      fuloong2e_defconfig
arm                      jornada720_defconfig
powerpc                     mpc5200_defconfig
h8300                     edosk2674_defconfig
mips                      malta_kvm_defconfig
sh                           se7780_defconfig
ia64                             allmodconfig
ia64                                defconfig
ia64                             allyesconfig
m68k                             allmodconfig
m68k                                defconfig
m68k                             allyesconfig
nios2                               defconfig
arc                              allyesconfig
nds32                             allnoconfig
c6x                              allyesconfig
nds32                               defconfig
nios2                            allyesconfig
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
powerpc                          allyesconfig
powerpc                          allmodconfig
powerpc                           allnoconfig
i386                 randconfig-a005-20201228
i386                 randconfig-a002-20201228
i386                 randconfig-a004-20201228
i386                 randconfig-a006-20201228
i386                 randconfig-a003-20201228
i386                 randconfig-a001-20201228
x86_64               randconfig-a014-20201228
x86_64               randconfig-a015-20201228
x86_64               randconfig-a016-20201228
x86_64               randconfig-a012-20201228
x86_64               randconfig-a011-20201228
x86_64               randconfig-a013-20201228
i386                 randconfig-a014-20201228
i386                 randconfig-a012-20201228
i386                 randconfig-a016-20201228
i386                 randconfig-a011-20201228
i386                 randconfig-a015-20201228
i386                 randconfig-a013-20201228
riscv                            allyesconfig
riscv                    nommu_virt_defconfig
riscv                             allnoconfig
riscv                            allmodconfig
x86_64                                   rhel
x86_64                           allyesconfig
x86_64                    rhel-7.6-kselftests
x86_64                              defconfig
x86_64                               rhel-8.3
x86_64                      rhel-8.3-kbuiltin
x86_64                                  kexec

clang tested configs:
x86_64               randconfig-a001-20201228
x86_64               randconfig-a006-20201228
x86_64               randconfig-a002-20201228
x86_64               randconfig-a004-20201228
x86_64               randconfig-a003-20201228
x86_64               randconfig-a005-20201228

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
