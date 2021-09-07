Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2C1E5403027
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  7 Sep 2021 23:19:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1346932AbhIGVUO (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 7 Sep 2021 17:20:14 -0400
Received: from mga05.intel.com ([192.55.52.43]:23778 "EHLO mga05.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S243883AbhIGVUO (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 7 Sep 2021 17:20:14 -0400
X-IronPort-AV: E=McAfee;i="6200,9189,10100"; a="305874754"
X-IronPort-AV: E=Sophos;i="5.85,276,1624345200"; 
   d="scan'208";a="305874754"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Sep 2021 14:19:06 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.85,276,1624345200"; 
   d="scan'208";a="605426045"
Received: from lkp-server01.sh.intel.com (HELO 730d49888f40) ([10.239.97.150])
  by fmsmga001.fm.intel.com with ESMTP; 07 Sep 2021 14:19:05 -0700
Received: from kbuild by 730d49888f40 with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1mNiUi-0001Kj-HY; Tue, 07 Sep 2021 21:19:04 +0000
Date:   Wed, 08 Sep 2021 05:18:58 +0800
From:   kernel test robot <lkp@intel.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     linux-renesas-soc@vger.kernel.org
Subject: [renesas-devel:renesas-arm-dt-for-v5.16] BUILD SUCCESS
 f70f24bf012808d33e47fde38e8a11cf68b35b82
Message-ID: <6137d742.VOhrgCQuhDVJnZE7%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git renesas-arm-dt-for-v5.16
branch HEAD: f70f24bf012808d33e47fde38e8a11cf68b35b82  arm64: dts: renesas: r8a779a0: Add iommus into sdhi node

elapsed time: 725m

configs tested: 205
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm64                            allyesconfig
arm64                               defconfig
arm                              allyesconfig
arm                              allmodconfig
arm                                 defconfig
i386                 randconfig-c001-20210906
mips                           ip28_defconfig
powerpc                        icon_defconfig
mips                            ar7_defconfig
sh                             espt_defconfig
sh                   secureedge5410_defconfig
riscv             nommu_k210_sdcard_defconfig
powerpc                 canyonlands_defconfig
arc                          axs103_defconfig
mips                         rt305x_defconfig
sh                           se7722_defconfig
mips                           jazz_defconfig
powerpc                     stx_gp3_defconfig
mips                        bcm63xx_defconfig
mips                        nlm_xlr_defconfig
sh                           se7780_defconfig
nios2                            alldefconfig
powerpc                 mpc8560_ads_defconfig
powerpc                      cm5200_defconfig
mips                        qi_lb60_defconfig
powerpc                           allnoconfig
mips                      pic32mzda_defconfig
arm                           stm32_defconfig
sparc64                          alldefconfig
powerpc                    gamecube_defconfig
powerpc                     mpc83xx_defconfig
xtensa                       common_defconfig
powerpc                     redwood_defconfig
mips                     decstation_defconfig
arm                            mps2_defconfig
mips                        vocore2_defconfig
arm64                            alldefconfig
h8300                       h8s-sim_defconfig
sh                   sh7724_generic_defconfig
arm                         at91_dt_defconfig
sh                               alldefconfig
mips                        nlm_xlp_defconfig
sh                           se7721_defconfig
m68k                         apollo_defconfig
alpha                               defconfig
powerpc                         ps3_defconfig
sparc                       sparc32_defconfig
ia64                            zx1_defconfig
arm                            zeus_defconfig
arm                           h3600_defconfig
arm                            pleb_defconfig
arm                           h5000_defconfig
microblaze                      mmu_defconfig
powerpc                 mpc834x_itx_defconfig
mips                           ip27_defconfig
sh                        sh7763rdp_defconfig
arm                          badge4_defconfig
powerpc                    klondike_defconfig
powerpc                      bamboo_defconfig
sparc                       sparc64_defconfig
powerpc                        warp_defconfig
mips                       rbtx49xx_defconfig
mips                      maltasmvp_defconfig
powerpc                  mpc885_ads_defconfig
sh                      rts7751r2d1_defconfig
sh                                  defconfig
sh                           se7724_defconfig
mips                        maltaup_defconfig
arm                       versatile_defconfig
arm                          imote2_defconfig
powerpc                    sam440ep_defconfig
sh                           se7751_defconfig
sh                  sh7785lcr_32bit_defconfig
arm                          ixp4xx_defconfig
arm                  colibri_pxa300_defconfig
arm                       aspeed_g5_defconfig
sh                           sh2007_defconfig
mips                          ath79_defconfig
sh                               j2_defconfig
arm                        multi_v7_defconfig
powerpc                 mpc836x_mds_defconfig
mips                         tb0287_defconfig
powerpc                     tqm8541_defconfig
alpha                            alldefconfig
sh                         apsh4a3a_defconfig
mips                    maltaup_xpa_defconfig
mips                          rb532_defconfig
riscv                               defconfig
sh                          rsk7264_defconfig
mips                      fuloong2e_defconfig
sh                            shmin_defconfig
mips                           ip22_defconfig
powerpc                      obs600_defconfig
mips                malta_qemu_32r6_defconfig
sh                           se7712_defconfig
powerpc                  storcenter_defconfig
sh                             shx3_defconfig
arm                   milbeaut_m10v_defconfig
m68k                        mvme147_defconfig
arm                         s3c2410_defconfig
powerpc                       maple_defconfig
powerpc                   bluestone_defconfig
sh                          rsk7203_defconfig
ia64                        generic_defconfig
sh                           se7206_defconfig
powerpc                      arches_defconfig
xtensa                  audio_kc705_defconfig
nios2                         10m50_defconfig
powerpc                       ebony_defconfig
powerpc64                           defconfig
powerpc                     taishan_defconfig
sh                           se7619_defconfig
m68k                        m5407c3_defconfig
riscv                            allyesconfig
powerpc                   lite5200b_defconfig
powerpc                     tqm8548_defconfig
arm                  randconfig-c002-20210906
arm                  randconfig-c002-20210907
x86_64                            allnoconfig
ia64                             allmodconfig
ia64                                defconfig
ia64                             allyesconfig
m68k                             allmodconfig
m68k                                defconfig
m68k                             allyesconfig
nios2                               defconfig
arc                              allyesconfig
nds32                             allnoconfig
nds32                               defconfig
csky                                defconfig
alpha                            allyesconfig
nios2                            allyesconfig
h8300                            allyesconfig
sh                               allmodconfig
xtensa                           allyesconfig
arc                                 defconfig
parisc                              defconfig
s390                             allyesconfig
s390                             allmodconfig
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
x86_64               randconfig-a006-20210906
x86_64               randconfig-a004-20210906
x86_64               randconfig-a003-20210906
x86_64               randconfig-a005-20210906
x86_64               randconfig-a001-20210906
x86_64               randconfig-a002-20210906
i386                 randconfig-a005-20210906
i386                 randconfig-a004-20210906
i386                 randconfig-a006-20210906
i386                 randconfig-a002-20210906
i386                 randconfig-a003-20210906
i386                 randconfig-a001-20210906
arc                  randconfig-r043-20210906
riscv                    nommu_k210_defconfig
riscv                    nommu_virt_defconfig
riscv                             allnoconfig
riscv                          rv32_defconfig
riscv                            allmodconfig
x86_64                    rhel-8.3-kselftests
um                           x86_64_defconfig
um                             i386_defconfig
x86_64                               rhel-8.3
x86_64                                  kexec
x86_64                           allyesconfig
x86_64                              defconfig

clang tested configs:
s390                 randconfig-c005-20210906
mips                 randconfig-c004-20210906
powerpc              randconfig-c003-20210906
i386                 randconfig-c001-20210906
arm                  randconfig-c002-20210906
s390                 randconfig-c005-20210907
mips                 randconfig-c004-20210907
powerpc              randconfig-c003-20210907
arm                  randconfig-c002-20210907
riscv                randconfig-c006-20210907
x86_64               randconfig-c007-20210906
riscv                randconfig-c006-20210906
i386                 randconfig-a005-20210907
i386                 randconfig-a004-20210907
i386                 randconfig-a006-20210907
i386                 randconfig-a002-20210907
i386                 randconfig-a003-20210907
i386                 randconfig-a001-20210907
x86_64               randconfig-a011-20210906
x86_64               randconfig-a016-20210906
x86_64               randconfig-a012-20210906
x86_64               randconfig-a015-20210906
x86_64               randconfig-a014-20210906
x86_64               randconfig-a013-20210906
i386                 randconfig-a012-20210906
i386                 randconfig-a015-20210906
i386                 randconfig-a011-20210906
i386                 randconfig-a013-20210906
i386                 randconfig-a014-20210906
i386                 randconfig-a016-20210906
riscv                randconfig-r042-20210906
hexagon              randconfig-r045-20210906
s390                 randconfig-r044-20210906
hexagon              randconfig-r041-20210906

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
