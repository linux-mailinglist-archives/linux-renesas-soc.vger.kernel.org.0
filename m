Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BE60D6FDABC
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 10 May 2023 11:28:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236711AbjEJJ22 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 10 May 2023 05:28:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43070 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235962AbjEJJ21 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 10 May 2023 05:28:27 -0400
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 04FB43A89
        for <linux-renesas-soc@vger.kernel.org>; Wed, 10 May 2023 02:28:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1683710906; x=1715246906;
  h=date:from:to:cc:subject:message-id;
  bh=l44yYkUxM6y46tWGR3lE0A3XQIbqOKgG1o9+Do+xoEs=;
  b=ZWZy4hIsub9qQAyK8GSzszTtNj1IdbtyW9rrapASgIpU3b/kKeCEL3jc
   xCUEz6Y5BVZYMZ07DgyWD1+aBnFU3kXkv2kCmJvD7SRX2cgu+YL+0J5N3
   a5Ly/Gec0AZu5bB3YJsGPe6VSvzcIAkYUXRL+NE63zEYYMw63YDh8xMLW
   GuYpCe0O2KvKg6Crj09C5Tl+xxRzBzMKYPOmUcU1P5qhSoGuB/ZcHBB8W
   BPcfDt+1AAh8/wcZL/PmgH4DO23wkWy1Ocr2APdSDdGDzPaJr7QUtAfyT
   xY4biVWUVJXe1+LT9xw0+flfsy4pNN6X+g0ONiQFcmJ2p4bZu9zBxt6s3
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10705"; a="353239963"
X-IronPort-AV: E=Sophos;i="5.99,264,1677571200"; 
   d="scan'208";a="353239963"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 May 2023 02:28:25 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10705"; a="811067501"
X-IronPort-AV: E=Sophos;i="5.99,264,1677571200"; 
   d="scan'208";a="811067501"
Received: from lkp-server01.sh.intel.com (HELO dea6d5a4f140) ([10.239.97.150])
  by fmsmga002.fm.intel.com with ESMTP; 10 May 2023 02:28:24 -0700
Received: from kbuild by dea6d5a4f140 with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1pwg7T-00036Y-2n;
        Wed, 10 May 2023 09:28:23 +0000
Date:   Wed, 10 May 2023 17:27:49 +0800
From:   kernel test robot <lkp@intel.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     linux-renesas-soc@vger.kernel.org
Subject: [geert-renesas-devel:master] BUILD SUCCESS
 dce70215cdd5598b16b34f41c88d168ad124cd45
Message-ID: <20230510092749.KqFIt%lkp@intel.com>
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

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git master
branch HEAD: dce70215cdd5598b16b34f41c88d168ad124cd45  Merge branch 'topic/renesas-defconfig' into renesas-devel

elapsed time: 1354m

configs tested: 152
configs skipped: 13

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                            allyesconfig   gcc  
alpha        buildonly-randconfig-r005-20230509   gcc  
alpha                               defconfig   gcc  
alpha                randconfig-r005-20230509   gcc  
arc                              allyesconfig   gcc  
arc                                 defconfig   gcc  
arc                  randconfig-r001-20230509   gcc  
arc                  randconfig-r006-20230509   gcc  
arc                  randconfig-r011-20230509   gcc  
arc                  randconfig-r014-20230509   gcc  
arc                  randconfig-r031-20230509   gcc  
arc                  randconfig-r032-20230509   gcc  
arc                  randconfig-r034-20230509   gcc  
arc                  randconfig-r043-20230509   gcc  
arm                              allmodconfig   gcc  
arm                              allyesconfig   gcc  
arm                                 defconfig   gcc  
arm                            mps2_defconfig   gcc  
arm                  randconfig-r004-20230509   clang
arm                  randconfig-r024-20230509   gcc  
arm                  randconfig-r046-20230509   gcc  
arm64                            allyesconfig   gcc  
arm64        buildonly-randconfig-r006-20230509   gcc  
arm64                               defconfig   gcc  
arm64                randconfig-r015-20230509   clang
csky                                defconfig   gcc  
csky                 randconfig-r006-20230509   gcc  
csky                 randconfig-r032-20230509   gcc  
csky                 randconfig-r036-20230509   gcc  
hexagon              randconfig-r024-20230509   clang
hexagon              randconfig-r041-20230509   clang
hexagon              randconfig-r045-20230509   clang
i386                             allyesconfig   gcc  
i386                              debian-10.3   gcc  
i386                                defconfig   gcc  
i386                          randconfig-a001   gcc  
i386                          randconfig-a002   clang
i386                          randconfig-a003   gcc  
i386                          randconfig-a004   clang
i386                          randconfig-a005   gcc  
i386                          randconfig-a006   clang
i386                          randconfig-a011   clang
i386                          randconfig-a012   gcc  
i386                          randconfig-a013   clang
i386                          randconfig-a014   gcc  
i386                          randconfig-a015   clang
i386                          randconfig-a016   gcc  
ia64                             allmodconfig   gcc  
ia64         buildonly-randconfig-r005-20230509   gcc  
ia64                                defconfig   gcc  
ia64                 randconfig-r013-20230509   gcc  
ia64                 randconfig-r023-20230509   gcc  
ia64                 randconfig-r025-20230509   gcc  
ia64                 randconfig-r035-20230509   gcc  
ia64                            zx1_defconfig   gcc  
loongarch                        allmodconfig   gcc  
loongarch                         allnoconfig   gcc  
loongarch    buildonly-randconfig-r005-20230509   gcc  
loongarch                           defconfig   gcc  
loongarch            randconfig-r003-20230509   gcc  
loongarch            randconfig-r013-20230509   gcc  
loongarch            randconfig-r021-20230509   gcc  
m68k                             allmodconfig   gcc  
m68k                          amiga_defconfig   gcc  
m68k                                defconfig   gcc  
m68k                       m5249evb_defconfig   gcc  
m68k                 randconfig-r004-20230509   gcc  
m68k                 randconfig-r014-20230509   gcc  
m68k                        stmark2_defconfig   gcc  
microblaze   buildonly-randconfig-r002-20230509   gcc  
microblaze           randconfig-r001-20230509   gcc  
microblaze           randconfig-r002-20230509   gcc  
microblaze           randconfig-r003-20230509   gcc  
microblaze           randconfig-r033-20230509   gcc  
microblaze           randconfig-r036-20230509   gcc  
mips                             allmodconfig   gcc  
mips                             allyesconfig   gcc  
mips         buildonly-randconfig-r001-20230509   clang
mips                 randconfig-r005-20230509   clang
mips                 randconfig-r031-20230509   clang
mips                 randconfig-r035-20230509   clang
nios2        buildonly-randconfig-r001-20230509   gcc  
nios2                               defconfig   gcc  
nios2                randconfig-r003-20230509   gcc  
nios2                randconfig-r006-20230509   gcc  
nios2                randconfig-r026-20230509   gcc  
openrisc             randconfig-r004-20230509   gcc  
openrisc             randconfig-r006-20230509   gcc  
openrisc             randconfig-r022-20230509   gcc  
parisc       buildonly-randconfig-r002-20230509   gcc  
parisc       buildonly-randconfig-r003-20230509   gcc  
parisc                              defconfig   gcc  
parisc               randconfig-r015-20230509   gcc  
parisc               randconfig-r024-20230509   gcc  
parisc64                            defconfig   gcc  
powerpc                          allmodconfig   gcc  
powerpc                           allnoconfig   gcc  
powerpc                     tqm8555_defconfig   gcc  
riscv                            allmodconfig   gcc  
riscv                             allnoconfig   gcc  
riscv        buildonly-randconfig-r002-20230509   clang
riscv        buildonly-randconfig-r004-20230509   clang
riscv                               defconfig   gcc  
riscv                randconfig-r021-20230509   clang
riscv                randconfig-r042-20230509   clang
riscv                          rv32_defconfig   gcc  
s390                             allmodconfig   gcc  
s390                             allyesconfig   gcc  
s390                                defconfig   gcc  
s390                 randconfig-r002-20230509   gcc  
s390                 randconfig-r011-20230509   clang
s390                 randconfig-r013-20230509   clang
s390                 randconfig-r034-20230509   gcc  
s390                 randconfig-r044-20230509   clang
sh                               allmodconfig   gcc  
sh                   randconfig-r002-20230509   gcc  
sh                   randconfig-r003-20230509   gcc  
sh                   randconfig-r014-20230509   gcc  
sh                   secureedge5410_defconfig   gcc  
sh                        sh7763rdp_defconfig   gcc  
sparc        buildonly-randconfig-r004-20230509   gcc  
sparc        buildonly-randconfig-r006-20230509   gcc  
sparc                               defconfig   gcc  
sparc                randconfig-r012-20230509   gcc  
sparc                randconfig-r015-20230509   gcc  
sparc                randconfig-r016-20230509   gcc  
sparc64      buildonly-randconfig-r003-20230509   gcc  
sparc64              randconfig-r005-20230509   gcc  
sparc64              randconfig-r016-20230509   gcc  
um                             i386_defconfig   gcc  
um                           x86_64_defconfig   gcc  
x86_64                            allnoconfig   gcc  
x86_64                           allyesconfig   gcc  
x86_64                              defconfig   gcc  
x86_64                                  kexec   gcc  
x86_64                        randconfig-a001   clang
x86_64                        randconfig-a002   gcc  
x86_64                        randconfig-a003   clang
x86_64                        randconfig-a004   gcc  
x86_64                        randconfig-a005   clang
x86_64                        randconfig-a006   gcc  
x86_64                        randconfig-a011   gcc  
x86_64                        randconfig-a012   clang
x86_64                        randconfig-a013   gcc  
x86_64                        randconfig-a014   clang
x86_64                        randconfig-a015   gcc  
x86_64                        randconfig-a016   clang
x86_64                               rhel-8.3   gcc  
xtensa       buildonly-randconfig-r001-20230509   gcc  
xtensa               randconfig-r001-20230509   gcc  
xtensa               randconfig-r002-20230509   gcc  
xtensa               randconfig-r004-20230509   gcc  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
