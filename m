Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0E25137B5C7
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 12 May 2021 08:16:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229704AbhELGR6 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 12 May 2021 02:17:58 -0400
Received: from mga11.intel.com ([192.55.52.93]:44147 "EHLO mga11.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229580AbhELGR5 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 12 May 2021 02:17:57 -0400
IronPort-SDR: y+lbM7Qn4TN/0ppCN9Hd2F08K/F0v58BcAlQ7Uj7xoIGb0I1pOoS7sZNUKJ/4lqkZ7E24GVlt+
 5OEdwdIXIazw==
X-IronPort-AV: E=McAfee;i="6200,9189,9981"; a="196534108"
X-IronPort-AV: E=Sophos;i="5.82,293,1613462400"; 
   d="scan'208";a="196534108"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 May 2021 23:16:50 -0700
IronPort-SDR: OXwEwNVklJ/cW6V6ieol75GJJ0mKRfPDhneqsHjtAU9Qllfvx57rN66kuYDbh4NXt33Y7HeRJJ
 uyC9lIMBmXQA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.82,293,1613462400"; 
   d="scan'208";a="471352793"
Received: from lkp-server01.sh.intel.com (HELO 1e931876798f) ([10.239.97.150])
  by orsmga001.jf.intel.com with ESMTP; 11 May 2021 23:16:48 -0700
Received: from kbuild by 1e931876798f with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1lgiAp-00001T-Sf; Wed, 12 May 2021 06:16:47 +0000
Date:   Wed, 12 May 2021 14:16:31 +0800
From:   kernel test robot <lkp@intel.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     linux-renesas-soc@vger.kernel.org
Subject: [renesas-devel:next] BUILD SUCCESS
 81ca6c161d39b686d380f0bd5b34e6782451703f
Message-ID: <609b72bf.cGP4EcpqZ9XwhPEB%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git next
branch HEAD: 81ca6c161d39b686d380f0bd5b34e6782451703f  Merge branch 'renesas-arm-dt-for-v5.14' into renesas-next

elapsed time: 1272m

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
x86_64                           allyesconfig
riscv                            allmodconfig
riscv                            allyesconfig
i386                             allyesconfig
powerpc                    amigaone_defconfig
nios2                            allyesconfig
mips                      malta_kvm_defconfig
arm                           u8500_defconfig
sh                            hp6xx_defconfig
sh                  sh7785lcr_32bit_defconfig
sh                ecovec24-romimage_defconfig
powerpc                     pseries_defconfig
powerpc                  storcenter_defconfig
arm                      footbridge_defconfig
mips                            gpr_defconfig
sh                           se7705_defconfig
mips                        workpad_defconfig
arm                        shmobile_defconfig
arm                  colibri_pxa270_defconfig
arm                         axm55xx_defconfig
m68k                       m5475evb_defconfig
sparc                       sparc64_defconfig
powerpc                   currituck_defconfig
m68k                        mvme147_defconfig
sh                             shx3_defconfig
mips                        qi_lb60_defconfig
parisc                generic-32bit_defconfig
powerpc                     tqm8548_defconfig
powerpc64                           defconfig
powerpc                     ep8248e_defconfig
mips                      bmips_stb_defconfig
mips                         tb0226_defconfig
powerpc                     tqm8541_defconfig
powerpc                 mpc834x_itx_defconfig
powerpc                     rainier_defconfig
powerpc                      ppc64e_defconfig
arm                         s3c2410_defconfig
arm                           viper_defconfig
mips                     loongson1c_defconfig
arm                        mvebu_v5_defconfig
mips                          ath25_defconfig
sh                            migor_defconfig
mips                     decstation_defconfig
m68k                        m5407c3_defconfig
arm                            xcep_defconfig
h8300                     edosk2674_defconfig
powerpc                        fsp2_defconfig
xtensa                           alldefconfig
powerpc                     tqm8560_defconfig
powerpc                     ppa8548_defconfig
arm                        multi_v7_defconfig
sh                               alldefconfig
arc                    vdk_hs38_smp_defconfig
powerpc                       holly_defconfig
sh                        apsh4ad0a_defconfig
mips                       lemote2f_defconfig
powerpc                   motionpro_defconfig
openrisc                  or1klitex_defconfig
sh                   secureedge5410_defconfig
arm                         vf610m4_defconfig
x86_64                            allnoconfig
sh                          rsk7201_defconfig
xtensa                generic_kc705_defconfig
arm                             mxs_defconfig
arm                           tegra_defconfig
ia64                             alldefconfig
arm                        spear3xx_defconfig
arm                              alldefconfig
sh                          lboxre2_defconfig
powerpc                       maple_defconfig
xtensa                         virt_defconfig
arc                 nsimosci_hs_smp_defconfig
sh                        edosk7760_defconfig
mips                       capcella_defconfig
powerpc                  mpc866_ads_defconfig
sh                 kfr2r09-romimage_defconfig
powerpc                      bamboo_defconfig
riscv                             allnoconfig
s390                                defconfig
m68k                       m5208evb_defconfig
sh                        sh7763rdp_defconfig
sh                             espt_defconfig
powerpc                 mpc837x_mds_defconfig
powerpc                    ge_imp3a_defconfig
arc                        vdk_hs38_defconfig
arm                         socfpga_defconfig
m68k                          amiga_defconfig
arm                          pcm027_defconfig
powerpc                 xes_mpc85xx_defconfig
mips                        jmr3927_defconfig
s390                             allmodconfig
sh                        dreamcast_defconfig
arm                       imx_v4_v5_defconfig
sh                                  defconfig
sh                          rsk7264_defconfig
powerpc                     pq2fads_defconfig
arm                           sama5_defconfig
powerpc                   lite5200b_defconfig
m68k                        mvme16x_defconfig
powerpc                         wii_defconfig
ia64                         bigsur_defconfig
mips                        nlm_xlp_defconfig
powerpc                         ps3_defconfig
sh                          r7785rp_defconfig
mips                        omega2p_defconfig
powerpc                     tqm8540_defconfig
arm                          imote2_defconfig
arm                      pxa255-idp_defconfig
arm                          iop32x_defconfig
arm                         assabet_defconfig
powerpc                     kilauea_defconfig
mips                        bcm63xx_defconfig
powerpc                 mpc836x_rdk_defconfig
mips                         tb0287_defconfig
m68k                            q40_defconfig
arm                            pleb_defconfig
m68k                           sun3_defconfig
arm                           corgi_defconfig
powerpc                      pasemi_defconfig
m68k                       m5249evb_defconfig
powerpc                      chrp32_defconfig
arm                      tct_hammer_defconfig
arm                     am200epdkit_defconfig
um                            kunit_defconfig
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
alpha                               defconfig
alpha                            allyesconfig
xtensa                           allyesconfig
h8300                            allyesconfig
arc                                 defconfig
sh                               allmodconfig
parisc                              defconfig
s390                             allyesconfig
parisc                           allyesconfig
sparc                            allyesconfig
sparc                               defconfig
i386                                defconfig
mips                             allyesconfig
mips                             allmodconfig
powerpc                          allyesconfig
powerpc                          allmodconfig
powerpc                           allnoconfig
i386                 randconfig-a003-20210511
i386                 randconfig-a001-20210511
i386                 randconfig-a005-20210511
i386                 randconfig-a004-20210511
i386                 randconfig-a002-20210511
i386                 randconfig-a006-20210511
x86_64               randconfig-a012-20210511
x86_64               randconfig-a015-20210511
x86_64               randconfig-a011-20210511
x86_64               randconfig-a013-20210511
x86_64               randconfig-a016-20210511
x86_64               randconfig-a014-20210511
i386                 randconfig-a016-20210511
i386                 randconfig-a014-20210511
i386                 randconfig-a011-20210511
i386                 randconfig-a015-20210511
i386                 randconfig-a012-20210511
i386                 randconfig-a013-20210511
riscv                    nommu_k210_defconfig
riscv                    nommu_virt_defconfig
riscv                               defconfig
riscv                          rv32_defconfig
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
x86_64               randconfig-a003-20210511
x86_64               randconfig-a004-20210511
x86_64               randconfig-a001-20210511
x86_64               randconfig-a005-20210511
x86_64               randconfig-a002-20210511
x86_64               randconfig-a006-20210511

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
