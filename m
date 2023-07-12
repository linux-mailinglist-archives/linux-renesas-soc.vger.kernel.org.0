Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 97D3074FCDC
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 12 Jul 2023 03:51:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229655AbjGLBve (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 11 Jul 2023 21:51:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32810 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231272AbjGLBvd (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 11 Jul 2023 21:51:33 -0400
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4801C171E
        for <linux-renesas-soc@vger.kernel.org>; Tue, 11 Jul 2023 18:51:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1689126692; x=1720662692;
  h=date:from:to:cc:subject:message-id;
  bh=MwwnvZ6MrSkS9E0vclYZAl6jjU3Syvj25UOl4ZNsf5Q=;
  b=RzgAiZZ9FTpE3VP804jiqEWK+LvzfGNT44Qt963UikAtQ0EwZtiuXtDL
   GuuDCsBFMKe6FvozFMMBro/R8M3TqmKB6KVD0lqKb1/5Q2S9Tcld5pV/a
   npENaxdYA9vZmCFeNeLNbF2UsLxu/DAp6e9ZH++bqNqvXHKZRr8Hu2Utn
   q6zdwUuNatK8rWNuljDpW0NMusKZ3eHw/Blva3I0buAhUcOJ6urC8XhOs
   iinj9dCRTBqvtuUEDr4Rd5PVpvrl1dIxuTJbPic3VcrYX9BESOf9ypWTZ
   X+YV5/1LvXKClQJjRyAqUk4xXuQUvEZFXiDlmVbyL66qaH1vsyvX77EHi
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10768"; a="344379723"
X-IronPort-AV: E=Sophos;i="6.01,198,1684825200"; 
   d="scan'208";a="344379723"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jul 2023 18:51:31 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10768"; a="968028077"
X-IronPort-AV: E=Sophos;i="6.01,198,1684825200"; 
   d="scan'208";a="968028077"
Received: from lkp-server01.sh.intel.com (HELO c544d7fc5005) ([10.239.97.150])
  by fmsmga006.fm.intel.com with ESMTP; 11 Jul 2023 18:51:30 -0700
Received: from kbuild by c544d7fc5005 with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1qJP0r-0005Gz-2H;
        Wed, 12 Jul 2023 01:51:29 +0000
Date:   Wed, 12 Jul 2023 09:50:35 +0800
From:   kernel test robot <lkp@intel.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     linux-renesas-soc@vger.kernel.org
Subject: [geert-renesas-drivers:renesas-clk] BUILD SUCCESS
 bbceb13ce2c7b084bbbf2463ac8ac2b1f2bd2949
Message-ID: <202307120934.v7CnHzAN-lkp@intel.com>
User-Agent: s-nail v14.9.24
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_PASS,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git renesas-clk
branch HEAD: bbceb13ce2c7b084bbbf2463ac8ac2b1f2bd2949  clk: renesas: rzg2l: Simplify .determine_rate()

elapsed time: 721m

configs tested: 191
configs skipped: 10

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                            allyesconfig   gcc  
alpha                               defconfig   gcc  
alpha                randconfig-r002-20230712   gcc  
alpha                randconfig-r025-20230710   gcc  
alpha                randconfig-r034-20230710   gcc  
arc                              allyesconfig   gcc  
arc                                 defconfig   gcc  
arc                  randconfig-r005-20230710   gcc  
arc                  randconfig-r006-20230710   gcc  
arc                  randconfig-r012-20230711   gcc  
arc                  randconfig-r024-20230710   gcc  
arc                  randconfig-r036-20230712   gcc  
arc                  randconfig-r043-20230710   gcc  
arc                  randconfig-r043-20230711   gcc  
arm                              allmodconfig   gcc  
arm                              allyesconfig   gcc  
arm                     am200epdkit_defconfig   clang
arm                     davinci_all_defconfig   clang
arm                                 defconfig   gcc  
arm                             pxa_defconfig   gcc  
arm                  randconfig-r004-20230710   clang
arm                  randconfig-r015-20230712   gcc  
arm                  randconfig-r021-20230710   gcc  
arm                  randconfig-r046-20230710   gcc  
arm                  randconfig-r046-20230711   clang
arm                       spear13xx_defconfig   clang
arm64                            allyesconfig   gcc  
arm64                               defconfig   gcc  
arm64                randconfig-r001-20230712   gcc  
arm64                randconfig-r004-20230712   gcc  
arm64                randconfig-r011-20230711   gcc  
arm64                randconfig-r025-20230710   clang
csky                                defconfig   gcc  
csky                 randconfig-r036-20230710   gcc  
hexagon              randconfig-r016-20230711   clang
hexagon              randconfig-r035-20230710   clang
hexagon              randconfig-r041-20230710   clang
hexagon              randconfig-r041-20230711   clang
hexagon              randconfig-r045-20230710   clang
hexagon              randconfig-r045-20230711   clang
i386                             allyesconfig   gcc  
i386         buildonly-randconfig-r004-20230710   gcc  
i386         buildonly-randconfig-r004-20230711   clang
i386         buildonly-randconfig-r005-20230710   gcc  
i386         buildonly-randconfig-r005-20230711   clang
i386         buildonly-randconfig-r006-20230710   gcc  
i386         buildonly-randconfig-r006-20230711   clang
i386                              debian-10.3   gcc  
i386                                defconfig   gcc  
i386                 randconfig-i001-20230710   gcc  
i386                 randconfig-i001-20230711   clang
i386                 randconfig-i002-20230710   gcc  
i386                 randconfig-i002-20230711   clang
i386                 randconfig-i003-20230710   gcc  
i386                 randconfig-i003-20230711   clang
i386                 randconfig-i004-20230710   gcc  
i386                 randconfig-i004-20230711   clang
i386                 randconfig-i005-20230710   gcc  
i386                 randconfig-i005-20230711   clang
i386                 randconfig-i006-20230710   gcc  
i386                 randconfig-i006-20230711   clang
i386                 randconfig-i011-20230711   gcc  
i386                 randconfig-i012-20230711   gcc  
i386                 randconfig-i013-20230711   gcc  
i386                 randconfig-i014-20230711   gcc  
i386                 randconfig-i015-20230711   gcc  
i386                 randconfig-i016-20230711   gcc  
i386                 randconfig-r014-20230711   gcc  
loongarch                        allmodconfig   gcc  
loongarch                         allnoconfig   gcc  
loongarch                           defconfig   gcc  
loongarch            randconfig-r006-20230712   gcc  
loongarch            randconfig-r022-20230710   gcc  
m68k                             allmodconfig   gcc  
m68k                             allyesconfig   gcc  
m68k                                defconfig   gcc  
m68k                       m5249evb_defconfig   gcc  
m68k                          multi_defconfig   gcc  
m68k                 randconfig-r002-20230710   gcc  
m68k                 randconfig-r013-20230712   gcc  
m68k                 randconfig-r025-20230710   gcc  
m68k                 randconfig-r026-20230710   gcc  
m68k                 randconfig-r034-20230710   gcc  
microblaze           randconfig-r015-20230711   gcc  
microblaze           randconfig-r032-20230710   gcc  
mips                             allmodconfig   gcc  
mips                             allyesconfig   gcc  
mips                  decstation_64_defconfig   gcc  
mips                malta_qemu_32r6_defconfig   clang
mips                 randconfig-r002-20230710   clang
mips                 randconfig-r015-20230711   clang
mips                 randconfig-r024-20230710   gcc  
nios2                               defconfig   gcc  
nios2                randconfig-r012-20230712   gcc  
nios2                randconfig-r013-20230711   gcc  
nios2                randconfig-r023-20230710   gcc  
openrisc                            defconfig   gcc  
openrisc             randconfig-r011-20230711   gcc  
openrisc             randconfig-r021-20230710   gcc  
parisc                           allyesconfig   gcc  
parisc                              defconfig   gcc  
parisc               randconfig-r011-20230712   gcc  
parisc               randconfig-r035-20230712   gcc  
parisc64                            defconfig   gcc  
powerpc                          allmodconfig   gcc  
powerpc                           allnoconfig   gcc  
powerpc              randconfig-r003-20230712   gcc  
powerpc              randconfig-r023-20230710   clang
powerpc              randconfig-r035-20230710   gcc  
riscv                            allmodconfig   gcc  
riscv                             allnoconfig   gcc  
riscv                            allyesconfig   gcc  
riscv                               defconfig   gcc  
riscv                randconfig-r001-20230710   gcc  
riscv                randconfig-r006-20230710   gcc  
riscv                randconfig-r013-20230711   gcc  
riscv                randconfig-r031-20230710   gcc  
riscv                randconfig-r032-20230710   gcc  
riscv                randconfig-r042-20230710   clang
riscv                randconfig-r042-20230711   gcc  
riscv                          rv32_defconfig   gcc  
s390                             allmodconfig   gcc  
s390                             allyesconfig   gcc  
s390                                defconfig   gcc  
s390                 randconfig-r004-20230710   gcc  
s390                 randconfig-r014-20230711   gcc  
s390                 randconfig-r031-20230710   gcc  
s390                 randconfig-r036-20230710   gcc  
s390                 randconfig-r044-20230710   clang
s390                 randconfig-r044-20230711   gcc  
sh                               allmodconfig   gcc  
sh                   randconfig-r012-20230711   gcc  
sh                   randconfig-r033-20230710   gcc  
sparc                            allyesconfig   gcc  
sparc                               defconfig   gcc  
sparc                randconfig-r001-20230710   gcc  
sparc                randconfig-r011-20230711   gcc  
sparc                randconfig-r014-20230712   gcc  
sparc                randconfig-r016-20230711   gcc  
sparc                randconfig-r023-20230710   gcc  
sparc                randconfig-r033-20230712   gcc  
sparc64              randconfig-r012-20230711   gcc  
sparc64              randconfig-r026-20230710   gcc  
um                               allmodconfig   clang
um                                allnoconfig   clang
um                               allyesconfig   clang
um                                  defconfig   gcc  
um                             i386_defconfig   gcc  
um                   randconfig-r003-20230710   clang
um                   randconfig-r005-20230710   clang
um                   randconfig-r016-20230712   gcc  
um                   randconfig-r022-20230710   gcc  
um                           x86_64_defconfig   gcc  
x86_64                           allyesconfig   gcc  
x86_64       buildonly-randconfig-r001-20230710   gcc  
x86_64       buildonly-randconfig-r001-20230711   clang
x86_64       buildonly-randconfig-r002-20230710   gcc  
x86_64       buildonly-randconfig-r002-20230711   clang
x86_64       buildonly-randconfig-r003-20230710   gcc  
x86_64       buildonly-randconfig-r003-20230711   clang
x86_64                              defconfig   gcc  
x86_64                                  kexec   gcc  
x86_64               randconfig-r016-20230711   gcc  
x86_64               randconfig-r031-20230712   gcc  
x86_64               randconfig-r033-20230710   gcc  
x86_64               randconfig-x001-20230710   clang
x86_64               randconfig-x001-20230711   gcc  
x86_64               randconfig-x002-20230710   clang
x86_64               randconfig-x002-20230711   gcc  
x86_64               randconfig-x003-20230710   clang
x86_64               randconfig-x003-20230711   gcc  
x86_64               randconfig-x004-20230710   clang
x86_64               randconfig-x004-20230711   gcc  
x86_64               randconfig-x005-20230710   clang
x86_64               randconfig-x005-20230711   gcc  
x86_64               randconfig-x006-20230710   clang
x86_64               randconfig-x006-20230711   gcc  
x86_64               randconfig-x011-20230710   gcc  
x86_64               randconfig-x011-20230711   clang
x86_64               randconfig-x012-20230710   gcc  
x86_64               randconfig-x012-20230711   clang
x86_64               randconfig-x013-20230710   gcc  
x86_64               randconfig-x013-20230711   clang
x86_64               randconfig-x014-20230710   gcc  
x86_64               randconfig-x014-20230711   clang
x86_64               randconfig-x015-20230710   gcc  
x86_64               randconfig-x015-20230711   clang
x86_64               randconfig-x016-20230710   gcc  
x86_64               randconfig-x016-20230711   clang
x86_64                          rhel-8.3-rust   clang
x86_64                               rhel-8.3   gcc  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
