Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7A263724DFC
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  6 Jun 2023 22:26:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239192AbjFFU0Q (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 6 Jun 2023 16:26:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51530 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238887AbjFFU0P (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 6 Jun 2023 16:26:15 -0400
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C90761707
        for <linux-renesas-soc@vger.kernel.org>; Tue,  6 Jun 2023 13:26:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1686083173; x=1717619173;
  h=date:from:to:cc:subject:message-id;
  bh=jX8kyI2menVaTp5WZ582GRtD9tb3WPjuiEjYQU+TsDE=;
  b=YkHFm+rwm9dvELQ8oB/WyDJASn0I0YgAFx3ZrqjTuBZt/hzCTkrkc7r9
   +H9EZiH0teGwwQHg4VzjUc8cjKhbRgLKTrjmrssCCgNbsAXm/ke2DKXSd
   URSu7oAIHQHwm19RcDQ6r3763zxIOzHYzL6sSfM7fyfUZ8w7FE3uwNt3w
   lRiQ0/3wO+7AUU9vZKyK7zL3t9A2AlINQx7AT1GoqjjcezNjpirqbxW2O
   cyDACkzRnjJJcSyaUJazXdpmuO7lW9BgazrDFWkRQRrATMpt1t2dDSOeq
   QLR1L2UYAIZasEcvwj1JGtpAAKDnsOESKXdCUXdbkjhmSeD8OOXbRqfAe
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10733"; a="420339519"
X-IronPort-AV: E=Sophos;i="6.00,221,1681196400"; 
   d="scan'208";a="420339519"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Jun 2023 13:26:13 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10733"; a="1039326867"
X-IronPort-AV: E=Sophos;i="6.00,221,1681196400"; 
   d="scan'208";a="1039326867"
Received: from lkp-server01.sh.intel.com (HELO 15ab08e44a81) ([10.239.97.150])
  by fmsmga005.fm.intel.com with ESMTP; 06 Jun 2023 13:26:11 -0700
Received: from kbuild by 15ab08e44a81 with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1q6dFr-0005hd-0g;
        Tue, 06 Jun 2023 20:26:11 +0000
Date:   Wed, 07 Jun 2023 04:25:30 +0800
From:   kernel test robot <lkp@intel.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     linux-renesas-soc@vger.kernel.org
Subject: [geert-renesas-devel:next] BUILD SUCCESS
 7762defcdaf029da668d5af3304d3d940d43199e
Message-ID: <20230606202530.K474n%lkp@intel.com>
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

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git next
branch HEAD: 7762defcdaf029da668d5af3304d3d940d43199e  Merge branch 'renesas-drivers-for-v6.5' into renesas-next

elapsed time: 727m

configs tested: 204
configs skipped: 13

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                            allyesconfig   gcc  
alpha        buildonly-randconfig-r001-20230606   gcc  
alpha        buildonly-randconfig-r004-20230606   gcc  
alpha                               defconfig   gcc  
alpha                randconfig-r001-20230606   gcc  
alpha                randconfig-r004-20230606   gcc  
alpha                randconfig-r031-20230606   gcc  
arc                              allyesconfig   gcc  
arc                                 defconfig   gcc  
arc                  randconfig-r012-20230606   gcc  
arc                  randconfig-r016-20230606   gcc  
arc                  randconfig-r043-20230606   gcc  
arm                              allmodconfig   gcc  
arm                              allyesconfig   gcc  
arm          buildonly-randconfig-r001-20230606   gcc  
arm          buildonly-randconfig-r004-20230606   gcc  
arm          buildonly-randconfig-r006-20230606   gcc  
arm                                 defconfig   gcc  
arm                  randconfig-r003-20230606   clang
arm                  randconfig-r004-20230606   clang
arm                  randconfig-r013-20230606   gcc  
arm                  randconfig-r014-20230606   gcc  
arm                  randconfig-r046-20230606   gcc  
arm64                            allyesconfig   gcc  
arm64        buildonly-randconfig-r005-20230606   gcc  
arm64                               defconfig   gcc  
arm64                randconfig-r002-20230606   gcc  
arm64                randconfig-r005-20230606   gcc  
arm64                randconfig-r021-20230606   clang
arm64                randconfig-r025-20230606   clang
arm64                randconfig-r031-20230606   gcc  
csky                                defconfig   gcc  
csky                 randconfig-r005-20230606   gcc  
csky                 randconfig-r021-20230606   gcc  
csky                 randconfig-r022-20230606   gcc  
csky                 randconfig-r035-20230606   gcc  
hexagon      buildonly-randconfig-r003-20230606   clang
hexagon      buildonly-randconfig-r004-20230606   clang
hexagon              randconfig-r002-20230606   clang
hexagon              randconfig-r004-20230606   clang
hexagon              randconfig-r012-20230606   clang
hexagon              randconfig-r022-20230606   clang
hexagon              randconfig-r024-20230606   clang
hexagon              randconfig-r041-20230606   clang
hexagon              randconfig-r045-20230606   clang
i386                             allyesconfig   gcc  
i386         buildonly-randconfig-r005-20230606   gcc  
i386                              debian-10.3   gcc  
i386                                defconfig   gcc  
i386                 randconfig-i001-20230606   gcc  
i386                 randconfig-i002-20230606   gcc  
i386                 randconfig-i003-20230606   gcc  
i386                 randconfig-i004-20230606   gcc  
i386                 randconfig-i005-20230606   gcc  
i386                 randconfig-i006-20230606   gcc  
i386                 randconfig-i011-20230606   clang
i386                 randconfig-i012-20230606   clang
i386                 randconfig-i013-20230606   clang
i386                 randconfig-i014-20230606   clang
i386                 randconfig-i015-20230606   clang
i386                 randconfig-i016-20230606   clang
i386                 randconfig-i051-20230606   gcc  
i386                 randconfig-i052-20230606   gcc  
i386                 randconfig-i053-20230606   gcc  
i386                 randconfig-i054-20230606   gcc  
i386                 randconfig-i055-20230606   gcc  
i386                 randconfig-i056-20230606   gcc  
i386                 randconfig-i061-20230606   gcc  
i386                 randconfig-i062-20230606   gcc  
i386                 randconfig-i063-20230606   gcc  
i386                 randconfig-i064-20230606   gcc  
i386                 randconfig-i065-20230606   gcc  
i386                 randconfig-i066-20230606   gcc  
i386                 randconfig-r024-20230606   clang
i386                 randconfig-r033-20230606   gcc  
i386                 randconfig-r034-20230606   gcc  
i386                 randconfig-r036-20230606   gcc  
loongarch                        allmodconfig   gcc  
loongarch                         allnoconfig   gcc  
loongarch    buildonly-randconfig-r003-20230606   gcc  
loongarch    buildonly-randconfig-r006-20230606   gcc  
loongarch                           defconfig   gcc  
loongarch            randconfig-r003-20230606   gcc  
loongarch            randconfig-r011-20230606   gcc  
loongarch            randconfig-r013-20230606   gcc  
loongarch            randconfig-r031-20230606   gcc  
loongarch            randconfig-r032-20230606   gcc  
loongarch            randconfig-r033-20230606   gcc  
loongarch            randconfig-r035-20230606   gcc  
m68k                             allmodconfig   gcc  
m68k                                defconfig   gcc  
m68k                 randconfig-r001-20230606   gcc  
m68k                 randconfig-r012-20230606   gcc  
m68k                 randconfig-r016-20230606   gcc  
m68k                 randconfig-r022-20230606   gcc  
m68k                 randconfig-r032-20230606   gcc  
microblaze   buildonly-randconfig-r002-20230606   gcc  
microblaze           randconfig-r003-20230606   gcc  
microblaze           randconfig-r012-20230606   gcc  
microblaze           randconfig-r014-20230606   gcc  
microblaze           randconfig-r015-20230606   gcc  
microblaze           randconfig-r026-20230606   gcc  
microblaze           randconfig-r032-20230606   gcc  
mips                             allmodconfig   gcc  
mips                             allyesconfig   gcc  
mips         buildonly-randconfig-r002-20230606   clang
mips                 randconfig-r015-20230606   gcc  
mips                 randconfig-r025-20230606   gcc  
nios2        buildonly-randconfig-r004-20230606   gcc  
nios2                               defconfig   gcc  
nios2                randconfig-r001-20230606   gcc  
nios2                randconfig-r002-20230606   gcc  
nios2                randconfig-r014-20230606   gcc  
openrisc             randconfig-r003-20230606   gcc  
openrisc             randconfig-r024-20230606   gcc  
openrisc             randconfig-r025-20230606   gcc  
parisc                              defconfig   gcc  
parisc               randconfig-r034-20230606   gcc  
parisc64                            defconfig   gcc  
powerpc                          allmodconfig   gcc  
powerpc                           allnoconfig   gcc  
powerpc      buildonly-randconfig-r001-20230606   clang
powerpc              randconfig-r002-20230606   gcc  
powerpc              randconfig-r005-20230606   gcc  
powerpc              randconfig-r011-20230606   clang
powerpc              randconfig-r021-20230606   clang
powerpc              randconfig-r032-20230606   gcc  
powerpc              randconfig-r033-20230606   gcc  
powerpc              randconfig-r035-20230606   gcc  
riscv                            allmodconfig   gcc  
riscv                             allnoconfig   gcc  
riscv        buildonly-randconfig-r001-20230606   clang
riscv        buildonly-randconfig-r003-20230606   clang
riscv                               defconfig   gcc  
riscv                randconfig-r011-20230606   clang
riscv                randconfig-r025-20230606   clang
riscv                randconfig-r026-20230606   clang
riscv                randconfig-r036-20230606   gcc  
riscv                randconfig-r042-20230606   clang
riscv                          rv32_defconfig   gcc  
s390                             allmodconfig   gcc  
s390                             allyesconfig   gcc  
s390                                defconfig   gcc  
s390                 randconfig-r004-20230606   gcc  
s390                 randconfig-r015-20230606   clang
s390                 randconfig-r035-20230606   gcc  
s390                 randconfig-r044-20230606   clang
sh                               allmodconfig   gcc  
sh                   randconfig-r006-20230606   gcc  
sh                   randconfig-r013-20230606   gcc  
sh                   randconfig-r014-20230606   gcc  
sh                   randconfig-r023-20230606   gcc  
sh                   randconfig-r032-20230606   gcc  
sh                   randconfig-r033-20230606   gcc  
sh                   randconfig-r034-20230606   gcc  
sh                   randconfig-r035-20230606   gcc  
sparc        buildonly-randconfig-r003-20230606   gcc  
sparc                               defconfig   gcc  
sparc                randconfig-r003-20230606   gcc  
sparc                randconfig-r036-20230606   gcc  
sparc64      buildonly-randconfig-r002-20230606   gcc  
sparc64              randconfig-r002-20230606   gcc  
sparc64              randconfig-r024-20230606   gcc  
sparc64              randconfig-r031-20230606   gcc  
sparc64              randconfig-r036-20230606   gcc  
um                             i386_defconfig   gcc  
um                           x86_64_defconfig   gcc  
x86_64                           allyesconfig   gcc  
x86_64                              defconfig   gcc  
x86_64                                  kexec   gcc  
x86_64               randconfig-a001-20230606   gcc  
x86_64               randconfig-a002-20230606   gcc  
x86_64               randconfig-a003-20230606   gcc  
x86_64               randconfig-a004-20230606   gcc  
x86_64               randconfig-a005-20230606   gcc  
x86_64               randconfig-a006-20230606   gcc  
x86_64               randconfig-a011-20230606   clang
x86_64               randconfig-a012-20230606   clang
x86_64               randconfig-a013-20230606   clang
x86_64               randconfig-a014-20230606   clang
x86_64               randconfig-a015-20230606   clang
x86_64               randconfig-a016-20230606   clang
x86_64               randconfig-r005-20230606   gcc  
x86_64               randconfig-r016-20230606   clang
x86_64               randconfig-r026-20230606   clang
x86_64               randconfig-r031-20230606   gcc  
x86_64               randconfig-x051-20230606   clang
x86_64               randconfig-x052-20230606   clang
x86_64               randconfig-x053-20230606   clang
x86_64               randconfig-x054-20230606   clang
x86_64               randconfig-x055-20230606   clang
x86_64               randconfig-x056-20230606   clang
x86_64               randconfig-x061-20230606   clang
x86_64               randconfig-x062-20230606   clang
x86_64               randconfig-x063-20230606   clang
x86_64               randconfig-x064-20230606   clang
x86_64               randconfig-x065-20230606   clang
x86_64               randconfig-x066-20230606   clang
x86_64                               rhel-8.3   gcc  
xtensa               randconfig-r002-20230606   gcc  
xtensa               randconfig-r004-20230606   gcc  
xtensa               randconfig-r006-20230606   gcc  
xtensa               randconfig-r024-20230606   gcc  
xtensa               randconfig-r025-20230606   gcc  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
