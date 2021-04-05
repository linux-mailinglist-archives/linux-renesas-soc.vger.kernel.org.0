Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 60F8D354819
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  5 Apr 2021 23:15:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232770AbhDEVPu (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 5 Apr 2021 17:15:50 -0400
Received: from mga06.intel.com ([134.134.136.31]:61710 "EHLO mga06.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232715AbhDEVPt (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 5 Apr 2021 17:15:49 -0400
IronPort-SDR: ggYeMzW5TDojnO/7ewrcvdKdbLaSjTdof9er0gS1aiNC5VzNmY4354BYyEHKew2iUV8shsSjJ7
 pEG3lwGcdykQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9945"; a="254260811"
X-IronPort-AV: E=Sophos;i="5.81,307,1610438400"; 
   d="scan'208";a="254260811"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Apr 2021 14:15:42 -0700
IronPort-SDR: RHW+p+tQXn2x1dY5ADbrhK3jgNplNEeAA1i60QTJfWgup0/rE8QkI+p3baKt0nRm2hq0nvitLc
 fUzMhI9Qrxvg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.81,307,1610438400"; 
   d="scan'208";a="395952115"
Received: from lkp-server01.sh.intel.com (HELO 69d8fcc516b7) ([10.239.97.150])
  by orsmga002.jf.intel.com with ESMTP; 05 Apr 2021 14:15:41 -0700
Received: from kbuild by 69d8fcc516b7 with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1lTWZQ-000AiS-SY; Mon, 05 Apr 2021 21:15:40 +0000
Date:   Tue, 06 Apr 2021 05:14:43 +0800
From:   kernel test robot <lkp@intel.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     linux-renesas-soc@vger.kernel.org
Subject: [renesas-devel:master] BUILD SUCCESS
 ea0aa7f2e67d781466efc1f9867e42062aa6e685
Message-ID: <606b7dc3.UYTOsZm7J3XKN090%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git master
branch HEAD: ea0aa7f2e67d781466efc1f9867e42062aa6e685  Merge tag 'v5.12-rc6' into renesas-devel

elapsed time: 722m

configs tested: 112
configs skipped: 9

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                                 defconfig
arm64                            allyesconfig
arm64                               defconfig
arm                              allyesconfig
arm                              allmodconfig
x86_64                           allyesconfig
arm                         cm_x300_defconfig
powerpc                      chrp32_defconfig
arm                           sama5_defconfig
powerpc                          g5_defconfig
m68k                         amcore_defconfig
powerpc                     mpc5200_defconfig
powerpc                     tqm5200_defconfig
arm                      pxa255-idp_defconfig
sh                          lboxre2_defconfig
arm                       imx_v4_v5_defconfig
mips                           ip28_defconfig
m68k                       m5249evb_defconfig
h8300                               defconfig
arm                      jornada720_defconfig
m68k                          hp300_defconfig
arm                       cns3420vb_defconfig
um                             i386_defconfig
arm                            hisi_defconfig
powerpc                     kilauea_defconfig
sh                          rsk7203_defconfig
sh                          landisk_defconfig
mips                       rbtx49xx_defconfig
mips                      maltasmvp_defconfig
xtensa                  nommu_kc705_defconfig
arm                       omap2plus_defconfig
sh                 kfr2r09-romimage_defconfig
m68k                            q40_defconfig
arm                        shmobile_defconfig
openrisc                            defconfig
m68k                             alldefconfig
sh                           se7712_defconfig
powerpc                        fsp2_defconfig
powerpc                       ppc64_defconfig
arm                       versatile_defconfig
ia64                             allmodconfig
ia64                                defconfig
ia64                             allyesconfig
m68k                             allmodconfig
m68k                                defconfig
m68k                             allyesconfig
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
nios2                               defconfig
arc                              allyesconfig
nds32                             allnoconfig
mips                             allyesconfig
mips                             allmodconfig
powerpc                          allyesconfig
powerpc                          allmodconfig
powerpc                           allnoconfig
i386                 randconfig-a006-20210405
i386                 randconfig-a003-20210405
i386                 randconfig-a001-20210405
i386                 randconfig-a004-20210405
i386                 randconfig-a002-20210405
i386                 randconfig-a005-20210405
x86_64               randconfig-a014-20210405
x86_64               randconfig-a015-20210405
x86_64               randconfig-a013-20210405
x86_64               randconfig-a011-20210405
x86_64               randconfig-a012-20210405
x86_64               randconfig-a016-20210405
i386                 randconfig-a014-20210405
i386                 randconfig-a011-20210405
i386                 randconfig-a016-20210405
i386                 randconfig-a012-20210405
i386                 randconfig-a015-20210405
i386                 randconfig-a013-20210405
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
um                                  defconfig
x86_64                    rhel-8.3-kselftests
x86_64                              defconfig
x86_64                               rhel-8.3
x86_64                      rhel-8.3-kbuiltin
x86_64                                  kexec

clang tested configs:
x86_64               randconfig-a004-20210405
x86_64               randconfig-a003-20210405
x86_64               randconfig-a005-20210405
x86_64               randconfig-a001-20210405
x86_64               randconfig-a002-20210405
x86_64               randconfig-a006-20210405

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
