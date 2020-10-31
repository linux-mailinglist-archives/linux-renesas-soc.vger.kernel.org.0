Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 67DB12A12BC
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 31 Oct 2020 02:45:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726022AbgJaBpr (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 30 Oct 2020 21:45:47 -0400
Received: from mga14.intel.com ([192.55.52.115]:20827 "EHLO mga14.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725446AbgJaBpr (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 30 Oct 2020 21:45:47 -0400
IronPort-SDR: fFYbMd1cNr8JGC8t3PWLs2gZgDE4f8tI8YpU16UYKdd4vifqHnKEFLYeJxt0oGv2IL0T+GFGqq
 aZUCCh2C0VOg==
X-IronPort-AV: E=McAfee;i="6000,8403,9790"; a="167905694"
X-IronPort-AV: E=Sophos;i="5.77,435,1596524400"; 
   d="scan'208";a="167905694"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Oct 2020 18:45:46 -0700
IronPort-SDR: kKlltg1k6h2j15xrLrSL0gEAhw5BXkXHG0wCjPsCC5/FxWA2vUTuZ25juNjsyuCOvY7daE27Ti
 ZlRHaJVCenRg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.77,435,1596524400"; 
   d="scan'208";a="352052208"
Received: from lkp-server02.sh.intel.com (HELO fcc9f8859912) ([10.239.97.151])
  by fmsmga004.fm.intel.com with ESMTP; 30 Oct 2020 18:45:45 -0700
Received: from kbuild by fcc9f8859912 with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1kYfxg-0000NY-Rh; Sat, 31 Oct 2020 01:45:44 +0000
Date:   Sat, 31 Oct 2020 09:44:56 +0800
From:   kernel test robot <lkp@intel.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     linux-renesas-soc@vger.kernel.org
Subject: [renesas-devel:next] BUILD SUCCESS
 fc52536ffcefaef6f5956abd03939811b02ea451
Message-ID: <5f9cc198.4XTVLz0DP8YzXkDB%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git  next
branch HEAD: fc52536ffcefaef6f5956abd03939811b02ea451  Merge branch 'renesas-arm-dt-for-v5.11' into renesas-next

elapsed time: 724m

configs tested: 169
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                                 defconfig
arm64                            allyesconfig
arm64                               defconfig
arm                              allyesconfig
arm                              allmodconfig
arm                         shannon_defconfig
parisc                           alldefconfig
h8300                    h8300h-sim_defconfig
mips                      maltasmvp_defconfig
arc                                 defconfig
sh                          r7785rp_defconfig
arm                          ep93xx_defconfig
arc                     nsimosci_hs_defconfig
sh                          rsk7203_defconfig
sh                 kfr2r09-romimage_defconfig
powerpc                     taishan_defconfig
arm                        magician_defconfig
microblaze                          defconfig
arm                          pxa910_defconfig
i386                             alldefconfig
sh                           se7722_defconfig
powerpc                 mpc834x_itx_defconfig
m68k                        mvme16x_defconfig
powerpc                      pasemi_defconfig
arc                         haps_hs_defconfig
sh                        apsh4ad0a_defconfig
xtensa                  nommu_kc705_defconfig
mips                           mtx1_defconfig
sh                             shx3_defconfig
mips                      loongson3_defconfig
arm                       imx_v4_v5_defconfig
mips                         tb0219_defconfig
s390                             allyesconfig
arm                            xcep_defconfig
powerpc                      ppc6xx_defconfig
parisc                generic-64bit_defconfig
powerpc                     asp8347_defconfig
mips                        jmr3927_defconfig
sh                          rsk7201_defconfig
nios2                               defconfig
powerpc                   motionpro_defconfig
arm                     eseries_pxa_defconfig
sh                          r7780mp_defconfig
arm                           omap1_defconfig
powerpc                     kilauea_defconfig
arc                        vdk_hs38_defconfig
arm                          exynos_defconfig
arm                            pleb_defconfig
sh                           se7712_defconfig
sparc                       sparc64_defconfig
sh                           se7780_defconfig
c6x                        evmc6457_defconfig
powerpc                      ep88xc_defconfig
mips                malta_qemu_32r6_defconfig
arm                     am200epdkit_defconfig
mips                       lemote2f_defconfig
arm                           efm32_defconfig
mips                malta_kvm_guest_defconfig
mips                           ip22_defconfig
powerpc                 mpc837x_rdb_defconfig
riscv                            alldefconfig
sh                          sdk7786_defconfig
arm                        cerfcube_defconfig
sh                            hp6xx_defconfig
alpha                               defconfig
mips                         tb0226_defconfig
sh                        dreamcast_defconfig
powerpc                      chrp32_defconfig
mips                     loongson1c_defconfig
powerpc                     kmeter1_defconfig
arm                        multi_v7_defconfig
powerpc                 mpc8540_ads_defconfig
mips                          rm200_defconfig
arm                        multi_v5_defconfig
arm                           corgi_defconfig
sh                          kfr2r09_defconfig
arm                      tct_hammer_defconfig
powerpc                     sequoia_defconfig
xtensa                  audio_kc705_defconfig
mips                      maltaaprp_defconfig
powerpc                         ps3_defconfig
arm                         socfpga_defconfig
powerpc                 mpc8560_ads_defconfig
m68k                       bvme6000_defconfig
powerpc                 mpc834x_mds_defconfig
sh                      rts7751r2d1_defconfig
powerpc                        fsp2_defconfig
arc                        nsim_700_defconfig
microblaze                      mmu_defconfig
powerpc                       maple_defconfig
m68k                        m5307c3_defconfig
m68k                       m5208evb_defconfig
mips                        omega2p_defconfig
powerpc                 mpc832x_rdb_defconfig
arm                         lubbock_defconfig
mips                        bcm47xx_defconfig
arc                     haps_hs_smp_defconfig
um                             i386_defconfig
arm                        keystone_defconfig
mips                          ath79_defconfig
arm                        clps711x_defconfig
powerpc                      cm5200_defconfig
mips                           rs90_defconfig
arm                        neponset_defconfig
ia64                             allmodconfig
ia64                                defconfig
ia64                             allyesconfig
m68k                             allmodconfig
m68k                                defconfig
m68k                             allyesconfig
arc                              allyesconfig
nds32                             allnoconfig
c6x                              allyesconfig
nds32                               defconfig
nios2                            allyesconfig
csky                                defconfig
alpha                            allyesconfig
xtensa                           allyesconfig
h8300                            allyesconfig
sh                               allmodconfig
parisc                              defconfig
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
x86_64               randconfig-a005-20201030
x86_64               randconfig-a001-20201030
x86_64               randconfig-a002-20201030
x86_64               randconfig-a003-20201030
x86_64               randconfig-a006-20201030
x86_64               randconfig-a004-20201030
i386                 randconfig-a005-20201030
i386                 randconfig-a003-20201030
i386                 randconfig-a002-20201030
i386                 randconfig-a001-20201030
i386                 randconfig-a006-20201030
i386                 randconfig-a004-20201030
i386                 randconfig-a011-20201030
i386                 randconfig-a014-20201030
i386                 randconfig-a015-20201030
i386                 randconfig-a012-20201030
i386                 randconfig-a013-20201030
i386                 randconfig-a016-20201030
riscv                    nommu_k210_defconfig
riscv                            allyesconfig
riscv                    nommu_virt_defconfig
riscv                             allnoconfig
riscv                               defconfig
riscv                          rv32_defconfig
riscv                            allmodconfig
x86_64                                   rhel
x86_64                           allyesconfig
x86_64                    rhel-7.6-kselftests
x86_64                              defconfig
x86_64                               rhel-8.3
x86_64                                  kexec

clang tested configs:
x86_64               randconfig-a013-20201030
x86_64               randconfig-a014-20201030
x86_64               randconfig-a015-20201030
x86_64               randconfig-a016-20201030
x86_64               randconfig-a011-20201030
x86_64               randconfig-a012-20201030

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
