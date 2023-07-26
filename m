Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7607E762972
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 26 Jul 2023 05:50:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230382AbjGZDuM (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 25 Jul 2023 23:50:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50458 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229483AbjGZDuL (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 25 Jul 2023 23:50:11 -0400
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1D78C2695
        for <linux-renesas-soc@vger.kernel.org>; Tue, 25 Jul 2023 20:50:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1690343410; x=1721879410;
  h=date:from:to:cc:subject:message-id;
  bh=78TZyJninxzheX/pK12Y30A7GeWLyaYFU4i4rsVJfEQ=;
  b=LKFzYmknLdbyjv08+Vi9IDtg6/qG3W+xUaX/14X426sAgFRh3BPDseId
   HqgZOUA089V7SJASaSpEdI45S6htWe652d711xj9bt88xTKKDugq+yx7g
   m7xzzAvzqGpFBJtyWnQqKXq4QoO3R6CFT7xmyEQIJOFAD6/JvN5SbyJAW
   v9VRZHESwcjHVfz2VtOTBTgeMCgOJJ3TnwtfMm43KG3FzUxm4jucHtv8j
   8X6qDIwlLVOZJuLpnQ9SNZe7eEz6l69P8o0EFE4Pe4P/DK41K6nofufEF
   Zy9ZC85+4F5nWkHg/du63oEobrK844nWczbGk9VYgSazlFwuLiTqg3tNx
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10782"; a="357910514"
X-IronPort-AV: E=Sophos;i="6.01,231,1684825200"; 
   d="scan'208";a="357910514"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Jul 2023 20:50:09 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10782"; a="729655825"
X-IronPort-AV: E=Sophos;i="6.01,231,1684825200"; 
   d="scan'208";a="729655825"
Received: from lkp-server02.sh.intel.com (HELO 953e8cd98f7d) ([10.239.97.151])
  by fmsmga007.fm.intel.com with ESMTP; 25 Jul 2023 20:50:08 -0700
Received: from kbuild by 953e8cd98f7d with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1qOVXL-0000bt-20;
        Wed, 26 Jul 2023 03:50:07 +0000
Date:   Wed, 26 Jul 2023 11:49:27 +0800
From:   kernel test robot <lkp@intel.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     linux-renesas-soc@vger.kernel.org
Subject: [geert-renesas-drivers:renesas-pinctrl-for-v6.6] BUILD
 SUCCESS 95eb19869401850f069723b296170b8b3bd5be9e
Message-ID: <202307261122.JbuvKGGt-lkp@intel.com>
User-Agent: s-nail v14.9.24
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git renesas-pinctrl-for-v6.6
branch HEAD: 95eb19869401850f069723b296170b8b3bd5be9e  pinctrl: renesas: rzg2l: Use devm_clk_get_enabled() helper

elapsed time: 722m

configs tested: 188
configs skipped: 8

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                            allyesconfig   gcc  
alpha                               defconfig   gcc  
alpha                randconfig-r001-20230725   gcc  
alpha                randconfig-r012-20230725   gcc  
arc                              allyesconfig   gcc  
arc                                 defconfig   gcc  
arc                  randconfig-r013-20230725   gcc  
arc                  randconfig-r014-20230725   gcc  
arc                  randconfig-r016-20230725   gcc  
arc                  randconfig-r031-20230725   gcc  
arc                  randconfig-r043-20230725   gcc  
arc                  randconfig-r043-20230726   gcc  
arm                              allmodconfig   gcc  
arm                              allyesconfig   gcc  
arm                                 defconfig   gcc  
arm                  randconfig-r003-20230725   gcc  
arm                  randconfig-r004-20230725   gcc  
arm                  randconfig-r032-20230725   gcc  
arm                  randconfig-r036-20230725   gcc  
arm                  randconfig-r046-20230725   clang
arm                  randconfig-r046-20230726   gcc  
arm64                            allyesconfig   gcc  
arm64                               defconfig   gcc  
arm64                randconfig-r003-20230725   clang
arm64                randconfig-r004-20230725   clang
arm64                randconfig-r024-20230725   gcc  
arm64                randconfig-r035-20230725   clang
csky                                defconfig   gcc  
csky                 randconfig-r006-20230725   gcc  
csky                 randconfig-r011-20230725   gcc  
csky                 randconfig-r016-20230725   gcc  
csky                 randconfig-r022-20230725   gcc  
csky                 randconfig-r023-20230725   gcc  
hexagon              randconfig-r001-20230725   clang
hexagon              randconfig-r004-20230725   clang
hexagon              randconfig-r005-20230725   clang
hexagon              randconfig-r023-20230725   clang
hexagon              randconfig-r041-20230725   clang
hexagon              randconfig-r041-20230726   clang
hexagon              randconfig-r045-20230725   clang
hexagon              randconfig-r045-20230726   clang
i386                             allyesconfig   gcc  
i386         buildonly-randconfig-r004-20230725   clang
i386         buildonly-randconfig-r005-20230725   clang
i386         buildonly-randconfig-r006-20230725   clang
i386                              debian-10.3   gcc  
i386                                defconfig   gcc  
i386                 randconfig-i001-20230725   clang
i386                 randconfig-i002-20230725   clang
i386                 randconfig-i003-20230725   clang
i386                 randconfig-i004-20230725   clang
i386                 randconfig-i005-20230725   clang
i386                 randconfig-i006-20230725   clang
i386                 randconfig-i011-20230725   gcc  
i386                 randconfig-i012-20230725   gcc  
i386                 randconfig-i013-20230725   gcc  
i386                 randconfig-i014-20230725   gcc  
i386                 randconfig-i015-20230725   gcc  
i386                 randconfig-i016-20230725   gcc  
i386                 randconfig-r001-20230725   clang
i386                 randconfig-r003-20230725   clang
i386                 randconfig-r024-20230725   gcc  
i386                 randconfig-r026-20230725   gcc  
i386                 randconfig-r036-20230725   clang
loongarch                        allmodconfig   gcc  
loongarch                         allnoconfig   gcc  
loongarch                           defconfig   gcc  
loongarch            randconfig-r013-20230725   gcc  
loongarch            randconfig-r015-20230725   gcc  
loongarch            randconfig-r016-20230725   gcc  
loongarch            randconfig-r021-20230725   gcc  
loongarch            randconfig-r024-20230725   gcc  
loongarch            randconfig-r031-20230725   gcc  
loongarch            randconfig-r032-20230725   gcc  
loongarch            randconfig-r033-20230725   gcc  
loongarch            randconfig-r034-20230725   gcc  
loongarch            randconfig-r035-20230725   gcc  
m68k                             allmodconfig   gcc  
m68k                             allyesconfig   gcc  
m68k                                defconfig   gcc  
m68k                 randconfig-r001-20230725   gcc  
m68k                 randconfig-r021-20230725   gcc  
m68k                 randconfig-r025-20230725   gcc  
m68k                 randconfig-r026-20230725   gcc  
m68k                 randconfig-r036-20230725   gcc  
microblaze           randconfig-r002-20230725   gcc  
microblaze           randconfig-r005-20230725   gcc  
microblaze           randconfig-r012-20230725   gcc  
microblaze           randconfig-r025-20230725   gcc  
microblaze           randconfig-r033-20230725   gcc  
microblaze           randconfig-r035-20230725   gcc  
mips                             allmodconfig   gcc  
mips                             allyesconfig   gcc  
mips                 randconfig-r005-20230725   gcc  
mips                 randconfig-r023-20230725   clang
mips                 randconfig-r033-20230725   gcc  
nios2                               defconfig   gcc  
nios2                randconfig-r014-20230725   gcc  
nios2                randconfig-r021-20230725   gcc  
nios2                randconfig-r026-20230725   gcc  
openrisc             randconfig-r031-20230725   gcc  
parisc                           allyesconfig   gcc  
parisc                              defconfig   gcc  
parisc               randconfig-r002-20230725   gcc  
parisc               randconfig-r013-20230725   gcc  
parisc               randconfig-r016-20230725   gcc  
parisc               randconfig-r025-20230725   gcc  
parisc               randconfig-r036-20230725   gcc  
parisc64                            defconfig   gcc  
powerpc                          allmodconfig   gcc  
powerpc                           allnoconfig   gcc  
powerpc              randconfig-r006-20230725   clang
powerpc              randconfig-r012-20230725   gcc  
powerpc              randconfig-r023-20230725   gcc  
powerpc              randconfig-r032-20230725   clang
powerpc              randconfig-r034-20230725   clang
riscv                            allmodconfig   gcc  
riscv                             allnoconfig   gcc  
riscv                            allyesconfig   gcc  
riscv                               defconfig   gcc  
riscv                randconfig-r002-20230725   clang
riscv                randconfig-r012-20230725   gcc  
riscv                randconfig-r016-20230725   gcc  
riscv                randconfig-r034-20230725   clang
riscv                randconfig-r042-20230725   gcc  
riscv                randconfig-r042-20230726   clang
riscv                          rv32_defconfig   gcc  
s390                             allmodconfig   gcc  
s390                             allyesconfig   gcc  
s390                                defconfig   gcc  
s390                 randconfig-r014-20230725   gcc  
s390                 randconfig-r021-20230725   gcc  
s390                 randconfig-r031-20230725   clang
s390                 randconfig-r033-20230725   clang
s390                 randconfig-r044-20230725   gcc  
s390                 randconfig-r044-20230726   clang
sh                               allmodconfig   gcc  
sh                   randconfig-r014-20230725   gcc  
sh                   randconfig-r016-20230725   gcc  
sh                   randconfig-r036-20230725   gcc  
sparc                            allyesconfig   gcc  
sparc                               defconfig   gcc  
sparc                randconfig-r003-20230725   gcc  
sparc                randconfig-r015-20230725   gcc  
sparc                randconfig-r026-20230725   gcc  
sparc64              randconfig-r005-20230725   gcc  
sparc64              randconfig-r014-20230725   gcc  
sparc64              randconfig-r015-20230725   gcc  
sparc64              randconfig-r022-20230725   gcc  
sparc64              randconfig-r025-20230725   gcc  
um                               allmodconfig   clang
um                                allnoconfig   clang
um                               allyesconfig   clang
um                                  defconfig   gcc  
um                             i386_defconfig   gcc  
um                   randconfig-r001-20230725   gcc  
um                   randconfig-r004-20230725   gcc  
um                   randconfig-r016-20230725   clang
um                   randconfig-r026-20230725   clang
um                   randconfig-r032-20230725   gcc  
um                   randconfig-r034-20230725   gcc  
um                           x86_64_defconfig   gcc  
x86_64                           allyesconfig   gcc  
x86_64       buildonly-randconfig-r001-20230725   clang
x86_64       buildonly-randconfig-r002-20230725   clang
x86_64       buildonly-randconfig-r003-20230725   clang
x86_64                              defconfig   gcc  
x86_64                                  kexec   gcc  
x86_64               randconfig-r011-20230725   gcc  
x86_64               randconfig-r013-20230725   gcc  
x86_64               randconfig-r015-20230725   gcc  
x86_64               randconfig-r024-20230725   gcc  
x86_64               randconfig-x001-20230725   gcc  
x86_64               randconfig-x002-20230725   gcc  
x86_64               randconfig-x003-20230725   gcc  
x86_64               randconfig-x004-20230725   gcc  
x86_64               randconfig-x005-20230725   gcc  
x86_64               randconfig-x006-20230725   gcc  
x86_64               randconfig-x011-20230725   clang
x86_64               randconfig-x012-20230725   clang
x86_64               randconfig-x013-20230725   clang
x86_64               randconfig-x014-20230725   clang
x86_64               randconfig-x015-20230725   clang
x86_64               randconfig-x016-20230725   clang
x86_64                          rhel-8.3-rust   clang
x86_64                               rhel-8.3   gcc  
xtensa               randconfig-r012-20230725   gcc  
xtensa               randconfig-r013-20230725   gcc  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
