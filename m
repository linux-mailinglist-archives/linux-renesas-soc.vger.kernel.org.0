Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id ADF4A3B0FF1
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 23 Jun 2021 00:15:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229900AbhFVWRm (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 22 Jun 2021 18:17:42 -0400
Received: from mga03.intel.com ([134.134.136.65]:29506 "EHLO mga03.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229718AbhFVWRl (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 22 Jun 2021 18:17:41 -0400
IronPort-SDR: uO/Z6HZun7zahpb92Ye94KUsVSZZ9NokaHjmxvTIPuNz4/n4tMWXqbxi2PY06lnNuLfFpqObK0
 7+mEPBtwNVRw==
X-IronPort-AV: E=McAfee;i="6200,9189,10023"; a="207192974"
X-IronPort-AV: E=Sophos;i="5.83,292,1616482800"; 
   d="scan'208";a="207192974"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Jun 2021 15:15:24 -0700
IronPort-SDR: s2L0hiNp3AF0GhgHDoeS5G2vCdxb4aDCR4deDeS+F0WPr0fcqXCRCWVAo6t4TbKe33vFuBNPs0
 rBlPxNYnbHgw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.83,292,1616482800"; 
   d="scan'208";a="423482676"
Received: from lkp-server01.sh.intel.com (HELO 4aae0cb4f5b5) ([10.239.97.150])
  by orsmga002.jf.intel.com with ESMTP; 22 Jun 2021 15:15:23 -0700
Received: from kbuild by 4aae0cb4f5b5 with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1lvofy-0005Uf-Uo; Tue, 22 Jun 2021 22:15:22 +0000
Date:   Wed, 23 Jun 2021 06:14:45 +0800
From:   kernel test robot <lkp@intel.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     linux-renesas-soc@vger.kernel.org
Subject: [renesas-devel:master] BUILD SUCCESS
 3b9234c27991cbe7e6f97f22c3c7fef521fe34d3
Message-ID: <60d260d5.8Bdk86V6a+7UeEYO%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git master
branch HEAD: 3b9234c27991cbe7e6f97f22c3c7fef521fe34d3  Merge branch 'renesas-arm-dt-for-v5.15' into renesas-devel

elapsed time: 726m

configs tested: 135
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
powerpc                      chrp32_defconfig
m68k                        mvme16x_defconfig
openrisc                            defconfig
arm                         s3c2410_defconfig
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
mips                         rt305x_defconfig
arm                           h5000_defconfig
sh                           se7343_defconfig
sh                           sh2007_defconfig
arm                    vt8500_v6_v7_defconfig
arm                        keystone_defconfig
arm                          exynos_defconfig
mips                       lemote2f_defconfig
arm                            zeus_defconfig
powerpc               mpc834x_itxgp_defconfig
mips                           mtx1_defconfig
arc                    vdk_hs38_smp_defconfig
mips                           jazz_defconfig
mips                        jmr3927_defconfig
powerpc                     pq2fads_defconfig
powerpc                    amigaone_defconfig
sh                          rsk7269_defconfig
powerpc                          g5_defconfig
arm                            hisi_defconfig
arm                          gemini_defconfig
arm                       aspeed_g5_defconfig
mips                          malta_defconfig
arm                             ezx_defconfig
mips                      maltaaprp_defconfig
sh                 kfr2r09-romimage_defconfig
alpha                            alldefconfig
mips                        omega2p_defconfig
m68k                         amcore_defconfig
xtensa                  nommu_kc705_defconfig
h8300                       h8s-sim_defconfig
sparc64                             defconfig
csky                                defconfig
mips                        bcm47xx_defconfig
powerpc                        icon_defconfig
powerpc                    sam440ep_defconfig
arm                             rpc_defconfig
powerpc                     sequoia_defconfig
x86_64                            allnoconfig
ia64                                defconfig
ia64                             allyesconfig
ia64                             allmodconfig
m68k                             allmodconfig
m68k                                defconfig
m68k                             allyesconfig
nios2                               defconfig
nds32                             allnoconfig
arc                              allyesconfig
nds32                               defconfig
alpha                               defconfig
nios2                            allyesconfig
alpha                            allyesconfig
xtensa                           allyesconfig
h8300                            allyesconfig
arc                                 defconfig
sh                               allmodconfig
parisc                              defconfig
s390                             allyesconfig
s390                             allmodconfig
parisc                           allyesconfig
s390                                defconfig
sparc                               defconfig
i386                                defconfig
i386                             allyesconfig
sparc                            allyesconfig
mips                             allyesconfig
mips                             allmodconfig
powerpc                          allyesconfig
powerpc                          allmodconfig
powerpc                           allnoconfig
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
