Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 812B66E773D
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 19 Apr 2023 12:11:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232041AbjDSKLv (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 19 Apr 2023 06:11:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35658 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231618AbjDSKLu (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 19 Apr 2023 06:11:50 -0400
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E4EF611B
        for <linux-renesas-soc@vger.kernel.org>; Wed, 19 Apr 2023 03:11:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1681899108; x=1713435108;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=x6obLhkSuBNkBxFRTFZ84I3RG49PtyN05Ncsfj3n0oo=;
  b=PATMuH7fuTGC8TRnF5K5Gaj7N3rgSOq5FqefOrfW0cWaiAznDDdip4q+
   ufxcsCTwIr6Wdte/uWrqF2YlZ6cSQaVmH+oXxlGNIedbrGNoEkTcmZmAq
   jFhBYke8iAM/3RN5bgiPm+HVzc52nZkKW/QdxAbVaiLsfjEBPFkd1xmPm
   Z8ntZlqT+xV/aYZ67w2Krcek28+J3rDq0/T1iu5C1ge3w2BsWAn/FBW55
   1XhworKLgFDRS0NOU8F5Qjz9ihIpiPT38HcCjHJO147lY6ZJ6/zqI73XI
   KEmW+prEA1s7pf8PVOKhDrvg6I8d64w4aqi0kEE+6DCOBjMy6/KrAeefn
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10684"; a="345409826"
X-IronPort-AV: E=Sophos;i="5.99,208,1677571200"; 
   d="scan'208";a="345409826"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Apr 2023 03:11:48 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10684"; a="802875545"
X-IronPort-AV: E=Sophos;i="5.99,208,1677571200"; 
   d="scan'208";a="802875545"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by fmsmga002.fm.intel.com with ESMTP; 19 Apr 2023 03:11:47 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1pp4mw-000enP-1J;
        Wed, 19 Apr 2023 10:11:46 +0000
Date:   Wed, 19 Apr 2023 18:11:17 +0800
From:   kernel test robot <lkp@intel.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     linux-renesas-soc@vger.kernel.org
Subject: [geert-renesas-drivers:master] BUILD REGRESSION
 7e16ec08611059a1000cfa489ab5ae396d623e70
Message-ID: <643fbe45.OneHJSJ6F3mas/0d%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git master
branch HEAD: 7e16ec08611059a1000cfa489ab5ae396d623e70  [LOCAL] arm64: renesas: defconfig: Update renesas_defconfig

Error/Warning reports:

https://lore.kernel.org/oe-kbuild-all/202304191404.hmYyn4RN-lkp@intel.com

Error/Warning: (recently discovered and may have been fixed)

drivers/dma/dw-edma/dw-edma-core.c:231:13: error: redefinition of 'dw_edma_device_caps'

Error/Warning ids grouped by kconfigs:

clang_recent_errors
`-- i386-randconfig-a015-20230417
    `-- drivers-dma-dw-edma-dw-edma-core.c:error:redefinition-of-dw_edma_device_caps

elapsed time: 868m

configs tested: 132
configs skipped: 10

tested configs:
alpha                            allyesconfig   gcc  
alpha                               defconfig   gcc  
alpha                randconfig-r004-20230416   gcc  
alpha                randconfig-r016-20230416   gcc  
alpha                randconfig-r032-20230416   gcc  
arc                              allyesconfig   gcc  
arc                                 defconfig   gcc  
arc                  randconfig-r033-20230416   gcc  
arc                  randconfig-r034-20230416   gcc  
arc                  randconfig-r043-20230416   gcc  
arc                  randconfig-r043-20230417   gcc  
arm                              allmodconfig   gcc  
arm                              allyesconfig   gcc  
arm                                 defconfig   gcc  
arm                  randconfig-r013-20230416   clang
arm                  randconfig-r021-20230416   clang
arm                  randconfig-r046-20230416   clang
arm                  randconfig-r046-20230417   gcc  
arm64                            allyesconfig   gcc  
arm64        buildonly-randconfig-r002-20230416   clang
arm64        buildonly-randconfig-r002-20230417   gcc  
arm64        buildonly-randconfig-r004-20230416   clang
arm64                               defconfig   gcc  
csky                                defconfig   gcc  
csky                 randconfig-r004-20230418   gcc  
csky                 randconfig-r033-20230417   gcc  
csky                 randconfig-r035-20230417   gcc  
hexagon      buildonly-randconfig-r004-20230417   clang
hexagon              randconfig-r004-20230417   clang
hexagon              randconfig-r041-20230416   clang
hexagon              randconfig-r041-20230417   clang
hexagon              randconfig-r045-20230416   clang
hexagon              randconfig-r045-20230417   clang
i386                             allyesconfig   gcc  
i386                              debian-10.3   gcc  
i386                                defconfig   gcc  
i386                 randconfig-a001-20230417   gcc  
i386                 randconfig-a002-20230417   gcc  
i386                 randconfig-a003-20230417   gcc  
i386                 randconfig-a004-20230417   gcc  
i386                 randconfig-a005-20230417   gcc  
i386                 randconfig-a006-20230417   gcc  
i386                 randconfig-a011-20230417   clang
i386                 randconfig-a012-20230417   clang
i386                 randconfig-a013-20230417   clang
i386                 randconfig-a014-20230417   clang
i386                 randconfig-a015-20230417   clang
i386                 randconfig-a016-20230417   clang
i386                 randconfig-r011-20230417   clang
ia64                             allmodconfig   gcc  
ia64                                defconfig   gcc  
ia64                 randconfig-r006-20230418   gcc  
loongarch                        allmodconfig   gcc  
loongarch                         allnoconfig   gcc  
loongarch                           defconfig   gcc  
loongarch            randconfig-r034-20230417   gcc  
loongarch            randconfig-r036-20230416   gcc  
m68k                             allmodconfig   gcc  
m68k                                defconfig   gcc  
microblaze   buildonly-randconfig-r003-20230417   gcc  
microblaze   buildonly-randconfig-r005-20230417   gcc  
microblaze           randconfig-r002-20230417   gcc  
microblaze           randconfig-r005-20230417   gcc  
microblaze           randconfig-r014-20230417   gcc  
mips                             allmodconfig   gcc  
mips                             allyesconfig   gcc  
nios2        buildonly-randconfig-r003-20230416   gcc  
nios2                               defconfig   gcc  
openrisc             randconfig-r015-20230416   gcc  
openrisc             randconfig-r035-20230416   gcc  
parisc                              defconfig   gcc  
parisc               randconfig-r001-20230416   gcc  
parisc               randconfig-r026-20230416   gcc  
parisc64                            defconfig   gcc  
powerpc                          allmodconfig   gcc  
powerpc                           allnoconfig   gcc  
powerpc      buildonly-randconfig-r006-20230417   clang
powerpc              randconfig-r001-20230417   gcc  
powerpc              randconfig-r002-20230418   clang
powerpc              randconfig-r016-20230417   clang
powerpc              randconfig-r023-20230416   gcc  
riscv                            allmodconfig   gcc  
riscv                             allnoconfig   gcc  
riscv        buildonly-randconfig-r001-20230416   gcc  
riscv        buildonly-randconfig-r005-20230416   gcc  
riscv                               defconfig   gcc  
riscv                randconfig-r015-20230417   clang
riscv                randconfig-r042-20230416   gcc  
riscv                randconfig-r042-20230417   clang
riscv                          rv32_defconfig   gcc  
s390                             allmodconfig   gcc  
s390                             allyesconfig   gcc  
s390         buildonly-randconfig-r006-20230416   gcc  
s390                                defconfig   gcc  
s390                 randconfig-r001-20230418   clang
s390                 randconfig-r006-20230416   clang
s390                 randconfig-r022-20230416   gcc  
s390                 randconfig-r044-20230416   gcc  
s390                 randconfig-r044-20230417   clang
sh                               allmodconfig   gcc  
sh                   randconfig-r002-20230416   gcc  
sh                   randconfig-r003-20230417   gcc  
sh                   randconfig-r006-20230417   gcc  
sh                   randconfig-r014-20230416   gcc  
sparc                               defconfig   gcc  
sparc                randconfig-r003-20230416   gcc  
sparc                randconfig-r031-20230416   gcc  
sparc64              randconfig-r012-20230417   gcc  
sparc64              randconfig-r024-20230416   gcc  
sparc64              randconfig-r036-20230417   gcc  
um                             i386_defconfig   gcc  
um                           x86_64_defconfig   gcc  
x86_64                            allnoconfig   gcc  
x86_64                           allyesconfig   gcc  
x86_64                              defconfig   gcc  
x86_64                                  kexec   gcc  
x86_64               randconfig-a001-20230417   gcc  
x86_64               randconfig-a002-20230417   gcc  
x86_64               randconfig-a003-20230417   gcc  
x86_64               randconfig-a004-20230417   gcc  
x86_64               randconfig-a005-20230417   gcc  
x86_64               randconfig-a006-20230417   gcc  
x86_64               randconfig-a011-20230417   clang
x86_64               randconfig-a012-20230417   clang
x86_64               randconfig-a013-20230417   clang
x86_64               randconfig-a014-20230417   clang
x86_64               randconfig-a015-20230417   clang
x86_64               randconfig-a016-20230417   clang
x86_64               randconfig-r032-20230417   gcc  
x86_64                               rhel-8.3   gcc  
xtensa               randconfig-r003-20230418   gcc  
xtensa               randconfig-r031-20230417   gcc  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
