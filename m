Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 62DCA39B0A4
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  4 Jun 2021 04:57:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229695AbhFDC7a (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 3 Jun 2021 22:59:30 -0400
Received: from mga18.intel.com ([134.134.136.126]:50252 "EHLO mga18.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229576AbhFDC7a (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 3 Jun 2021 22:59:30 -0400
IronPort-SDR: sXapsckivIi4hAvmKmB+Vx+r6tzCWC1JxxklT9IEfA18Ip67QSTya06dSyeQSGV3QkhRKKaVnm
 X5SDaXVyn5lg==
X-IronPort-AV: E=McAfee;i="6200,9189,10004"; a="191547182"
X-IronPort-AV: E=Sophos;i="5.83,246,1616482800"; 
   d="scan'208";a="191547182"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Jun 2021 19:57:45 -0700
IronPort-SDR: LLNaqN6AL2bXsclR4Cvqc8P/KTLGyxyKQ1OAQxWket3r4+NgXaxWqTV2r7yUlKZLauwgAmJXXO
 KTCHAcs0SylQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.83,246,1616482800"; 
   d="scan'208";a="417615622"
Received: from lkp-server02.sh.intel.com (HELO 1ec8406c5392) ([10.239.97.151])
  by orsmga002.jf.intel.com with ESMTP; 03 Jun 2021 19:57:43 -0700
Received: from kbuild by 1ec8406c5392 with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1lp01m-0006cB-Ui; Fri, 04 Jun 2021 02:57:42 +0000
Date:   Fri, 04 Jun 2021 10:57:09 +0800
From:   kernel test robot <lkp@intel.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     linux-renesas-soc@vger.kernel.org
Subject: [renesas-drivers:renesas-clk] BUILD SUCCESS
 790c06cc5df263cdaff748670cc65958c81b0951
Message-ID: <60b99685.aMVIVV7yZpaRQHAP%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git renesas-clk
branch HEAD: 790c06cc5df263cdaff748670cc65958c81b0951  clk: renesas: r8a77995: Add ZA2 clock

elapsed time: 10854m

configs tested: 215
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                                 defconfig
arm64                            allyesconfig
arm64                               defconfig
arm                              allyesconfig
arm                              allmodconfig
arc                          axs101_defconfig
xtensa                generic_kc705_defconfig
arm                         s3c6400_defconfig
m68k                       m5249evb_defconfig
sh                  sh7785lcr_32bit_defconfig
arm                              alldefconfig
powerpc                       ebony_defconfig
arm                           viper_defconfig
arm                            mps2_defconfig
arm                         orion5x_defconfig
powerpc                        icon_defconfig
mips                      maltaaprp_defconfig
arm                     davinci_all_defconfig
mips                         bigsur_defconfig
mips                            ar7_defconfig
arm                         s5pv210_defconfig
m68k                            mac_defconfig
powerpc                     ppa8548_defconfig
powerpc                    sam440ep_defconfig
sh                        edosk7760_defconfig
arm                          iop32x_defconfig
arm                         lpc32xx_defconfig
arm                          ixp4xx_defconfig
sh                          lboxre2_defconfig
mips                        workpad_defconfig
powerpc                   bluestone_defconfig
sh                         apsh4a3a_defconfig
arc                    vdk_hs38_smp_defconfig
arm                        mvebu_v5_defconfig
nds32                            alldefconfig
arm                            hisi_defconfig
mips                         mpc30x_defconfig
powerpc                      ppc40x_defconfig
sh                          rsk7201_defconfig
m68k                       m5475evb_defconfig
m68k                        m5307c3_defconfig
m68k                         apollo_defconfig
sh                           se7712_defconfig
arm                        keystone_defconfig
s390                          debug_defconfig
mips                     loongson1b_defconfig
mips                      pistachio_defconfig
sh                   rts7751r2dplus_defconfig
arm                         axm55xx_defconfig
powerpc                 mpc834x_itx_defconfig
nios2                            allyesconfig
arm                           spitz_defconfig
arm                     am200epdkit_defconfig
arm                             pxa_defconfig
sh                            titan_defconfig
mips                        jmr3927_defconfig
microblaze                          defconfig
powerpc                 mpc8313_rdb_defconfig
arc                     nsimosci_hs_defconfig
mips                        nlm_xlp_defconfig
sh                            shmin_defconfig
arm                          collie_defconfig
ia64                             allmodconfig
um                           x86_64_defconfig
mips                      malta_kvm_defconfig
um                             i386_defconfig
xtensa                       common_defconfig
arm                         lpc18xx_defconfig
arm64                            alldefconfig
arc                            hsdk_defconfig
arm                             ezx_defconfig
xtensa                           allyesconfig
sh                             sh03_defconfig
arm                         lubbock_defconfig
sparc                       sparc64_defconfig
powerpc                        cell_defconfig
sh                        sh7757lcr_defconfig
openrisc                  or1klitex_defconfig
arm                        spear6xx_defconfig
powerpc                      arches_defconfig
arm                         shannon_defconfig
arc                     haps_hs_smp_defconfig
mips                        maltaup_defconfig
powerpc64                        alldefconfig
sh                          rsk7269_defconfig
powerpc64                           defconfig
sh                          r7785rp_defconfig
mips                          ath25_defconfig
powerpc                     stx_gp3_defconfig
mips                        omega2p_defconfig
arm                        mini2440_defconfig
arm                          badge4_defconfig
ia64                             alldefconfig
powerpc                 mpc836x_mds_defconfig
arm                      jornada720_defconfig
powerpc                    ge_imp3a_defconfig
sh                          polaris_defconfig
powerpc                      obs600_defconfig
powerpc                        fsp2_defconfig
arm                        multi_v7_defconfig
mips                     cu1830-neo_defconfig
nios2                         3c120_defconfig
powerpc                     powernv_defconfig
h8300                               defconfig
m68k                       m5208evb_defconfig
mips                     decstation_defconfig
powerpc                    klondike_defconfig
mips                           jazz_defconfig
powerpc                  mpc885_ads_defconfig
arm                            mmp2_defconfig
powerpc                   currituck_defconfig
sh                     magicpanelr2_defconfig
arm                            qcom_defconfig
arm                       cns3420vb_defconfig
arc                        nsim_700_defconfig
m68k                        mvme147_defconfig
mips                        nlm_xlr_defconfig
powerpc                   motionpro_defconfig
powerpc                      bamboo_defconfig
arm                          exynos_defconfig
m68k                        stmark2_defconfig
arm                           corgi_defconfig
mips                     cu1000-neo_defconfig
parisc                generic-64bit_defconfig
mips                           ci20_defconfig
mips                           xway_defconfig
m68k                          sun3x_defconfig
sparc                       sparc32_defconfig
sh                          r7780mp_defconfig
powerpc               mpc834x_itxgp_defconfig
arm                         cm_x300_defconfig
powerpc                    mvme5100_defconfig
mips                       capcella_defconfig
powerpc                     mpc83xx_defconfig
x86_64                            allnoconfig
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
h8300                            allyesconfig
arc                                 defconfig
sh                               allmodconfig
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
powerpc                           allnoconfig
x86_64               randconfig-a005-20210526
x86_64               randconfig-a001-20210526
x86_64               randconfig-a006-20210526
x86_64               randconfig-a003-20210526
x86_64               randconfig-a004-20210526
x86_64               randconfig-a002-20210526
i386                 randconfig-a001-20210526
i386                 randconfig-a002-20210526
i386                 randconfig-a005-20210526
i386                 randconfig-a004-20210526
i386                 randconfig-a003-20210526
i386                 randconfig-a006-20210526
i386                 randconfig-a001-20210527
i386                 randconfig-a002-20210527
i386                 randconfig-a005-20210527
i386                 randconfig-a003-20210527
i386                 randconfig-a004-20210527
i386                 randconfig-a006-20210527
x86_64               randconfig-a013-20210527
x86_64               randconfig-a012-20210527
x86_64               randconfig-a014-20210527
x86_64               randconfig-a016-20210527
x86_64               randconfig-a015-20210527
x86_64               randconfig-a011-20210527
i386                 randconfig-a011-20210526
i386                 randconfig-a016-20210526
i386                 randconfig-a015-20210526
i386                 randconfig-a012-20210526
i386                 randconfig-a014-20210526
i386                 randconfig-a013-20210526
riscv                    nommu_k210_defconfig
riscv                            allyesconfig
riscv                    nommu_virt_defconfig
riscv                             allnoconfig
riscv                               defconfig
riscv                          rv32_defconfig
riscv                            allmodconfig
um                            kunit_defconfig
x86_64                           allyesconfig
x86_64                    rhel-8.3-kselftests
x86_64                              defconfig
x86_64                               rhel-8.3
x86_64                      rhel-8.3-kbuiltin
x86_64                                  kexec

clang tested configs:
x86_64               randconfig-b001-20210527
x86_64               randconfig-a013-20210526
x86_64               randconfig-a012-20210526
x86_64               randconfig-a014-20210526
x86_64               randconfig-a016-20210526
x86_64               randconfig-a015-20210526
x86_64               randconfig-a011-20210526

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
