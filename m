Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8C5803C7828
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 13 Jul 2021 22:47:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235394AbhGMUuL (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 13 Jul 2021 16:50:11 -0400
Received: from mga01.intel.com ([192.55.52.88]:45062 "EHLO mga01.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S234394AbhGMUuL (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 13 Jul 2021 16:50:11 -0400
X-IronPort-AV: E=McAfee;i="6200,9189,10044"; a="232044622"
X-IronPort-AV: E=Sophos;i="5.84,237,1620716400"; 
   d="scan'208";a="232044622"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jul 2021 13:47:19 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.84,237,1620716400"; 
   d="scan'208";a="427401703"
Received: from lkp-server01.sh.intel.com (HELO 4aae0cb4f5b5) ([10.239.97.150])
  by fmsmga007.fm.intel.com with ESMTP; 13 Jul 2021 13:47:18 -0700
Received: from kbuild by 4aae0cb4f5b5 with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1m3PJF-000I9E-AY; Tue, 13 Jul 2021 20:47:17 +0000
Date:   Wed, 14 Jul 2021 04:46:53 +0800
From:   kernel test robot <lkp@intel.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     linux-renesas-soc@vger.kernel.org
Subject: [renesas-devel:master] BUILD SUCCESS
 81b7948a0be3dc48ef04d01b16c08dc3b460bce2
Message-ID: <60edfbbd.0eb8uRBCmJ8o6Gt8%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git master
branch HEAD: 81b7948a0be3dc48ef04d01b16c08dc3b460bce2  Merge branches 'renesas-next' and 'topic/renesas-defconfig' into renesas-devel

elapsed time: 730m

configs tested: 120
configs skipped: 4

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                                 defconfig
arm64                            allyesconfig
arm64                               defconfig
arm                              allyesconfig
arm                              allmodconfig
arm                          gemini_defconfig
arm                         mv78xx0_defconfig
powerpc                       eiger_defconfig
sh                              ul2_defconfig
sh                            hp6xx_defconfig
powerpc                      ep88xc_defconfig
arc                     haps_hs_smp_defconfig
sh                             espt_defconfig
arm                             ezx_defconfig
riscv                          rv32_defconfig
sh                           se7705_defconfig
mips                           gcw0_defconfig
powerpc                    amigaone_defconfig
mips                           ip32_defconfig
arm                              alldefconfig
arm                       mainstone_defconfig
arm                          moxart_defconfig
powerpc                     pq2fads_defconfig
powerpc                      walnut_defconfig
openrisc                            defconfig
arm                        trizeps4_defconfig
arm                    vt8500_v6_v7_defconfig
arm                       netwinder_defconfig
xtensa                           alldefconfig
sh                            migor_defconfig
m68k                          sun3x_defconfig
arm                            xcep_defconfig
sh                   sh7770_generic_defconfig
arm                        neponset_defconfig
mips                        vocore2_defconfig
sh                        edosk7705_defconfig
powerpc                    mvme5100_defconfig
arm                        cerfcube_defconfig
arm                  colibri_pxa270_defconfig
arm                            mps2_defconfig
powerpc                 mpc8560_ads_defconfig
arm                            mmp2_defconfig
arm                        multi_v5_defconfig
mips                            e55_defconfig
arm                        mvebu_v5_defconfig
arm                   milbeaut_m10v_defconfig
openrisc                 simple_smp_defconfig
arm                          lpd270_defconfig
ia64                             allmodconfig
ia64                                defconfig
ia64                             allyesconfig
x86_64                            allnoconfig
m68k                             allmodconfig
m68k                                defconfig
m68k                             allyesconfig
nios2                               defconfig
arc                              allyesconfig
nds32                             allnoconfig
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
s390                             allyesconfig
s390                             allmodconfig
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
i386                 randconfig-a005-20210713
i386                 randconfig-a004-20210713
i386                 randconfig-a006-20210713
i386                 randconfig-a001-20210713
i386                 randconfig-a002-20210713
i386                 randconfig-a003-20210713
x86_64               randconfig-a013-20210713
x86_64               randconfig-a014-20210713
x86_64               randconfig-a012-20210713
x86_64               randconfig-a015-20210713
x86_64               randconfig-a016-20210713
x86_64               randconfig-a011-20210713
i386                 randconfig-a015-20210713
i386                 randconfig-a014-20210713
i386                 randconfig-a011-20210713
i386                 randconfig-a013-20210713
i386                 randconfig-a012-20210713
i386                 randconfig-a016-20210713
riscv                    nommu_k210_defconfig
riscv                            allyesconfig
riscv                    nommu_virt_defconfig
riscv                             allnoconfig
riscv                               defconfig
riscv                            allmodconfig
x86_64                    rhel-8.3-kselftests
um                           x86_64_defconfig
um                             i386_defconfig
x86_64                           allyesconfig
x86_64                              defconfig
x86_64                               rhel-8.3
x86_64                      rhel-8.3-kbuiltin
x86_64                                  kexec

clang tested configs:
x86_64               randconfig-b001-20210713
x86_64               randconfig-a005-20210713
x86_64               randconfig-a004-20210713
x86_64               randconfig-a003-20210713
x86_64               randconfig-a002-20210713
x86_64               randconfig-a006-20210713
x86_64               randconfig-a001-20210713

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
