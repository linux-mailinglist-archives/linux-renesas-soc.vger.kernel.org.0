Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A8D1870EA67
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 24 May 2023 02:41:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229777AbjEXAlv (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 23 May 2023 20:41:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47674 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234494AbjEXAlt (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 23 May 2023 20:41:49 -0400
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E6F25E5
        for <linux-renesas-soc@vger.kernel.org>; Tue, 23 May 2023 17:41:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1684888904; x=1716424904;
  h=date:from:to:cc:subject:message-id;
  bh=dnttJGlWXPGaTi7EERkMf08KdQ47/IB1jk+AHSNn89Y=;
  b=hHcwLqh0e8JW0NxUGnsEbNFgubr9sjTRD/NZ5rcgQ2EPonwX0N40aOEf
   mQxSToLMrpI+5maYpZTXp5lFfp5slHnAAReCjDuV5Wzda0dcyNqvXS5uv
   XY3PTCjiYgO8SWFRmK3ZhuqFv50CqEzoCEJsSV5tr+XOipDzzEvQe2jQh
   7GTG5UA+cVsOXQmlJHLwt75y83nlyi2I0hJ6ALLkXt54lgS6ME58zXgfp
   7/9WcHsSLx/zUW1M4+ZYDNJ+jmCy38IYMb83+8fvvpHZ+x3JgBV4fUgXk
   C2JdwxPjewh00KddjYUnpZNK6GWbzHYldAcAv5PxYowEMS0aEJ6EnEf3W
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10719"; a="333772307"
X-IronPort-AV: E=Sophos;i="6.00,187,1681196400"; 
   d="scan'208";a="333772307"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 May 2023 17:41:40 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10719"; a="707245600"
X-IronPort-AV: E=Sophos;i="6.00,187,1681196400"; 
   d="scan'208";a="707245600"
Received: from lkp-server01.sh.intel.com (HELO dea6d5a4f140) ([10.239.97.150])
  by fmsmga007.fm.intel.com with ESMTP; 23 May 2023 17:41:39 -0700
Received: from kbuild by dea6d5a4f140 with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1q1cZO-000EEd-1R;
        Wed, 24 May 2023 00:41:38 +0000
Date:   Wed, 24 May 2023 08:41:03 +0800
From:   kernel test robot <lkp@intel.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     linux-renesas-soc@vger.kernel.org
Subject: [geert-renesas-drivers:master] BUILD REGRESSION
 abbb9265eae965fe3b8d34a68b71b3aeacaa3a11
Message-ID: <20230524004103.lQ2jP%lkp@intel.com>
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

tree/branch: INFO setup_repo_specs: /db/releases/20230524001904/lkp-src/repo/*/geert-renesas-drivers
https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git master
branch HEAD: abbb9265eae965fe3b8d34a68b71b3aeacaa3a11  [LOCAL] arm64: renesas: defconfig: Update renesas_defconfig

Error/Warning reports:

https://lore.kernel.org/oe-kbuild-all/202304260234.QTHOuoZG-lkp@intel.com

Error/Warning: (recently discovered and may have been fixed)

drivers/dma/dw-edma/dw-edma-core.c:231:13: error: redefinition of 'dw_edma_device_caps'

Error/Warning ids grouped by kconfigs:

gcc_recent_errors
|-- alpha-allyesconfig
|   `-- drivers-dma-dw-edma-dw-edma-core.c:error:redefinition-of-dw_edma_device_caps
|-- arc-allyesconfig
|   `-- drivers-dma-dw-edma-dw-edma-core.c:error:redefinition-of-dw_edma_device_caps
|-- arm-allmodconfig
|   `-- drivers-dma-dw-edma-dw-edma-core.c:error:redefinition-of-dw_edma_device_caps
|-- arm-allyesconfig
|   `-- drivers-dma-dw-edma-dw-edma-core.c:error:redefinition-of-dw_edma_device_caps
|-- arm-randconfig-r046-20230522
|   `-- drivers-dma-dw-edma-dw-edma-core.c:error:redefinition-of-dw_edma_device_caps
|-- arm64-allyesconfig
|   `-- drivers-dma-dw-edma-dw-edma-core.c:error:redefinition-of-dw_edma_device_caps
|-- i386-allyesconfig
|   `-- drivers-dma-dw-edma-dw-edma-core.c:error:redefinition-of-dw_edma_device_caps
|-- ia64-allmodconfig
|   `-- drivers-dma-dw-edma-dw-edma-core.c:error:redefinition-of-dw_edma_device_caps
|-- ia64-randconfig-r002-20230521
|   `-- drivers-dma-dw-edma-dw-edma-core.c:error:redefinition-of-dw_edma_device_caps
|-- ia64-randconfig-r025-20230522
|   `-- drivers-dma-dw-edma-dw-edma-core.c:error:redefinition-of-dw_edma_device_caps
|-- loongarch-allmodconfig
|   `-- drivers-dma-dw-edma-dw-edma-core.c:error:redefinition-of-dw_edma_device_caps
|-- loongarch-randconfig-r001-20230521
|   `-- drivers-dma-dw-edma-dw-edma-core.c:error:redefinition-of-dw_edma_device_caps
|-- mips-allmodconfig
|   `-- drivers-dma-dw-edma-dw-edma-core.c:error:redefinition-of-dw_edma_device_caps
|-- mips-allyesconfig
|   `-- drivers-dma-dw-edma-dw-edma-core.c:error:redefinition-of-dw_edma_device_caps
|-- powerpc-allmodconfig
|   `-- drivers-dma-dw-edma-dw-edma-core.c:error:redefinition-of-dw_edma_device_caps
|-- riscv-allmodconfig
|   `-- drivers-dma-dw-edma-dw-edma-core.c:error:redefinition-of-dw_edma_device_caps
|-- s390-allyesconfig
|   `-- drivers-dma-dw-edma-dw-edma-core.c:error:redefinition-of-dw_edma_device_caps
|-- sparc-allyesconfig
|   `-- drivers-dma-dw-edma-dw-edma-core.c:error:redefinition-of-dw_edma_device_caps
`-- x86_64-allyesconfig
    `-- drivers-dma-dw-edma-dw-edma-core.c:error:redefinition-of-dw_edma_device_caps

elapsed time: 728m

configs tested: 165
configs skipped: 12

tested configs:
alpha                            allyesconfig   gcc  
alpha                               defconfig   gcc  
alpha                randconfig-r001-20230522   gcc  
alpha                randconfig-r025-20230521   gcc  
alpha                randconfig-r036-20230522   gcc  
arc                              allyesconfig   gcc  
arc                                 defconfig   gcc  
arc                  randconfig-r005-20230521   gcc  
arc                  randconfig-r024-20230521   gcc  
arc                  randconfig-r043-20230521   gcc  
arc                  randconfig-r043-20230522   gcc  
arm                              allmodconfig   gcc  
arm                              allyesconfig   gcc  
arm          buildonly-randconfig-r005-20230521   clang
arm                                 defconfig   gcc  
arm                  randconfig-r003-20230521   gcc  
arm                  randconfig-r024-20230522   gcc  
arm                  randconfig-r034-20230521   gcc  
arm                  randconfig-r046-20230521   clang
arm                  randconfig-r046-20230522   gcc  
arm64                            allyesconfig   gcc  
arm64        buildonly-randconfig-r004-20230521   clang
arm64                               defconfig   gcc  
arm64                randconfig-r011-20230522   clang
arm64                randconfig-r021-20230522   clang
arm64                randconfig-r023-20230521   gcc  
arm64                randconfig-r033-20230521   clang
csky         buildonly-randconfig-r001-20230521   gcc  
csky         buildonly-randconfig-r002-20230521   gcc  
csky         buildonly-randconfig-r003-20230522   gcc  
csky                                defconfig   gcc  
csky                 randconfig-r004-20230521   gcc  
csky                 randconfig-r026-20230522   gcc  
csky                 randconfig-r036-20230521   gcc  
hexagon      buildonly-randconfig-r004-20230522   clang
hexagon              randconfig-r014-20230521   clang
hexagon              randconfig-r015-20230521   clang
hexagon              randconfig-r031-20230522   clang
hexagon              randconfig-r041-20230521   clang
hexagon              randconfig-r041-20230522   clang
hexagon              randconfig-r045-20230521   clang
hexagon              randconfig-r045-20230522   clang
i386                             allyesconfig   gcc  
i386                              debian-10.3   gcc  
i386                                defconfig   gcc  
i386                 randconfig-a001-20230522   gcc  
i386                 randconfig-a002-20230522   gcc  
i386                 randconfig-a003-20230522   gcc  
i386                 randconfig-a004-20230522   gcc  
i386                 randconfig-a005-20230522   gcc  
i386                 randconfig-a006-20230522   gcc  
i386                 randconfig-i051-20230523   clang
i386                 randconfig-i052-20230523   clang
i386                 randconfig-i053-20230523   clang
i386                 randconfig-i054-20230523   clang
i386                 randconfig-i055-20230523   clang
i386                 randconfig-i056-20230523   clang
i386                 randconfig-i061-20230523   clang
i386                 randconfig-i062-20230523   clang
i386                 randconfig-i063-20230523   clang
i386                 randconfig-i064-20230523   clang
i386                 randconfig-i065-20230523   clang
i386                 randconfig-i066-20230523   clang
ia64                             allmodconfig   gcc  
ia64                                defconfig   gcc  
ia64                 randconfig-r002-20230521   gcc  
ia64                 randconfig-r021-20230521   gcc  
ia64                 randconfig-r025-20230522   gcc  
loongarch                        allmodconfig   gcc  
loongarch                         allnoconfig   gcc  
loongarch                           defconfig   gcc  
loongarch            randconfig-r001-20230521   gcc  
loongarch            randconfig-r022-20230522   gcc  
m68k                             allmodconfig   gcc  
m68k                                defconfig   gcc  
m68k                 randconfig-r032-20230522   gcc  
mips                             allmodconfig   gcc  
mips                             allyesconfig   gcc  
mips                 randconfig-r016-20230521   clang
nios2                               defconfig   gcc  
openrisc     buildonly-randconfig-r006-20230522   gcc  
parisc                              defconfig   gcc  
parisc               randconfig-r033-20230522   gcc  
parisc               randconfig-r034-20230522   gcc  
parisc64                            defconfig   gcc  
powerpc                          allmodconfig   gcc  
powerpc                           allnoconfig   gcc  
powerpc      buildonly-randconfig-r003-20230521   gcc  
powerpc      buildonly-randconfig-r005-20230522   clang
powerpc              randconfig-r004-20230522   gcc  
powerpc              randconfig-r012-20230522   clang
powerpc              randconfig-r023-20230522   clang
riscv                            allmodconfig   gcc  
riscv                             allnoconfig   gcc  
riscv                               defconfig   gcc  
riscv                randconfig-r013-20230521   gcc  
riscv                randconfig-r013-20230522   clang
riscv                randconfig-r015-20230522   clang
riscv                randconfig-r042-20230521   gcc  
riscv                randconfig-r042-20230522   clang
riscv                          rv32_defconfig   gcc  
s390                             allmodconfig   gcc  
s390                             allyesconfig   gcc  
s390         buildonly-randconfig-r001-20230522   clang
s390         buildonly-randconfig-r002-20230522   clang
s390                                defconfig   gcc  
s390                 randconfig-r011-20230521   gcc  
s390                 randconfig-r044-20230521   gcc  
s390                 randconfig-r044-20230522   clang
sh                               allmodconfig   gcc  
sh                   randconfig-r003-20230522   gcc  
sh                   randconfig-r006-20230521   gcc  
sh                   randconfig-r014-20230522   gcc  
sparc                               defconfig   gcc  
sparc                randconfig-r035-20230522   gcc  
sparc64              randconfig-r032-20230521   gcc  
um                             i386_defconfig   gcc  
um                           x86_64_defconfig   gcc  
x86_64                            allnoconfig   gcc  
x86_64                           allyesconfig   gcc  
x86_64                              defconfig   gcc  
x86_64                                  kexec   gcc  
x86_64               randconfig-a001-20230522   gcc  
x86_64               randconfig-a002-20230522   gcc  
x86_64               randconfig-a003-20230522   gcc  
x86_64               randconfig-a004-20230522   gcc  
x86_64               randconfig-a005-20230522   gcc  
x86_64               randconfig-a006-20230522   gcc  
x86_64               randconfig-a011-20230522   clang
x86_64               randconfig-a012-20230522   clang
x86_64               randconfig-a013-20230522   clang
x86_64               randconfig-a014-20230522   clang
x86_64               randconfig-a015-20230522   clang
x86_64               randconfig-a016-20230522   clang
x86_64               randconfig-x051-20230522   clang
x86_64               randconfig-x052-20230522   clang
x86_64               randconfig-x053-20230522   clang
x86_64               randconfig-x054-20230522   clang
x86_64               randconfig-x055-20230522   clang
x86_64               randconfig-x056-20230522   clang
x86_64                        randconfig-x061   gcc  
x86_64                        randconfig-x062   clang
x86_64                        randconfig-x063   gcc  
x86_64                        randconfig-x064   clang
x86_64                        randconfig-x065   gcc  
x86_64                        randconfig-x066   clang
x86_64               randconfig-x071-20230522   gcc  
x86_64               randconfig-x072-20230522   gcc  
x86_64               randconfig-x073-20230522   gcc  
x86_64               randconfig-x074-20230522   gcc  
x86_64               randconfig-x075-20230522   gcc  
x86_64               randconfig-x076-20230522   gcc  
x86_64               randconfig-x081-20230522   gcc  
x86_64               randconfig-x082-20230522   gcc  
x86_64               randconfig-x083-20230522   gcc  
x86_64               randconfig-x084-20230522   gcc  
x86_64               randconfig-x085-20230522   gcc  
x86_64               randconfig-x086-20230522   gcc  
x86_64               randconfig-x091-20230523   gcc  
x86_64               randconfig-x092-20230523   gcc  
x86_64               randconfig-x093-20230523   gcc  
x86_64               randconfig-x094-20230523   gcc  
x86_64               randconfig-x095-20230523   gcc  
x86_64               randconfig-x096-20230523   gcc  
x86_64                               rhel-8.3   gcc  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
