Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5AC2B3C1DC7
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  9 Jul 2021 05:26:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230462AbhGID2u (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 8 Jul 2021 23:28:50 -0400
Received: from mga14.intel.com ([192.55.52.115]:12544 "EHLO mga14.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230453AbhGID2u (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 8 Jul 2021 23:28:50 -0400
X-IronPort-AV: E=McAfee;i="6200,9189,10039"; a="209456051"
X-IronPort-AV: E=Sophos;i="5.84,225,1620716400"; 
   d="scan'208";a="209456051"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jul 2021 20:26:04 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.84,225,1620716400"; 
   d="scan'208";a="411127904"
Received: from lkp-server01.sh.intel.com (HELO 4aae0cb4f5b5) ([10.239.97.150])
  by orsmga006.jf.intel.com with ESMTP; 08 Jul 2021 20:26:03 -0700
Received: from kbuild by 4aae0cb4f5b5 with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1m1h9O-000EeW-Ps; Fri, 09 Jul 2021 03:26:02 +0000
Date:   Fri, 09 Jul 2021 11:25:05 +0800
From:   kernel test robot <lkp@intel.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     linux-renesas-soc@vger.kernel.org
Subject: [renesas-devel:renesas-fixes-for-v5.14] BUILD SUCCESS
 5aaa0696cb25eb4cd318aca7a395aad537f36629
Message-ID: <60e7c191.xGfWAJtQR5LNuoAt%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git renesas-fixes-for-v5.14
branch HEAD: 5aaa0696cb25eb4cd318aca7a395aad537f36629  dt-bindings: clock: r9a07g044-cpg: Update clock/reset definitions

elapsed time: 727m

configs tested: 171
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                                 defconfig
arm64                            allyesconfig
arm64                               defconfig
arm                              allyesconfig
arm                              allmodconfig
mips                      malta_kvm_defconfig
sh                           se7712_defconfig
m68k                       bvme6000_defconfig
arm                         palmz72_defconfig
mips                          rb532_defconfig
sh                           se7721_defconfig
m68k                         apollo_defconfig
powerpc                     asp8347_defconfig
arm                           u8500_defconfig
arm                            hisi_defconfig
sh                 kfr2r09-romimage_defconfig
x86_64                              defconfig
ia64                            zx1_defconfig
m68k                          multi_defconfig
arm                            mps2_defconfig
powerpc                 mpc8315_rdb_defconfig
powerpc                      chrp32_defconfig
powerpc                   bluestone_defconfig
powerpc                 mpc832x_rdb_defconfig
powerpc                     ep8248e_defconfig
arm                        oxnas_v6_defconfig
arm                         at91_dt_defconfig
arm                             rpc_defconfig
sparc                       sparc32_defconfig
arm                       multi_v4t_defconfig
m68k                        stmark2_defconfig
arm                          imote2_defconfig
arm                          pxa3xx_defconfig
sh                          urquell_defconfig
arc                    vdk_hs38_smp_defconfig
sh                        dreamcast_defconfig
mips                        nlm_xlp_defconfig
powerpc                         ps3_defconfig
powerpc                    sam440ep_defconfig
arm                           corgi_defconfig
arm                  colibri_pxa270_defconfig
mips                         cobalt_defconfig
powerpc                          allmodconfig
mips                     loongson2k_defconfig
sh                           se7724_defconfig
arc                        nsim_700_defconfig
s390                             allmodconfig
arm                         vf610m4_defconfig
arm                       aspeed_g4_defconfig
arm                            pleb_defconfig
xtensa                       common_defconfig
sh                           se7619_defconfig
mips                          rm200_defconfig
powerpc                      arches_defconfig
mips                        jmr3927_defconfig
arm                      footbridge_defconfig
powerpc                 canyonlands_defconfig
powerpc                     akebono_defconfig
powerpc                   motionpro_defconfig
sh                           se7750_defconfig
s390                          debug_defconfig
powerpc                    mvme5100_defconfig
sh                     magicpanelr2_defconfig
sh                               alldefconfig
mips                    maltaup_xpa_defconfig
nds32                             allnoconfig
sparc64                          alldefconfig
sh                        sh7757lcr_defconfig
powerpc                          allyesconfig
sh                   secureedge5410_defconfig
powerpc                     tqm8560_defconfig
arm                       aspeed_g5_defconfig
mips                       rbtx49xx_defconfig
powerpc                     tqm8548_defconfig
sh                               allmodconfig
arm                           h3600_defconfig
arm                        mvebu_v7_defconfig
sh                            hp6xx_defconfig
arm                         shannon_defconfig
powerpc                    gamecube_defconfig
mips                       bmips_be_defconfig
arm                        multi_v7_defconfig
arm                         socfpga_defconfig
sh                          rsk7269_defconfig
nios2                         10m50_defconfig
mips                        omega2p_defconfig
ia64                         bigsur_defconfig
powerpc                  mpc885_ads_defconfig
arm                     davinci_all_defconfig
riscv                    nommu_k210_defconfig
mips                     loongson1c_defconfig
mips                            gpr_defconfig
x86_64                            allnoconfig
ia64                             allmodconfig
ia64                                defconfig
ia64                             allyesconfig
m68k                             allmodconfig
m68k                                defconfig
m68k                             allyesconfig
nios2                               defconfig
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
i386                                defconfig
mips                             allyesconfig
mips                             allmodconfig
powerpc                           allnoconfig
x86_64               randconfig-a004-20210707
x86_64               randconfig-a002-20210707
x86_64               randconfig-a003-20210707
x86_64               randconfig-a001-20210707
x86_64               randconfig-a005-20210707
x86_64               randconfig-a006-20210707
i386                 randconfig-a004-20210707
i386                 randconfig-a006-20210707
i386                 randconfig-a001-20210707
i386                 randconfig-a003-20210707
i386                 randconfig-a005-20210707
i386                 randconfig-a002-20210707
i386                 randconfig-a006-20210708
i386                 randconfig-a004-20210708
i386                 randconfig-a001-20210708
i386                 randconfig-a003-20210708
i386                 randconfig-a005-20210708
i386                 randconfig-a002-20210708
x86_64               randconfig-a015-20210708
x86_64               randconfig-a011-20210708
x86_64               randconfig-a012-20210708
x86_64               randconfig-a014-20210708
x86_64               randconfig-a016-20210708
x86_64               randconfig-a013-20210708
i386                 randconfig-a015-20210707
i386                 randconfig-a016-20210707
i386                 randconfig-a012-20210707
i386                 randconfig-a011-20210707
i386                 randconfig-a014-20210707
i386                 randconfig-a013-20210707
riscv                            allyesconfig
riscv                             allnoconfig
riscv                               defconfig
riscv                            allmodconfig
riscv                    nommu_virt_defconfig
riscv                          rv32_defconfig
x86_64                    rhel-8.3-kselftests
um                           x86_64_defconfig
um                             i386_defconfig
um                            kunit_defconfig
x86_64                           allyesconfig
x86_64                               rhel-8.3
x86_64                      rhel-8.3-kbuiltin
x86_64                                  kexec

clang tested configs:
x86_64               randconfig-b001-20210707
x86_64               randconfig-a015-20210707
x86_64               randconfig-a014-20210707
x86_64               randconfig-a012-20210707
x86_64               randconfig-a011-20210707
x86_64               randconfig-a016-20210707
x86_64               randconfig-a013-20210707

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
