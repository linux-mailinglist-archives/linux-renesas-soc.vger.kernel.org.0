Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B063D7AE103
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 25 Sep 2023 23:52:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229550AbjIYVxD (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 25 Sep 2023 17:53:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34068 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229509AbjIYVxC (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 25 Sep 2023 17:53:02 -0400
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 31B8FAF
        for <linux-renesas-soc@vger.kernel.org>; Mon, 25 Sep 2023 14:52:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1695678776; x=1727214776;
  h=date:from:to:cc:subject:message-id;
  bh=RQ4JvYnMQK37cPInHukuK/LSdA5B0AoA/lN8ahkLYBI=;
  b=lCW7Wt+wS6XKDNvDzUKQsP8PNZcS/K2i1Fu4maFRMr+mTSy+XxnGhtcQ
   xh7NvclHE5TD1QJlLKN/KueVl7woMRd+ccqVMv6g7S4aHFXraQXztbsAK
   LNva0dEyXjW07HJ2yaoAyn0UzXXruKtHSZYFJrMEifAbUGDyY1PbShVeu
   HNEjZ1G4xl4ONrfwunnv69jQwkopfl6svIBmnzGw+0Ht58On6DgCDpG4n
   wNloTtyVJL+SlLnGLmHojO1aHA7wQDtoNMCUXHUvdfE32mzoRR5bUFoZV
   1p4NA4uVvQ50JoKhCUW0hJMlypVu7bm4JNkPkAlOjqveg9tpRMFVLqDBi
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10843"; a="385251409"
X-IronPort-AV: E=Sophos;i="6.03,176,1694761200"; 
   d="scan'208";a="385251409"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Sep 2023 14:51:56 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10843"; a="783687053"
X-IronPort-AV: E=Sophos;i="6.03,176,1694761200"; 
   d="scan'208";a="783687053"
Received: from lkp-server02.sh.intel.com (HELO 32c80313467c) ([10.239.97.151])
  by orsmga001.jf.intel.com with ESMTP; 25 Sep 2023 14:51:54 -0700
Received: from kbuild by 32c80313467c with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1qktUd-00023T-2O;
        Mon, 25 Sep 2023 21:51:51 +0000
Date:   Tue, 26 Sep 2023 05:51:44 +0800
From:   kernel test robot <lkp@intel.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     linux-renesas-soc@vger.kernel.org
Subject: [geert-renesas-devel:renesas-arm-soc-for-v6.7] BUILD SUCCESS
 719efe2c63b1240ceefc232b57ebc6e69ab647d5
Message-ID: <202309260541.ANFSicHK-lkp@intel.com>
User-Agent: s-nail v14.9.24
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_NONE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git renesas-arm-soc-for-v6.7
branch HEAD: 719efe2c63b1240ceefc232b57ebc6e69ab647d5  ARM: shmobile: sh73a0: Reserve boot area when SMP is enabled

elapsed time: 724m

configs tested: 106
configs skipped: 153

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig   gcc  
alpha                            allyesconfig   gcc  
alpha                               defconfig   gcc  
arc                              allmodconfig   gcc  
arc                               allnoconfig   gcc  
arc                              allyesconfig   gcc  
arc                                 defconfig   gcc  
arc                        nsim_700_defconfig   gcc  
arc                   randconfig-001-20230926   gcc  
arm                              allmodconfig   gcc  
arm                               allnoconfig   gcc  
arm                              allyesconfig   gcc  
arm                        clps711x_defconfig   gcc  
arm                                 defconfig   gcc  
arm                   randconfig-001-20230925   gcc  
csky                             allmodconfig   gcc  
csky                              allnoconfig   gcc  
csky                             allyesconfig   gcc  
csky                                defconfig   gcc  
i386         buildonly-randconfig-001-20230925   gcc  
i386         buildonly-randconfig-002-20230925   gcc  
i386         buildonly-randconfig-003-20230925   gcc  
i386         buildonly-randconfig-004-20230925   gcc  
i386         buildonly-randconfig-005-20230925   gcc  
i386         buildonly-randconfig-006-20230925   gcc  
i386                  randconfig-001-20230925   gcc  
i386                  randconfig-002-20230925   gcc  
i386                  randconfig-003-20230925   gcc  
i386                  randconfig-004-20230925   gcc  
i386                  randconfig-005-20230925   gcc  
i386                  randconfig-006-20230925   gcc  
i386                  randconfig-011-20230925   gcc  
i386                  randconfig-012-20230925   gcc  
i386                  randconfig-013-20230925   gcc  
i386                  randconfig-014-20230925   gcc  
i386                  randconfig-015-20230925   gcc  
i386                  randconfig-016-20230925   gcc  
loongarch                        allmodconfig   gcc  
loongarch                         allnoconfig   gcc  
loongarch                        allyesconfig   gcc  
loongarch                           defconfig   gcc  
loongarch             randconfig-001-20230926   gcc  
m68k                             allmodconfig   gcc  
m68k                              allnoconfig   gcc  
m68k                             allyesconfig   gcc  
m68k                                defconfig   gcc  
mips                             allmodconfig   gcc  
mips                              allnoconfig   gcc  
mips                        bcm63xx_defconfig   clang
mips                           ip32_defconfig   gcc  
nios2                            allmodconfig   gcc  
nios2                             allnoconfig   gcc  
nios2                            allyesconfig   gcc  
nios2                               defconfig   gcc  
openrisc                          allnoconfig   gcc  
openrisc                         allyesconfig   gcc  
openrisc                    or1ksim_defconfig   gcc  
parisc                            allnoconfig   gcc  
parisc                           allyesconfig   gcc  
parisc                              defconfig   gcc  
powerpc                          allmodconfig   gcc  
powerpc                           allnoconfig   gcc  
powerpc                          allyesconfig   gcc  
riscv                            allmodconfig   gcc  
riscv                             allnoconfig   gcc  
riscv                               defconfig   gcc  
s390                             allmodconfig   gcc  
s390                              allnoconfig   gcc  
s390                             allyesconfig   gcc  
s390                                defconfig   gcc  
sh                               allmodconfig   gcc  
sh                                allnoconfig   gcc  
sh                               allyesconfig   gcc  
sh                                  defconfig   gcc  
sh                         ecovec24_defconfig   gcc  
sh                            shmin_defconfig   gcc  
sparc                            allmodconfig   gcc  
sparc                             allnoconfig   gcc  
sparc                            allyesconfig   gcc  
sparc                               defconfig   gcc  
sparc64                          allmodconfig   gcc  
sparc64                          allyesconfig   gcc  
sparc64                             defconfig   gcc  
um                               allmodconfig   clang
um                                allnoconfig   clang
um                               allyesconfig   clang
um                                  defconfig   gcc  
um                             i386_defconfig   gcc  
um                           x86_64_defconfig   gcc  
x86_64                            allnoconfig   gcc  
x86_64                           allyesconfig   gcc  
x86_64       buildonly-randconfig-001-20230925   gcc  
x86_64       buildonly-randconfig-002-20230925   gcc  
x86_64       buildonly-randconfig-003-20230925   gcc  
x86_64       buildonly-randconfig-004-20230925   gcc  
x86_64       buildonly-randconfig-005-20230925   gcc  
x86_64       buildonly-randconfig-006-20230925   gcc  
x86_64                              defconfig   gcc  
x86_64                randconfig-001-20230925   gcc  
x86_64                randconfig-002-20230925   gcc  
x86_64                randconfig-003-20230925   gcc  
x86_64                randconfig-004-20230925   gcc  
x86_64                randconfig-005-20230925   gcc  
x86_64                randconfig-006-20230925   gcc  
x86_64                          rhel-8.3-rust   clang
x86_64                               rhel-8.3   gcc  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
