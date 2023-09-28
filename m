Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 635727B0FC0
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 28 Sep 2023 02:02:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229469AbjI1ACx (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 27 Sep 2023 20:02:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46968 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229445AbjI1ACw (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 27 Sep 2023 20:02:52 -0400
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 65AC5F4
        for <linux-renesas-soc@vger.kernel.org>; Wed, 27 Sep 2023 17:02:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1695859371; x=1727395371;
  h=date:from:to:cc:subject:message-id;
  bh=dAekmzbtE+NczeyLwQLcvORnXfdFKEpxWts5IxfOAdk=;
  b=hXXq9o6FnFcqBRvzTIiIeflE0hOF7dO3d8wRi1GCG00cZZEcfBjSqvqU
   PPptX5ZBBVnhyv1y7bRBByGHf9LBvyOKLSvLzY5Ikdij3Scb5bt3FTq+H
   TdL0DBu+8AZR1J3mVGox8SYPsfQtaS1rJ7btF9maTO6iFnHHBSOwF+2up
   GSyJHc0sLv/FdeUo0NrH89C5RykSQK13g/OOGb5PWEs0FfX3WSiXlI08J
   15mreEisXvcwrxREvKH+RO97XwkLalGvhzQeQ59qvnndGSZoyH/gd02Au
   edhEyEbJ2r0vOoil0jH6+V+f+rIcmsM/GncnbAHM3I4nuLbBKwFprLPip
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10846"; a="3503911"
X-IronPort-AV: E=Sophos;i="6.03,182,1694761200"; 
   d="scan'208";a="3503911"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Sep 2023 17:02:51 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10846"; a="1080368655"
X-IronPort-AV: E=Sophos;i="6.03,182,1694761200"; 
   d="scan'208";a="1080368655"
Received: from lkp-server02.sh.intel.com (HELO c3b01524d57c) ([10.239.97.151])
  by fmsmga005.fm.intel.com with ESMTP; 27 Sep 2023 17:02:49 -0700
Received: from kbuild by c3b01524d57c with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1qleUR-0000p0-1l;
        Thu, 28 Sep 2023 00:02:47 +0000
Date:   Thu, 28 Sep 2023 08:01:59 +0800
From:   kernel test robot <lkp@intel.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     linux-renesas-soc@vger.kernel.org
Subject: [geert-renesas-devel:renesas-arm-soc-for-v6.7] BUILD SUCCESS
 435d422624b74085e2c0be650dc3a1d3a4a6bfa5
Message-ID: <202309280857.5scncR95-lkp@intel.com>
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
branch HEAD: 435d422624b74085e2c0be650dc3a1d3a4a6bfa5  ARM: shmobile: sh73a0: Reserve boot area when SMP is enabled

elapsed time: 789m

configs tested: 132
configs skipped: 154

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig   gcc  
alpha                            allyesconfig   gcc  
alpha                               defconfig   gcc  
arc                   randconfig-001-20230928   gcc  
arc                    vdk_hs38_smp_defconfig   gcc  
arm                              allmodconfig   gcc  
arm                               allnoconfig   gcc  
arm                              allyesconfig   gcc  
arm                                 defconfig   gcc  
arm                       imx_v6_v7_defconfig   gcc  
arm                         lpc32xx_defconfig   clang
arm                        neponset_defconfig   clang
arm                   randconfig-001-20230928   gcc  
arm                        shmobile_defconfig   gcc  
arm                        spear3xx_defconfig   clang
arm64                            allmodconfig   gcc  
arm64                             allnoconfig   gcc  
arm64                            allyesconfig   gcc  
arm64                               defconfig   gcc  
csky                             allmodconfig   gcc  
csky                              allnoconfig   gcc  
csky                             allyesconfig   gcc  
csky                                defconfig   gcc  
i386                             allmodconfig   gcc  
i386                              allnoconfig   gcc  
i386                             allyesconfig   gcc  
i386         buildonly-randconfig-001-20230928   gcc  
i386         buildonly-randconfig-002-20230928   gcc  
i386         buildonly-randconfig-003-20230928   gcc  
i386         buildonly-randconfig-004-20230928   gcc  
i386         buildonly-randconfig-005-20230928   gcc  
i386         buildonly-randconfig-006-20230928   gcc  
i386                              debian-10.3   gcc  
i386                                defconfig   gcc  
i386                  randconfig-001-20230928   gcc  
i386                  randconfig-002-20230928   gcc  
i386                  randconfig-003-20230928   gcc  
i386                  randconfig-004-20230928   gcc  
i386                  randconfig-005-20230928   gcc  
i386                  randconfig-006-20230928   gcc  
i386                  randconfig-011-20230928   gcc  
i386                  randconfig-012-20230928   gcc  
i386                  randconfig-013-20230928   gcc  
i386                  randconfig-014-20230928   gcc  
i386                  randconfig-015-20230928   gcc  
i386                  randconfig-016-20230928   gcc  
loongarch                        allmodconfig   gcc  
loongarch                         allnoconfig   gcc  
loongarch                        allyesconfig   gcc  
loongarch                           defconfig   gcc  
loongarch             randconfig-001-20230928   gcc  
m68k                             allmodconfig   gcc  
m68k                              allnoconfig   gcc  
m68k                             allyesconfig   gcc  
m68k                                defconfig   gcc  
microblaze                       allmodconfig   gcc  
microblaze                        allnoconfig   gcc  
microblaze                       allyesconfig   gcc  
microblaze                          defconfig   gcc  
mips                           ip28_defconfig   clang
nios2                            allmodconfig   gcc  
nios2                             allnoconfig   gcc  
nios2                            allyesconfig   gcc  
nios2                               defconfig   gcc  
powerpc                          allmodconfig   gcc  
powerpc                           allnoconfig   gcc  
powerpc                          allyesconfig   gcc  
powerpc                      ppc64e_defconfig   clang
powerpc                    sam440ep_defconfig   gcc  
powerpc                    socrates_defconfig   clang
riscv                            allmodconfig   gcc  
riscv                             allnoconfig   gcc  
riscv                            allyesconfig   gcc  
riscv                               defconfig   gcc  
riscv                 randconfig-001-20230928   gcc  
riscv                          rv32_defconfig   gcc  
s390                  randconfig-001-20230928   gcc  
sh                               allmodconfig   gcc  
sh                                allnoconfig   gcc  
sh                               allyesconfig   gcc  
sh                                  defconfig   gcc  
sparc                            allmodconfig   gcc  
sparc                             allnoconfig   gcc  
sparc                            allyesconfig   gcc  
sparc                               defconfig   gcc  
sparc                 randconfig-001-20230928   gcc  
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
x86_64       buildonly-randconfig-001-20230928   gcc  
x86_64       buildonly-randconfig-002-20230928   gcc  
x86_64       buildonly-randconfig-003-20230928   gcc  
x86_64       buildonly-randconfig-004-20230928   gcc  
x86_64       buildonly-randconfig-005-20230928   gcc  
x86_64       buildonly-randconfig-006-20230928   gcc  
x86_64                              defconfig   gcc  
x86_64                                  kexec   gcc  
x86_64                randconfig-001-20230928   gcc  
x86_64                randconfig-002-20230928   gcc  
x86_64                randconfig-003-20230928   gcc  
x86_64                randconfig-004-20230928   gcc  
x86_64                randconfig-005-20230928   gcc  
x86_64                randconfig-006-20230928   gcc  
x86_64                randconfig-011-20230928   gcc  
x86_64                randconfig-012-20230928   gcc  
x86_64                randconfig-013-20230928   gcc  
x86_64                randconfig-014-20230928   gcc  
x86_64                randconfig-015-20230928   gcc  
x86_64                randconfig-016-20230928   gcc  
x86_64                randconfig-071-20230928   gcc  
x86_64                randconfig-072-20230928   gcc  
x86_64                randconfig-073-20230928   gcc  
x86_64                randconfig-074-20230928   gcc  
x86_64                randconfig-075-20230928   gcc  
x86_64                randconfig-076-20230928   gcc  
x86_64                           rhel-8.3-bpf   gcc  
x86_64                          rhel-8.3-func   gcc  
x86_64                    rhel-8.3-kselftests   gcc  
x86_64                         rhel-8.3-kunit   gcc  
x86_64                           rhel-8.3-ltp   gcc  
x86_64                          rhel-8.3-rust   clang
x86_64                               rhel-8.3   gcc  
xtensa                            allnoconfig   gcc  
xtensa                           allyesconfig   gcc  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
