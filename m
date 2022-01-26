Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 75D0449C214
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 26 Jan 2022 04:28:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237154AbiAZD2f (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 25 Jan 2022 22:28:35 -0500
Received: from mga14.intel.com ([192.55.52.115]:25036 "EHLO mga14.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S237144AbiAZD2f (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 25 Jan 2022 22:28:35 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1643167715; x=1674703715;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=lxk4V4f6FngSllelSxsNtooRT6fhilXg2ugO3VXUuNU=;
  b=iCYdXqxzokerTN2d3KtoP4VO7KsxEHlwDnpztVfrHhoC6wpiP/nLAYaG
   3xMrU7zqMTGsB/kjbMUkcpS4237QhexMkAoP/lnfYDWjXYXWlSpNLqebD
   avnkzsVEjnEREoBPMQzOWiluSvd+Mq6ckwtdv1BuH0KZwNS1V8HQRA34O
   VGwNSU9+KnG2AdpyGK3jHLpKJjdli8gBE+leEvK0hFJBtLmOQe0gGqxcj
   kxsXF+VGSlhU2/dExfV8z05ShtbMdyrh7o+ZbsTbziDMJnH8AioL8jB48
   +od0nC8TA7k4siTngSGt5PhJh+X4k/OLQoUQqCylGc+qRwDegjfLAguuw
   Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10238"; a="246691628"
X-IronPort-AV: E=Sophos;i="5.88,316,1635231600"; 
   d="scan'208";a="246691628"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Jan 2022 19:28:33 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,316,1635231600"; 
   d="scan'208";a="520650021"
Received: from lkp-server01.sh.intel.com (HELO 276f1b88eecb) ([10.239.97.150])
  by orsmga007.jf.intel.com with ESMTP; 25 Jan 2022 19:28:31 -0800
Received: from kbuild by 276f1b88eecb with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1nCYz1-000Kjw-7J; Wed, 26 Jan 2022 03:28:31 +0000
Date:   Wed, 26 Jan 2022 11:28:10 +0800
From:   kernel test robot <lkp@intel.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     linux-renesas-soc@vger.kernel.org
Subject: [geert-renesas-drivers:topic/r8a779f0-pfc-v1] BUILD SUCCESS
 189a03276a00473535b88a6b46e5bf27333ce24f
Message-ID: <61f0bfca.fi9tbXaOkrwbQCmJ%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git topic/r8a779f0-pfc-v1
branch HEAD: 189a03276a00473535b88a6b46e5bf27333ce24f  arm64: dts: renesas: spider: Complete SCIF3 description

elapsed time: 733m

configs tested: 157
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                                 defconfig
arm                              allyesconfig
arm                              allmodconfig
arm64                               defconfig
arm64                            allyesconfig
i386                          randconfig-c001
i386                 randconfig-c001-20220124
powerpc              randconfig-c003-20220124
arm                            hisi_defconfig
sh                            hp6xx_defconfig
arm                        spear6xx_defconfig
powerpc64                           defconfig
ia64                          tiger_defconfig
sparc                       sparc64_defconfig
sh                           se7206_defconfig
powerpc                     redwood_defconfig
powerpc                mpc7448_hpc2_defconfig
riscv                    nommu_k210_defconfig
m68k                        m5407c3_defconfig
s390                             allyesconfig
sh                ecovec24-romimage_defconfig
powerpc                     rainier_defconfig
arm                     eseries_pxa_defconfig
sh                            titan_defconfig
mips                            ar7_defconfig
mips                        vocore2_defconfig
arm                      jornada720_defconfig
mips                         db1xxx_defconfig
xtensa                  audio_kc705_defconfig
sh                           se7780_defconfig
mips                         rt305x_defconfig
arm                        mini2440_defconfig
ia64                             alldefconfig
arc                        nsimosci_defconfig
sh                           se7724_defconfig
arm                       aspeed_g5_defconfig
mips                           xway_defconfig
sh                         apsh4a3a_defconfig
um                               alldefconfig
sh                           se7721_defconfig
ia64                         bigsur_defconfig
h8300                    h8300h-sim_defconfig
powerpc                 mpc837x_rdb_defconfig
arm                            zeus_defconfig
sh                         ap325rxa_defconfig
nios2                         10m50_defconfig
powerpc                 mpc834x_mds_defconfig
powerpc                     ep8248e_defconfig
sh                             espt_defconfig
powerpc                        warp_defconfig
mips                      fuloong2e_defconfig
sh                          r7785rp_defconfig
arm                            xcep_defconfig
arm                          lpd270_defconfig
csky                             alldefconfig
arm                           viper_defconfig
mips                 decstation_r4k_defconfig
m68k                        stmark2_defconfig
powerpc                 mpc834x_itx_defconfig
xtensa                    xip_kc705_defconfig
sh                          lboxre2_defconfig
arm                  randconfig-c002-20220124
ia64                             allmodconfig
ia64                                defconfig
ia64                             allyesconfig
m68k                                defconfig
m68k                             allyesconfig
m68k                             allmodconfig
nds32                             allnoconfig
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
sh                               allmodconfig
parisc                              defconfig
s390                             allmodconfig
parisc                           allyesconfig
s390                                defconfig
i386                             allyesconfig
sparc                            allyesconfig
sparc                               defconfig
i386                                defconfig
i386                   debian-10.3-kselftests
i386                              debian-10.3
mips                             allyesconfig
mips                             allmodconfig
powerpc                          allyesconfig
powerpc                          allmodconfig
powerpc                           allnoconfig
x86_64               randconfig-a002-20220124
x86_64               randconfig-a003-20220124
x86_64               randconfig-a001-20220124
x86_64               randconfig-a004-20220124
x86_64               randconfig-a005-20220124
x86_64               randconfig-a006-20220124
i386                 randconfig-a002-20220124
i386                 randconfig-a005-20220124
i386                 randconfig-a003-20220124
i386                 randconfig-a004-20220124
i386                 randconfig-a001-20220124
i386                 randconfig-a006-20220124
riscv                randconfig-r042-20220125
arc                  randconfig-r043-20220125
arc                  randconfig-r043-20220124
s390                 randconfig-r044-20220125
riscv                            allyesconfig
riscv                    nommu_virt_defconfig
riscv                             allnoconfig
riscv                               defconfig
riscv                          rv32_defconfig
riscv                            allmodconfig
um                           x86_64_defconfig
um                             i386_defconfig
x86_64                              defconfig
x86_64                               rhel-8.3
x86_64                          rhel-8.3-func
x86_64                                  kexec
x86_64                           allyesconfig
x86_64                    rhel-8.3-kselftests

clang tested configs:
arm                           omap1_defconfig
powerpc                      ppc64e_defconfig
arm                        vexpress_defconfig
arm                          pxa168_defconfig
mips                          malta_defconfig
powerpc                     mpc512x_defconfig
powerpc                     kmeter1_defconfig
powerpc                 mpc8272_ads_defconfig
arm                        magician_defconfig
arm                        multi_v5_defconfig
powerpc                        fsp2_defconfig
i386                          randconfig-a002
i386                          randconfig-a006
i386                          randconfig-a004
x86_64               randconfig-a011-20220124
x86_64               randconfig-a013-20220124
x86_64               randconfig-a015-20220124
x86_64               randconfig-a016-20220124
x86_64               randconfig-a014-20220124
x86_64               randconfig-a012-20220124
i386                 randconfig-a011-20220124
i386                 randconfig-a016-20220124
i386                 randconfig-a013-20220124
i386                 randconfig-a014-20220124
i386                 randconfig-a015-20220124
i386                 randconfig-a012-20220124
riscv                randconfig-r042-20220124
hexagon              randconfig-r045-20220124
hexagon              randconfig-r041-20220124
s390                 randconfig-r044-20220124
hexagon              randconfig-r045-20220125
hexagon              randconfig-r041-20220125

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
