Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7D7B231D510
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 17 Feb 2021 06:35:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231494AbhBQFeu (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 17 Feb 2021 00:34:50 -0500
Received: from mga14.intel.com ([192.55.52.115]:8981 "EHLO mga14.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231490AbhBQFeW (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 17 Feb 2021 00:34:22 -0500
IronPort-SDR: /57+jPITo58oKL9dHstWCSCEw5lZTevsX7/rlRXS+/WQ39NTZScM5eULxkxgeVNIoJIjUbKms5
 lMiyyBZLdUTA==
X-IronPort-AV: E=McAfee;i="6000,8403,9897"; a="182329065"
X-IronPort-AV: E=Sophos;i="5.81,184,1610438400"; 
   d="scan'208";a="182329065"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Feb 2021 21:33:32 -0800
IronPort-SDR: zoNgE5OExEABLOZAZfn3bPnJJDOn7QJxkqffV+dtch6eOkMCfrMChgw3un+TK9IjZG+NKQo+no
 055Htn1Ido0g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.81,184,1610438400"; 
   d="scan'208";a="361922903"
Received: from lkp-server02.sh.intel.com (HELO cd560a204411) ([10.239.97.151])
  by orsmga003.jf.intel.com with ESMTP; 16 Feb 2021 21:33:30 -0800
Received: from kbuild by cd560a204411 with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1lCFSs-0008mJ-3p; Wed, 17 Feb 2021 05:33:30 +0000
Date:   Wed, 17 Feb 2021 13:32:47 +0800
From:   kernel test robot <lkp@intel.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     linux-renesas-soc@vger.kernel.org
Subject: [renesas-drivers:master] BUILD SUCCESS
 07dc3566ef81460e966b1e65e93fc9f6ab4c019b
Message-ID: <602caa7f.AHFPaZeePhn6hOHe%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git master
branch HEAD: 07dc3566ef81460e966b1e65e93fc9f6ab4c019b  [LOCAL] arm64: defconfig: Update renesas_defconfig

elapsed time: 724m

configs tested: 97
configs skipped: 4

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                                 defconfig
arm64                               defconfig
arm                              allyesconfig
arm                              allmodconfig
mips                           jazz_defconfig
powerpc                        fsp2_defconfig
csky                             alldefconfig
arc                           tb10x_defconfig
sh                           se7343_defconfig
mips                         tb0287_defconfig
arm                     eseries_pxa_defconfig
arm                             rpc_defconfig
powerpc                     sbc8548_defconfig
sh                        apsh4ad0a_defconfig
xtensa                    xip_kc705_defconfig
arm64                            allyesconfig
mips                            ar7_defconfig
powerpc                     pseries_defconfig
arm                        mvebu_v7_defconfig
powerpc                     akebono_defconfig
arm                          pxa3xx_defconfig
powerpc                 linkstation_defconfig
openrisc                            defconfig
h8300                    h8300h-sim_defconfig
powerpc                 mpc837x_mds_defconfig
ia64                             allmodconfig
ia64                                defconfig
ia64                             allyesconfig
m68k                             allmodconfig
m68k                                defconfig
m68k                             allyesconfig
nios2                               defconfig
arc                              allyesconfig
nds32                             allnoconfig
c6x                              allyesconfig
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
i386                               tinyconfig
i386                                defconfig
mips                             allyesconfig
mips                             allmodconfig
powerpc                          allyesconfig
powerpc                          allmodconfig
powerpc                           allnoconfig
i386                 randconfig-a003-20210216
i386                 randconfig-a005-20210216
i386                 randconfig-a002-20210216
i386                 randconfig-a006-20210216
i386                 randconfig-a001-20210216
i386                 randconfig-a004-20210216
x86_64               randconfig-a016-20210215
x86_64               randconfig-a013-20210215
x86_64               randconfig-a012-20210215
x86_64               randconfig-a015-20210215
x86_64               randconfig-a014-20210215
x86_64               randconfig-a011-20210215
i386                 randconfig-a016-20210216
i386                 randconfig-a014-20210216
i386                 randconfig-a012-20210216
i386                 randconfig-a013-20210216
i386                 randconfig-a011-20210216
i386                 randconfig-a015-20210216
riscv                    nommu_k210_defconfig
riscv                            allyesconfig
riscv                    nommu_virt_defconfig
riscv                             allnoconfig
riscv                               defconfig
riscv                          rv32_defconfig
riscv                            allmodconfig
x86_64                                   rhel
x86_64                           allyesconfig
x86_64                    rhel-7.6-kselftests
x86_64                              defconfig
x86_64                               rhel-8.3
x86_64                      rhel-8.3-kbuiltin
x86_64                                  kexec

clang tested configs:
x86_64               randconfig-a003-20210215
x86_64               randconfig-a002-20210215
x86_64               randconfig-a001-20210215
x86_64               randconfig-a004-20210215
x86_64               randconfig-a005-20210215
x86_64               randconfig-a006-20210215

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
