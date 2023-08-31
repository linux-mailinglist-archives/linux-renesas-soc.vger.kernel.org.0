Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C530778E612
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 31 Aug 2023 08:00:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243438AbjHaGAT (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 31 Aug 2023 02:00:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59512 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244176AbjHaGAT (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 31 Aug 2023 02:00:19 -0400
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D53FBCE6
        for <linux-renesas-soc@vger.kernel.org>; Wed, 30 Aug 2023 23:00:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1693461613; x=1724997613;
  h=date:from:to:cc:subject:message-id;
  bh=DdrIjiWoMRJnAjDbP9kCkuIeHgnlnhYsPpABtjk7oks=;
  b=cV92Tapw0FpJg8vTxh+NCGTw1hN2RwJDEAyWmPw/k9cF7C+cOAhusvlV
   EuQVHUpRYW8pIpR6p2qIusHp4/l/riyT73V9q1KOtgpPF3VDWZcOMWH6b
   ecCOW2ipy+mI1mDpkyUBTnskj+vlHkphrO7Ol0Q/wfgHsdA2iZUsP+3Af
   wPfpatkYq998du1C7GwBn6oT+5/48TLoW1lK3CE5ILUBui/7RPAFpWEAB
   o0lE9gIcUd0XrvIvkFkdhgJUCB1JEEdbPBTckkeCAdE15x0uXlcwmKrqs
   QJCTOD9qvcJ+N8SCIurLmb6O1vYidqACewSJ7c4kAI40gRsPtR7D7uWPZ
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10818"; a="360811207"
X-IronPort-AV: E=Sophos;i="6.02,215,1688454000"; 
   d="scan'208";a="360811207"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Aug 2023 23:00:12 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10818"; a="1070099672"
X-IronPort-AV: E=Sophos;i="6.02,215,1688454000"; 
   d="scan'208";a="1070099672"
Received: from lkp-server02.sh.intel.com (HELO daf8bb0a381d) ([10.239.97.151])
  by fmsmga005.fm.intel.com with ESMTP; 30 Aug 2023 23:00:10 -0700
Received: from kbuild by daf8bb0a381d with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1qbaiv-000Aut-1x;
        Thu, 31 Aug 2023 06:00:09 +0000
Date:   Thu, 31 Aug 2023 14:00:08 +0800
From:   kernel test robot <lkp@intel.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     linux-renesas-soc@vger.kernel.org
Subject: [geert-renesas-drivers:master] BUILD SUCCESS
 4d37c36b9df6ddc8ae43ff8b3c63d7b2eaefcf4d
Message-ID: <202308311406.Oz7bvElS-lkp@intel.com>
User-Agent: s-nail v14.9.24
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,
        SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git master
branch HEAD: 4d37c36b9df6ddc8ae43ff8b3c63d7b2eaefcf4d  [LOCAL] arm64: renesas: defconfig: Update renesas_defconfig

elapsed time: 2513m

configs tested: 170
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
arc                          axs101_defconfig   gcc  
arc                      axs103_smp_defconfig   gcc  
arc                                 defconfig   gcc  
arc                   randconfig-001-20230829   gcc  
arc                  randconfig-r011-20230829   gcc  
arm                              allmodconfig   gcc  
arm                               allnoconfig   gcc  
arm                              allyesconfig   gcc  
arm                                 defconfig   gcc  
arm                   randconfig-001-20230829   clang
arm                  randconfig-r002-20230829   gcc  
arm                  randconfig-r003-20230829   gcc  
arm                  randconfig-r014-20230829   clang
arm                  randconfig-r023-20230829   clang
arm                  randconfig-r035-20230829   gcc  
arm                        shmobile_defconfig   gcc  
arm64                            allmodconfig   gcc  
arm64                             allnoconfig   gcc  
arm64                            allyesconfig   gcc  
arm64                               defconfig   gcc  
csky                             allmodconfig   gcc  
csky                              allnoconfig   gcc  
csky                             allyesconfig   gcc  
csky                                defconfig   gcc  
csky                 randconfig-r036-20230829   gcc  
hexagon               randconfig-001-20230829   clang
hexagon               randconfig-002-20230829   clang
hexagon              randconfig-r021-20230829   clang
hexagon              randconfig-r025-20230829   clang
i386                             allmodconfig   gcc  
i386                              allnoconfig   gcc  
i386                             allyesconfig   gcc  
i386         buildonly-randconfig-001-20230829   clang
i386         buildonly-randconfig-002-20230829   clang
i386         buildonly-randconfig-003-20230829   clang
i386         buildonly-randconfig-004-20230829   clang
i386         buildonly-randconfig-005-20230829   clang
i386         buildonly-randconfig-006-20230829   clang
i386                              debian-10.3   gcc  
i386                                defconfig   gcc  
i386                  randconfig-001-20230829   clang
i386                  randconfig-002-20230829   clang
i386                  randconfig-003-20230829   clang
i386                  randconfig-004-20230829   clang
i386                  randconfig-005-20230829   clang
i386                  randconfig-006-20230829   clang
i386                  randconfig-011-20230829   gcc  
i386                  randconfig-012-20230829   gcc  
i386                  randconfig-013-20230829   gcc  
i386                  randconfig-014-20230829   gcc  
i386                  randconfig-015-20230829   gcc  
i386                  randconfig-016-20230829   gcc  
i386                 randconfig-r012-20230829   gcc  
loongarch                        allmodconfig   gcc  
loongarch                         allnoconfig   gcc  
loongarch                        allyesconfig   gcc  
loongarch                           defconfig   gcc  
loongarch             randconfig-001-20230829   gcc  
m68k                             allmodconfig   gcc  
m68k                              allnoconfig   gcc  
m68k                             allyesconfig   gcc  
m68k                         amcore_defconfig   gcc  
m68k                                defconfig   gcc  
microblaze                       allmodconfig   gcc  
microblaze                        allnoconfig   gcc  
microblaze                       allyesconfig   gcc  
microblaze                          defconfig   gcc  
mips                             allmodconfig   gcc  
mips                              allnoconfig   gcc  
mips                             allyesconfig   gcc  
mips                 decstation_r4k_defconfig   gcc  
mips                        maltaup_defconfig   clang
mips                 randconfig-r005-20230829   gcc  
mips                 randconfig-r015-20230829   clang
nios2                            allmodconfig   gcc  
nios2                             allnoconfig   gcc  
nios2                            allyesconfig   gcc  
nios2                               defconfig   gcc  
nios2                randconfig-r032-20230829   gcc  
openrisc                         allmodconfig   gcc  
openrisc                          allnoconfig   gcc  
openrisc                         allyesconfig   gcc  
openrisc                            defconfig   gcc  
openrisc             randconfig-r004-20230829   gcc  
openrisc             randconfig-r013-20230829   gcc  
parisc                           allmodconfig   gcc  
parisc                            allnoconfig   gcc  
parisc                           allyesconfig   gcc  
parisc                              defconfig   gcc  
parisc               randconfig-r001-20230829   gcc  
parisc               randconfig-r022-20230829   gcc  
parisc64                            defconfig   gcc  
powerpc                          allmodconfig   gcc  
powerpc                           allnoconfig   gcc  
powerpc                          allyesconfig   gcc  
powerpc                 mpc836x_rdk_defconfig   clang
powerpc              randconfig-r031-20230829   clang
powerpc                     redwood_defconfig   gcc  
powerpc                     stx_gp3_defconfig   gcc  
powerpc64            randconfig-r033-20230829   clang
riscv                            allmodconfig   gcc  
riscv                             allnoconfig   gcc  
riscv                            allyesconfig   gcc  
riscv                               defconfig   gcc  
riscv                 randconfig-001-20230829   clang
riscv                randconfig-r016-20230829   gcc  
riscv                          rv32_defconfig   gcc  
s390                             allmodconfig   gcc  
s390                              allnoconfig   gcc  
s390                             allyesconfig   gcc  
s390                                defconfig   gcc  
s390                  randconfig-001-20230829   gcc  
s390                 randconfig-r034-20230829   clang
sh                               allmodconfig   gcc  
sh                                allnoconfig   gcc  
sh                               allyesconfig   gcc  
sh                         apsh4a3a_defconfig   gcc  
sh                        apsh4ad0a_defconfig   gcc  
sh                                  defconfig   gcc  
sh                             espt_defconfig   gcc  
sh                               j2_defconfig   gcc  
sparc                            allmodconfig   gcc  
sparc                             allnoconfig   gcc  
sparc                            allyesconfig   gcc  
sparc                               defconfig   gcc  
sparc64                          allmodconfig   gcc  
sparc64                          allyesconfig   gcc  
sparc64                             defconfig   gcc  
sparc64              randconfig-r006-20230829   gcc  
um                               allmodconfig   clang
um                                allnoconfig   clang
um                               allyesconfig   clang
um                                  defconfig   gcc  
um                             i386_defconfig   gcc  
um                           x86_64_defconfig   gcc  
x86_64                            allnoconfig   gcc  
x86_64                           allyesconfig   gcc  
x86_64       buildonly-randconfig-001-20230829   clang
x86_64       buildonly-randconfig-002-20230829   clang
x86_64       buildonly-randconfig-003-20230829   clang
x86_64       buildonly-randconfig-004-20230829   clang
x86_64       buildonly-randconfig-005-20230829   clang
x86_64       buildonly-randconfig-006-20230829   clang
x86_64                              defconfig   gcc  
x86_64                randconfig-006-20230829   gcc  
x86_64                randconfig-011-20230829   clang
x86_64                randconfig-012-20230829   clang
x86_64                randconfig-013-20230829   clang
x86_64                randconfig-014-20230829   clang
x86_64                randconfig-015-20230829   clang
x86_64                randconfig-016-20230829   clang
x86_64                randconfig-071-20230829   clang
x86_64                randconfig-072-20230829   clang
x86_64                randconfig-073-20230829   clang
x86_64                randconfig-074-20230829   clang
x86_64                randconfig-075-20230829   clang
x86_64                randconfig-076-20230829   clang
x86_64               randconfig-r026-20230829   gcc  
x86_64                          rhel-8.3-rust   clang
x86_64                               rhel-8.3   gcc  
xtensa                            allnoconfig   gcc  
xtensa                           allyesconfig   gcc  
xtensa                          iss_defconfig   gcc  
xtensa               randconfig-r024-20230829   gcc  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
