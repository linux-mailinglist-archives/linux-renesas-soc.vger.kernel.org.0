Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 037533B0FF2
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 23 Jun 2021 00:15:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229718AbhFVWRm (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 22 Jun 2021 18:17:42 -0400
Received: from mga17.intel.com ([192.55.52.151]:39782 "EHLO mga17.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229873AbhFVWRl (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 22 Jun 2021 18:17:41 -0400
IronPort-SDR: vJDbUNlQYiVpxPtxzC+GpwHf0PMltEKWq2Dt3UiRDEmq0RWTW4QMX8zHXIb/vVpgKHEkCfga2x
 TMFcWFCmzenA==
X-IronPort-AV: E=McAfee;i="6200,9189,10023"; a="187533475"
X-IronPort-AV: E=Sophos;i="5.83,292,1616482800"; 
   d="scan'208";a="187533475"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Jun 2021 15:15:25 -0700
IronPort-SDR: WXrbbjVgdycef6Nz/XmmeNN3CNqfPO9Ejw49VFbCaxTpELM8nxEzpBSsRZ5cMSqdKNZts0ikL9
 OkL6V0IsbPFA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.83,292,1616482800"; 
   d="scan'208";a="480946337"
Received: from lkp-server01.sh.intel.com (HELO 4aae0cb4f5b5) ([10.239.97.150])
  by FMSMGA003.fm.intel.com with ESMTP; 22 Jun 2021 15:15:23 -0700
Received: from kbuild by 4aae0cb4f5b5 with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1lvofz-0005Ul-0r; Tue, 22 Jun 2021 22:15:23 +0000
Date:   Wed, 23 Jun 2021 06:14:51 +0800
From:   kernel test robot <lkp@intel.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     linux-renesas-soc@vger.kernel.org
Subject: [renesas-devel:renesas-arm-dt-for-v5.15] BUILD SUCCESS
 6b5a9900c4a8315e2fcc93089f3544d74ed8c8e6
Message-ID: <60d260db.cYWr6avgNIeQMv/x%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git renesas-arm-dt-for-v5.15
branch HEAD: 6b5a9900c4a8315e2fcc93089f3544d74ed8c8e6  arm64: dts: renesas: r8a77990: ebisu: Add SW4 support

elapsed time: 726m

configs tested: 193
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                                 defconfig
arm64                            allyesconfig
arm64                               defconfig
arm                              allyesconfig
arm                              allmodconfig
powerpc                      mgcoge_defconfig
sh                            titan_defconfig
arm                         s5pv210_defconfig
h8300                            alldefconfig
sh                           se7619_defconfig
arc                          axs103_defconfig
arm                            lart_defconfig
powerpc                        fsp2_defconfig
sparc64                             defconfig
mips                         mpc30x_defconfig
arm                        multi_v7_defconfig
powerpc                 mpc8315_rdb_defconfig
powerpc                   motionpro_defconfig
arc                        vdk_hs38_defconfig
powerpc                     powernv_defconfig
powerpc                 mpc832x_rdb_defconfig
powerpc                     tqm5200_defconfig
powerpc                    gamecube_defconfig
powerpc                 xes_mpc85xx_defconfig
arm                         at91_dt_defconfig
mips                         db1xxx_defconfig
arc                        nsimosci_defconfig
um                           x86_64_defconfig
arm                       imx_v4_v5_defconfig
alpha                            alldefconfig
powerpc                      ppc64e_defconfig
microblaze                          defconfig
mips                         rt305x_defconfig
arm                           h5000_defconfig
sh                           se7343_defconfig
sh                           sh2007_defconfig
sh                           se7705_defconfig
powerpc                  mpc866_ads_defconfig
mips                     cu1830-neo_defconfig
i386                                defconfig
powerpc                      acadia_defconfig
arc                     nsimosci_hs_defconfig
arm                         cm_x300_defconfig
sh                   secureedge5410_defconfig
mips                  decstation_64_defconfig
powerpc                     stx_gp3_defconfig
powerpc                 mpc85xx_cds_defconfig
arm                    vt8500_v6_v7_defconfig
openrisc                            defconfig
arm                        keystone_defconfig
arm                          exynos_defconfig
mips                       lemote2f_defconfig
arm                         hackkit_defconfig
arc                     haps_hs_smp_defconfig
m68k                       m5475evb_defconfig
arm                       netwinder_defconfig
sh                          polaris_defconfig
m68k                         apollo_defconfig
powerpc                      katmai_defconfig
sh                          rsk7264_defconfig
arm                            dove_defconfig
powerpc                     ksi8560_defconfig
sh                           se7780_defconfig
arm                              alldefconfig
openrisc                         alldefconfig
mips                      fuloong2e_defconfig
sh                             espt_defconfig
arm                         palmz72_defconfig
sh                            shmin_defconfig
powerpc                 mpc836x_mds_defconfig
arm                            zeus_defconfig
powerpc               mpc834x_itxgp_defconfig
mips                           mtx1_defconfig
arc                    vdk_hs38_smp_defconfig
arm                       aspeed_g5_defconfig
arc                        nsim_700_defconfig
arm                       versatile_defconfig
mips                         tb0226_defconfig
sh                          lboxre2_defconfig
mips                           jazz_defconfig
sh                               allmodconfig
mips                        jmr3927_defconfig
powerpc                     pq2fads_defconfig
powerpc                    amigaone_defconfig
sh                          rsk7269_defconfig
powerpc                          g5_defconfig
arm                            hisi_defconfig
powerpc                      pcm030_defconfig
arm                           sama5_defconfig
arm                       cns3420vb_defconfig
mips                   sb1250_swarm_defconfig
sh                           se7722_defconfig
powerpc                      pasemi_defconfig
m68k                       m5208evb_defconfig
ia64                         bigsur_defconfig
arm                      tct_hammer_defconfig
sh                           se7712_defconfig
arm                             ezx_defconfig
sh                 kfr2r09-romimage_defconfig
mips                        omega2p_defconfig
m68k                         amcore_defconfig
xtensa                  nommu_kc705_defconfig
sh                                  defconfig
arm                        mvebu_v5_defconfig
sh                   sh7770_generic_defconfig
powerpc                     kmeter1_defconfig
arm                         orion5x_defconfig
h8300                       h8s-sim_defconfig
mips                        bcm47xx_defconfig
powerpc                        icon_defconfig
arm                       aspeed_g4_defconfig
parisc                generic-64bit_defconfig
powerpc                     sbc8548_defconfig
powerpc                   currituck_defconfig
um                               alldefconfig
mips                         bigsur_defconfig
mips                        nlm_xlr_defconfig
xtensa                           alldefconfig
powerpc                     ppa8548_defconfig
powerpc                    sam440ep_defconfig
arm                             rpc_defconfig
powerpc                     sequoia_defconfig
x86_64                            allnoconfig
ia64                             allmodconfig
ia64                                defconfig
ia64                             allyesconfig
m68k                             allmodconfig
m68k                                defconfig
m68k                             allyesconfig
nios2                               defconfig
nds32                             allnoconfig
arc                              allyesconfig
nds32                               defconfig
nios2                            allyesconfig
csky                                defconfig
alpha                               defconfig
alpha                            allyesconfig
arc                                 defconfig
xtensa                           allyesconfig
h8300                            allyesconfig
parisc                              defconfig
s390                             allyesconfig
s390                             allmodconfig
parisc                           allyesconfig
s390                                defconfig
i386                             allyesconfig
sparc                            allyesconfig
sparc                               defconfig
mips                             allyesconfig
mips                             allmodconfig
powerpc                          allmodconfig
powerpc                           allnoconfig
powerpc                          allyesconfig
i386                 randconfig-a001-20210622
i386                 randconfig-a002-20210622
i386                 randconfig-a003-20210622
i386                 randconfig-a006-20210622
i386                 randconfig-a005-20210622
i386                 randconfig-a004-20210622
x86_64               randconfig-a012-20210622
x86_64               randconfig-a016-20210622
x86_64               randconfig-a015-20210622
x86_64               randconfig-a014-20210622
x86_64               randconfig-a013-20210622
x86_64               randconfig-a011-20210622
i386                 randconfig-a011-20210622
i386                 randconfig-a014-20210622
i386                 randconfig-a013-20210622
i386                 randconfig-a015-20210622
i386                 randconfig-a012-20210622
i386                 randconfig-a016-20210622
riscv                    nommu_k210_defconfig
riscv                    nommu_virt_defconfig
riscv                             allnoconfig
riscv                               defconfig
riscv                          rv32_defconfig
riscv                            allyesconfig
riscv                            allmodconfig
x86_64                    rhel-8.3-kselftests
um                             i386_defconfig
um                            kunit_defconfig
x86_64                              defconfig
x86_64                                  kexec
x86_64                           allyesconfig
x86_64                               rhel-8.3
x86_64                      rhel-8.3-kbuiltin

clang tested configs:
x86_64               randconfig-b001-20210622
x86_64               randconfig-a002-20210622
x86_64               randconfig-a001-20210622
x86_64               randconfig-a005-20210622
x86_64               randconfig-a003-20210622
x86_64               randconfig-a004-20210622
x86_64               randconfig-a006-20210622

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
