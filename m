Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2C33E74E067
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 10 Jul 2023 23:45:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229581AbjGJVpu (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 10 Jul 2023 17:45:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45912 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229573AbjGJVpt (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 10 Jul 2023 17:45:49 -0400
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ABB5A11B
        for <linux-renesas-soc@vger.kernel.org>; Mon, 10 Jul 2023 14:45:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1689025546; x=1720561546;
  h=date:from:to:cc:subject:message-id;
  bh=Jf3Wo8tWu0SGqrRb+Vy+ULxEDJbJb5SEPJybuU0rjKM=;
  b=D/VXRhI6TlRqENHCMvpK+UHENOpTCC056zIeansJeQv6/obUc+erYTyz
   tQUYihtJqBrTtGvIh1fQu64k/hngjnQK+k88Z/cB3KhlzLas2WcWfMTAw
   O4Jk77wySxTeV3ZU89tgCQUPUzljT5kDgAgRtWnCSK41pzdQFgvrSd7jK
   xYhPr6RRTRHj1OJLFEPkGahYiGJ3SH21s5tfbjZR9nNU9eVQotuZ3tz09
   UEAC78brYlKgkpflsSH+5Aw78x5SHcMQq9qNGFR0UYmFLC22hqADaajMg
   +imAOxQoUfqVD1rtNU10C551hl/zTZOT/kpLUiTTNHqt8fMf2r4aUis/9
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10767"; a="367960381"
X-IronPort-AV: E=Sophos;i="6.01,195,1684825200"; 
   d="scan'208";a="367960381"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jul 2023 14:45:30 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10767"; a="671123035"
X-IronPort-AV: E=Sophos;i="6.01,195,1684825200"; 
   d="scan'208";a="671123035"
Received: from lkp-server01.sh.intel.com (HELO c544d7fc5005) ([10.239.97.150])
  by orsmga003.jf.intel.com with ESMTP; 10 Jul 2023 14:45:29 -0700
Received: from kbuild by c544d7fc5005 with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1qIyhE-00042F-34;
        Mon, 10 Jul 2023 21:45:28 +0000
Date:   Tue, 11 Jul 2023 05:44:59 +0800
From:   kernel test robot <lkp@intel.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     linux-renesas-soc@vger.kernel.org
Subject: [geert-renesas-drivers:renesas-clk] BUILD SUCCESS
 63370298426b850220bba40012fb801a48c5fd14
Message-ID: <202307110557.KoL67hrc-lkp@intel.com>
User-Agent: s-nail v14.9.24
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git renesas-clk
branch HEAD: 63370298426b850220bba40012fb801a48c5fd14  clk: renesas: r9a09g011: Add CSI related clocks

elapsed time: 720m

configs tested: 155
configs skipped: 8

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                            allyesconfig   gcc  
alpha                               defconfig   gcc  
alpha                randconfig-r025-20230710   gcc  
alpha                randconfig-r032-20230710   gcc  
arc                              allyesconfig   gcc  
arc                                 defconfig   gcc  
arc                  randconfig-r043-20230710   gcc  
arm                              allmodconfig   gcc  
arm                              allyesconfig   gcc  
arm                       aspeed_g5_defconfig   gcc  
arm                          collie_defconfig   clang
arm                                 defconfig   gcc  
arm                          ep93xx_defconfig   clang
arm                       imx_v4_v5_defconfig   clang
arm                      integrator_defconfig   gcc  
arm                       multi_v4t_defconfig   gcc  
arm                  randconfig-r025-20230710   gcc  
arm                  randconfig-r046-20230710   gcc  
arm                          sp7021_defconfig   clang
arm                        spear3xx_defconfig   clang
arm                           spitz_defconfig   clang
arm                           tegra_defconfig   gcc  
arm                         wpcm450_defconfig   gcc  
arm64                            allyesconfig   gcc  
arm64                               defconfig   gcc  
csky                                defconfig   gcc  
csky                 randconfig-r024-20230710   gcc  
csky                 randconfig-r026-20230710   gcc  
hexagon              randconfig-r041-20230710   clang
hexagon              randconfig-r045-20230710   clang
i386                             allyesconfig   gcc  
i386         buildonly-randconfig-r004-20230710   gcc  
i386         buildonly-randconfig-r005-20230710   gcc  
i386         buildonly-randconfig-r006-20230710   gcc  
i386                              debian-10.3   gcc  
i386                                defconfig   gcc  
i386                 randconfig-i001-20230710   gcc  
i386                 randconfig-i002-20230710   gcc  
i386                 randconfig-i003-20230710   gcc  
i386                 randconfig-i004-20230710   gcc  
i386                 randconfig-i005-20230710   gcc  
i386                 randconfig-i006-20230710   gcc  
i386                 randconfig-i011-20230710   clang
i386                 randconfig-i012-20230710   clang
i386                 randconfig-i013-20230710   clang
i386                 randconfig-i014-20230710   clang
i386                 randconfig-i015-20230710   clang
i386                 randconfig-i016-20230710   clang
i386                 randconfig-r003-20230710   gcc  
i386                 randconfig-r023-20230710   clang
i386                 randconfig-r033-20230710   gcc  
loongarch                        allmodconfig   gcc  
loongarch                         allnoconfig   gcc  
loongarch                           defconfig   gcc  
loongarch            randconfig-r001-20230710   gcc  
loongarch            randconfig-r011-20230710   gcc  
m68k                             alldefconfig   gcc  
m68k                             allmodconfig   gcc  
m68k                             allyesconfig   gcc  
m68k                                defconfig   gcc  
m68k                 randconfig-r001-20230710   gcc  
m68k                 randconfig-r003-20230710   gcc  
m68k                 randconfig-r013-20230710   gcc  
mips                             allmodconfig   gcc  
mips                             allyesconfig   gcc  
mips                          ath25_defconfig   clang
mips                      bmips_stb_defconfig   clang
mips                         cobalt_defconfig   gcc  
mips                 randconfig-r002-20230710   clang
mips                 randconfig-r004-20230710   clang
mips                 randconfig-r026-20230710   gcc  
mips                 randconfig-r034-20230710   clang
mips                         rt305x_defconfig   gcc  
nios2                               defconfig   gcc  
openrisc             randconfig-r006-20230710   gcc  
openrisc             randconfig-r016-20230710   gcc  
openrisc             randconfig-r022-20230710   gcc  
parisc                           allyesconfig   gcc  
parisc                              defconfig   gcc  
parisc                generic-64bit_defconfig   gcc  
parisc               randconfig-r022-20230710   gcc  
parisc64                            defconfig   gcc  
powerpc                      acadia_defconfig   clang
powerpc                    adder875_defconfig   gcc  
powerpc                          allmodconfig   gcc  
powerpc                           allnoconfig   gcc  
powerpc                        cell_defconfig   gcc  
powerpc                    gamecube_defconfig   clang
powerpc                 mpc832x_rdb_defconfig   clang
powerpc              randconfig-r013-20230710   clang
powerpc              randconfig-r021-20230710   clang
powerpc                     tqm8555_defconfig   gcc  
riscv                            allmodconfig   gcc  
riscv                             allnoconfig   gcc  
riscv                            allyesconfig   gcc  
riscv                               defconfig   gcc  
riscv                randconfig-r023-20230710   clang
riscv                randconfig-r042-20230710   clang
riscv                          rv32_defconfig   gcc  
s390                             alldefconfig   clang
s390                             allmodconfig   gcc  
s390                             allyesconfig   gcc  
s390                                defconfig   gcc  
s390                 randconfig-r004-20230710   gcc  
s390                 randconfig-r031-20230710   gcc  
s390                 randconfig-r044-20230710   clang
sh                               allmodconfig   gcc  
sh                 kfr2r09-romimage_defconfig   gcc  
sh                   randconfig-r015-20230710   gcc  
sh                          sdk7780_defconfig   gcc  
sh                        sh7757lcr_defconfig   gcc  
sparc                            allyesconfig   gcc  
sparc                               defconfig   gcc  
sparc                randconfig-r005-20230710   gcc  
sparc64              randconfig-r006-20230710   gcc  
um                               allmodconfig   clang
um                                allnoconfig   clang
um                               allyesconfig   clang
um                                  defconfig   gcc  
um                             i386_defconfig   gcc  
um                   randconfig-r012-20230710   gcc  
um                           x86_64_defconfig   gcc  
x86_64                           allyesconfig   gcc  
x86_64       buildonly-randconfig-r001-20230710   gcc  
x86_64       buildonly-randconfig-r002-20230710   gcc  
x86_64       buildonly-randconfig-r003-20230710   gcc  
x86_64                              defconfig   gcc  
x86_64                                  kexec   gcc  
x86_64               randconfig-r014-20230710   clang
x86_64               randconfig-r015-20230710   clang
x86_64               randconfig-x001-20230710   clang
x86_64               randconfig-x002-20230710   clang
x86_64               randconfig-x003-20230710   clang
x86_64               randconfig-x004-20230710   clang
x86_64               randconfig-x005-20230710   clang
x86_64               randconfig-x006-20230710   clang
x86_64               randconfig-x011-20230710   gcc  
x86_64               randconfig-x012-20230710   gcc  
x86_64               randconfig-x013-20230710   gcc  
x86_64               randconfig-x014-20230710   gcc  
x86_64               randconfig-x015-20230710   gcc  
x86_64               randconfig-x016-20230710   gcc  
x86_64                           rhel-8.3-bpf   gcc  
x86_64                          rhel-8.3-func   gcc  
x86_64                    rhel-8.3-kselftests   gcc  
x86_64                         rhel-8.3-kunit   gcc  
x86_64                           rhel-8.3-kvm   gcc  
x86_64                           rhel-8.3-ltp   gcc  
x86_64                          rhel-8.3-rust   clang
x86_64                               rhel-8.3   gcc  
xtensa                  cadence_csp_defconfig   gcc  
xtensa                  nommu_kc705_defconfig   gcc  
xtensa               randconfig-r014-20230710   gcc  
xtensa               randconfig-r035-20230710   gcc  
xtensa                    xip_kc705_defconfig   gcc  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
