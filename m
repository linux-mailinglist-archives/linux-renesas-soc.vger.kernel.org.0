Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A59F26EECA6
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 26 Apr 2023 05:17:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238586AbjDZDRb (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 25 Apr 2023 23:17:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45288 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234044AbjDZDRa (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 25 Apr 2023 23:17:30 -0400
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 993C410C
        for <linux-renesas-soc@vger.kernel.org>; Tue, 25 Apr 2023 20:17:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1682479049; x=1714015049;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=O7O6ReQVaDfKCgVHbKbsPSB9Pm1R3DvN0InR7ghuC2k=;
  b=JfKBECXu+v2FTFSEx0aBROMxFPDL4LAFhvUbo6WUw0zzhyf0suJOK9p/
   N7k1mVgmap3ILUPc2qKs0qTDm1CZJIt3k7phLjHmbNqKGGV8MKAPwsqPK
   yDk4EI1PC8mIct8iwRb8cifQKR1OupuT1YnMAggaZFb1OqU4i2cd264El
   hup7KnPQB2lO7mOTdXqIgiOuY2IFbZie3BqSCq0b4uvof4hZfLgqzxVXz
   CoY8376IV5unnMOb5TBdo1u44VgX6AMxB0VFqZ+5ECyARV869F6T3bayW
   zlmVFXNPl61FgYoqtV6Il3kLc7jtfMXN6FqmZLaLIEb+5pUdZkXxzkgvA
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10691"; a="326587122"
X-IronPort-AV: E=Sophos;i="5.99,227,1677571200"; 
   d="scan'208";a="326587122"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Apr 2023 20:17:29 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10691"; a="693779681"
X-IronPort-AV: E=Sophos;i="5.99,227,1677571200"; 
   d="scan'208";a="693779681"
Received: from lkp-server01.sh.intel.com (HELO 98ee5a99fc83) ([10.239.97.150])
  by orsmga002.jf.intel.com with ESMTP; 25 Apr 2023 20:17:27 -0700
Received: from kbuild by 98ee5a99fc83 with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1prVeo-00002a-32;
        Wed, 26 Apr 2023 03:17:26 +0000
Date:   Wed, 26 Apr 2023 11:16:47 +0800
From:   kernel test robot <lkp@intel.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     linux-renesas-soc@vger.kernel.org
Subject: [geert-renesas-drivers:master] BUILD REGRESSION
 109f3e0b7f96d5fdf923b8002a68961774c25a6e
Message-ID: <6448979f.LDKrJi5RAYmSumBi%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.6 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_PASS,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git master
branch HEAD: 109f3e0b7f96d5fdf923b8002a68961774c25a6e  [LOCAL] arm64: renesas: defconfig: Update renesas_defconfig

Error/Warning reports:

https://lore.kernel.org/oe-kbuild-all/202304191404.hmYyn4RN-lkp@intel.com
https://lore.kernel.org/oe-kbuild-all/202304260234.QTHOuoZG-lkp@intel.com

Error/Warning: (recently discovered and may have been fixed)

drivers/dma/dw-edma/dw-edma-core.c:231:13: error: redefinition of 'dw_edma_device_caps'

Error/Warning ids grouped by kconfigs:

gcc_recent_errors
|-- arc-allmodconfig
|   `-- drivers-dma-dw-edma-dw-edma-core.c:error:redefinition-of-dw_edma_device_caps
|-- arc-randconfig-r023-20230424
|   `-- drivers-dma-dw-edma-dw-edma-core.c:error:redefinition-of-dw_edma_device_caps
|-- ia64-allmodconfig
|   `-- drivers-dma-dw-edma-dw-edma-core.c:error:redefinition-of-dw_edma_device_caps
|-- ia64-buildonly-randconfig-r005-20230424
|   `-- drivers-dma-dw-edma-dw-edma-core.c:error:redefinition-of-dw_edma_device_caps
|-- ia64-randconfig-r012-20230424
|   `-- drivers-dma-dw-edma-dw-edma-core.c:error:redefinition-of-dw_edma_device_caps
|-- ia64-randconfig-s053-20230423
|   `-- drivers-dma-dw-edma-dw-edma-core.c:error:redefinition-of-dw_edma_device_caps
|-- loongarch-randconfig-r014-20230423
|   `-- drivers-dma-dw-edma-dw-edma-core.c:error:redefinition-of-dw_edma_device_caps
|-- riscv-randconfig-r042-20230424
|   `-- drivers-dma-dw-edma-dw-edma-core.c:error:redefinition-of-dw_edma_device_caps
|-- s390-randconfig-s041-20230421
|   `-- drivers-dma-dw-edma-dw-edma-core.c:error:redefinition-of-dw_edma_device_caps
|-- sparc-allyesconfig
|   `-- drivers-dma-dw-edma-dw-edma-core.c:error:redefinition-of-dw_edma_device_caps
`-- xtensa-randconfig-r004-20230424
    `-- drivers-dma-dw-edma-dw-edma-core.c:error:redefinition-of-dw_edma_device_caps
clang_recent_errors
`-- s390-randconfig-r002-20230424
    `-- drivers-dma-dw-edma-dw-edma-core.c:error:redefinition-of-dw_edma_device_caps

elapsed time: 722m

configs tested: 146
configs skipped: 10

tested configs:
alpha                            allyesconfig   gcc  
alpha        buildonly-randconfig-r006-20230423   gcc  
alpha                               defconfig   gcc  
alpha                randconfig-r005-20230423   gcc  
alpha                randconfig-r035-20230424   gcc  
arc                               allnoconfig   gcc  
arc                              allyesconfig   gcc  
arc                                 defconfig   gcc  
arc                         haps_hs_defconfig   gcc  
arc                  randconfig-r016-20230424   gcc  
arc                  randconfig-r023-20230424   gcc  
arc                  randconfig-r043-20230423   gcc  
arc                  randconfig-r043-20230424   gcc  
arc                    vdk_hs38_smp_defconfig   gcc  
arm                              allmodconfig   gcc  
arm                              allyesconfig   gcc  
arm          buildonly-randconfig-r002-20230424   clang
arm                                 defconfig   gcc  
arm                  randconfig-r015-20230424   clang
arm                  randconfig-r046-20230423   gcc  
arm                  randconfig-r046-20230424   clang
arm                         wpcm450_defconfig   gcc  
arm64                            allyesconfig   gcc  
arm64        buildonly-randconfig-r005-20230423   gcc  
arm64                               defconfig   gcc  
arm64                randconfig-r016-20230423   clang
arm64                randconfig-r034-20230423   gcc  
csky                                defconfig   gcc  
csky                 randconfig-r003-20230423   gcc  
csky                 randconfig-r031-20230424   gcc  
csky                 randconfig-r035-20230423   gcc  
hexagon              randconfig-r006-20230424   clang
hexagon              randconfig-r011-20230423   clang
hexagon              randconfig-r041-20230423   clang
hexagon              randconfig-r041-20230424   clang
hexagon              randconfig-r045-20230423   clang
hexagon              randconfig-r045-20230424   clang
i386                             allyesconfig   gcc  
i386                              debian-10.3   gcc  
i386                                defconfig   gcc  
i386                 randconfig-a001-20230424   clang
i386                 randconfig-a002-20230424   clang
i386                 randconfig-a003-20230424   clang
i386                 randconfig-a004-20230424   clang
i386                 randconfig-a005-20230424   clang
i386                 randconfig-a006-20230424   clang
i386                 randconfig-a011-20230424   gcc  
i386                 randconfig-a012-20230424   gcc  
i386                 randconfig-a013-20230424   gcc  
i386                 randconfig-a014-20230424   gcc  
i386                 randconfig-a015-20230424   gcc  
i386                 randconfig-a016-20230424   gcc  
i386                 randconfig-r036-20230424   clang
ia64                             allmodconfig   gcc  
ia64         buildonly-randconfig-r005-20230424   gcc  
ia64                                defconfig   gcc  
ia64                 randconfig-r012-20230424   gcc  
loongarch                        allmodconfig   gcc  
loongarch                         allnoconfig   gcc  
loongarch                           defconfig   gcc  
loongarch            randconfig-r002-20230423   gcc  
loongarch            randconfig-r014-20230423   gcc  
loongarch            randconfig-r014-20230424   gcc  
m68k                             alldefconfig   gcc  
m68k                             allmodconfig   gcc  
m68k                                defconfig   gcc  
m68k                        mvme16x_defconfig   gcc  
m68k                 randconfig-r004-20230423   gcc  
m68k                 randconfig-r033-20230424   gcc  
microblaze   buildonly-randconfig-r004-20230423   gcc  
microblaze           randconfig-r003-20230424   gcc  
microblaze           randconfig-r013-20230424   gcc  
mips                             allmodconfig   gcc  
mips                             allyesconfig   gcc  
mips                           ip28_defconfig   clang
mips                      pic32mzda_defconfig   clang
mips                 randconfig-r005-20230424   gcc  
nios2        buildonly-randconfig-r004-20230424   gcc  
nios2        buildonly-randconfig-r006-20230424   gcc  
nios2                               defconfig   gcc  
nios2                randconfig-r001-20230423   gcc  
openrisc                            defconfig   gcc  
parisc                           alldefconfig   gcc  
parisc       buildonly-randconfig-r003-20230423   gcc  
parisc                              defconfig   gcc  
parisc               randconfig-r012-20230423   gcc  
parisc               randconfig-r021-20230423   gcc  
parisc               randconfig-r023-20230423   gcc  
parisc               randconfig-r031-20230423   gcc  
parisc               randconfig-r036-20230423   gcc  
parisc64                            defconfig   gcc  
powerpc                          allmodconfig   gcc  
powerpc                           allnoconfig   gcc  
powerpc      buildonly-randconfig-r001-20230423   clang
powerpc      buildonly-randconfig-r002-20230423   clang
powerpc                      chrp32_defconfig   gcc  
powerpc                      pcm030_defconfig   gcc  
powerpc              randconfig-r032-20230423   gcc  
powerpc              randconfig-r032-20230424   clang
riscv                            allmodconfig   gcc  
riscv                             allnoconfig   gcc  
riscv                               defconfig   gcc  
riscv                randconfig-r011-20230424   gcc  
riscv                randconfig-r042-20230423   clang
riscv                randconfig-r042-20230424   gcc  
riscv                          rv32_defconfig   gcc  
s390                             allmodconfig   gcc  
s390                             allyesconfig   gcc  
s390                                defconfig   gcc  
s390                 randconfig-r002-20230424   clang
s390                 randconfig-r022-20230424   gcc  
s390                 randconfig-r025-20230423   clang
s390                 randconfig-r044-20230423   clang
s390                 randconfig-r044-20230424   gcc  
sh                               allmodconfig   gcc  
sh                        apsh4ad0a_defconfig   gcc  
sh                   randconfig-r013-20230423   gcc  
sh                           sh2007_defconfig   gcc  
sparc                               defconfig   gcc  
sparc64              randconfig-r006-20230423   gcc  
sparc64              randconfig-r015-20230423   gcc  
sparc64              randconfig-r021-20230424   gcc  
um                             i386_defconfig   gcc  
um                           x86_64_defconfig   gcc  
x86_64                            allnoconfig   gcc  
x86_64                           allyesconfig   gcc  
x86_64                              defconfig   gcc  
x86_64                                  kexec   gcc  
x86_64               randconfig-a001-20230424   clang
x86_64               randconfig-a002-20230424   clang
x86_64               randconfig-a003-20230424   clang
x86_64               randconfig-a004-20230424   clang
x86_64               randconfig-a005-20230424   clang
x86_64               randconfig-a006-20230424   clang
x86_64               randconfig-a011-20230424   gcc  
x86_64               randconfig-a012-20230424   gcc  
x86_64               randconfig-a013-20230424   gcc  
x86_64               randconfig-a014-20230424   gcc  
x86_64               randconfig-a015-20230424   gcc  
x86_64               randconfig-a016-20230424   gcc  
x86_64                               rhel-8.3   gcc  
xtensa       buildonly-randconfig-r001-20230424   gcc  
xtensa               randconfig-r004-20230424   gcc  
xtensa               randconfig-r024-20230423   gcc  
xtensa               randconfig-r025-20230424   gcc  
xtensa               randconfig-r026-20230423   gcc  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
