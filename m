Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 78ACC766161
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 28 Jul 2023 03:39:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232091AbjG1BjD (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 27 Jul 2023 21:39:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49010 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229817AbjG1BjC (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 27 Jul 2023 21:39:02 -0400
Received: from mgamail.intel.com (unknown [192.55.52.136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CF6C83588
        for <linux-renesas-soc@vger.kernel.org>; Thu, 27 Jul 2023 18:39:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1690508340; x=1722044340;
  h=date:from:to:cc:subject:message-id;
  bh=eT1JX2Uwrs15qjTS4zVL0oCmrn+arPv+sSumYts7gQs=;
  b=AZaU/QoWSZSZGLGCrR45UlOFabguo3re3fiBiGsJaU9upZBUYsWqiI00
   A5iMm94X22i1v/2R4XXc12TdhY+lZ664E3bA7IRhf8/xZnNcyLsEQQJbf
   01BOZkvTbAa2nrU88xYtWkHNlIhs5bkaFMt0UuLs7Q4ECKuTQUVUeO0Ii
   PBHjXb6sjii3fldC4QAbUacxixic5s5kTBzKnx/fN5abzLODKKVna8+Hj
   G7tXMQDkII1k/SCTpbT8yV2+1XdZ7gTyQ93Po9eu1+w0ZNKfCcJjGQMBa
   KWka7IYJhjI/X2Sm9uYewGU0rrdanY3yH0YtyxyyjV5VmZP0d0ZNzDLCA
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10784"; a="348084798"
X-IronPort-AV: E=Sophos;i="6.01,236,1684825200"; 
   d="scan'208";a="348084798"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jul 2023 18:39:00 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10784"; a="817299735"
X-IronPort-AV: E=Sophos;i="6.01,236,1684825200"; 
   d="scan'208";a="817299735"
Received: from lkp-server02.sh.intel.com (HELO 953e8cd98f7d) ([10.239.97.151])
  by FMSMGA003.fm.intel.com with ESMTP; 27 Jul 2023 18:38:59 -0700
Received: from kbuild by 953e8cd98f7d with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1qPCRS-0002lc-1O;
        Fri, 28 Jul 2023 01:38:55 +0000
Date:   Fri, 28 Jul 2023 09:37:52 +0800
From:   kernel test robot <lkp@intel.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     linux-renesas-soc@vger.kernel.org
Subject: [geert-renesas-devel:next] BUILD SUCCESS
 13512fa6af4abcdd8645daabd4ad22576694c7a5
Message-ID: <202307280951.41p4cUKn-lkp@intel.com>
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
branch HEAD: 13512fa6af4abcdd8645daabd4ad22576694c7a5  Merge branch 'renesas-dts-for-v6.6' into renesas-next

elapsed time: 728m

configs tested: 125
configs skipped: 115

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                            allyesconfig   gcc  
alpha                               defconfig   gcc  
alpha                randconfig-r014-20230727   gcc  
arc                              allyesconfig   gcc  
arc                                 defconfig   gcc  
arc                  randconfig-r002-20230727   gcc  
arc                  randconfig-r013-20230727   gcc  
arc                  randconfig-r015-20230727   gcc  
arc                  randconfig-r022-20230727   gcc  
arc                  randconfig-r043-20230727   gcc  
arm                              allmodconfig   gcc  
arm                              allyesconfig   gcc  
arm                                 defconfig   gcc  
arm                           imxrt_defconfig   gcc  
arm                  randconfig-r022-20230727   clang
arm                  randconfig-r034-20230727   gcc  
arm                  randconfig-r046-20230727   clang
arm                        shmobile_defconfig   gcc  
arm64                            allyesconfig   gcc  
arm64                               defconfig   gcc  
arm64                randconfig-r006-20230727   clang
arm64                randconfig-r024-20230727   gcc  
arm64                randconfig-r032-20230727   clang
csky                                defconfig   gcc  
csky                 randconfig-r011-20230727   gcc  
csky                 randconfig-r036-20230727   gcc  
hexagon              randconfig-r035-20230727   clang
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
i386                 randconfig-r012-20230727   gcc  
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
microblaze           randconfig-r025-20230727   gcc  
mips                             allmodconfig   gcc  
mips                             allyesconfig   gcc  
mips                           gcw0_defconfig   gcc  
mips                  maltasmvp_eva_defconfig   gcc  
mips                 randconfig-r023-20230727   clang
nios2                               defconfig   gcc  
parisc                           allyesconfig   gcc  
parisc                              defconfig   gcc  
parisc               randconfig-r016-20230727   gcc  
parisc               randconfig-r035-20230727   gcc  
parisc64                            defconfig   gcc  
powerpc                          allmodconfig   gcc  
powerpc                           allnoconfig   gcc  
powerpc                      ppc6xx_defconfig   gcc  
powerpc                     rainier_defconfig   gcc  
powerpc              randconfig-r002-20230727   clang
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
sh                   randconfig-r012-20230727   gcc  
sh                           se7712_defconfig   gcc  
sh                        sh7763rdp_defconfig   gcc  
sh                   sh7770_generic_defconfig   gcc  
sparc                            allyesconfig   gcc  
sparc                               defconfig   gcc  
sparc                randconfig-r014-20230727   gcc  
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
x86_64                               rhel-8.3   gcc  
xtensa               randconfig-r004-20230727   gcc  
xtensa               randconfig-r011-20230727   gcc  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
