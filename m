Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D7D63339972
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 12 Mar 2021 23:06:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235436AbhCLWF5 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 12 Mar 2021 17:05:57 -0500
Received: from mga06.intel.com ([134.134.136.31]:60142 "EHLO mga06.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S235438AbhCLWF4 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 12 Mar 2021 17:05:56 -0500
IronPort-SDR: sVZfM5AWiSX+mYW6qBmoJ6hjdwI5td1Siaa26d1Vuc2iEmUVTkOMgqbxxWkZlQdK1EhKzm0HD8
 fm6a/yKoRxzg==
X-IronPort-AV: E=McAfee;i="6000,8403,9921"; a="250262495"
X-IronPort-AV: E=Sophos;i="5.81,244,1610438400"; 
   d="scan'208";a="250262495"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Mar 2021 14:05:51 -0800
IronPort-SDR: GEPKYjNKcEE2yBJZ9T+75rtKNxpT40rBnfHWSStTB5xkCYalJ+me4DiJO/iuUZcJMPUHATptu/
 l816PzgNu7cA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.81,244,1610438400"; 
   d="scan'208";a="404552374"
Received: from lkp-server02.sh.intel.com (HELO ce64c092ff93) ([10.239.97.151])
  by fmsmga008.fm.intel.com with ESMTP; 12 Mar 2021 14:05:50 -0800
Received: from kbuild by ce64c092ff93 with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1lKpun-0001dp-U4; Fri, 12 Mar 2021 22:05:49 +0000
Date:   Sat, 13 Mar 2021 06:05:38 +0800
From:   kernel test robot <lkp@intel.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     linux-renesas-soc@vger.kernel.org
Subject: [renesas-drivers:renesas-clk-for-v5.13] BUILD SUCCESS
 0eedab655ec1817d450085dcb12219726cb415ff
Message-ID: <604be5b2.zjg95qAer0Waz8EW%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git renesas-clk-for-v5.13
branch HEAD: 0eedab655ec1817d450085dcb12219726cb415ff  clk: renesas: r8a779a0: Add CMT clocks

elapsed time: 722m

configs tested: 132
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                                 defconfig
arm64                            allyesconfig
arm64                               defconfig
arm                              allyesconfig
arm                              allmodconfig
sh                           se7751_defconfig
mips                        maltaup_defconfig
sh                   sh7770_generic_defconfig
riscv                               defconfig
sh                        edosk7705_defconfig
arc                          axs103_defconfig
arm                     davinci_all_defconfig
powerpc                      pasemi_defconfig
powerpc                     powernv_defconfig
arm                   milbeaut_m10v_defconfig
arm                       versatile_defconfig
powerpc                      tqm8xx_defconfig
riscv                    nommu_k210_defconfig
powerpc                  storcenter_defconfig
sparc                       sparc64_defconfig
i386                                defconfig
m68k                            mac_defconfig
xtensa                  cadence_csp_defconfig
powerpc                    sam440ep_defconfig
h8300                     edosk2674_defconfig
arm                         lpc18xx_defconfig
arm                             ezx_defconfig
m68k                        m5307c3_defconfig
mips                      pistachio_defconfig
ia64                             alldefconfig
arm                             pxa_defconfig
parisc                generic-64bit_defconfig
arm                         s3c2410_defconfig
powerpc                 mpc837x_mds_defconfig
m68k                         apollo_defconfig
arm                       cns3420vb_defconfig
arc                        nsim_700_defconfig
powerpc                 mpc85xx_cds_defconfig
sh                   sh7724_generic_defconfig
powerpc                      arches_defconfig
sh                  sh7785lcr_32bit_defconfig
sh                          urquell_defconfig
arm64                            alldefconfig
mips                        omega2p_defconfig
mips                      bmips_stb_defconfig
arm                       multi_v4t_defconfig
arm                        oxnas_v6_defconfig
powerpc                     akebono_defconfig
m68k                            q40_defconfig
sh                            migor_defconfig
xtensa                generic_kc705_defconfig
powerpc                     tqm5200_defconfig
sparc                            allyesconfig
sparc                       sparc32_defconfig
arc                        nsimosci_defconfig
arm                          pxa3xx_defconfig
sh                        edosk7760_defconfig
arm                  colibri_pxa270_defconfig
mips                      loongson3_defconfig
powerpc                      pmac32_defconfig
arm                          imote2_defconfig
mips                         tb0287_defconfig
nios2                         10m50_defconfig
arm                         palmz72_defconfig
alpha                               defconfig
sh                        sh7757lcr_defconfig
sh                          rsk7201_defconfig
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
nios2                            allyesconfig
csky                                defconfig
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
i386                             allyesconfig
sparc                               defconfig
i386                               tinyconfig
mips                             allyesconfig
mips                             allmodconfig
powerpc                          allyesconfig
powerpc                          allmodconfig
powerpc                           allnoconfig
i386                 randconfig-a001-20210312
i386                 randconfig-a005-20210312
i386                 randconfig-a002-20210312
i386                 randconfig-a003-20210312
i386                 randconfig-a004-20210312
i386                 randconfig-a006-20210312
x86_64               randconfig-a011-20210312
x86_64               randconfig-a016-20210312
x86_64               randconfig-a013-20210312
x86_64               randconfig-a014-20210312
x86_64               randconfig-a015-20210312
x86_64               randconfig-a012-20210312
i386                 randconfig-a013-20210312
i386                 randconfig-a016-20210312
i386                 randconfig-a011-20210312
i386                 randconfig-a015-20210312
i386                 randconfig-a014-20210312
i386                 randconfig-a012-20210312
riscv                            allyesconfig
riscv                    nommu_virt_defconfig
riscv                             allnoconfig
riscv                          rv32_defconfig
riscv                            allmodconfig
x86_64                           allyesconfig
x86_64                    rhel-7.6-kselftests
x86_64                              defconfig
x86_64                               rhel-8.3
x86_64                      rhel-8.3-kbuiltin
x86_64                                  kexec

clang tested configs:
x86_64               randconfig-a006-20210312
x86_64               randconfig-a001-20210312
x86_64               randconfig-a005-20210312
x86_64               randconfig-a003-20210312
x86_64               randconfig-a002-20210312
x86_64               randconfig-a004-20210312

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
