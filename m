Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BF5496FBAD7
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  9 May 2023 00:08:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229637AbjEHWIr (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 8 May 2023 18:08:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48104 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230027AbjEHWIq (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 8 May 2023 18:08:46 -0400
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 55A2D61BD
        for <linux-renesas-soc@vger.kernel.org>; Mon,  8 May 2023 15:08:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1683583725; x=1715119725;
  h=date:from:to:cc:subject:message-id;
  bh=7QdbBxOZXPdMEa/wXxTkQfK6lFczKK1kAgeg8VQ2YJo=;
  b=HPq2hgcwGfVuFFBhqyJ+QD43X1kMu0TnGrmsTDKbvmITQ/BW2b0s+j9I
   saBPn8MKgcwJIGu1oCUVvbNyxqw8Qh7eeg6+vwUz6yi3I3C++c5EwyMjw
   3ieDCrL3x5USCsXKfTvgxYOBxGKclhUDpEeZhEBRnNzO8faWlY9B8K5JZ
   8cZKBXJMaarWIM0vgETLj8w0tLvjiMeCJT0t81vlxuWJ/xW2BGBExNk6C
   AE0+0ZV2hkSxYncwZWsdN66VHhap/l31snqyameQ2E1C9srCWVjdtZ2yn
   6gE8l+l/nLkId5b/Ulcs+2t5uEKOpkT4p3KI5aYVxXtRGOe099vPzyRyR
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10704"; a="330126421"
X-IronPort-AV: E=Sophos;i="5.99,259,1677571200"; 
   d="scan'208";a="330126421"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 May 2023 15:08:45 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10704"; a="692740183"
X-IronPort-AV: E=Sophos;i="5.99,259,1677571200"; 
   d="scan'208";a="692740183"
Received: from lkp-server01.sh.intel.com (HELO dea6d5a4f140) ([10.239.97.150])
  by orsmga007.jf.intel.com with ESMTP; 08 May 2023 15:08:43 -0700
Received: from kbuild by dea6d5a4f140 with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1pw92B-0001RD-0q;
        Mon, 08 May 2023 22:08:43 +0000
Date:   Tue, 09 May 2023 06:08:29 +0800
From:   kernel test robot <lkp@intel.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     linux-renesas-soc@vger.kernel.org
Subject: [geert-renesas-devel:master] BUILD SUCCESS
 2241fbd8b9fada5664849f293014b7c514b435c0
Message-ID: <20230508220829.i4gOC%lkp@intel.com>
User-Agent: s-nail v14.9.24
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git master
branch HEAD: 2241fbd8b9fada5664849f293014b7c514b435c0  Merge branch 'renesas-next' into renesas-devel

elapsed time: 817m

configs tested: 127
configs skipped: 9

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                            allyesconfig   gcc  
alpha                               defconfig   gcc  
alpha                randconfig-r035-20230507   gcc  
arc                              allyesconfig   gcc  
arc                                 defconfig   gcc  
arc                  randconfig-r023-20230507   gcc  
arc                  randconfig-r043-20230507   gcc  
arc                  randconfig-r043-20230508   gcc  
arm                              allmodconfig   gcc  
arm                              allyesconfig   gcc  
arm                                 defconfig   gcc  
arm                  randconfig-r004-20230508   gcc  
arm                  randconfig-r024-20230508   clang
arm                  randconfig-r046-20230507   gcc  
arm                  randconfig-r046-20230508   clang
arm64                            allyesconfig   gcc  
arm64                               defconfig   gcc  
arm64                randconfig-r033-20230507   gcc  
csky                                defconfig   gcc  
csky                 randconfig-r014-20230508   gcc  
hexagon              randconfig-r011-20230508   clang
hexagon              randconfig-r041-20230507   clang
hexagon              randconfig-r041-20230508   clang
hexagon              randconfig-r045-20230507   clang
hexagon              randconfig-r045-20230508   clang
i386                             allyesconfig   gcc  
i386                              debian-10.3   gcc  
i386                                defconfig   gcc  
i386                 randconfig-a001-20230508   clang
i386                 randconfig-a002-20230508   clang
i386                 randconfig-a003-20230508   clang
i386                 randconfig-a004-20230508   clang
i386                 randconfig-a005-20230508   clang
i386                 randconfig-a006-20230508   clang
i386                 randconfig-a011-20230508   gcc  
i386                 randconfig-a012-20230508   gcc  
i386                 randconfig-a013-20230508   gcc  
i386                 randconfig-a014-20230508   gcc  
i386                 randconfig-a015-20230508   gcc  
i386                 randconfig-a016-20230508   gcc  
i386                 randconfig-r002-20230508   clang
i386                 randconfig-r015-20230508   gcc  
ia64                             allmodconfig   gcc  
ia64                                defconfig   gcc  
ia64                 randconfig-r003-20230508   gcc  
ia64                 randconfig-r021-20230507   gcc  
ia64                 randconfig-r022-20230507   gcc  
loongarch                        allmodconfig   gcc  
loongarch                         allnoconfig   gcc  
loongarch    buildonly-randconfig-r006-20230507   gcc  
loongarch                           defconfig   gcc  
loongarch            randconfig-r014-20230507   gcc  
loongarch            randconfig-r031-20230508   gcc  
m68k                             allmodconfig   gcc  
m68k         buildonly-randconfig-r003-20230507   gcc  
m68k                                defconfig   gcc  
microblaze           randconfig-r011-20230507   gcc  
microblaze           randconfig-r013-20230507   gcc  
microblaze           randconfig-r015-20230507   gcc  
mips                             allmodconfig   gcc  
mips                             allyesconfig   gcc  
mips                 randconfig-r001-20230507   clang
mips                 randconfig-r002-20230507   clang
mips                 randconfig-r003-20230507   clang
mips                 randconfig-r006-20230508   gcc  
mips                 randconfig-r016-20230507   gcc  
nios2                               defconfig   gcc  
nios2                randconfig-r004-20230507   gcc  
nios2                randconfig-r006-20230507   gcc  
nios2                randconfig-r032-20230507   gcc  
openrisc             randconfig-r005-20230507   gcc  
openrisc             randconfig-r034-20230508   gcc  
parisc                              defconfig   gcc  
parisc64                            defconfig   gcc  
powerpc                          allmodconfig   gcc  
powerpc                           allnoconfig   gcc  
powerpc              randconfig-r005-20230508   clang
powerpc              randconfig-r033-20230508   clang
powerpc              randconfig-r036-20230507   gcc  
riscv                            allmodconfig   gcc  
riscv                             allnoconfig   gcc  
riscv        buildonly-randconfig-r001-20230507   clang
riscv                               defconfig   gcc  
riscv                randconfig-r013-20230508   gcc  
riscv                randconfig-r026-20230508   gcc  
riscv                randconfig-r042-20230507   clang
riscv                randconfig-r042-20230508   gcc  
riscv                          rv32_defconfig   gcc  
s390                             allmodconfig   gcc  
s390                             allyesconfig   gcc  
s390         buildonly-randconfig-r004-20230507   clang
s390                                defconfig   gcc  
s390                 randconfig-r022-20230508   gcc  
s390                 randconfig-r036-20230508   clang
s390                 randconfig-r044-20230507   clang
s390                 randconfig-r044-20230508   gcc  
sh                               allmodconfig   gcc  
sh                   randconfig-r025-20230507   gcc  
sh                   randconfig-r034-20230507   gcc  
sh                   randconfig-r035-20230508   gcc  
sparc                               defconfig   gcc  
sparc                randconfig-r024-20230507   gcc  
sparc64      buildonly-randconfig-r005-20230507   gcc  
sparc64              randconfig-r012-20230508   gcc  
sparc64              randconfig-r021-20230508   gcc  
um                             i386_defconfig   gcc  
um                           x86_64_defconfig   gcc  
x86_64                            allnoconfig   gcc  
x86_64                           allyesconfig   gcc  
x86_64                              defconfig   gcc  
x86_64                                  kexec   gcc  
x86_64               randconfig-a001-20230508   clang
x86_64               randconfig-a002-20230508   clang
x86_64               randconfig-a003-20230508   clang
x86_64               randconfig-a004-20230508   clang
x86_64               randconfig-a005-20230508   clang
x86_64               randconfig-a006-20230508   clang
x86_64               randconfig-a011-20230508   gcc  
x86_64               randconfig-a012-20230508   gcc  
x86_64               randconfig-a013-20230508   gcc  
x86_64               randconfig-a014-20230508   gcc  
x86_64               randconfig-a015-20230508   gcc  
x86_64               randconfig-a016-20230508   gcc  
x86_64               randconfig-r023-20230508   gcc  
x86_64                               rhel-8.3   gcc  
xtensa               randconfig-r016-20230508   gcc  
xtensa               randconfig-r032-20230508   gcc  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
