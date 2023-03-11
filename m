Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 93D276B58D9
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 11 Mar 2023 07:03:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229897AbjCKGDs (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Sat, 11 Mar 2023 01:03:48 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57734 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229835AbjCKGDr (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sat, 11 Mar 2023 01:03:47 -0500
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C1BBD12B940
        for <linux-renesas-soc@vger.kernel.org>; Fri, 10 Mar 2023 22:03:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1678514625; x=1710050625;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=RXbH/e5Q+v29EEzmwef6puRPQWJbr0VR5UzHQInv74E=;
  b=Dwdi2AC3pCyeVPZXPa4QqHFO6w+MNH6Y7wJvL+2b0gN0lnTMgWs9ZpZW
   +4AybJycVzQrq7KW+pWO6G3er6eh7olpZQQhBl6MVVKTMGrGnczMSLXBt
   00WzTnc2bWMEALl4dgqqWXFas4cGj2MzGLjy8afjY4Nz34QXbG9NYMCgR
   b9efWOx6MzP6HiyS8ZdGohUh6V+jhqTgbUnVWfcsvXtHPKg5H9+FhUDMI
   XURukcCH27v17LqiAk3fVVs75ACa6EbKy03NTxzo0lq61Sxf3mR/0UoX+
   UWNfDnS4zDjoUH8GhZwVuBALS59f/eMjiN8sgBPt6PYMOxww3Lx+mv5Kj
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10645"; a="338437673"
X-IronPort-AV: E=Sophos;i="5.98,252,1673942400"; 
   d="scan'208";a="338437673"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Mar 2023 22:03:44 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10645"; a="801863819"
X-IronPort-AV: E=Sophos;i="5.98,252,1673942400"; 
   d="scan'208";a="801863819"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga004.jf.intel.com with ESMTP; 10 Mar 2023 22:03:43 -0800
Received: from kbuild by b613635ddfff with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1pasKU-0004ON-15;
        Sat, 11 Mar 2023 06:03:42 +0000
Date:   Sat, 11 Mar 2023 14:03:15 +0800
From:   kernel test robot <lkp@intel.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     linux-renesas-soc@vger.kernel.org
Subject: [geert-renesas-devel:topic/renesas-defconfig] BUILD SUCCESS
 58a8e835d1c11d0a20f4c3310017f0f241a26c5e
Message-ID: <640c19a3.FE2d4RF22xpBGK7v%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,
        URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git topic/renesas-defconfig
branch HEAD: 58a8e835d1c11d0a20f4c3310017f0f241a26c5e  arm64: renesas: defconfig: Refresh for v6.3-rc1

elapsed time: 721m

configs tested: 118
configs skipped: 11

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                            alldefconfig   gcc  
alpha                            allyesconfig   gcc  
alpha        buildonly-randconfig-r005-20230310   gcc  
alpha                               defconfig   gcc  
arc                              allyesconfig   gcc  
arc                          axs101_defconfig   gcc  
arc                                 defconfig   gcc  
arc                  randconfig-r043-20230310   gcc  
arc                        vdk_hs38_defconfig   gcc  
arm                              allmodconfig   gcc  
arm                              allyesconfig   gcc  
arm          buildonly-randconfig-r002-20230310   clang
arm                                 defconfig   gcc  
arm                          pxa910_defconfig   gcc  
arm                  randconfig-r046-20230310   clang
arm64                            allyesconfig   gcc  
arm64                               defconfig   gcc  
csky                                defconfig   gcc  
csky                 randconfig-r026-20230310   gcc  
hexagon                             defconfig   clang
hexagon              randconfig-r041-20230310   clang
hexagon              randconfig-r045-20230310   clang
i386                             allyesconfig   gcc  
i386                              debian-10.3   gcc  
i386                                defconfig   gcc  
i386                          randconfig-a001   gcc  
i386                          randconfig-a002   clang
i386                          randconfig-a003   gcc  
i386                          randconfig-a004   clang
i386                          randconfig-a005   gcc  
i386                          randconfig-a006   clang
i386                          randconfig-a011   clang
i386                          randconfig-a012   gcc  
i386                          randconfig-a013   clang
i386                          randconfig-a014   gcc  
i386                          randconfig-a015   clang
i386                          randconfig-a016   gcc  
i386                          randconfig-c001   gcc  
ia64                             allmodconfig   gcc  
ia64                                defconfig   gcc  
loongarch                        allmodconfig   gcc  
loongarch                         allnoconfig   gcc  
loongarch    buildonly-randconfig-r001-20230310   gcc  
loongarch                           defconfig   gcc  
loongarch            randconfig-r015-20230310   gcc  
loongarch            randconfig-r032-20230311   gcc  
loongarch            randconfig-r033-20230311   gcc  
m68k                             allmodconfig   gcc  
m68k                                defconfig   gcc  
m68k                       m5475evb_defconfig   gcc  
m68k                          multi_defconfig   gcc  
m68k                 randconfig-r016-20230310   gcc  
mips                             allmodconfig   gcc  
mips                             allyesconfig   gcc  
nios2                               defconfig   gcc  
nios2                randconfig-r003-20230310   gcc  
nios2                randconfig-r022-20230310   gcc  
openrisc     buildonly-randconfig-r004-20230310   gcc  
openrisc             randconfig-r005-20230310   gcc  
openrisc             randconfig-r025-20230310   gcc  
openrisc                 simple_smp_defconfig   gcc  
parisc                              defconfig   gcc  
parisc               randconfig-r011-20230310   gcc  
parisc64                            defconfig   gcc  
powerpc                          allmodconfig   gcc  
powerpc                           allnoconfig   gcc  
powerpc                       maple_defconfig   gcc  
powerpc                mpc7448_hpc2_defconfig   gcc  
powerpc                 mpc8540_ads_defconfig   gcc  
powerpc              randconfig-r006-20230310   clang
powerpc              randconfig-r012-20230310   gcc  
powerpc              randconfig-r021-20230310   gcc  
powerpc              randconfig-r031-20230311   gcc  
powerpc                     sequoia_defconfig   gcc  
powerpc                     stx_gp3_defconfig   gcc  
powerpc                     tqm8560_defconfig   clang
powerpc                        warp_defconfig   gcc  
powerpc                 xes_mpc85xx_defconfig   clang
riscv                            allmodconfig   gcc  
riscv                             allnoconfig   gcc  
riscv                               defconfig   gcc  
riscv                    nommu_k210_defconfig   gcc  
riscv             nommu_k210_sdcard_defconfig   gcc  
riscv                randconfig-r036-20230311   gcc  
riscv                randconfig-r042-20230310   gcc  
riscv                          rv32_defconfig   gcc  
s390                             allmodconfig   gcc  
s390                             allyesconfig   gcc  
s390         buildonly-randconfig-r003-20230310   gcc  
s390                                defconfig   gcc  
s390                 randconfig-r044-20230310   gcc  
sh                               allmodconfig   gcc  
sh                         apsh4a3a_defconfig   gcc  
sh                            hp6xx_defconfig   gcc  
sh                   randconfig-r002-20230310   gcc  
sh                   randconfig-r013-20230310   gcc  
sparc                               defconfig   gcc  
sparc                randconfig-r034-20230311   gcc  
sparc64              randconfig-r001-20230310   gcc  
um                             i386_defconfig   gcc  
um                           x86_64_defconfig   gcc  
x86_64                            allnoconfig   gcc  
x86_64                           allyesconfig   gcc  
x86_64                              defconfig   gcc  
x86_64                                  kexec   gcc  
x86_64                        randconfig-a001   clang
x86_64                        randconfig-a002   gcc  
x86_64                        randconfig-a003   clang
x86_64                        randconfig-a004   gcc  
x86_64                        randconfig-a005   clang
x86_64                        randconfig-a006   gcc  
x86_64                        randconfig-a011   gcc  
x86_64                        randconfig-a012   clang
x86_64                        randconfig-a013   gcc  
x86_64                        randconfig-a014   clang
x86_64                        randconfig-a015   gcc  
x86_64                        randconfig-a016   clang
x86_64                               rhel-8.3   gcc  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
