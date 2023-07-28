Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 42B2E766137
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 28 Jul 2023 03:29:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231359AbjG1B30 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 27 Jul 2023 21:29:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44880 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231280AbjG1B3Z (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 27 Jul 2023 21:29:25 -0400
Received: from mgamail.intel.com (unknown [134.134.136.31])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5B3CF3582
        for <linux-renesas-soc@vger.kernel.org>; Thu, 27 Jul 2023 18:29:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1690507764; x=1722043764;
  h=date:from:to:cc:subject:message-id;
  bh=ukLKlzPfeSagekk7RORG0/k5sKJ6eVzmlsWvUwr92qw=;
  b=Y74Yb7/WWak3xmXCg8ifOQP9Jaadl/2zj41g9ANY7ofGoL+1n9xM0XvP
   Y+peZ1a/+Sy+2c7k1cu9vYSzTFDVAewmqczSSo8oiLzKZKDISEsuMdxhn
   F9N3FPLHb/6SdhTG1+vr9jZjgDcHysuizVMB8a2l8xHoZ6I5CmTQ/pxKp
   gcjtBiHNMxCGQ3W63XydK6NfvUCiYhSIyTphREyIir0LwMvsY/Da1IXq5
   z9o1CqI/PhamDnhksuOBTt/KmeTvl0kwuvSG+7iBBsrkIlDql6/dTdkKY
   e8visdjs+TPNyrc0tA506zrtcOuvTY8lgmMpAxRde6/UwaddtrLlfTf8h
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10784"; a="432291409"
X-IronPort-AV: E=Sophos;i="6.01,236,1684825200"; 
   d="scan'208";a="432291409"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jul 2023 18:29:23 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10784"; a="901042038"
X-IronPort-AV: E=Sophos;i="6.01,236,1684825200"; 
   d="scan'208";a="901042038"
Received: from lkp-server02.sh.intel.com (HELO 953e8cd98f7d) ([10.239.97.151])
  by orsmga005.jf.intel.com with ESMTP; 27 Jul 2023 18:29:22 -0700
Received: from kbuild by 953e8cd98f7d with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1qPCIE-0002kl-0r;
        Fri, 28 Jul 2023 01:29:22 +0000
Date:   Fri, 28 Jul 2023 09:28:58 +0800
From:   kernel test robot <lkp@intel.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     linux-renesas-soc@vger.kernel.org
Subject: [geert-renesas-drivers:renesas-clk] BUILD SUCCESS
 dec57795efc4585d5bbca913af6683c5cce2a647
Message-ID: <202307280956.telyUGU4-lkp@intel.com>
User-Agent: s-nail v14.9.24
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git renesas-clk
branch HEAD: dec57795efc4585d5bbca913af6683c5cce2a647  clk: renesas: r8a77965: Add 3DGE and ZG support

elapsed time: 721m

configs tested: 151
configs skipped: 10

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                            allyesconfig   gcc  
alpha                               defconfig   gcc  
alpha                randconfig-r005-20230727   gcc  
alpha                randconfig-r014-20230727   gcc  
alpha                randconfig-r021-20230727   gcc  
arc                              allyesconfig   gcc  
arc                                 defconfig   gcc  
arc                  randconfig-r002-20230727   gcc  
arc                  randconfig-r013-20230727   gcc  
arc                  randconfig-r015-20230727   gcc  
arc                  randconfig-r022-20230727   gcc  
arc                  randconfig-r031-20230727   gcc  
arc                  randconfig-r034-20230727   gcc  
arc                  randconfig-r043-20230727   gcc  
arm                              allmodconfig   gcc  
arm                              allyesconfig   gcc  
arm                                 defconfig   gcc  
arm                           imxrt_defconfig   gcc  
arm                  randconfig-r021-20230727   clang
arm                  randconfig-r022-20230727   clang
arm                  randconfig-r046-20230727   clang
arm                        shmobile_defconfig   gcc  
arm64                            allyesconfig   gcc  
arm64                               defconfig   gcc  
arm64                randconfig-r006-20230727   clang
arm64                randconfig-r016-20230727   gcc  
arm64                randconfig-r024-20230727   gcc  
arm64                randconfig-r032-20230727   clang
csky                                defconfig   gcc  
csky                 randconfig-r011-20230727   gcc  
csky                 randconfig-r036-20230727   gcc  
hexagon              randconfig-r035-20230727   clang
hexagon              randconfig-r041-20230727   clang
hexagon              randconfig-r045-20230727   clang
i386                             allyesconfig   gcc  
i386         buildonly-randconfig-r004-20230727   clang
i386         buildonly-randconfig-r005-20230727   clang
i386         buildonly-randconfig-r006-20230727   clang
i386                              debian-10.3   gcc  
i386                                defconfig   gcc  
i386                 randconfig-i001-20230727   clang
i386                 randconfig-i002-20230727   clang
i386                 randconfig-i003-20230727   clang
i386                 randconfig-i004-20230727   clang
i386                 randconfig-i005-20230727   clang
i386                 randconfig-i006-20230727   clang
i386                 randconfig-i011-20230727   gcc  
i386                 randconfig-i012-20230727   gcc  
i386                 randconfig-i013-20230727   gcc  
i386                 randconfig-i014-20230727   gcc  
i386                 randconfig-i015-20230727   gcc  
i386                 randconfig-i016-20230727   gcc  
i386                 randconfig-r003-20230727   clang
i386                 randconfig-r006-20230727   clang
i386                 randconfig-r012-20230727   gcc  
i386                 randconfig-r022-20230727   gcc  
loongarch                        allmodconfig   gcc  
loongarch                         allnoconfig   gcc  
loongarch                           defconfig   gcc  
loongarch            randconfig-r005-20230727   gcc  
loongarch            randconfig-r034-20230727   gcc  
m68k                             allmodconfig   gcc  
m68k                             allyesconfig   gcc  
m68k                                defconfig   gcc  
m68k                 randconfig-r026-20230727   gcc  
m68k                 randconfig-r031-20230727   gcc  
microblaze           randconfig-r013-20230727   gcc  
microblaze           randconfig-r016-20230727   gcc  
microblaze           randconfig-r025-20230727   gcc  
mips                             allmodconfig   gcc  
mips                             allyesconfig   gcc  
mips                           gcw0_defconfig   gcc  
mips                  maltasmvp_eva_defconfig   gcc  
mips                 randconfig-r013-20230727   clang
mips                 randconfig-r023-20230727   clang
nios2                               defconfig   gcc  
nios2                randconfig-r012-20230727   gcc  
openrisc             randconfig-r033-20230727   gcc  
parisc                           allyesconfig   gcc  
parisc                              defconfig   gcc  
parisc               randconfig-r004-20230727   gcc  
parisc               randconfig-r011-20230727   gcc  
parisc               randconfig-r015-20230727   gcc  
parisc               randconfig-r016-20230727   gcc  
parisc               randconfig-r035-20230727   gcc  
parisc64                            defconfig   gcc  
powerpc                          allmodconfig   gcc  
powerpc                           allnoconfig   gcc  
powerpc                      ppc6xx_defconfig   gcc  
powerpc                     rainier_defconfig   gcc  
powerpc              randconfig-r002-20230727   clang
powerpc              randconfig-r014-20230727   gcc  
riscv                            allmodconfig   gcc  
riscv                             allnoconfig   gcc  
riscv                            allyesconfig   gcc  
riscv                               defconfig   gcc  
riscv                randconfig-r042-20230727   gcc  
riscv                          rv32_defconfig   gcc  
s390                             allmodconfig   gcc  
s390                             allyesconfig   gcc  
s390                                defconfig   gcc  
s390                 randconfig-r001-20230727   clang
s390                 randconfig-r036-20230727   clang
s390                 randconfig-r044-20230727   gcc  
sh                               allmodconfig   gcc  
sh                   randconfig-r003-20230727   gcc  
sh                   randconfig-r012-20230727   gcc  
sh                   randconfig-r014-20230727   gcc  
sh                   randconfig-r024-20230727   gcc  
sh                           se7712_defconfig   gcc  
sh                        sh7763rdp_defconfig   gcc  
sh                   sh7770_generic_defconfig   gcc  
sparc                            allyesconfig   gcc  
sparc                               defconfig   gcc  
sparc                randconfig-r001-20230727   gcc  
sparc                randconfig-r014-20230727   gcc  
sparc64              randconfig-r015-20230727   gcc  
sparc64              randconfig-r023-20230727   gcc  
sparc64              randconfig-r033-20230727   gcc  
um                               allmodconfig   clang
um                                allnoconfig   clang
um                               allyesconfig   clang
um                                  defconfig   gcc  
um                             i386_defconfig   gcc  
um                   randconfig-r032-20230727   gcc  
um                           x86_64_defconfig   gcc  
x86_64                           allyesconfig   gcc  
x86_64       buildonly-randconfig-r001-20230727   clang
x86_64       buildonly-randconfig-r002-20230727   clang
x86_64       buildonly-randconfig-r003-20230727   clang
x86_64                              defconfig   gcc  
x86_64                                  kexec   gcc  
x86_64               randconfig-r013-20230727   gcc  
x86_64               randconfig-x001-20230727   gcc  
x86_64               randconfig-x002-20230727   gcc  
x86_64               randconfig-x003-20230727   gcc  
x86_64               randconfig-x004-20230727   gcc  
x86_64               randconfig-x005-20230727   gcc  
x86_64               randconfig-x006-20230727   gcc  
x86_64               randconfig-x011-20230727   clang
x86_64               randconfig-x012-20230727   clang
x86_64               randconfig-x013-20230727   clang
x86_64               randconfig-x014-20230727   clang
x86_64               randconfig-x015-20230727   clang
x86_64               randconfig-x016-20230727   clang
x86_64                          rhel-8.3-rust   clang
x86_64                               rhel-8.3   gcc  
xtensa               randconfig-r002-20230727   gcc  
xtensa               randconfig-r004-20230727   gcc  
xtensa               randconfig-r011-20230727   gcc  
xtensa               randconfig-r026-20230727   gcc  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
