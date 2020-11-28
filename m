Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 059112C6DED
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 28 Nov 2020 01:25:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730739AbgK1AWp (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 27 Nov 2020 19:22:45 -0500
Received: from mga02.intel.com ([134.134.136.20]:17849 "EHLO mga02.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1731627AbgK1AWQ (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 27 Nov 2020 19:22:16 -0500
IronPort-SDR: 8ktCu81U5vs4ogHAS0nhCGdmlor3dNEyP1ySFBnxVdKDTcn8X0EecP7xlfUkmcHPK2MBPKBm0d
 GvkVPD64VhOA==
X-IronPort-AV: E=McAfee;i="6000,8403,9818"; a="159491620"
X-IronPort-AV: E=Sophos;i="5.78,376,1599548400"; 
   d="scan'208";a="159491620"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Nov 2020 16:22:05 -0800
IronPort-SDR: +uVbHKHRsMQ+HCCW44EwXmXM0xbaMadxLuQVtY36yYDGFq8p5iYt12eOF7B1QD0Ci86ZtB10Bq
 gniiQs9yQzbg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.78,376,1599548400"; 
   d="scan'208";a="371717177"
Received: from lkp-server01.sh.intel.com (HELO b5888d13d5a5) ([10.239.97.150])
  by FMSMGA003.fm.intel.com with ESMTP; 27 Nov 2020 16:22:04 -0800
Received: from kbuild by b5888d13d5a5 with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1kio03-0000Dn-Jx; Sat, 28 Nov 2020 00:22:03 +0000
Date:   Sat, 28 Nov 2020 08:21:08 +0800
From:   kernel test robot <lkp@intel.com>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     linux-renesas-soc@vger.kernel.org
Subject: [renesas-devel:next] BUILD SUCCESS
 d5360d3b5aeeef32ff4da8648b172ff78c6a35f9
Message-ID: <5fc197f4.EQsuaGMKL30w6ggk%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git  next
branch HEAD: d5360d3b5aeeef32ff4da8648b172ff78c6a35f9  Merge branch 'renesas-arm-dt-for-v5.11' into renesas-next

elapsed time: 724m

configs tested: 157
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
mips                         rt305x_defconfig
powerpc                      mgcoge_defconfig
m68k                        mvme16x_defconfig
powerpc                    mvme5100_defconfig
arm                           efm32_defconfig
powerpc                    sam440ep_defconfig
m68k                       m5475evb_defconfig
xtensa                    smp_lx200_defconfig
arm                         mv78xx0_defconfig
sh                   secureedge5410_defconfig
arm                      pxa255-idp_defconfig
arm                           spitz_defconfig
sh                           sh2007_defconfig
sh                     sh7710voipgw_defconfig
mips                        workpad_defconfig
nds32                             allnoconfig
powerpc                      arches_defconfig
mips                            gpr_defconfig
m68k                           sun3_defconfig
sh                         ap325rxa_defconfig
powerpc                      pasemi_defconfig
mips                         bigsur_defconfig
mips                        omega2p_defconfig
xtensa                       common_defconfig
powerpc                     kilauea_defconfig
arm                            qcom_defconfig
m68k                          atari_defconfig
arm                           omap1_defconfig
mips                      pistachio_defconfig
powerpc                 mpc85xx_cds_defconfig
mips                     loongson1c_defconfig
alpha                               defconfig
arm                         s3c2410_defconfig
powerpc                        cell_defconfig
sh                   rts7751r2dplus_defconfig
xtensa                  cadence_csp_defconfig
arm                       omap2plus_defconfig
arm                          pxa3xx_defconfig
xtensa                generic_kc705_defconfig
powerpc                     pq2fads_defconfig
ia64                            zx1_defconfig
arm                       aspeed_g5_defconfig
arc                        nsim_700_defconfig
arm                            xcep_defconfig
powerpc                     skiroot_defconfig
arm                         lpc18xx_defconfig
m68k                        m5407c3_defconfig
mips                     cu1000-neo_defconfig
x86_64                           alldefconfig
arm                         cm_x300_defconfig
mips                          malta_defconfig
arm                          pxa168_defconfig
openrisc                 simple_smp_defconfig
powerpc                 mpc834x_itx_defconfig
sh                          polaris_defconfig
nds32                               defconfig
arm                            pleb_defconfig
powerpc                 mpc834x_mds_defconfig
arm                          simpad_defconfig
sh                                  defconfig
ia64                      gensparse_defconfig
arm                          collie_defconfig
powerpc                     mpc5200_defconfig
openrisc                         alldefconfig
arc                    vdk_hs38_smp_defconfig
powerpc                   currituck_defconfig
arm                          tango4_defconfig
powerpc                      tqm8xx_defconfig
mips                           ip27_defconfig
powerpc64                           defconfig
arm                          ep93xx_defconfig
mips                          ath25_defconfig
microblaze                      mmu_defconfig
sh                             sh03_defconfig
sparc64                             defconfig
arm                            dove_defconfig
arm                  colibri_pxa300_defconfig
arm                           corgi_defconfig
sh                          kfr2r09_defconfig
sh                          sdk7786_defconfig
mips                           ip22_defconfig
sh                           se7722_defconfig
powerpc                 linkstation_defconfig
arm                        oxnas_v6_defconfig
riscv                          rv32_defconfig
sh                          rsk7201_defconfig
ia64                             allmodconfig
ia64                                defconfig
ia64                             allyesconfig
m68k                             allmodconfig
m68k                                defconfig
m68k                             allyesconfig
nios2                               defconfig
arc                              allyesconfig
c6x                              allyesconfig
nios2                            allyesconfig
csky                                defconfig
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
i386                 randconfig-a004-20201127
i386                 randconfig-a003-20201127
i386                 randconfig-a002-20201127
i386                 randconfig-a005-20201127
i386                 randconfig-a001-20201127
i386                 randconfig-a006-20201127
x86_64               randconfig-a015-20201127
x86_64               randconfig-a011-20201127
x86_64               randconfig-a014-20201127
x86_64               randconfig-a016-20201127
x86_64               randconfig-a012-20201127
x86_64               randconfig-a013-20201127
i386                 randconfig-a012-20201127
i386                 randconfig-a013-20201127
i386                 randconfig-a011-20201127
i386                 randconfig-a016-20201127
i386                 randconfig-a014-20201127
i386                 randconfig-a015-20201127
riscv                    nommu_k210_defconfig
riscv                            allyesconfig
riscv                    nommu_virt_defconfig
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
x86_64               randconfig-a006-20201127
x86_64               randconfig-a003-20201127
x86_64               randconfig-a004-20201127
x86_64               randconfig-a005-20201127
x86_64               randconfig-a002-20201127
x86_64               randconfig-a001-20201127

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
