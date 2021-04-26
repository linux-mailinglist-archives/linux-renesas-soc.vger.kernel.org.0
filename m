Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 976A136BAD4
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 26 Apr 2021 22:48:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234266AbhDZUte (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 26 Apr 2021 16:49:34 -0400
Received: from mga17.intel.com ([192.55.52.151]:19965 "EHLO mga17.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232492AbhDZUtd (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 26 Apr 2021 16:49:33 -0400
IronPort-SDR: 6hfdMLlYCXQlLSX2orIRqnAD5ycFxxlkAjh5eE7bAYVG7A8BgZWw5XIY9eLoIkW5f9J4J2mH8t
 A7PqGwy54kjw==
X-IronPort-AV: E=McAfee;i="6200,9189,9966"; a="176519209"
X-IronPort-AV: E=Sophos;i="5.82,252,1613462400"; 
   d="scan'208";a="176519209"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Apr 2021 13:48:51 -0700
IronPort-SDR: 35mMSET/xHcTFFKgM1fKe0GG0YiWdImPhAtFkGB5XUfOkmDyEsNsyHibziWT+9uEjBDg6PbhOg
 VAOpPOn/CXXg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.82,252,1613462400"; 
   d="scan'208";a="536338424"
Received: from lkp-server01.sh.intel.com (HELO a48ff7ddd223) ([10.239.97.150])
  by orsmga004.jf.intel.com with ESMTP; 26 Apr 2021 13:48:50 -0700
Received: from kbuild by a48ff7ddd223 with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1lb89x-00065b-JJ; Mon, 26 Apr 2021 20:48:49 +0000
Date:   Tue, 27 Apr 2021 04:48:03 +0800
From:   kernel test robot <lkp@intel.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     linux-renesas-soc@vger.kernel.org
Subject: [renesas-devel:renesas-arm-dt-for-v5.13] BUILD SUCCESS
 ad6b674db6630d37ab241fe6514aaf45661e1153
Message-ID: <60872703.5ZYjwU9UxUZCur7U%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git renesas-arm-dt-for-v5.13
branch HEAD: ad6b674db6630d37ab241fe6514aaf45661e1153  arm64: dts: renesas: Add port@0 node for all CSI-2 nodes to dtsi

elapsed time: 721m

configs tested: 164
configs skipped: 91

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
arc                        vdk_hs38_defconfig
arm                            dove_defconfig
mips                   sb1250_swarm_defconfig
mips                         tb0287_defconfig
sh                          rsk7264_defconfig
mips                     decstation_defconfig
powerpc                   currituck_defconfig
powerpc                     tqm8548_defconfig
arm                  colibri_pxa300_defconfig
powerpc                  mpc866_ads_defconfig
arm                       omap2plus_defconfig
arm                          gemini_defconfig
powerpc                    socrates_defconfig
openrisc                 simple_smp_defconfig
nds32                               defconfig
arm                        cerfcube_defconfig
h8300                    h8300h-sim_defconfig
powerpc                 mpc834x_mds_defconfig
arm                          pxa910_defconfig
arm                         socfpga_defconfig
arc                              allyesconfig
powerpc                 mpc832x_rdb_defconfig
arm                          exynos_defconfig
mips                            gpr_defconfig
arm                         orion5x_defconfig
powerpc                     akebono_defconfig
arm                       cns3420vb_defconfig
mips                       rbtx49xx_defconfig
arm                        trizeps4_defconfig
parisc                              defconfig
sh                         apsh4a3a_defconfig
sh                        edosk7705_defconfig
arm                              alldefconfig
sh                           se7751_defconfig
powerpc                     rainier_defconfig
powerpc                          g5_defconfig
m68k                       bvme6000_defconfig
sh                           se7206_defconfig
sh                          r7780mp_defconfig
sh                           se7712_defconfig
arm                     am200epdkit_defconfig
sh                          rsk7203_defconfig
arm                          moxart_defconfig
mips                     loongson1b_defconfig
powerpc                 mpc8313_rdb_defconfig
arc                                 defconfig
m68k                       m5475evb_defconfig
sh                            titan_defconfig
ia64                         bigsur_defconfig
powerpc                     skiroot_defconfig
arm                            lart_defconfig
arm                            xcep_defconfig
sh                            migor_defconfig
mips                             allmodconfig
x86_64                              defconfig
mips                     cu1830-neo_defconfig
m68k                          amiga_defconfig
arc                         haps_hs_defconfig
mips                malta_qemu_32r6_defconfig
openrisc                    or1ksim_defconfig
mips                         rt305x_defconfig
mips                         bigsur_defconfig
mips                        jmr3927_defconfig
mips                    maltaup_xpa_defconfig
powerpc                    ge_imp3a_defconfig
m68k                       m5208evb_defconfig
sh                             shx3_defconfig
arm                      integrator_defconfig
sh                           se7722_defconfig
arm                            mmp2_defconfig
powerpc                     taishan_defconfig
arm                        magician_defconfig
sh                            hp6xx_defconfig
xtensa                generic_kc705_defconfig
powerpc                    klondike_defconfig
mips                          malta_defconfig
powerpc                 canyonlands_defconfig
arm                       imx_v6_v7_defconfig
powerpc                    adder875_defconfig
sh                               j2_defconfig
ia64                        generic_defconfig
alpha                            allyesconfig
h8300                     edosk2674_defconfig
xtensa                          iss_defconfig
arm                          collie_defconfig
arm                      tct_hammer_defconfig
m68k                        m5407c3_defconfig
powerpc                    mvme5100_defconfig
sh                           se7619_defconfig
um                           x86_64_defconfig
arc                           tb10x_defconfig
arm                         palmz72_defconfig
powerpc                     mpc83xx_defconfig
ia64                             allmodconfig
ia64                                defconfig
ia64                             allyesconfig
m68k                             allmodconfig
m68k                                defconfig
m68k                             allyesconfig
nios2                               defconfig
nds32                             allnoconfig
nios2                            allyesconfig
csky                                defconfig
alpha                               defconfig
xtensa                           allyesconfig
h8300                            allyesconfig
sh                               allmodconfig
s390                             allyesconfig
s390                             allmodconfig
parisc                           allyesconfig
s390                                defconfig
sparc                            allyesconfig
sparc                               defconfig
i386                                defconfig
mips                             allyesconfig
powerpc                          allyesconfig
powerpc                          allmodconfig
powerpc                           allnoconfig
i386                 randconfig-a005-20210426
i386                 randconfig-a002-20210426
i386                 randconfig-a001-20210426
i386                 randconfig-a006-20210426
i386                 randconfig-a004-20210426
i386                 randconfig-a003-20210426
x86_64               randconfig-a015-20210426
x86_64               randconfig-a016-20210426
x86_64               randconfig-a011-20210426
x86_64               randconfig-a014-20210426
x86_64               randconfig-a012-20210426
x86_64               randconfig-a013-20210426
i386                 randconfig-a014-20210426
i386                 randconfig-a012-20210426
i386                 randconfig-a011-20210426
i386                 randconfig-a013-20210426
i386                 randconfig-a015-20210426
i386                 randconfig-a016-20210426
riscv                    nommu_k210_defconfig
riscv                    nommu_virt_defconfig
riscv                             allnoconfig
riscv                               defconfig
riscv                          rv32_defconfig
um                               allmodconfig
um                                allnoconfig
um                               allyesconfig
um                                  defconfig
x86_64                    rhel-8.3-kselftests
x86_64                               rhel-8.3
x86_64                      rhel-8.3-kbuiltin
x86_64                                  kexec

clang tested configs:
x86_64               randconfig-a002-20210426
x86_64               randconfig-a004-20210426
x86_64               randconfig-a001-20210426
x86_64               randconfig-a006-20210426
x86_64               randconfig-a005-20210426
x86_64               randconfig-a003-20210426

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
