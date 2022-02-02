Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6FB414A7AB3
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  2 Feb 2022 23:02:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1347739AbiBBWCa (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 2 Feb 2022 17:02:30 -0500
Received: from mga06.intel.com ([134.134.136.31]:58711 "EHLO mga06.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231777AbiBBWCa (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 2 Feb 2022 17:02:30 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1643839350; x=1675375350;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=i6uutqznXUngP7+9wUqDBuDlMwwkylEV6I7VFIckEj0=;
  b=BkqU8Sg0kQohPN5Nu8u/uYyGKG2gSJr+tDms10Zmy2Eb9W/8MDU1QquY
   7Q1h14VAAYhU2zlQbdfWd6L82yvSsuvaGwa8K0KsoKntYdrgw0oHL99jK
   C/fkDR9YZUIvIKERMWYAM6fvmJoY2JfApDEMUXtZNJKUHeV7YiKtmloPG
   NLvWRFSD1WvISfI9uqhKWgc6sCRzUulxhgx5NJUCNrL4AhT68omTcbnsT
   Jmy8UuIblOx0MjvpocsSDply3HR4yIR6UN0w16HJI8M7XAPaj4poxrfEv
   hOCGzxM/H9DgMAnM82s+wyFCwanyMXs1qPheM1ymen1JIuRg0drR0VMLb
   w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10246"; a="308756727"
X-IronPort-AV: E=Sophos;i="5.88,337,1635231600"; 
   d="scan'208";a="308756727"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Feb 2022 14:02:30 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,337,1635231600"; 
   d="scan'208";a="497920730"
Received: from lkp-server01.sh.intel.com (HELO 276f1b88eecb) ([10.239.97.150])
  by orsmga002.jf.intel.com with ESMTP; 02 Feb 2022 14:02:28 -0800
Received: from kbuild by 276f1b88eecb with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1nFNhs-000VBU-9h; Wed, 02 Feb 2022 22:02:28 +0000
Date:   Thu, 03 Feb 2022 06:02:14 +0800
From:   kernel test robot <lkp@intel.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     linux-renesas-soc@vger.kernel.org
Subject: [geert-renesas-drivers:renesas-clk-for-v5.18] BUILD SUCCESS
 678eb67513a963e5ce00a4ed6a07a5722bd1267e
Message-ID: <61faff66.5b/PC3HBWmwjTrqr%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git renesas-clk-for-v5.18
branch HEAD: 678eb67513a963e5ce00a4ed6a07a5722bd1267e  dt-bindings: clock: renesas: Document RZ/V2L SoC

elapsed time: 726m

configs tested: 166
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                                 defconfig
arm64                            allyesconfig
arm64                               defconfig
arm                              allyesconfig
arm                              allmodconfig
i386                 randconfig-c001-20220131
powerpc              randconfig-c003-20220131
i386                          randconfig-c001
nios2                         3c120_defconfig
nios2                         10m50_defconfig
arc                         haps_hs_defconfig
sh                           sh2007_defconfig
powerpc                     stx_gp3_defconfig
mips                  maltasmvp_eva_defconfig
m68k                          sun3x_defconfig
arm                          iop32x_defconfig
arc                              alldefconfig
powerpc                    amigaone_defconfig
powerpc                      ppc6xx_defconfig
arm                        mvebu_v7_defconfig
arc                     nsimosci_hs_defconfig
arm                        trizeps4_defconfig
sh                               alldefconfig
parisc                generic-32bit_defconfig
arc                           tb10x_defconfig
powerpc                      ppc40x_defconfig
powerpc                mpc7448_hpc2_defconfig
arc                        nsimosci_defconfig
sh                               j2_defconfig
m68k                       bvme6000_defconfig
m68k                             allyesconfig
ia64                                defconfig
sh                        apsh4ad0a_defconfig
sh                        dreamcast_defconfig
arm                      jornada720_defconfig
s390                       zfcpdump_defconfig
h8300                       h8s-sim_defconfig
powerpc                      pcm030_defconfig
parisc                generic-64bit_defconfig
m68k                        mvme147_defconfig
sh                           se7343_defconfig
mips                           ip32_defconfig
sh                            migor_defconfig
arm                        multi_v7_defconfig
powerpc                      tqm8xx_defconfig
arm                     eseries_pxa_defconfig
um                             i386_defconfig
ia64                      gensparse_defconfig
s390                          debug_defconfig
microblaze                          defconfig
mips                           ci20_defconfig
sh                                  defconfig
powerpc                     asp8347_defconfig
sh                          rsk7203_defconfig
sh                        edosk7760_defconfig
sh                           se7721_defconfig
nios2                               defconfig
h8300                     edosk2674_defconfig
arm                         axm55xx_defconfig
sh                             espt_defconfig
m68k                           sun3_defconfig
mips                           gcw0_defconfig
powerpc                     taishan_defconfig
sh                     sh7710voipgw_defconfig
powerpc                     tqm8541_defconfig
m68k                       m5208evb_defconfig
powerpc                   currituck_defconfig
arm                  randconfig-c002-20220131
arm                  randconfig-c002-20220130
ia64                             allmodconfig
ia64                             allyesconfig
m68k                             allmodconfig
m68k                                defconfig
arc                              allyesconfig
nds32                             allnoconfig
alpha                            allyesconfig
nds32                               defconfig
nios2                            allyesconfig
csky                                defconfig
alpha                               defconfig
xtensa                           allyesconfig
h8300                            allyesconfig
arc                                 defconfig
sh                               allmodconfig
parisc                              defconfig
s390                             allmodconfig
parisc                           allyesconfig
s390                             allyesconfig
s390                                defconfig
i386                             allyesconfig
sparc                               defconfig
i386                                defconfig
i386                   debian-10.3-kselftests
i386                              debian-10.3
sparc                            allyesconfig
mips                             allmodconfig
mips                             allyesconfig
powerpc                          allyesconfig
powerpc                          allmodconfig
powerpc                           allnoconfig
x86_64               randconfig-a004-20220131
x86_64               randconfig-a003-20220131
x86_64               randconfig-a001-20220131
x86_64               randconfig-a006-20220131
x86_64               randconfig-a005-20220131
x86_64               randconfig-a002-20220131
i386                 randconfig-a006-20220131
i386                 randconfig-a005-20220131
i386                 randconfig-a003-20220131
i386                 randconfig-a002-20220131
i386                 randconfig-a001-20220131
i386                 randconfig-a004-20220131
i386                          randconfig-a012
i386                          randconfig-a014
i386                          randconfig-a016
riscv                randconfig-r042-20220130
arc                  randconfig-r043-20220130
s390                 randconfig-r044-20220130
riscv                    nommu_k210_defconfig
riscv                            allyesconfig
riscv                    nommu_virt_defconfig
riscv                             allnoconfig
riscv                               defconfig
riscv                          rv32_defconfig
riscv                            allmodconfig
x86_64                    rhel-8.3-kselftests
um                           x86_64_defconfig
x86_64                           allyesconfig
x86_64                              defconfig
x86_64                               rhel-8.3
x86_64                          rhel-8.3-func
x86_64                                  kexec

clang tested configs:
riscv                randconfig-c006-20220130
x86_64                        randconfig-c007
arm                  randconfig-c002-20220130
powerpc              randconfig-c003-20220130
mips                 randconfig-c004-20220130
i386                          randconfig-c001
powerpc                     ppa8548_defconfig
powerpc                 xes_mpc85xx_defconfig
powerpc                 mpc8313_rdb_defconfig
mips                      maltaaprp_defconfig
powerpc                      katmai_defconfig
powerpc                     kilauea_defconfig
arm                              alldefconfig
powerpc                 mpc836x_rdk_defconfig
arm                         shannon_defconfig
powerpc                        icon_defconfig
i386                          randconfig-a002
i386                          randconfig-a006
i386                          randconfig-a004
x86_64               randconfig-a013-20220131
x86_64               randconfig-a015-20220131
x86_64               randconfig-a014-20220131
x86_64               randconfig-a016-20220131
x86_64               randconfig-a011-20220131
x86_64               randconfig-a012-20220131
i386                 randconfig-a011-20220131
i386                 randconfig-a013-20220131
i386                 randconfig-a014-20220131
i386                 randconfig-a012-20220131
i386                 randconfig-a015-20220131
i386                 randconfig-a016-20220131
riscv                randconfig-r042-20220131
hexagon              randconfig-r045-20220131
hexagon              randconfig-r041-20220131
hexagon              randconfig-r045-20220130
hexagon              randconfig-r041-20220130

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
