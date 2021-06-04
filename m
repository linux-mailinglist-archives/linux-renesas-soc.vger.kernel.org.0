Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 83F8439B120
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  4 Jun 2021 05:48:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229752AbhFDDud (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 3 Jun 2021 23:50:33 -0400
Received: from mga09.intel.com ([134.134.136.24]:40435 "EHLO mga09.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229718AbhFDDud (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 3 Jun 2021 23:50:33 -0400
IronPort-SDR: s8OxcC28Br2iHmVDru+xsjWuyVXDGiExz5yayAgptaxAYzuIzRI+6tHffwPgtnVDidF3ehd8rn
 +4eG60BNcGTg==
X-IronPort-AV: E=McAfee;i="6200,9189,10004"; a="204194962"
X-IronPort-AV: E=Sophos;i="5.83,247,1616482800"; 
   d="scan'208";a="204194962"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Jun 2021 20:48:45 -0700
IronPort-SDR: ArMOZSPA/nhvi3Gtt9qIfhflSxnt1z0xqyl3jWkMJvf9HcMpMX/yi20TtblZ9PnvbtuWZ6Whlc
 Fp9HOC9sBZZw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.83,247,1616482800"; 
   d="scan'208";a="483742606"
Received: from lkp-server02.sh.intel.com (HELO 1ec8406c5392) ([10.239.97.151])
  by fmsmga002.fm.intel.com with ESMTP; 03 Jun 2021 20:48:44 -0700
Received: from kbuild by 1ec8406c5392 with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1lp0p9-0006dX-ES; Fri, 04 Jun 2021 03:48:43 +0000
Date:   Fri, 04 Jun 2021 11:48:30 +0800
From:   kernel test robot <lkp@intel.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     linux-renesas-soc@vger.kernel.org
Subject: [renesas-devel:master] BUILD SUCCESS
 a17b18482334959148cabda392caea262c68ba77
Message-ID: <60b9a28e.ZdzpUB/4+GpbEEsB%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git master
branch HEAD: a17b18482334959148cabda392caea262c68ba77  Merge branch 'renesas-next', tag 'v5.13-rc4' into renesas-devel

elapsed time: 5395m

configs tested: 222
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                                 defconfig
arm64                            allyesconfig
arm64                               defconfig
arm                              allyesconfig
arm                              allmodconfig
arm                      tct_hammer_defconfig
sh                          sdk7780_defconfig
riscv                    nommu_virt_defconfig
arm                           tegra_defconfig
powerpc                     ppa8548_defconfig
h8300                       h8s-sim_defconfig
powerpc                 linkstation_defconfig
sh                          sdk7786_defconfig
powerpc                  storcenter_defconfig
arm                          pxa3xx_defconfig
xtensa                    xip_kc705_defconfig
parisc                           alldefconfig
m68k                       bvme6000_defconfig
microblaze                          defconfig
ia64                             allmodconfig
sh                          rsk7203_defconfig
powerpc                    adder875_defconfig
m68k                        m5307c3_defconfig
h8300                               defconfig
arm                          collie_defconfig
arc                        vdk_hs38_defconfig
arc                            hsdk_defconfig
s390                             allmodconfig
m68k                        m5272c3_defconfig
arm                         cm_x300_defconfig
sh                          urquell_defconfig
mips                malta_qemu_32r6_defconfig
arm                       netwinder_defconfig
arm                        mvebu_v7_defconfig
powerpc                    gamecube_defconfig
arc                          axs101_defconfig
arm                            qcom_defconfig
m68k                          sun3x_defconfig
sh                            shmin_defconfig
mips                 decstation_r4k_defconfig
nds32                            alldefconfig
mips                           ip27_defconfig
arc                      axs103_smp_defconfig
sparc                       sparc64_defconfig
arm                         assabet_defconfig
powerpc                        cell_defconfig
m68k                            q40_defconfig
powerpc               mpc834x_itxgp_defconfig
m68k                          atari_defconfig
powerpc                   currituck_defconfig
sh                        sh7763rdp_defconfig
sh                   secureedge5410_defconfig
arm                             ezx_defconfig
arm                          exynos_defconfig
sh                            hp6xx_defconfig
sh                 kfr2r09-romimage_defconfig
alpha                            alldefconfig
sh                           se7751_defconfig
mips                           xway_defconfig
arm                          ixp4xx_defconfig
arm                       mainstone_defconfig
mips                          malta_defconfig
powerpc                     tqm8540_defconfig
sh                            migor_defconfig
arm                         orion5x_defconfig
powerpc                      chrp32_defconfig
powerpc                  mpc866_ads_defconfig
arm                         bcm2835_defconfig
powerpc                      mgcoge_defconfig
arm                            pleb_defconfig
powerpc                 mpc837x_rdb_defconfig
powerpc                     ep8248e_defconfig
mips                     loongson1c_defconfig
parisc                generic-32bit_defconfig
sh                          rsk7201_defconfig
sh                     magicpanelr2_defconfig
arm                        spear3xx_defconfig
sh                          rsk7264_defconfig
powerpc                      ppc40x_defconfig
openrisc                            defconfig
mips                           ip32_defconfig
sh                           se7619_defconfig
mips                        nlm_xlp_defconfig
arm                          imote2_defconfig
nios2                            alldefconfig
mips                         bigsur_defconfig
powerpc                 mpc8313_rdb_defconfig
arm                          ep93xx_defconfig
xtensa                  audio_kc705_defconfig
riscv                               defconfig
arm                          pcm027_defconfig
arm                         s5pv210_defconfig
sh                  sh7785lcr_32bit_defconfig
nds32                             allnoconfig
m68k                             allmodconfig
powerpc                       holly_defconfig
powerpc                     tqm8555_defconfig
arm                        neponset_defconfig
mips                           mtx1_defconfig
powerpc                     sbc8548_defconfig
arm                     am200epdkit_defconfig
ia64                            zx1_defconfig
powerpc                     ksi8560_defconfig
arm                            zeus_defconfig
arm                        mini2440_defconfig
mips                      maltasmvp_defconfig
arm                    vt8500_v6_v7_defconfig
mips                        workpad_defconfig
sh                               allmodconfig
mips                            e55_defconfig
m68k                        mvme16x_defconfig
mips                            gpr_defconfig
mips                   sb1250_swarm_defconfig
arm                            mps2_defconfig
sh                           se7721_defconfig
arm                  colibri_pxa300_defconfig
m68k                          hp300_defconfig
powerpc                     redwood_defconfig
arm                            lart_defconfig
mips                      bmips_stb_defconfig
sh                            titan_defconfig
arm                           u8500_defconfig
nios2                               defconfig
um                           x86_64_defconfig
mips                       capcella_defconfig
arm                          moxart_defconfig
s390                          debug_defconfig
sh                          rsk7269_defconfig
powerpc                       ppc64_defconfig
sh                           se7206_defconfig
arm64                            alldefconfig
riscv             nommu_k210_sdcard_defconfig
mips                       rbtx49xx_defconfig
powerpc                      walnut_defconfig
arm                        spear6xx_defconfig
mips                         mpc30x_defconfig
powerpc                 mpc836x_mds_defconfig
mips                           rs90_defconfig
powerpc                     mpc5200_defconfig
arm                        vexpress_defconfig
mips                        vocore2_defconfig
sh                        edosk7705_defconfig
xtensa                         virt_defconfig
mips                     loongson2k_defconfig
powerpc                          g5_defconfig
i386                                defconfig
x86_64                            allnoconfig
ia64                                defconfig
ia64                             allyesconfig
m68k                                defconfig
m68k                             allyesconfig
arc                              allyesconfig
nds32                               defconfig
nios2                            allyesconfig
csky                                defconfig
alpha                               defconfig
alpha                            allyesconfig
xtensa                           allyesconfig
h8300                            allyesconfig
arc                                 defconfig
parisc                              defconfig
s390                             allyesconfig
parisc                           allyesconfig
s390                                defconfig
i386                             allyesconfig
sparc                            allyesconfig
sparc                               defconfig
mips                             allyesconfig
mips                             allmodconfig
powerpc                          allyesconfig
powerpc                          allmodconfig
powerpc                           allnoconfig
x86_64               randconfig-a006-20210531
x86_64               randconfig-a003-20210531
x86_64               randconfig-a005-20210531
x86_64               randconfig-a004-20210531
x86_64               randconfig-a002-20210531
x86_64               randconfig-a001-20210531
i386                 randconfig-a002-20210531
i386                 randconfig-a001-20210531
i386                 randconfig-a005-20210531
i386                 randconfig-a006-20210531
i386                 randconfig-a004-20210531
i386                 randconfig-a003-20210531
i386                 randconfig-a016-20210531
i386                 randconfig-a015-20210531
i386                 randconfig-a013-20210531
i386                 randconfig-a012-20210531
i386                 randconfig-a014-20210531
i386                 randconfig-a011-20210531
i386                 randconfig-a015-20210601
i386                 randconfig-a013-20210601
i386                 randconfig-a011-20210601
i386                 randconfig-a016-20210601
i386                 randconfig-a014-20210601
i386                 randconfig-a012-20210601
riscv                    nommu_k210_defconfig
riscv                            allyesconfig
riscv                             allnoconfig
riscv                          rv32_defconfig
riscv                            allmodconfig
um                             i386_defconfig
um                            kunit_defconfig
x86_64                           allyesconfig
x86_64                    rhel-8.3-kselftests
x86_64                              defconfig
x86_64                               rhel-8.3
x86_64                      rhel-8.3-kbuiltin
x86_64                                  kexec

clang tested configs:
x86_64               randconfig-b001-20210531
x86_64               randconfig-a002-20210601
x86_64               randconfig-a004-20210601
x86_64               randconfig-a003-20210601
x86_64               randconfig-a006-20210601
x86_64               randconfig-a005-20210601
x86_64               randconfig-a001-20210601
x86_64               randconfig-a014-20210531
x86_64               randconfig-a012-20210531
x86_64               randconfig-a013-20210531
x86_64               randconfig-a016-20210531
x86_64               randconfig-a015-20210531
x86_64               randconfig-a011-20210531

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
