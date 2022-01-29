Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2B5B44A2A83
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 29 Jan 2022 01:18:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241141AbiA2ASL (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 28 Jan 2022 19:18:11 -0500
Received: from mga14.intel.com ([192.55.52.115]:6459 "EHLO mga14.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1348189AbiA2ASL (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 28 Jan 2022 19:18:11 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1643415491; x=1674951491;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=188cjJsFWwnRXd4fQORZVGbRnAWu3fPrEOgLIaQglSo=;
  b=Qke5fFgvf6QvrmLnLGB1blhe2oIxmo6njuo1mpf3iNaolcMdk3IGXQaz
   UwyGS1EOE1aWxYH5urKC19GnbaNjrxwSSSlt+dL/RAC7Judkqs8ySSdvQ
   BIpvKJ2hnMQAS3c0/BpEdeFu1n9d8n+azulUH6mTNJTxFJD3kV02LJqRk
   Z2AaXf3BE4DB+J3c2Fga5atw+VeHbmGbUvsfcXAQYDE/58FsktBJQ5YKP
   eI2PFoAiMN/sQ+fWCiLqqMcbuL6yWcrIkmbkRiMjp/7NC3XIn0qJ48Qkd
   +JrdOJObB6bthSdToV4+gu2VbICfHqJK1M/Scbxm/85+7Q2DRm8B6cpg8
   w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10241"; a="247443186"
X-IronPort-AV: E=Sophos;i="5.88,325,1635231600"; 
   d="scan'208";a="247443186"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jan 2022 16:18:10 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,325,1635231600"; 
   d="scan'208";a="582010698"
Received: from lkp-server01.sh.intel.com (HELO 276f1b88eecb) ([10.239.97.150])
  by fmsmga008.fm.intel.com with ESMTP; 28 Jan 2022 16:18:09 -0800
Received: from kbuild by 276f1b88eecb with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1nDbRR-000OW5-3K; Sat, 29 Jan 2022 00:18:09 +0000
Date:   Sat, 29 Jan 2022 08:17:22 +0800
From:   kernel test robot <lkp@intel.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     linux-renesas-soc@vger.kernel.org
Subject: [geert-renesas-devel:renesas-drivers-for-v5.18] BUILD SUCCESS
 92dfff382af0ce65216e05f056e7cb7f18ef6f78
Message-ID: <61f48792.Rko31IEFX9beBvb5%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git renesas-drivers-for-v5.18
branch HEAD: 92dfff382af0ce65216e05f056e7cb7f18ef6f78  soc: renesas: Add support for reading product revision for RZ/G2L family

elapsed time: 728m

configs tested: 161
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                                 defconfig
arm64                            allyesconfig
arm64                               defconfig
arm                              allyesconfig
arm                              allmodconfig
i386                 randconfig-c001-20220124
nios2                         10m50_defconfig
xtensa                  audio_kc705_defconfig
powerpc                      ppc40x_defconfig
powerpc                 mpc837x_mds_defconfig
arm64                            alldefconfig
mips                        jmr3927_defconfig
sh                           se7780_defconfig
sh                        edosk7760_defconfig
sh                             espt_defconfig
um                                  defconfig
parisc                generic-64bit_defconfig
sparc                       sparc64_defconfig
mips                        bcm47xx_defconfig
arm                           sunxi_defconfig
arm                        multi_v7_defconfig
powerpc                      ep88xc_defconfig
powerpc                     ep8248e_defconfig
m68k                        stmark2_defconfig
nios2                            allyesconfig
arm                            xcep_defconfig
sh                            shmin_defconfig
ia64                      gensparse_defconfig
openrisc                         alldefconfig
arc                 nsimosci_hs_smp_defconfig
powerpc                     sequoia_defconfig
m68k                           sun3_defconfig
powerpc                 mpc834x_mds_defconfig
powerpc                     tqm8541_defconfig
mips                           xway_defconfig
sh                           se7705_defconfig
xtensa                    smp_lx200_defconfig
arm                        mini2440_defconfig
sh                           se7343_defconfig
powerpc                      ppc6xx_defconfig
arc                              alldefconfig
arc                        nsimosci_defconfig
sh                   secureedge5410_defconfig
arm                          lpd270_defconfig
m68k                          hp300_defconfig
h8300                     edosk2674_defconfig
nios2                         3c120_defconfig
sh                         apsh4a3a_defconfig
mips                           ci20_defconfig
xtensa                    xip_kc705_defconfig
powerpc                    adder875_defconfig
powerpc                 linkstation_defconfig
powerpc                        cell_defconfig
xtensa                  nommu_kc705_defconfig
arm                  randconfig-c002-20220127
arm                  randconfig-c002-20220124
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
x86_64                        randconfig-a004
x86_64                        randconfig-a002
x86_64                        randconfig-a006
i386                          randconfig-a012
i386                          randconfig-a014
i386                          randconfig-a016
riscv                    nommu_k210_defconfig
riscv                            allyesconfig
riscv                    nommu_virt_defconfig
riscv                             allnoconfig
riscv                               defconfig
riscv                          rv32_defconfig
riscv                            allmodconfig
um                           x86_64_defconfig
um                             i386_defconfig
x86_64                           allyesconfig
x86_64                    rhel-8.3-kselftests
x86_64                              defconfig
x86_64                               rhel-8.3
x86_64                          rhel-8.3-func
x86_64                                  kexec

clang tested configs:
arm                     davinci_all_defconfig
arm                   milbeaut_m10v_defconfig
powerpc                          allmodconfig
arm                    vt8500_v6_v7_defconfig
powerpc                          g5_defconfig
powerpc                      acadia_defconfig
arm                        magician_defconfig
powerpc                     kilauea_defconfig
mips                malta_qemu_32r6_defconfig
powerpc                 mpc832x_mds_defconfig
powerpc                      katmai_defconfig
mips                        bcm63xx_defconfig
i386                          randconfig-a002
i386                          randconfig-a006
i386                          randconfig-a004
x86_64               randconfig-a011-20220124
x86_64               randconfig-a013-20220124
x86_64               randconfig-a015-20220124
x86_64               randconfig-a016-20220124
x86_64               randconfig-a014-20220124
x86_64               randconfig-a012-20220124
x86_64                        randconfig-a012
x86_64                        randconfig-a014
x86_64                        randconfig-a016
x86_64                        randconfig-a003
x86_64                        randconfig-a001
x86_64                        randconfig-a005
i386                 randconfig-a011-20220124
i386                 randconfig-a016-20220124
i386                 randconfig-a013-20220124
i386                 randconfig-a014-20220124
i386                 randconfig-a015-20220124
i386                 randconfig-a012-20220124
riscv                randconfig-r042-20220124
hexagon              randconfig-r045-20220125
hexagon              randconfig-r045-20220124
hexagon              randconfig-r045-20220127
hexagon              randconfig-r041-20220125
hexagon              randconfig-r041-20220124
hexagon              randconfig-r041-20220127

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
