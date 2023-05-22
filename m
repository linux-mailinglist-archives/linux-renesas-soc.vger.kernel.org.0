Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D089170CE2E
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 23 May 2023 00:45:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230232AbjEVWp3 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 22 May 2023 18:45:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48888 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229734AbjEVWp2 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 22 May 2023 18:45:28 -0400
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B34F1E6
        for <linux-renesas-soc@vger.kernel.org>; Mon, 22 May 2023 15:45:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1684795527; x=1716331527;
  h=date:from:to:cc:subject:message-id;
  bh=S8fmUF0kHkBNSS5ZvqPPyWQFunl4RXzwPeFxoQtdjN0=;
  b=gZF7kz6dnaRXnzbcLyNN8+O6h6t0UGYtMQIPz3JY3Y8J9+xVxelDFNZ3
   Hbv49ouetWQMby+byp2P8D9lKKFaPGmpAZoeVNKY1Ae+7f4/BW9+LoBa9
   cjdaaaKWUqfOOF5idRO39LaU9h6MYcdCm+q1pnBI2eCXNL6aWCGVPa1Am
   Uu4/+9q23J7OLcmFPFlrYTSLuTX4oimSKS+W2hary1+c798YCYMa3Xbwi
   HF7SKO6MrqKsTaVdFLNT3FaWTxpBDFnxqNPWnaV33FRGqHNTmhHhHkIGp
   V5Q2PVJDyfiH7tJ7+VLgugz0UsG2A9cfuPpvWxxMvnCnpbmlsO32qWPwm
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10718"; a="333426618"
X-IronPort-AV: E=Sophos;i="6.00,184,1681196400"; 
   d="scan'208";a="333426618"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 May 2023 15:45:27 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10718"; a="734472425"
X-IronPort-AV: E=Sophos;i="6.00,184,1681196400"; 
   d="scan'208";a="734472425"
Received: from lkp-server01.sh.intel.com (HELO dea6d5a4f140) ([10.239.97.150])
  by orsmga008.jf.intel.com with ESMTP; 22 May 2023 15:45:26 -0700
Received: from kbuild by dea6d5a4f140 with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1q1EHN-000DHJ-1U;
        Mon, 22 May 2023 22:45:25 +0000
Date:   Tue, 23 May 2023 06:45:23 +0800
From:   kernel test robot <lkp@intel.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     linux-renesas-soc@vger.kernel.org
Subject: [geert-renesas-devel:master] BUILD SUCCESS
 44b93b667d845927e0168aa763b3a14e93b21a66
Message-ID: <20230522224523.LdXqk%lkp@intel.com>
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

tree/branch: INFO setup_repo_specs: /db/releases/20230522162832/lkp-src/repo/*/geert-renesas-devel
https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git master
branch HEAD: 44b93b667d845927e0168aa763b3a14e93b21a66  Merge tag 'v6.4-rc3' into renesas-devel

elapsed time: 725m

configs tested: 158
configs skipped: 7

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                            allyesconfig   gcc  
alpha        buildonly-randconfig-r002-20230522   gcc  
alpha                               defconfig   gcc  
alpha                randconfig-r004-20230522   gcc  
alpha                randconfig-r034-20230521   gcc  
arc                              allyesconfig   gcc  
arc          buildonly-randconfig-r004-20230521   gcc  
arc                                 defconfig   gcc  
arc                  randconfig-r013-20230521   gcc  
arc                  randconfig-r016-20230522   gcc  
arc                  randconfig-r025-20230522   gcc  
arc                  randconfig-r043-20230521   gcc  
arc                  randconfig-r043-20230522   gcc  
arm                              allmodconfig   gcc  
arm                              allyesconfig   gcc  
arm          buildonly-randconfig-r005-20230521   clang
arm                                 defconfig   gcc  
arm                  randconfig-r046-20230521   clang
arm                  randconfig-r046-20230522   gcc  
arm64                            allyesconfig   gcc  
arm64                               defconfig   gcc  
arm64                randconfig-r004-20230521   clang
arm64                randconfig-r012-20230522   clang
csky                                defconfig   gcc  
csky                 randconfig-r002-20230521   gcc  
csky                 randconfig-r011-20230522   gcc  
csky                 randconfig-r015-20230521   gcc  
csky                 randconfig-r021-20230521   gcc  
csky                 randconfig-r023-20230522   gcc  
hexagon      buildonly-randconfig-r001-20230521   clang
hexagon      buildonly-randconfig-r002-20230521   clang
hexagon              randconfig-r005-20230521   clang
hexagon              randconfig-r021-20230522   clang
hexagon              randconfig-r023-20230521   clang
hexagon              randconfig-r031-20230521   clang
hexagon              randconfig-r032-20230521   clang
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
i386                 randconfig-a011-20230522   clang
i386                 randconfig-a012-20230522   clang
i386                 randconfig-a013-20230522   clang
i386                 randconfig-a014-20230522   clang
i386                 randconfig-a015-20230522   clang
i386                 randconfig-a016-20230522   clang
i386                 randconfig-r034-20230522   gcc  
ia64                             allmodconfig   gcc  
ia64                                defconfig   gcc  
ia64                 randconfig-r003-20230522   gcc  
ia64                 randconfig-r015-20230522   gcc  
ia64                 randconfig-r022-20230521   gcc  
loongarch                        allmodconfig   gcc  
loongarch                         allnoconfig   gcc  
loongarch    buildonly-randconfig-r003-20230521   gcc  
loongarch                           defconfig   gcc  
loongarch            randconfig-r033-20230522   gcc  
m68k                             allmodconfig   gcc  
m68k         buildonly-randconfig-r003-20230522   gcc  
m68k                                defconfig   gcc  
m68k                 randconfig-r013-20230522   gcc  
m68k                 randconfig-r024-20230522   gcc  
microblaze           randconfig-r006-20230522   gcc  
microblaze           randconfig-r025-20230521   gcc  
mips                             allmodconfig   gcc  
mips                             allyesconfig   gcc  
mips         buildonly-randconfig-r006-20230521   gcc  
nios2                               defconfig   gcc  
nios2                randconfig-r003-20230521   gcc  
nios2                randconfig-r006-20230521   gcc  
nios2                randconfig-r033-20230521   gcc  
nios2                randconfig-r036-20230521   gcc  
openrisc     buildonly-randconfig-r001-20230522   gcc  
openrisc             randconfig-r031-20230522   gcc  
parisc                              defconfig   gcc  
parisc               randconfig-r014-20230522   gcc  
parisc               randconfig-r035-20230522   gcc  
parisc64                            defconfig   gcc  
powerpc                          allmodconfig   gcc  
powerpc                           allnoconfig   gcc  
riscv                            allmodconfig   gcc  
riscv                             allnoconfig   gcc  
riscv                               defconfig   gcc  
riscv                randconfig-r001-20230521   clang
riscv                randconfig-r002-20230522   gcc  
riscv                randconfig-r042-20230521   gcc  
riscv                randconfig-r042-20230522   clang
riscv                          rv32_defconfig   gcc  
s390                             allmodconfig   gcc  
s390                             allyesconfig   gcc  
s390         buildonly-randconfig-r004-20230522   clang
s390                                defconfig   gcc  
s390                 randconfig-r032-20230522   gcc  
s390                 randconfig-r044-20230521   gcc  
s390                 randconfig-r044-20230522   clang
sh                               allmodconfig   gcc  
sparc        buildonly-randconfig-r005-20230522   gcc  
sparc                               defconfig   gcc  
sparc                randconfig-r014-20230521   gcc  
sparc64              randconfig-r005-20230522   gcc  
sparc64              randconfig-r011-20230521   gcc  
sparc64              randconfig-r016-20230521   gcc  
sparc64              randconfig-r026-20230522   gcc  
sparc64              randconfig-r035-20230521   gcc  
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
x86_64               randconfig-r022-20230522   clang
x86_64               randconfig-r036-20230522   gcc  
x86_64               randconfig-x051-20230522   clang
x86_64               randconfig-x052-20230522   clang
x86_64               randconfig-x053-20230522   clang
x86_64               randconfig-x054-20230522   clang
x86_64               randconfig-x055-20230522   clang
x86_64               randconfig-x056-20230522   clang
x86_64               randconfig-x061-20230522   clang
x86_64               randconfig-x062-20230522   clang
x86_64               randconfig-x063-20230522   clang
x86_64               randconfig-x064-20230522   clang
x86_64               randconfig-x065-20230522   clang
x86_64               randconfig-x066-20230522   clang
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
x86_64                               rhel-8.3   gcc  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
