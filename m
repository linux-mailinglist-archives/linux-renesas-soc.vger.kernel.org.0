Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 579664D2FE3
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  9 Mar 2022 14:27:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232410AbiCIN2K (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 9 Mar 2022 08:28:10 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38276 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231750AbiCIN2J (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 9 Mar 2022 08:28:09 -0500
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E4774179A00
        for <linux-renesas-soc@vger.kernel.org>; Wed,  9 Mar 2022 05:27:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1646832430; x=1678368430;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=NB6Zn01bidK6dA91leeZhQuuqiWboJ5qG5YnhO/84zA=;
  b=frjwjlY/7vLQUx1pr36Grbb2Uf8oQWOwCC2GarGYTKeNaI2wEMQEe23Z
   K5de4GFY3bWwKZuGwLd8uGlEfHb520WRNsZ/ctreatLQxmtDFRQjIaXfu
   7g3wYiMhEJtgeDQa35pG/pJHSCLeHkep0HkthuOW1xkESBUloKNEA/umQ
   0F6RxO0eXR5YBtzCy+cCszd1CsKvaFoZ9KBTEmdcu9uC9pVfYGeE+ti+x
   IeJQEz8INLYthAfivZG7zNXimpP8Kxu2uzrCwVh8Fag29FAb+/8FzlbJX
   jXn7WPA6mYhyGd7CRTdHPaid+4HqVSW13r5mYmsAEGmw6TJ/dnV2ZlEBy
   g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10280"; a="254914177"
X-IronPort-AV: E=Sophos;i="5.90,167,1643702400"; 
   d="scan'208";a="254914177"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Mar 2022 05:27:10 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,167,1643702400"; 
   d="scan'208";a="513522867"
Received: from lkp-server02.sh.intel.com (HELO 89b41b6ae01c) ([10.239.97.151])
  by orsmga006.jf.intel.com with ESMTP; 09 Mar 2022 05:27:09 -0800
Received: from kbuild by 89b41b6ae01c with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1nRwLM-0003Gp-Cg; Wed, 09 Mar 2022 13:27:08 +0000
Date:   Wed, 09 Mar 2022 21:26:48 +0800
From:   kernel test robot <lkp@intel.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     linux-renesas-soc@vger.kernel.org
Subject: [geert-renesas-drivers:master] BUILD SUCCESS
 96641fa0027a256276545a4810ed9d0444ef13a7
Message-ID: <6228ab18.37dXAMn5iLoSkwCw%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.9 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git master
branch HEAD: 96641fa0027a256276545a4810ed9d0444ef13a7  [LOCAL] arm64: renesas: defconfig: Update renesas_defconfig

elapsed time: 1281m

configs tested: 113
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                                 defconfig
arm                              allmodconfig
arm                              allyesconfig
arm64                               defconfig
arm64                            allyesconfig
i386                          randconfig-c001
powerpc                    klondike_defconfig
openrisc                 simple_smp_defconfig
sh                   secureedge5410_defconfig
sh                            migor_defconfig
arc                            hsdk_defconfig
parisc                generic-64bit_defconfig
nios2                         3c120_defconfig
powerpc                     rainier_defconfig
sh                          r7785rp_defconfig
i386                                defconfig
m68k                          multi_defconfig
arc                    vdk_hs38_smp_defconfig
m68k                       m5275evb_defconfig
powerpc                 mpc837x_mds_defconfig
arm                  randconfig-c002-20220308
ia64                                defconfig
ia64                             allmodconfig
ia64                             allyesconfig
m68k                                defconfig
m68k                             allyesconfig
m68k                             allmodconfig
nds32                             allnoconfig
nios2                               defconfig
arc                              allyesconfig
csky                                defconfig
alpha                               defconfig
nds32                               defconfig
nios2                            allyesconfig
alpha                            allyesconfig
arc                                 defconfig
sh                               allmodconfig
h8300                            allyesconfig
xtensa                           allyesconfig
parisc                              defconfig
parisc64                            defconfig
s390                             allmodconfig
parisc                           allyesconfig
s390                                defconfig
s390                             allyesconfig
i386                             allyesconfig
i386                              debian-10.3
i386                   debian-10.3-kselftests
sparc                            allyesconfig
sparc                               defconfig
mips                             allyesconfig
mips                             allmodconfig
powerpc                           allnoconfig
powerpc                          allyesconfig
powerpc                          allmodconfig
i386                          randconfig-a003
i386                          randconfig-a001
i386                          randconfig-a005
x86_64                        randconfig-a013
x86_64                        randconfig-a011
x86_64                        randconfig-a015
i386                          randconfig-a014
i386                          randconfig-a012
i386                          randconfig-a016
x86_64                        randconfig-a006
x86_64                        randconfig-a002
x86_64                        randconfig-a004
riscv                randconfig-r042-20220308
arc                  randconfig-r043-20220308
s390                 randconfig-r044-20220308
riscv                    nommu_virt_defconfig
riscv                          rv32_defconfig
riscv                             allnoconfig
riscv                               defconfig
riscv                            allmodconfig
riscv                    nommu_k210_defconfig
riscv                            allyesconfig
um                             i386_defconfig
um                           x86_64_defconfig
x86_64                              defconfig
x86_64                           allyesconfig
x86_64                                  kexec
x86_64                               rhel-8.3
x86_64                          rhel-8.3-func
x86_64                         rhel-8.3-kunit
x86_64                    rhel-8.3-kselftests

clang tested configs:
x86_64                        randconfig-c007
powerpc              randconfig-c003-20220308
arm                  randconfig-c002-20220308
mips                 randconfig-c004-20220308
i386                          randconfig-c001
riscv                randconfig-c006-20220308
s390                 randconfig-c005-20220308
powerpc                      ppc64e_defconfig
riscv                    nommu_virt_defconfig
arm                           spitz_defconfig
powerpc                    ge_imp3a_defconfig
mips                         tb0219_defconfig
powerpc                     ppa8548_defconfig
mips                          ath79_defconfig
arm                       spear13xx_defconfig
powerpc                 mpc8272_ads_defconfig
i386                          randconfig-a002
i386                          randconfig-a004
i386                          randconfig-a006
x86_64                        randconfig-a012
x86_64                        randconfig-a014
x86_64                        randconfig-a016
i386                          randconfig-a013
i386                          randconfig-a015
i386                          randconfig-a011
x86_64                        randconfig-a001
x86_64                        randconfig-a003
x86_64                        randconfig-a005
hexagon              randconfig-r045-20220308
hexagon              randconfig-r041-20220308

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
