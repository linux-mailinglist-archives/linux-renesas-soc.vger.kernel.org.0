Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4C3B37B3101
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 29 Sep 2023 13:05:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232630AbjI2LFF (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 29 Sep 2023 07:05:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54928 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229508AbjI2LFE (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 29 Sep 2023 07:05:04 -0400
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 71C261A7
        for <linux-renesas-soc@vger.kernel.org>; Fri, 29 Sep 2023 04:05:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1695985502; x=1727521502;
  h=date:from:to:cc:subject:message-id;
  bh=3Zs0+U8oYVPgcBgBu994YTjVDNYGCwYf3DgSHV/dTa8=;
  b=iwRa67uoEoDrj03DBer9262//soG6cN7G3ocCufdlKvayicNJK7fMvwi
   gw+MXc3RFmiiWVlYWwMwvNAFndwnsgdg+TfZBvn9hSxw3ppbPFmVHRyPB
   Rf3Q11UNb5ruV1B3GjgESWNZbN4ZIvBSTpt0NUnGGDpDoKu82Z+j04s1V
   +ODe1klTQF+nCMCVS+J7bUrZdt3w3ATc2Xhub8TcdT1KFoCq5B9IvCMc0
   eJ6A0yrBR4L2hjsxoNc1+UXlxX47yrZVDJJ0h68aKei8iP17SIHTVrSUX
   sWv8ydwegpOaZv04h0QKvvY5rDhrkhF6KvIqJmJC2AeoU4MyPTBaZfcAb
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10847"; a="379547239"
X-IronPort-AV: E=Sophos;i="6.03,187,1694761200"; 
   d="scan'208";a="379547239"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Sep 2023 04:05:02 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10847"; a="1080897442"
X-IronPort-AV: E=Sophos;i="6.03,187,1694761200"; 
   d="scan'208";a="1080897442"
Received: from lkp-server02.sh.intel.com (HELO c3b01524d57c) ([10.239.97.151])
  by fmsmga005.fm.intel.com with ESMTP; 29 Sep 2023 04:05:00 -0700
Received: from kbuild by c3b01524d57c with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1qmBIo-0002l7-2i;
        Fri, 29 Sep 2023 11:04:58 +0000
Date:   Fri, 29 Sep 2023 19:04:38 +0800
From:   kernel test robot <lkp@intel.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     linux-renesas-soc@vger.kernel.org
Subject: [geert-renesas-drivers:topic/overlays] BUILD SUCCESS
 ba418c1247f21544df0fe0bf505c1899a8c6a937
Message-ID: <202309291935.1IwiqwvO-lkp@intel.com>
User-Agent: s-nail v14.9.24
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git topic/overlays
branch HEAD: ba418c1247f21544df0fe0bf505c1899a8c6a937  kbuild: Enable DT symbols when CONFIG_OF_OVERLAY is used

elapsed time: 1462m

configs tested: 156
configs skipped: 2

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
arc                   randconfig-001-20230928   gcc  
arc                   randconfig-001-20230929   gcc  
arm                              allmodconfig   gcc  
arm                               allnoconfig   gcc  
arm                              allyesconfig   gcc  
arm                                 defconfig   gcc  
arm                   randconfig-001-20230929   gcc  
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
i386         buildonly-randconfig-001-20230929   gcc  
i386         buildonly-randconfig-002-20230929   gcc  
i386         buildonly-randconfig-003-20230929   gcc  
i386         buildonly-randconfig-004-20230929   gcc  
i386         buildonly-randconfig-005-20230929   gcc  
i386         buildonly-randconfig-006-20230929   gcc  
i386                              debian-10.3   gcc  
i386                                defconfig   gcc  
i386                  randconfig-001-20230929   gcc  
i386                  randconfig-002-20230929   gcc  
i386                  randconfig-003-20230929   gcc  
i386                  randconfig-004-20230929   gcc  
i386                  randconfig-005-20230929   gcc  
i386                  randconfig-006-20230929   gcc  
i386                  randconfig-011-20230929   gcc  
i386                  randconfig-012-20230929   gcc  
i386                  randconfig-013-20230929   gcc  
i386                  randconfig-014-20230929   gcc  
i386                  randconfig-015-20230929   gcc  
i386                  randconfig-016-20230929   gcc  
loongarch                        allmodconfig   gcc  
loongarch                         allnoconfig   gcc  
loongarch                        allyesconfig   gcc  
loongarch                           defconfig   gcc  
loongarch             randconfig-001-20230928   gcc  
loongarch             randconfig-001-20230929   gcc  
m68k                             allmodconfig   gcc  
m68k                              allnoconfig   gcc  
m68k                             allyesconfig   gcc  
m68k                                defconfig   gcc  
m68k                        mvme16x_defconfig   gcc  
m68k                           sun3_defconfig   gcc  
microblaze                       allmodconfig   gcc  
microblaze                        allnoconfig   gcc  
microblaze                       allyesconfig   gcc  
microblaze                          defconfig   gcc  
mips                             allmodconfig   gcc  
mips                              allnoconfig   gcc  
mips                             allyesconfig   gcc  
mips                          ath79_defconfig   clang
mips                        qi_lb60_defconfig   clang
mips                          rb532_defconfig   gcc  
nios2                            allmodconfig   gcc  
nios2                             allnoconfig   gcc  
nios2                            allyesconfig   gcc  
nios2                               defconfig   gcc  
openrisc                         allmodconfig   gcc  
openrisc                          allnoconfig   gcc  
openrisc                         allyesconfig   gcc  
openrisc                            defconfig   gcc  
parisc                           allmodconfig   gcc  
parisc                            allnoconfig   gcc  
parisc                           allyesconfig   gcc  
parisc                              defconfig   gcc  
parisc64                            defconfig   gcc  
powerpc                          allmodconfig   gcc  
powerpc                           allnoconfig   gcc  
powerpc                          allyesconfig   gcc  
powerpc                   currituck_defconfig   gcc  
powerpc                   microwatt_defconfig   clang
riscv                            allmodconfig   gcc  
riscv                             allnoconfig   gcc  
riscv                            allyesconfig   gcc  
riscv                               defconfig   gcc  
riscv             nommu_k210_sdcard_defconfig   gcc  
riscv                 randconfig-001-20230928   gcc  
riscv                 randconfig-001-20230929   gcc  
riscv                          rv32_defconfig   gcc  
s390                             allmodconfig   gcc  
s390                              allnoconfig   gcc  
s390                             allyesconfig   gcc  
s390                                defconfig   gcc  
s390                  randconfig-001-20230928   gcc  
s390                  randconfig-001-20230929   gcc  
sh                               allmodconfig   gcc  
sh                                allnoconfig   gcc  
sh                               allyesconfig   gcc  
sh                                  defconfig   gcc  
sh                        edosk7760_defconfig   gcc  
sparc                            allmodconfig   gcc  
sparc                             allnoconfig   gcc  
sparc                            allyesconfig   gcc  
sparc                               defconfig   gcc  
sparc                 randconfig-001-20230929   gcc  
sparc64                          alldefconfig   gcc  
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
x86_64       buildonly-randconfig-001-20230929   gcc  
x86_64       buildonly-randconfig-002-20230929   gcc  
x86_64       buildonly-randconfig-003-20230929   gcc  
x86_64       buildonly-randconfig-004-20230929   gcc  
x86_64       buildonly-randconfig-005-20230929   gcc  
x86_64       buildonly-randconfig-006-20230929   gcc  
x86_64                              defconfig   gcc  
x86_64                                  kexec   gcc  
x86_64                randconfig-001-20230929   gcc  
x86_64                randconfig-002-20230929   gcc  
x86_64                randconfig-003-20230929   gcc  
x86_64                randconfig-004-20230929   gcc  
x86_64                randconfig-005-20230929   gcc  
x86_64                randconfig-006-20230929   gcc  
x86_64                randconfig-011-20230929   gcc  
x86_64                randconfig-012-20230929   gcc  
x86_64                randconfig-013-20230929   gcc  
x86_64                randconfig-014-20230929   gcc  
x86_64                randconfig-015-20230929   gcc  
x86_64                randconfig-016-20230929   gcc  
x86_64                randconfig-071-20230929   gcc  
x86_64                randconfig-072-20230929   gcc  
x86_64                randconfig-073-20230929   gcc  
x86_64                randconfig-074-20230929   gcc  
x86_64                randconfig-075-20230929   gcc  
x86_64                randconfig-076-20230929   gcc  
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
