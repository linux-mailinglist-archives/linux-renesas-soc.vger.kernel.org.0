Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 49F6734F5A8
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 31 Mar 2021 03:00:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229626AbhCaA74 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 30 Mar 2021 20:59:56 -0400
Received: from mga12.intel.com ([192.55.52.136]:20063 "EHLO mga12.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229662AbhCaA7Y (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 30 Mar 2021 20:59:24 -0400
IronPort-SDR: C99N7vtcSZPPC0b1mBAPJawVTEYyPuUcqynPQotio23CQjBgZvfX5a9s/t1eOCO9HRAFsw7fvX
 JgpFa1tOumdA==
X-IronPort-AV: E=McAfee;i="6000,8403,9939"; a="171297582"
X-IronPort-AV: E=Sophos;i="5.81,291,1610438400"; 
   d="scan'208";a="171297582"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Mar 2021 17:59:23 -0700
IronPort-SDR: an+QtQSBAeAcnYpdhA9M3Yrs1pNTIc/LF0267GrvbEb9AF+IpDkPg1+uWXjXESp3RNI2rko2a0
 dDt/2/TCHvHQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.81,291,1610438400"; 
   d="scan'208";a="606966144"
Received: from lkp-server01.sh.intel.com (HELO 69d8fcc516b7) ([10.239.97.150])
  by fmsmga006.fm.intel.com with ESMTP; 30 Mar 2021 17:59:22 -0700
Received: from kbuild by 69d8fcc516b7 with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1lRPCb-0005Z8-Tg; Wed, 31 Mar 2021 00:59:21 +0000
Date:   Wed, 31 Mar 2021 08:58:31 +0800
From:   kernel test robot <lkp@intel.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     linux-renesas-soc@vger.kernel.org
Subject: [renesas-drivers:renesas-clk-for-v5.13] BUILD SUCCESS
 f2fb4fe62390b293bc6edc04cc7002940c441359
Message-ID: <6063c937.yurilGjg85hUvmZj%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git renesas-clk-for-v5.13
branch HEAD: f2fb4fe62390b293bc6edc04cc7002940c441359  clk: renesas: Zero init clk_init_data

elapsed time: 731m

configs tested: 191
configs skipped: 4

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                                 defconfig
arm64                            allyesconfig
arm64                               defconfig
arm                              allyesconfig
arm                              allmodconfig
x86_64                           allyesconfig
riscv                            allmodconfig
i386                             allyesconfig
riscv                            allyesconfig
arm                       imx_v4_v5_defconfig
sh                          r7780mp_defconfig
arm                       imx_v6_v7_defconfig
sh                              ul2_defconfig
microblaze                      mmu_defconfig
mips                           gcw0_defconfig
powerpc                        warp_defconfig
powerpc                     kmeter1_defconfig
mips                           ip22_defconfig
powerpc                 mpc837x_rdb_defconfig
riscv                    nommu_k210_defconfig
nios2                         3c120_defconfig
xtensa                    xip_kc705_defconfig
openrisc                            defconfig
mips                           rs90_defconfig
arm                         s3c2410_defconfig
sh                          rsk7203_defconfig
arm                          iop32x_defconfig
um                            kunit_defconfig
sh                        sh7757lcr_defconfig
mips                         db1xxx_defconfig
arm                        cerfcube_defconfig
arm                           tegra_defconfig
arm                        neponset_defconfig
arm                     eseries_pxa_defconfig
powerpc                      arches_defconfig
sparc64                             defconfig
powerpc                  storcenter_defconfig
arm                          pxa910_defconfig
powerpc                     kilauea_defconfig
m68k                         apollo_defconfig
arm                         s3c6400_defconfig
mips                     cu1000-neo_defconfig
ia64                         bigsur_defconfig
h8300                               defconfig
powerpc                     redwood_defconfig
arm                       aspeed_g5_defconfig
mips                malta_qemu_32r6_defconfig
sh                        sh7763rdp_defconfig
sh                          rsk7201_defconfig
sh                          urquell_defconfig
arm                            mmp2_defconfig
powerpc                      bamboo_defconfig
i386                                defconfig
powerpc                 mpc837x_mds_defconfig
arm                          lpd270_defconfig
powerpc                 mpc836x_rdk_defconfig
xtensa                         virt_defconfig
sh                            titan_defconfig
arm                        mini2440_defconfig
powerpc                    amigaone_defconfig
x86_64                           alldefconfig
sh                          sdk7780_defconfig
m68k                          amiga_defconfig
sh                               j2_defconfig
arm                        magician_defconfig
arm                          exynos_defconfig
arm                       mainstone_defconfig
sh                          landisk_defconfig
arm                   milbeaut_m10v_defconfig
m68k                           sun3_defconfig
arm                  colibri_pxa300_defconfig
powerpc                      katmai_defconfig
mips                             allmodconfig
powerpc                      makalu_defconfig
arm                        multi_v7_defconfig
arm                     davinci_all_defconfig
sh                                  defconfig
powerpc                      ep88xc_defconfig
sh                            hp6xx_defconfig
powerpc                    sam440ep_defconfig
mips                          rm200_defconfig
arm                           u8500_defconfig
arm                         hackkit_defconfig
mips                           jazz_defconfig
arc                         haps_hs_defconfig
mips                      bmips_stb_defconfig
nds32                               defconfig
powerpc                     rainier_defconfig
sh                           se7780_defconfig
arm                     am200epdkit_defconfig
sh                           se7343_defconfig
ia64                            zx1_defconfig
parisc                           allyesconfig
mips                         cobalt_defconfig
sh                               alldefconfig
arm                        spear6xx_defconfig
mips                          malta_defconfig
mips                            ar7_defconfig
sparc                       sparc64_defconfig
sh                           se7619_defconfig
s390                       zfcpdump_defconfig
arm                      tct_hammer_defconfig
m68k                        mvme147_defconfig
arm                    vt8500_v6_v7_defconfig
mips                        qi_lb60_defconfig
riscv                          rv32_defconfig
powerpc                     asp8347_defconfig
mips                          rb532_defconfig
arm                           h5000_defconfig
powerpc                    socrates_defconfig
powerpc                        fsp2_defconfig
arm                         s5pv210_defconfig
m68k                       bvme6000_defconfig
powerpc                      ppc40x_defconfig
arm                            mps2_defconfig
sh                     magicpanelr2_defconfig
mips                         rt305x_defconfig
powerpc                   motionpro_defconfig
sparc64                          alldefconfig
sh                            migor_defconfig
mips                   sb1250_swarm_defconfig
mips                           xway_defconfig
powerpc                       ppc64_defconfig
mips                        bcm47xx_defconfig
powerpc                      ppc44x_defconfig
mips                malta_kvm_guest_defconfig
powerpc                       ebony_defconfig
mips                       lemote2f_defconfig
ia64                             allmodconfig
ia64                                defconfig
ia64                             allyesconfig
m68k                             allmodconfig
m68k                                defconfig
m68k                             allyesconfig
nios2                               defconfig
arc                              allyesconfig
nds32                             allnoconfig
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
s390                             allmodconfig
s390                                defconfig
sparc                            allyesconfig
sparc                               defconfig
mips                             allyesconfig
powerpc                          allyesconfig
powerpc                          allmodconfig
powerpc                           allnoconfig
x86_64               randconfig-a004-20210330
x86_64               randconfig-a003-20210330
x86_64               randconfig-a002-20210330
x86_64               randconfig-a001-20210330
x86_64               randconfig-a005-20210330
x86_64               randconfig-a006-20210330
i386                 randconfig-a004-20210330
i386                 randconfig-a006-20210330
i386                 randconfig-a005-20210330
i386                 randconfig-a003-20210330
i386                 randconfig-a002-20210330
i386                 randconfig-a001-20210330
i386                 randconfig-a015-20210330
i386                 randconfig-a011-20210330
i386                 randconfig-a014-20210330
i386                 randconfig-a013-20210330
i386                 randconfig-a016-20210330
i386                 randconfig-a012-20210330
riscv                    nommu_virt_defconfig
riscv                             allnoconfig
riscv                               defconfig
um                               allmodconfig
um                                allnoconfig
um                               allyesconfig
um                                  defconfig
x86_64                    rhel-8.3-kselftests
x86_64                              defconfig
x86_64                               rhel-8.3
x86_64                      rhel-8.3-kbuiltin
x86_64                                  kexec

clang tested configs:
x86_64               randconfig-a012-20210330
x86_64               randconfig-a015-20210330
x86_64               randconfig-a014-20210330
x86_64               randconfig-a016-20210330
x86_64               randconfig-a013-20210330
x86_64               randconfig-a011-20210330

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
