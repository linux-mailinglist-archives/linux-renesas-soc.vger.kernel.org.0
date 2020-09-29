Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0557C27DB86
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 30 Sep 2020 00:16:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728391AbgI2WQq (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 29 Sep 2020 18:16:46 -0400
Received: from mga01.intel.com ([192.55.52.88]:32278 "EHLO mga01.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728329AbgI2WQq (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 29 Sep 2020 18:16:46 -0400
IronPort-SDR: eA8inOrzPWTytdiraf9Fcd0HJ0lkwFjwXV52nsDMgnPKmNbbmizsxXpcCTwLZeOhowdSsGB2ws
 2YihM6QwtRog==
X-IronPort-AV: E=McAfee;i="6000,8403,9759"; a="180468164"
X-IronPort-AV: E=Sophos;i="5.77,320,1596524400"; 
   d="scan'208";a="180468164"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Sep 2020 15:16:45 -0700
IronPort-SDR: hTQ5WfHa9F6ltz4wIix6zUq6Ko/nr4+otDEN9EBiy06XSSjukOE06zprA8QGXDnnFWq/z6K6X/
 bkJ/kRoDsucw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.77,320,1596524400"; 
   d="scan'208";a="457433018"
Received: from lkp-server02.sh.intel.com (HELO 10ae44db8633) ([10.239.97.151])
  by orsmga004.jf.intel.com with ESMTP; 29 Sep 2020 15:16:42 -0700
Received: from kbuild by 10ae44db8633 with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1kNNvO-0000L4-BB; Tue, 29 Sep 2020 22:16:42 +0000
Date:   Wed, 30 Sep 2020 06:16:38 +0800
From:   kernel test robot <lkp@intel.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     linux-renesas-soc@vger.kernel.org
Subject: [renesas-drivers:renesas-clk] BUILD SUCCESS
 308ba04e78d60b21408eacef75efebe1a78874c8
Message-ID: <5f73b246.HF9FvBLYVd1su6wk%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git  renesas-clk
branch HEAD: 308ba04e78d60b21408eacef75efebe1a78874c8  MAINTAINERS: Update git repo for Renesas clock drivers

elapsed time: 724m

configs tested: 190
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                                 defconfig
arm64                            allyesconfig
arm64                               defconfig
arm                              allyesconfig
arm                              allmodconfig
powerpc                 xes_mpc85xx_defconfig
arc                      axs103_smp_defconfig
arc                         haps_hs_defconfig
arm                         orion5x_defconfig
powerpc                    ge_imp3a_defconfig
xtensa                           alldefconfig
mips                          ath79_defconfig
sh                        sh7757lcr_defconfig
m68k                            q40_defconfig
arc                           tb10x_defconfig
m68k                        mvme147_defconfig
sh                  sh7785lcr_32bit_defconfig
mips                         tb0219_defconfig
mips                         bigsur_defconfig
arc                             nps_defconfig
h8300                            alldefconfig
sh                            hp6xx_defconfig
ia64                        generic_defconfig
mips                       rbtx49xx_defconfig
powerpc                      pmac32_defconfig
powerpc64                        alldefconfig
sh                        sh7785lcr_defconfig
xtensa                         virt_defconfig
powerpc                   bluestone_defconfig
arm                         s5pv210_defconfig
arm                           efm32_defconfig
arm                         cm_x300_defconfig
powerpc64                           defconfig
sh                         apsh4a3a_defconfig
um                             i386_defconfig
arm                             ezx_defconfig
powerpc                      pasemi_defconfig
powerpc                 mpc8540_ads_defconfig
powerpc                     sequoia_defconfig
mips                           ip32_defconfig
powerpc                    amigaone_defconfig
sh                           se7751_defconfig
mips                      malta_kvm_defconfig
powerpc                     rainier_defconfig
arm                      tct_hammer_defconfig
powerpc                        icon_defconfig
powerpc                  mpc866_ads_defconfig
nios2                         3c120_defconfig
powerpc                 mpc832x_mds_defconfig
mips                             allmodconfig
m68k                             alldefconfig
arm                         socfpga_defconfig
arm                       spear13xx_defconfig
powerpc                     kmeter1_defconfig
ia64                             allmodconfig
arm                          gemini_defconfig
i386                                defconfig
powerpc                     stx_gp3_defconfig
xtensa                           allyesconfig
mips                          rm200_defconfig
m68k                       m5249evb_defconfig
arc                    vdk_hs38_smp_defconfig
mips                        maltaup_defconfig
arm                       versatile_defconfig
powerpc                  mpc885_ads_defconfig
arm                             pxa_defconfig
sh                           se7722_defconfig
riscv                    nommu_virt_defconfig
mips                      loongson3_defconfig
powerpc                     tqm8541_defconfig
m68k                        mvme16x_defconfig
powerpc                 mpc8560_ads_defconfig
mips                      pistachio_defconfig
s390                                defconfig
powerpc                 mpc837x_rdb_defconfig
s390                       zfcpdump_defconfig
powerpc                      ep88xc_defconfig
s390                             allyesconfig
arm                            u300_defconfig
sh                   sh7724_generic_defconfig
powerpc                     tqm8555_defconfig
sh                            shmin_defconfig
xtensa                  cadence_csp_defconfig
arc                        vdk_hs38_defconfig
m68k                                defconfig
powerpc                     akebono_defconfig
c6x                        evmc6457_defconfig
ia64                      gensparse_defconfig
powerpc                     ppa8548_defconfig
arm                      pxa255-idp_defconfig
powerpc                mpc7448_hpc2_defconfig
arm                          simpad_defconfig
sh                        edosk7705_defconfig
powerpc                    socrates_defconfig
arm                              zx_defconfig
c6x                         dsk6455_defconfig
sh                   sh7770_generic_defconfig
arm                           h5000_defconfig
powerpc               mpc834x_itxgp_defconfig
arm                       multi_v4t_defconfig
sh                             shx3_defconfig
microblaze                          defconfig
mips                   sb1250_swarm_defconfig
powerpc                      ppc6xx_defconfig
mips                        nlm_xlr_defconfig
um                            kunit_defconfig
powerpc                 mpc836x_mds_defconfig
arm                          ep93xx_defconfig
sh                           se7780_defconfig
parisc                           alldefconfig
arm                             mxs_defconfig
mips                            gpr_defconfig
ia64                            zx1_defconfig
c6x                        evmc6474_defconfig
arm                        spear3xx_defconfig
powerpc                 mpc836x_rdk_defconfig
arm                       aspeed_g5_defconfig
sparc                            alldefconfig
sh                         ecovec24_defconfig
riscv                          rv32_defconfig
mips                        bcm63xx_defconfig
nds32                               defconfig
mips                       capcella_defconfig
powerpc                     mpc83xx_defconfig
openrisc                    or1ksim_defconfig
sh                      rts7751r2d1_defconfig
alpha                            alldefconfig
sh                           se7712_defconfig
mips                     loongson1c_defconfig
um                           x86_64_defconfig
arm                        multi_v7_defconfig
ia64                                defconfig
ia64                             allyesconfig
m68k                             allmodconfig
m68k                             allyesconfig
nios2                               defconfig
arc                              allyesconfig
nds32                             allnoconfig
c6x                              allyesconfig
nios2                            allyesconfig
csky                                defconfig
alpha                               defconfig
alpha                            allyesconfig
h8300                            allyesconfig
arc                                 defconfig
sh                               allmodconfig
parisc                              defconfig
parisc                           allyesconfig
i386                             allyesconfig
sparc                            allyesconfig
sparc                               defconfig
mips                             allyesconfig
powerpc                          allyesconfig
powerpc                          allmodconfig
powerpc                           allnoconfig
i386                 randconfig-a006-20200929
i386                 randconfig-a002-20200929
i386                 randconfig-a003-20200929
i386                 randconfig-a004-20200929
i386                 randconfig-a005-20200929
i386                 randconfig-a001-20200929
x86_64               randconfig-a011-20200929
x86_64               randconfig-a013-20200929
x86_64               randconfig-a015-20200929
x86_64               randconfig-a014-20200929
x86_64               randconfig-a016-20200929
x86_64               randconfig-a012-20200929
i386                 randconfig-a012-20200929
i386                 randconfig-a016-20200929
i386                 randconfig-a014-20200929
i386                 randconfig-a013-20200929
i386                 randconfig-a015-20200929
i386                 randconfig-a011-20200929
riscv                    nommu_k210_defconfig
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
x86_64               randconfig-a005-20200929
x86_64               randconfig-a003-20200929
x86_64               randconfig-a004-20200929
x86_64               randconfig-a002-20200929
x86_64               randconfig-a006-20200929
x86_64               randconfig-a001-20200929

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
