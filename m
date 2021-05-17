Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 36F92386D2E
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 18 May 2021 00:48:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237094AbhEQWtd (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 17 May 2021 18:49:33 -0400
Received: from mga06.intel.com ([134.134.136.31]:4229 "EHLO mga06.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S238532AbhEQWtd (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 17 May 2021 18:49:33 -0400
IronPort-SDR: cAkTqDFzD1zsq6uD3U5y+pwi+Kb+ejg1My1aELtzbNWqteBVeLEuUTKm0gds27BJlVPklC0fZl
 EyC6ryPOVRHQ==
X-IronPort-AV: E=McAfee;i="6200,9189,9987"; a="261813755"
X-IronPort-AV: E=Sophos;i="5.82,307,1613462400"; 
   d="scan'208";a="261813755"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 May 2021 15:48:15 -0700
IronPort-SDR: a1KDcMicU6+ttPgdNqhT6vOA4ayeS4Njnmm9OGYYzxAjzW1fOXUX9lky1XP1uwGTmdZN/rqonH
 A+bnwsY/sUmg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.82,307,1613462400"; 
   d="scan'208";a="438382751"
Received: from lkp-server01.sh.intel.com (HELO ddd90b05c979) ([10.239.97.150])
  by fmsmga008.fm.intel.com with ESMTP; 17 May 2021 15:48:14 -0700
Received: from kbuild by ddd90b05c979 with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1lim21-0001wm-Sp; Mon, 17 May 2021 22:48:13 +0000
Date:   Tue, 18 May 2021 06:47:25 +0800
From:   kernel test robot <lkp@intel.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     linux-renesas-soc@vger.kernel.org
Subject: [renesas-devel:renesas-arm-defconfig-for-v5.14] BUILD SUCCESS
 8d09cdab05e63d8d7fbe5c2e8b82a65646709c57
Message-ID: <60a2f27d.GrnvdDZP6EpH0WCd%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git renesas-arm-defconfig-for-v5.14
branch HEAD: 8d09cdab05e63d8d7fbe5c2e8b82a65646709c57  ARM: shmobile: defconfig: Refresh for v5.13-rc1

elapsed time: 724m

configs tested: 140
configs skipped: 80

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                                 defconfig
arm64                            allyesconfig
arm64                               defconfig
arm                              allyesconfig
arm                              allmodconfig
arm                           stm32_defconfig
mips                        nlm_xlr_defconfig
mips                      loongson3_defconfig
sh                        edosk7705_defconfig
m68k                                defconfig
mips                     cu1830-neo_defconfig
sh                          polaris_defconfig
m68k                        m5407c3_defconfig
powerpc                          g5_defconfig
arm                            mps2_defconfig
sh                        edosk7760_defconfig
m68k                       m5249evb_defconfig
x86_64                           alldefconfig
arm                       aspeed_g5_defconfig
mips                           rs90_defconfig
mips                          rb532_defconfig
s390                             alldefconfig
arc                    vdk_hs38_smp_defconfig
m68k                         amcore_defconfig
arm                        keystone_defconfig
um                                  defconfig
sh                      rts7751r2d1_defconfig
powerpc                      pasemi_defconfig
nios2                         10m50_defconfig
arm                      pxa255-idp_defconfig
sh                           se7619_defconfig
sh                          urquell_defconfig
powerpc                      arches_defconfig
mips                    maltaup_xpa_defconfig
sh                             shx3_defconfig
powerpc                        cell_defconfig
arm                           u8500_defconfig
arm                          iop32x_defconfig
powerpc                 mpc85xx_cds_defconfig
mips                         rt305x_defconfig
arc                          axs101_defconfig
nios2                         3c120_defconfig
arm                         lpc18xx_defconfig
sh                         apsh4a3a_defconfig
sh                           sh2007_defconfig
i386                             allyesconfig
powerpc                 mpc8560_ads_defconfig
m68k                       bvme6000_defconfig
arm                          ixp4xx_defconfig
arm                          collie_defconfig
mips                     decstation_defconfig
mips                       lemote2f_defconfig
sh                          rsk7201_defconfig
s390                       zfcpdump_defconfig
arm                            zeus_defconfig
ia64                          tiger_defconfig
csky                             alldefconfig
xtensa                       common_defconfig
arc                         haps_hs_defconfig
mips                           ip22_defconfig
openrisc                    or1ksim_defconfig
arc                                 defconfig
arm                            qcom_defconfig
arc                 nsimosci_hs_smp_defconfig
sparc64                             defconfig
arm                            lart_defconfig
mips                          malta_defconfig
m68k                       m5275evb_defconfig
powerpc                     tqm8548_defconfig
sh                          lboxre2_defconfig
x86_64                            allnoconfig
ia64                             allmodconfig
ia64                                defconfig
ia64                             allyesconfig
m68k                             allmodconfig
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
sh                               allmodconfig
parisc                              defconfig
s390                             allyesconfig
s390                             allmodconfig
parisc                           allyesconfig
s390                                defconfig
sparc                            allyesconfig
sparc                               defconfig
i386                                defconfig
mips                             allyesconfig
mips                             allmodconfig
powerpc                          allyesconfig
powerpc                          allmodconfig
powerpc                           allnoconfig
i386                 randconfig-a003-20210517
i386                 randconfig-a001-20210517
i386                 randconfig-a004-20210517
i386                 randconfig-a005-20210517
i386                 randconfig-a002-20210517
i386                 randconfig-a006-20210517
x86_64               randconfig-a012-20210517
x86_64               randconfig-a015-20210517
x86_64               randconfig-a011-20210517
x86_64               randconfig-a013-20210517
x86_64               randconfig-a016-20210517
x86_64               randconfig-a014-20210517
i386                 randconfig-a016-20210517
i386                 randconfig-a014-20210517
i386                 randconfig-a011-20210517
i386                 randconfig-a012-20210517
i386                 randconfig-a015-20210517
i386                 randconfig-a013-20210517
riscv                    nommu_k210_defconfig
riscv                            allyesconfig
riscv                    nommu_virt_defconfig
riscv                             allnoconfig
riscv                               defconfig
riscv                          rv32_defconfig
riscv                            allmodconfig
um                               allmodconfig
um                                allnoconfig
um                               allyesconfig
x86_64                           allyesconfig
x86_64                    rhel-8.3-kselftests
x86_64                              defconfig
x86_64                               rhel-8.3
x86_64                      rhel-8.3-kbuiltin
x86_64                                  kexec

clang tested configs:
x86_64               randconfig-a004-20210517
x86_64               randconfig-a003-20210517
x86_64               randconfig-a001-20210517
x86_64               randconfig-a005-20210517
x86_64               randconfig-a002-20210517
x86_64               randconfig-a006-20210517

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
