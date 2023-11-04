Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 294097E0F36
	for <lists+linux-renesas-soc@lfdr.de>; Sat,  4 Nov 2023 12:45:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231823AbjKDLoT (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Sat, 4 Nov 2023 07:44:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45520 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229468AbjKDLoT (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sat, 4 Nov 2023 07:44:19 -0400
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A0274D47
        for <linux-renesas-soc@vger.kernel.org>; Sat,  4 Nov 2023 04:44:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1699098256; x=1730634256;
  h=date:from:to:cc:subject:message-id;
  bh=q+FseZE4su2an4J2qqxty2X9gc6emQ4p3fTllWg3fT4=;
  b=dFUqmPI/yDotFkNuIfLiYKp9fp/pHh2xu93TE2AexUQ2GE22AyrXN1EC
   u9FcX2q5O/lWaWdqJD5ctwMoPVnkpSw4Yt1X7qDEV2lYGOfX08QCX/mpf
   yzTswhqbXrIQ7ckeiMNcWfRpcwtmaU/U1wSbevDXPoc76gkvyRboIC8GN
   qUYma17nLLuSRleQS926iA3JZXkjGa4bHXlfJKxFlCfLTLEq1LBoHmSo0
   k3sgof+kKxKjRTzibG7qMY16aoea9NSfLRN8wTqm0eMQWEewWGXgK9DQZ
   pNmINp/ynPb73BidwyjX7A8DnNsuOjozE6id/NjmWK4jUNrLKvsAT/iSS
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10883"; a="388904972"
X-IronPort-AV: E=Sophos;i="6.03,276,1694761200"; 
   d="scan'208";a="388904972"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Nov 2023 04:44:16 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10883"; a="761862906"
X-IronPort-AV: E=Sophos;i="6.03,276,1694761200"; 
   d="scan'208";a="761862906"
Received: from lkp-server01.sh.intel.com (HELO 17d9e85e5079) ([10.239.97.150])
  by orsmga002.jf.intel.com with ESMTP; 04 Nov 2023 04:44:14 -0700
Received: from kbuild by 17d9e85e5079 with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1qzF4W-0004F3-15;
        Sat, 04 Nov 2023 11:44:12 +0000
Date:   Sat, 04 Nov 2023 19:44:02 +0800
From:   kernel test robot <lkp@intel.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     linux-renesas-soc@vger.kernel.org
Subject: [geert-renesas-drivers:master] BUILD REGRESSION
 d2db27106b911291048ef82bee72ed5a489a83e0
Message-ID: <202311041900.GZyZ8QaS-lkp@intel.com>
User-Agent: s-nail v14.9.24
X-Spam-Status: No, score=-5.0 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git master
branch HEAD: d2db27106b911291048ef82bee72ed5a489a83e0  [LOCAL] arm64: renesas: defconfig: Update renesas_defconfig

Error/Warning reports:

https://lore.kernel.org/oe-kbuild-all/202311011709.KSZRMITa-lkp@intel.com

Error/Warning: (recently discovered and may have been fixed)

net/ipv4/tcp_ao.c:1536:13: error: implicit declaration of function 'crypto_ahash_alignmask'; did you mean 'crypto_ahash_alg_name'? [-Werror=implicit-function-declaration]

Error/Warning ids grouped by kconfigs:

gcc_recent_errors
|-- alpha-allyesconfig
|   `-- net-ipv4-tcp_ao.c:error:implicit-declaration-of-function-crypto_ahash_alignmask
|-- arm-allmodconfig
|   |-- kernel-power-snapshot.c:warning:Function-parameter-or-member-ca-not-described-in-add_rtree_block
|   |-- kernel-power-snapshot.c:warning:Function-parameter-or-member-ca-not-described-in-create_zone_bm_rtree
|   |-- kernel-power-snapshot.c:warning:Function-parameter-or-member-clear_nosave_free-not-described-in-memory_bm_free
|   |-- kernel-power-snapshot.c:warning:Function-parameter-or-member-gfp_mask-not-described-in-memory_bm_create
|   `-- kernel-power-snapshot.c:warning:Function-parameter-or-member-pfn-not-described-in-memory_bm_find_bit
|-- arm-allyesconfig
|   |-- kernel-power-snapshot.c:warning:Function-parameter-or-member-ca-not-described-in-add_rtree_block
|   |-- kernel-power-snapshot.c:warning:Function-parameter-or-member-ca-not-described-in-create_zone_bm_rtree
|   |-- kernel-power-snapshot.c:warning:Function-parameter-or-member-clear_nosave_free-not-described-in-memory_bm_free
|   |-- kernel-power-snapshot.c:warning:Function-parameter-or-member-gfp_mask-not-described-in-memory_bm_create
|   `-- kernel-power-snapshot.c:warning:Function-parameter-or-member-pfn-not-described-in-memory_bm_find_bit
|-- arm64-allyesconfig
|   |-- kernel-power-snapshot.c:warning:Function-parameter-or-member-ca-not-described-in-add_rtree_block
|   |-- kernel-power-snapshot.c:warning:Function-parameter-or-member-ca-not-described-in-create_zone_bm_rtree
|   |-- kernel-power-snapshot.c:warning:Function-parameter-or-member-clear_nosave_free-not-described-in-memory_bm_free
|   |-- kernel-power-snapshot.c:warning:Function-parameter-or-member-gfp_mask-not-described-in-memory_bm_create
|   |-- kernel-power-snapshot.c:warning:Function-parameter-or-member-pfn-not-described-in-memory_bm_find_bit
|   `-- net-ipv4-tcp_ao.c:error:implicit-declaration-of-function-crypto_ahash_alignmask
|-- arm64-defconfig
|   |-- kernel-power-snapshot.c:warning:Function-parameter-or-member-ca-not-described-in-add_rtree_block
|   |-- kernel-power-snapshot.c:warning:Function-parameter-or-member-ca-not-described-in-create_zone_bm_rtree
|   |-- kernel-power-snapshot.c:warning:Function-parameter-or-member-clear_nosave_free-not-described-in-memory_bm_free
|   |-- kernel-power-snapshot.c:warning:Function-parameter-or-member-gfp_mask-not-described-in-memory_bm_create
|   `-- kernel-power-snapshot.c:warning:Function-parameter-or-member-pfn-not-described-in-memory_bm_find_bit
|-- i386-defconfig
|   |-- kernel-power-snapshot.c:warning:Function-parameter-or-member-ca-not-described-in-add_rtree_block
|   |-- kernel-power-snapshot.c:warning:Function-parameter-or-member-ca-not-described-in-create_zone_bm_rtree
|   |-- kernel-power-snapshot.c:warning:Function-parameter-or-member-clear_nosave_free-not-described-in-memory_bm_free
|   |-- kernel-power-snapshot.c:warning:Function-parameter-or-member-gfp_mask-not-described-in-memory_bm_create
|   `-- kernel-power-snapshot.c:warning:Function-parameter-or-member-pfn-not-described-in-memory_bm_find_bit
|-- loongarch-allnoconfig
|   `-- drivers-acpi-acpica-tbfind.c:warning:strncpy-specified-bound-equals-destination-size
|-- loongarch-defconfig
|   |-- kernel-power-snapshot.c:warning:Function-parameter-or-member-ca-not-described-in-add_rtree_block
|   |-- kernel-power-snapshot.c:warning:Function-parameter-or-member-ca-not-described-in-create_zone_bm_rtree
|   |-- kernel-power-snapshot.c:warning:Function-parameter-or-member-clear_nosave_free-not-described-in-memory_bm_free
|   |-- kernel-power-snapshot.c:warning:Function-parameter-or-member-gfp_mask-not-described-in-memory_bm_create
|   `-- kernel-power-snapshot.c:warning:Function-parameter-or-member-pfn-not-described-in-memory_bm_find_bit
|-- powerpc-allyesconfig
|   `-- net-ipv4-tcp_ao.c:error:implicit-declaration-of-function-crypto_ahash_alignmask
`-- x86_64-allyesconfig
    `-- net-ipv4-tcp_ao.c:error:implicit-declaration-of-function-crypto_ahash_alignmask

elapsed time: 5627m

configs tested: 150
configs skipped: 2

tested configs:
alpha                             allnoconfig   gcc  
alpha                            allyesconfig   gcc  
alpha                               defconfig   gcc  
arc                              allmodconfig   gcc  
arc                               allnoconfig   gcc  
arc                              allyesconfig   gcc  
arc                                 defconfig   gcc  
arc                   randconfig-001-20231031   gcc  
arc                   randconfig-002-20231031   gcc  
arm                              allmodconfig   gcc  
arm                               allnoconfig   gcc  
arm                              allyesconfig   gcc  
arm                                 defconfig   gcc  
arm                   randconfig-001-20231031   gcc  
arm                   randconfig-002-20231031   gcc  
arm                   randconfig-003-20231031   gcc  
arm                   randconfig-004-20231031   gcc  
arm64                             allnoconfig   gcc  
arm64                            allyesconfig   gcc  
arm64                               defconfig   gcc  
arm64                 randconfig-001-20231031   gcc  
arm64                 randconfig-002-20231031   gcc  
arm64                 randconfig-003-20231031   gcc  
arm64                 randconfig-004-20231031   gcc  
csky                              allnoconfig   gcc  
csky                                defconfig   gcc  
csky                  randconfig-001-20231031   gcc  
csky                  randconfig-002-20231031   gcc  
i386         buildonly-randconfig-001-20231031   gcc  
i386         buildonly-randconfig-002-20231031   gcc  
i386         buildonly-randconfig-003-20231031   gcc  
i386         buildonly-randconfig-004-20231031   gcc  
i386         buildonly-randconfig-005-20231031   gcc  
i386         buildonly-randconfig-006-20231031   gcc  
i386                                defconfig   gcc  
i386                  randconfig-001-20231031   gcc  
i386                  randconfig-002-20231031   gcc  
i386                  randconfig-003-20231031   gcc  
i386                  randconfig-004-20231031   gcc  
i386                  randconfig-005-20231031   gcc  
i386                  randconfig-006-20231031   gcc  
i386                  randconfig-011-20231031   gcc  
i386                  randconfig-012-20231031   gcc  
i386                  randconfig-013-20231031   gcc  
i386                  randconfig-014-20231031   gcc  
i386                  randconfig-015-20231031   gcc  
i386                  randconfig-016-20231031   gcc  
loongarch                        allmodconfig   gcc  
loongarch                         allnoconfig   gcc  
loongarch                        allyesconfig   gcc  
loongarch                           defconfig   gcc  
loongarch             randconfig-001-20231031   gcc  
loongarch             randconfig-002-20231031   gcc  
m68k                             allmodconfig   gcc  
m68k                              allnoconfig   gcc  
m68k                             allyesconfig   gcc  
m68k                                defconfig   gcc  
microblaze                       allmodconfig   gcc  
microblaze                        allnoconfig   gcc  
microblaze                       allyesconfig   gcc  
microblaze                          defconfig   gcc  
mips                             allmodconfig   gcc  
mips                              allnoconfig   gcc  
mips                             allyesconfig   gcc  
nios2                            allmodconfig   gcc  
nios2                             allnoconfig   gcc  
nios2                            allyesconfig   gcc  
nios2                               defconfig   gcc  
nios2                 randconfig-001-20231031   gcc  
nios2                 randconfig-002-20231031   gcc  
openrisc                            defconfig   gcc  
parisc                              defconfig   gcc  
parisc                randconfig-001-20231031   gcc  
parisc                randconfig-002-20231031   gcc  
parisc64                            defconfig   gcc  
powerpc                          allmodconfig   gcc  
powerpc                           allnoconfig   gcc  
powerpc                          allyesconfig   gcc  
powerpc               randconfig-001-20231031   gcc  
powerpc               randconfig-002-20231031   gcc  
powerpc               randconfig-003-20231031   gcc  
powerpc64             randconfig-001-20231031   gcc  
powerpc64             randconfig-002-20231031   gcc  
powerpc64             randconfig-003-20231031   gcc  
riscv                             allnoconfig   gcc  
riscv                            allyesconfig   gcc  
riscv                               defconfig   gcc  
riscv                 randconfig-001-20231031   gcc  
riscv                 randconfig-002-20231031   gcc  
riscv                          rv32_defconfig   gcc  
s390                                defconfig   gcc  
s390                  randconfig-001-20231031   gcc  
s390                  randconfig-002-20231031   gcc  
sh                               allmodconfig   gcc  
sh                                allnoconfig   gcc  
sh                               allyesconfig   gcc  
sh                                  defconfig   gcc  
sh                    randconfig-001-20231101   gcc  
sh                    randconfig-002-20231101   gcc  
sparc                            allmodconfig   gcc  
sparc                             allnoconfig   gcc  
sparc                            allyesconfig   gcc  
sparc                               defconfig   gcc  
sparc                 randconfig-001-20231101   gcc  
sparc                 randconfig-002-20231101   gcc  
sparc64                          allmodconfig   gcc  
sparc64                          allyesconfig   gcc  
sparc64                             defconfig   gcc  
sparc64               randconfig-001-20231101   gcc  
sparc64               randconfig-002-20231101   gcc  
um                               allmodconfig   clang
um                                allnoconfig   clang
um                               allyesconfig   clang
um                                  defconfig   gcc  
um                             i386_defconfig   gcc  
um                    randconfig-001-20231101   gcc  
um                    randconfig-002-20231101   gcc  
um                           x86_64_defconfig   gcc  
x86_64                            allnoconfig   gcc  
x86_64                           allyesconfig   gcc  
x86_64       buildonly-randconfig-001-20231031   gcc  
x86_64       buildonly-randconfig-002-20231031   gcc  
x86_64       buildonly-randconfig-003-20231031   gcc  
x86_64       buildonly-randconfig-004-20231031   gcc  
x86_64       buildonly-randconfig-005-20231031   gcc  
x86_64       buildonly-randconfig-006-20231031   gcc  
x86_64                              defconfig   gcc  
x86_64                randconfig-001-20231031   gcc  
x86_64                randconfig-002-20231031   gcc  
x86_64                randconfig-003-20231031   gcc  
x86_64                randconfig-004-20231031   gcc  
x86_64                randconfig-005-20231031   gcc  
x86_64                randconfig-006-20231031   gcc  
x86_64                randconfig-011-20231101   gcc  
x86_64                randconfig-012-20231101   gcc  
x86_64                randconfig-013-20231101   gcc  
x86_64                randconfig-014-20231101   gcc  
x86_64                randconfig-015-20231101   gcc  
x86_64                randconfig-016-20231101   gcc  
x86_64                randconfig-071-20231031   gcc  
x86_64                randconfig-072-20231031   gcc  
x86_64                randconfig-073-20231031   gcc  
x86_64                randconfig-074-20231031   gcc  
x86_64                randconfig-075-20231031   gcc  
x86_64                randconfig-076-20231031   gcc  
x86_64                          rhel-8.3-rust   clang
x86_64                               rhel-8.3   gcc  
xtensa                           allyesconfig   gcc  
xtensa                randconfig-001-20231101   gcc  
xtensa                randconfig-002-20231101   gcc  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
