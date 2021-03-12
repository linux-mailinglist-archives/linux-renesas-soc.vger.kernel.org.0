Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F1A9D33998A
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 12 Mar 2021 23:16:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235459AbhCLWPd (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 12 Mar 2021 17:15:33 -0500
Received: from mga05.intel.com ([192.55.52.43]:64679 "EHLO mga05.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S235442AbhCLWPF (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 12 Mar 2021 17:15:05 -0500
IronPort-SDR: rR9oIYDRNo8/kPlIScHXcnOdxvUsDJFwyFfF3lD8d995y4SUXnTrbfYtIEdX6XULFjOA6d647I
 A04KS1nowvJw==
X-IronPort-AV: E=McAfee;i="6000,8403,9921"; a="273939895"
X-IronPort-AV: E=Sophos;i="5.81,244,1610438400"; 
   d="scan'208";a="273939895"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Mar 2021 14:14:57 -0800
IronPort-SDR: 2UdYYabKxT5QXOWHUEvA6J2HrqkTx3M8SrJ5T64MGRGS6YhadkSWFNBBPF8wShv4+zYx6PlLDj
 jS/58Ot4kTvQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.81,244,1610438400"; 
   d="scan'208";a="521560544"
Received: from lkp-server02.sh.intel.com (HELO ce64c092ff93) ([10.239.97.151])
  by orsmga004.jf.intel.com with ESMTP; 12 Mar 2021 14:14:56 -0800
Received: from kbuild by ce64c092ff93 with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1lKq3b-0001e7-LK; Fri, 12 Mar 2021 22:14:55 +0000
Date:   Sat, 13 Mar 2021 06:14:31 +0800
From:   kernel test robot <lkp@intel.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     linux-renesas-soc@vger.kernel.org
Subject: [renesas-devel:renesas-arm-dt-for-v5.13] BUILD SUCCESS
 92c406ed0a7f2810c4498e2b6bea81c6b61c03e8
Message-ID: <604be7c7.++t++KXBkef6k+vd%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git renesas-arm-dt-for-v5.13
branch HEAD: 92c406ed0a7f2810c4498e2b6bea81c6b61c03e8  arm64: dts: renesas: r8a77961: Add CAN nodes

elapsed time: 722m

configs tested: 124
configs skipped: 55

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
powerpc                      tqm8xx_defconfig
arm                     davinci_all_defconfig
powerpc                      pasemi_defconfig
powerpc                     powernv_defconfig
arm                   milbeaut_m10v_defconfig
arm                       versatile_defconfig
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
arc                                 defconfig
sh                   sh7724_generic_defconfig
sparc                               defconfig
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
sh                               allmodconfig
parisc                              defconfig
s390                             allyesconfig
s390                             allmodconfig
parisc                           allyesconfig
s390                                defconfig
i386                             allyesconfig
sparc                            allyesconfig
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
