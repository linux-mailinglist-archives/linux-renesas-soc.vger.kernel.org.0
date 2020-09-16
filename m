Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2EA5326C0D6
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 16 Sep 2020 11:39:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726369AbgIPJju (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 16 Sep 2020 05:39:50 -0400
Received: from mga06.intel.com ([134.134.136.31]:32981 "EHLO mga06.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726699AbgIPJji (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 16 Sep 2020 05:39:38 -0400
IronPort-SDR: P3klSYMpVucLmQb32Z0URfNd57iMaIe5IPdyWWyJM0rYE84rgWauHk/ubx4r6DMA2B9pqTW3aO
 5CXqFJppBcfw==
X-IronPort-AV: E=McAfee;i="6000,8403,9745"; a="220988804"
X-IronPort-AV: E=Sophos;i="5.76,432,1592895600"; 
   d="scan'208";a="220988804"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Sep 2020 02:39:36 -0700
IronPort-SDR: oCRoesbSW9g7p+bg2WaWIdr0LRQkxK/rrpvcCKyVG/L+BJWHJAuRb0RmWP7w9WB+l3AdqjPlVQ
 2Nrqhe/2sbTw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.76,432,1592895600"; 
   d="scan'208";a="343832092"
Received: from lkp-server02.sh.intel.com (HELO bdcb92cf8b4e) ([10.239.97.151])
  by FMSMGA003.fm.intel.com with ESMTP; 16 Sep 2020 02:39:35 -0700
Received: from kbuild by bdcb92cf8b4e with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1kITuY-00002j-DB; Wed, 16 Sep 2020 09:39:34 +0000
Date:   Wed, 16 Sep 2020 17:38:58 +0800
From:   kernel test robot <lkp@intel.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     linux-renesas-soc@vger.kernel.org
Subject: [renesas-drivers:clk-renesas] BUILD SUCCESS
 57884127495c01d110c54154180de75001d1dedb
Message-ID: <5f61dd32.gofCrGHLrqRJ8l8d%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git  clk-renesas
branch HEAD: 57884127495c01d110c54154180de75001d1dedb  clk: renesas: rcar-gen3: Update description for RZ/G2

elapsed time: 1219m

configs tested: 194
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                                 defconfig
arm64                            allyesconfig
arm64                               defconfig
arm                              allyesconfig
arm                              allmodconfig
mips                         rt305x_defconfig
arm                           corgi_defconfig
sparc64                             defconfig
powerpc                      ppc6xx_defconfig
m68k                            mac_defconfig
sh                             sh03_defconfig
arm                          prima2_defconfig
m68k                        m5272c3_defconfig
arm                          pxa168_defconfig
powerpc                      walnut_defconfig
powerpc                     ppa8548_defconfig
mips                        bcm63xx_defconfig
arm                      integrator_defconfig
arc                     nsimosci_hs_defconfig
sh                          urquell_defconfig
powerpc                     ep8248e_defconfig
arm                         assabet_defconfig
powerpc                     tqm8548_defconfig
sh                            hp6xx_defconfig
arm                           sunxi_defconfig
powerpc                    mvme5100_defconfig
arm                      footbridge_defconfig
arm                         palmz72_defconfig
arm                        vexpress_defconfig
mips                           ci20_defconfig
c6x                         dsk6455_defconfig
powerpc                 canyonlands_defconfig
sh                          rsk7264_defconfig
mips                      bmips_stb_defconfig
powerpc                        fsp2_defconfig
arc                             nps_defconfig
arm                            dove_defconfig
sh                     sh7710voipgw_defconfig
arm                         shannon_defconfig
sh                 kfr2r09-romimage_defconfig
powerpc                          g5_defconfig
powerpc                  storcenter_defconfig
m68k                           sun3_defconfig
arm                         socfpga_defconfig
sh                          r7785rp_defconfig
s390                             alldefconfig
mips                        nlm_xlp_defconfig
microblaze                    nommu_defconfig
sh                           se7780_defconfig
i386                             alldefconfig
powerpc                     tqm5200_defconfig
m68k                        m5407c3_defconfig
mips                     loongson1c_defconfig
powerpc                       holly_defconfig
mips                      maltaaprp_defconfig
powerpc                      ep88xc_defconfig
arm                              zx_defconfig
h8300                            alldefconfig
microblaze                          defconfig
sh                   rts7751r2dplus_defconfig
mips                      maltasmvp_defconfig
arm                         ebsa110_defconfig
arm                          gemini_defconfig
arc                           tb10x_defconfig
powerpc                     tqm8560_defconfig
powerpc                      ppc64e_defconfig
xtensa                          iss_defconfig
sh                           se7619_defconfig
powerpc64                        alldefconfig
powerpc                 mpc836x_mds_defconfig
xtensa                    xip_kc705_defconfig
arm                        spear6xx_defconfig
mips                           jazz_defconfig
powerpc                     rainier_defconfig
arm                         lpc18xx_defconfig
sh                   secureedge5410_defconfig
mips                  decstation_64_defconfig
powerpc                     powernv_defconfig
powerpc                 mpc832x_mds_defconfig
arm                          pcm027_defconfig
powerpc                       eiger_defconfig
powerpc                 mpc834x_mds_defconfig
powerpc                      tqm8xx_defconfig
powerpc                      katmai_defconfig
sh                        apsh4ad0a_defconfig
powerpc                         wii_defconfig
arm                          exynos_defconfig
ia64                         bigsur_defconfig
arm                         bcm2835_defconfig
sh                           se7724_defconfig
mips                         db1xxx_defconfig
arm                             rpc_defconfig
powerpc                        warp_defconfig
sh                      rts7751r2d1_defconfig
arm                        shmobile_defconfig
powerpc                     taishan_defconfig
c6x                        evmc6474_defconfig
powerpc                      makalu_defconfig
mips                malta_kvm_guest_defconfig
sh                           se7751_defconfig
sh                   sh7770_generic_defconfig
ia64                            zx1_defconfig
powerpc                 mpc8315_rdb_defconfig
powerpc                  iss476-smp_defconfig
mips                         tb0219_defconfig
arm                        mini2440_defconfig
arm                          lpd270_defconfig
mips                   sb1250_swarm_defconfig
mips                        bcm47xx_defconfig
sh                        dreamcast_defconfig
powerpc                     tqm8540_defconfig
powerpc                     kmeter1_defconfig
arm                          simpad_defconfig
mips                         tb0287_defconfig
sh                                  defconfig
sh                   sh7724_generic_defconfig
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
csky                                defconfig
alpha                               defconfig
nios2                            allyesconfig
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
i386                                defconfig
mips                             allyesconfig
mips                             allmodconfig
powerpc                          allyesconfig
powerpc                          allmodconfig
powerpc                           allnoconfig
x86_64               randconfig-a006-20200916
x86_64               randconfig-a004-20200916
x86_64               randconfig-a003-20200916
x86_64               randconfig-a002-20200916
x86_64               randconfig-a001-20200916
x86_64               randconfig-a005-20200916
x86_64               randconfig-a004-20200914
x86_64               randconfig-a006-20200914
x86_64               randconfig-a003-20200914
x86_64               randconfig-a002-20200914
x86_64               randconfig-a001-20200914
x86_64               randconfig-a005-20200914
i386                 randconfig-a004-20200916
i386                 randconfig-a006-20200916
i386                 randconfig-a003-20200916
i386                 randconfig-a001-20200916
i386                 randconfig-a002-20200916
i386                 randconfig-a005-20200916
i386                 randconfig-a015-20200916
i386                 randconfig-a014-20200916
i386                 randconfig-a011-20200916
i386                 randconfig-a013-20200916
i386                 randconfig-a016-20200916
i386                 randconfig-a012-20200916
i386                 randconfig-a015-20200915
i386                 randconfig-a014-20200915
i386                 randconfig-a011-20200915
i386                 randconfig-a013-20200915
i386                 randconfig-a016-20200915
i386                 randconfig-a012-20200915
riscv                            allyesconfig
riscv                             allnoconfig
riscv                               defconfig
riscv                            allmodconfig
x86_64                                   rhel
x86_64                           allyesconfig
x86_64                    rhel-7.6-kselftests
x86_64                              defconfig
x86_64                               rhel-8.3
x86_64                                  kexec

clang tested configs:
x86_64               randconfig-a014-20200916
x86_64               randconfig-a011-20200916
x86_64               randconfig-a016-20200916
x86_64               randconfig-a012-20200916
x86_64               randconfig-a015-20200916
x86_64               randconfig-a013-20200916

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
