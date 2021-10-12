Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D296A429EA4
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 12 Oct 2021 09:30:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233860AbhJLHc0 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 12 Oct 2021 03:32:26 -0400
Received: from mga04.intel.com ([192.55.52.120]:45835 "EHLO mga04.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232500AbhJLHc0 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 12 Oct 2021 03:32:26 -0400
X-IronPort-AV: E=McAfee;i="6200,9189,10134"; a="225840222"
X-IronPort-AV: E=Sophos;i="5.85,367,1624345200"; 
   d="scan'208";a="225840222"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Oct 2021 00:30:25 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.85,367,1624345200"; 
   d="scan'208";a="441119442"
Received: from lkp-server02.sh.intel.com (HELO 08b2c502c3de) ([10.239.97.151])
  by orsmga006.jf.intel.com with ESMTP; 12 Oct 2021 00:30:19 -0700
Received: from kbuild by 08b2c502c3de with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1maCEs-0003CC-Rd; Tue, 12 Oct 2021 07:30:18 +0000
Date:   Tue, 12 Oct 2021 15:29:54 +0800
From:   kernel test robot <lkp@intel.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     linux-renesas-soc@vger.kernel.org
Subject: [geert-renesas-devel:next] BUILD SUCCESS
 321d106e70eb261bd55bee08d881cbd5468d9d64
Message-ID: <61653972.+tsSejSMWi7oOlU4%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git next
branch HEAD: 321d106e70eb261bd55bee08d881cbd5468d9d64  Merge branch 'renesas-arm-dt-for-v5.16' into renesas-next

elapsed time: 1019m

configs tested: 175
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                                 defconfig
arm64                            allyesconfig
arm64                               defconfig
arm                              allyesconfig
arm                              allmodconfig
i386                 randconfig-c001-20211012
i386                 randconfig-c001-20211011
powerpc              randconfig-c003-20211011
sh                           se7705_defconfig
m68k                             alldefconfig
sh                              ul2_defconfig
sh                            hp6xx_defconfig
powerpc                 mpc837x_rdb_defconfig
mips                   sb1250_swarm_defconfig
powerpc                      obs600_defconfig
powerpc                    gamecube_defconfig
mips                       bmips_be_defconfig
sh                           se7619_defconfig
arm                            mps2_defconfig
powerpc                     mpc5200_defconfig
powerpc                 mpc834x_itx_defconfig
mips                          rm200_defconfig
powerpc                       holly_defconfig
powerpc                 mpc8315_rdb_defconfig
powerpc                         ps3_defconfig
powerpc                 xes_mpc85xx_defconfig
sh                ecovec24-romimage_defconfig
sparc                       sparc64_defconfig
sh                        sh7757lcr_defconfig
arm                         hackkit_defconfig
m68k                          amiga_defconfig
um                               alldefconfig
sh                        sh7785lcr_defconfig
mips                        vocore2_defconfig
powerpc                      pasemi_defconfig
arm                         s3c6400_defconfig
arm                            lart_defconfig
m68k                            mac_defconfig
mips                      loongson3_defconfig
arm                       omap2plus_defconfig
arm                         mv78xx0_defconfig
arm                         orion5x_defconfig
mips                        maltaup_defconfig
parisc                generic-32bit_defconfig
microblaze                          defconfig
mips                           ip22_defconfig
xtensa                generic_kc705_defconfig
mips                         db1xxx_defconfig
mips                malta_qemu_32r6_defconfig
arm                         lubbock_defconfig
mips                         mpc30x_defconfig
ia64                         bigsur_defconfig
powerpc                   bluestone_defconfig
arm                           sama5_defconfig
arc                        nsim_700_defconfig
mips                         tb0226_defconfig
sh                     magicpanelr2_defconfig
mips                  cavium_octeon_defconfig
mips                           gcw0_defconfig
powerpc                     pseries_defconfig
mips                      maltasmvp_defconfig
xtensa                    xip_kc705_defconfig
powerpc                 linkstation_defconfig
arc                         haps_hs_defconfig
m68k                       m5249evb_defconfig
sh                          rsk7203_defconfig
mips                      fuloong2e_defconfig
powerpc                      ppc64e_defconfig
xtensa                           alldefconfig
powerpc                           allnoconfig
powerpc                      tqm8xx_defconfig
powerpc               mpc834x_itxgp_defconfig
arm                            mmp2_defconfig
arm                        mvebu_v5_defconfig
powerpc                        fsp2_defconfig
um                                  defconfig
riscv                    nommu_k210_defconfig
m68k                            q40_defconfig
powerpc                      ppc44x_defconfig
powerpc                      chrp32_defconfig
arm                           spitz_defconfig
m68k                        m5407c3_defconfig
arm                         assabet_defconfig
arm                        neponset_defconfig
sh                         ecovec24_defconfig
mips                     loongson2k_defconfig
mips                     loongson1b_defconfig
arc                        nsimosci_defconfig
arm                  randconfig-c002-20211011
x86_64               randconfig-c001-20211011
arm                  randconfig-c002-20211012
x86_64               randconfig-c001-20211012
ia64                             allmodconfig
ia64                                defconfig
ia64                             allyesconfig
m68k                                defconfig
m68k                             allmodconfig
m68k                             allyesconfig
nios2                               defconfig
nds32                             allnoconfig
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
parisc                           allyesconfig
s390                                defconfig
s390                             allyesconfig
s390                             allmodconfig
i386                             allyesconfig
sparc                            allyesconfig
sparc                               defconfig
i386                                defconfig
mips                             allyesconfig
mips                             allmodconfig
powerpc                          allyesconfig
powerpc                          allmodconfig
x86_64               randconfig-a015-20211011
x86_64               randconfig-a012-20211011
x86_64               randconfig-a016-20211011
x86_64               randconfig-a014-20211011
x86_64               randconfig-a013-20211011
x86_64               randconfig-a011-20211011
i386                 randconfig-a016-20211011
i386                 randconfig-a014-20211011
i386                 randconfig-a011-20211011
i386                 randconfig-a015-20211011
i386                 randconfig-a012-20211011
i386                 randconfig-a013-20211011
arc                  randconfig-r043-20211011
s390                 randconfig-r044-20211011
riscv                randconfig-r042-20211011
riscv                            allyesconfig
riscv                    nommu_virt_defconfig
riscv                             allnoconfig
riscv                               defconfig
riscv                          rv32_defconfig
riscv                            allmodconfig
x86_64                    rhel-8.3-kselftests
um                           x86_64_defconfig
um                             i386_defconfig
x86_64                              defconfig
x86_64                               rhel-8.3
x86_64                                  kexec
x86_64                           allyesconfig

clang tested configs:
arm                  randconfig-c002-20211011
mips                 randconfig-c004-20211011
i386                 randconfig-c001-20211011
s390                 randconfig-c005-20211011
x86_64               randconfig-c007-20211011
powerpc              randconfig-c003-20211011
riscv                randconfig-c006-20211011
x86_64               randconfig-a004-20211011
x86_64               randconfig-a006-20211011
x86_64               randconfig-a001-20211011
x86_64               randconfig-a005-20211011
x86_64               randconfig-a002-20211011
x86_64               randconfig-a003-20211011
i386                 randconfig-a001-20211011
i386                 randconfig-a003-20211011
i386                 randconfig-a004-20211011
i386                 randconfig-a005-20211011
i386                 randconfig-a002-20211011
i386                 randconfig-a006-20211011
x86_64               randconfig-a015-20211012
x86_64               randconfig-a012-20211012
x86_64               randconfig-a016-20211012
x86_64               randconfig-a014-20211012
x86_64               randconfig-a013-20211012
x86_64               randconfig-a011-20211012
hexagon              randconfig-r041-20211011
hexagon              randconfig-r045-20211011

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
