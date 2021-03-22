Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8F5A234513B
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 22 Mar 2021 21:58:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229547AbhCVU5t (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 22 Mar 2021 16:57:49 -0400
Received: from mga05.intel.com ([192.55.52.43]:16922 "EHLO mga05.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229961AbhCVU5r (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 22 Mar 2021 16:57:47 -0400
IronPort-SDR: qr26Cl4TK0BH0/4wOtq2sIVEzQesx5tvoG1DJ9XQd6i7tXbjvrUEipKHe9RA3ocbcY1bciPfvo
 /OU1XDo68fWQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9931"; a="275447174"
X-IronPort-AV: E=Sophos;i="5.81,269,1610438400"; 
   d="scan'208";a="275447174"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Mar 2021 13:57:47 -0700
IronPort-SDR: 2cqFGmgWcA3b/RWplapM3iFCKHJV0ZwBuussVXnxaRDniU0dAZgkVOnk9S44vGx+IyxnrJwmKz
 MaMrWKJWhOOA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.81,269,1610438400"; 
   d="scan'208";a="524580697"
Received: from lkp-server01.sh.intel.com (HELO 69d8fcc516b7) ([10.239.97.150])
  by orsmga004.jf.intel.com with ESMTP; 22 Mar 2021 13:57:43 -0700
Received: from kbuild by 69d8fcc516b7 with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1lORcN-0000FJ-1e; Mon, 22 Mar 2021 20:57:43 +0000
Date:   Tue, 23 Mar 2021 04:56:42 +0800
From:   kernel test robot <lkp@intel.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     linux-renesas-soc@vger.kernel.org
Subject: [renesas-devel:renesas-arm-dt-for-v5.13] BUILD SUCCESS
 431c8ae4519dba5ffec5b9a4c6bca90f3e591bb8
Message-ID: <6059048a.hY1QMNr38lSh3p+7%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git renesas-arm-dt-for-v5.13
branch HEAD: 431c8ae4519dba5ffec5b9a4c6bca90f3e591bb8  arm64: dts: renesas: falcon: Move AVB0 to main DTS

elapsed time: 720m

configs tested: 109
configs skipped: 92

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                                 defconfig
arm64                            allyesconfig
arm64                               defconfig
arm                              allyesconfig
arm                              allmodconfig
riscv                            allmodconfig
x86_64                           allyesconfig
i386                             allyesconfig
riscv                            allyesconfig
mips                     decstation_defconfig
mips                         db1xxx_defconfig
xtensa                  audio_kc705_defconfig
arm                             ezx_defconfig
powerpc                     ppa8548_defconfig
sh                        edosk7705_defconfig
sh                                  defconfig
sh                          urquell_defconfig
xtensa                    xip_kc705_defconfig
m68k                        m5407c3_defconfig
sh                        sh7757lcr_defconfig
sh                          polaris_defconfig
powerpc                      mgcoge_defconfig
mips                      pic32mzda_defconfig
powerpc                      arches_defconfig
arm                            mmp2_defconfig
riscv                               defconfig
arm                     eseries_pxa_defconfig
arm                      tct_hammer_defconfig
powerpc                      walnut_defconfig
arm                      footbridge_defconfig
mips                   sb1250_swarm_defconfig
i386                                defconfig
sh                          rsk7201_defconfig
powerpc                  iss476-smp_defconfig
arm                       versatile_defconfig
arm                            dove_defconfig
mips                        vocore2_defconfig
mips                           ip28_defconfig
powerpc                 mpc837x_mds_defconfig
arm                          simpad_defconfig
powerpc                 mpc8272_ads_defconfig
mips                            gpr_defconfig
sh                           se7619_defconfig
powerpc                      ppc44x_defconfig
powerpc                 mpc8315_rdb_defconfig
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
nios2                               defconfig
arc                              allyesconfig
nds32                             allnoconfig
xtensa                           allyesconfig
h8300                            allyesconfig
arc                                 defconfig
sh                               allmodconfig
parisc                              defconfig
s390                             allyesconfig
s390                             allmodconfig
parisc                           allyesconfig
s390                                defconfig
sparc                            allyesconfig
sparc                               defconfig
i386                               tinyconfig
mips                             allyesconfig
mips                             allmodconfig
powerpc                          allyesconfig
powerpc                          allmodconfig
powerpc                           allnoconfig
i386                 randconfig-a004-20210322
i386                 randconfig-a003-20210322
i386                 randconfig-a001-20210322
i386                 randconfig-a002-20210322
i386                 randconfig-a006-20210322
i386                 randconfig-a005-20210322
x86_64               randconfig-a012-20210322
x86_64               randconfig-a015-20210322
x86_64               randconfig-a013-20210322
x86_64               randconfig-a014-20210322
x86_64               randconfig-a016-20210322
x86_64               randconfig-a011-20210322
i386                 randconfig-a014-20210322
i386                 randconfig-a011-20210322
i386                 randconfig-a015-20210322
i386                 randconfig-a016-20210322
i386                 randconfig-a012-20210322
i386                 randconfig-a013-20210322
riscv                    nommu_k210_defconfig
riscv                    nommu_virt_defconfig
riscv                             allnoconfig
riscv                          rv32_defconfig
x86_64                    rhel-7.6-kselftests
x86_64                              defconfig
x86_64                               rhel-8.3
x86_64                      rhel-8.3-kbuiltin
x86_64                                  kexec

clang tested configs:
x86_64               randconfig-a002-20210322
x86_64               randconfig-a003-20210322
x86_64               randconfig-a001-20210322
x86_64               randconfig-a006-20210322
x86_64               randconfig-a004-20210322
x86_64               randconfig-a005-20210322

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
