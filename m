Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E9A44735E04
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 19 Jun 2023 21:57:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229547AbjFST5k (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 19 Jun 2023 15:57:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52346 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229774AbjFST5j (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 19 Jun 2023 15:57:39 -0400
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DD95F118
        for <linux-renesas-soc@vger.kernel.org>; Mon, 19 Jun 2023 12:57:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1687204658; x=1718740658;
  h=date:from:to:cc:subject:message-id;
  bh=T8ypenmxDEwgkyXAOsTAv5GdNkyX6sqNR2OPK9ORLQg=;
  b=n+slbhPInOnpcVw4hgShY40Q8XPc7AE3zQA4cBSEhrTTi3mkrpEeRG2R
   A61NDTU3jqtk8kwJ+tvnVs8MMDOTUwajdwP8GdzHNt+5Td45o+pNGFgk1
   8BO1DJ5WAk2WYU0QJOWJdQdp3JGC0XjhUZlsVsse0rvRcPBcFSf+rJjUx
   Ard08EvYvjqzjjQ5lpH8BWWuI66JhkonoEftna/IzToajugRhUKstFd5V
   Y2U7cdNrY+L3/5sClDkR5qBxuh5vZsw0zuCJKIuTgVRQJPspE6H4pyqXL
   bG4McNG+5jWVAyT9DKgEA6h2dSWmQvMrAZTX5nEvwEklJaV493yo8qvF5
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10746"; a="423370892"
X-IronPort-AV: E=Sophos;i="6.00,255,1681196400"; 
   d="scan'208";a="423370892"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jun 2023 12:57:37 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10746"; a="960520098"
X-IronPort-AV: E=Sophos;i="6.00,255,1681196400"; 
   d="scan'208";a="960520098"
Received: from lkp-server01.sh.intel.com (HELO 783282924a45) ([10.239.97.150])
  by fmsmga006.fm.intel.com with ESMTP; 19 Jun 2023 12:57:02 -0700
Received: from kbuild by 783282924a45 with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1qBKzl-000556-1a;
        Mon, 19 Jun 2023 19:57:01 +0000
Date:   Tue, 20 Jun 2023 03:56:39 +0800
From:   kernel test robot <lkp@intel.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     linux-renesas-soc@vger.kernel.org
Subject: [geert-renesas-devel:master] BUILD SUCCESS
 3ed0e539eddbec58ebbee17b7b26ed92bf34cf29
Message-ID: <202306200337.hfIOq64G-lkp@intel.com>
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
branch HEAD: 3ed0e539eddbec58ebbee17b7b26ed92bf34cf29  Merge branch 'renesas-dts-for-v6.6' into renesas-devel

elapsed time: 720m

configs tested: 123
configs skipped: 8

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                            allyesconfig   gcc  
alpha                               defconfig   gcc  
arc                              allyesconfig   gcc  
arc                                 defconfig   gcc  
arc                        nsim_700_defconfig   gcc  
arc                  randconfig-r004-20230619   gcc  
arc                  randconfig-r005-20230619   gcc  
arc                  randconfig-r016-20230619   gcc  
arc                  randconfig-r043-20230619   gcc  
arm                              allmodconfig   gcc  
arm                              allyesconfig   gcc  
arm                                 defconfig   gcc  
arm                          pxa910_defconfig   gcc  
arm                  randconfig-r046-20230619   gcc  
arm                         vf610m4_defconfig   gcc  
arm64                            allyesconfig   gcc  
arm64                               defconfig   gcc  
arm64                randconfig-r031-20230619   gcc  
csky                                defconfig   gcc  
csky                 randconfig-r002-20230619   gcc  
csky                 randconfig-r004-20230619   gcc  
csky                 randconfig-r006-20230619   gcc  
csky                 randconfig-r026-20230619   gcc  
hexagon              randconfig-r041-20230619   clang
hexagon              randconfig-r045-20230619   clang
i386                             allyesconfig   gcc  
i386         buildonly-randconfig-r004-20230619   gcc  
i386         buildonly-randconfig-r005-20230619   gcc  
i386         buildonly-randconfig-r006-20230619   gcc  
i386                              debian-10.3   gcc  
i386                                defconfig   gcc  
i386                 randconfig-i001-20230619   gcc  
i386                 randconfig-i002-20230619   gcc  
i386                 randconfig-i003-20230619   gcc  
i386                 randconfig-i004-20230619   gcc  
i386                 randconfig-i005-20230619   gcc  
i386                 randconfig-i006-20230619   gcc  
i386                 randconfig-i011-20230619   clang
i386                 randconfig-i012-20230619   clang
i386                 randconfig-i013-20230619   clang
i386                 randconfig-i014-20230619   clang
i386                 randconfig-i015-20230619   clang
i386                 randconfig-i016-20230619   clang
i386                 randconfig-r012-20230619   clang
i386                 randconfig-r033-20230619   gcc  
loongarch                        allmodconfig   gcc  
loongarch                         allnoconfig   gcc  
loongarch                           defconfig   gcc  
m68k                             allmodconfig   gcc  
m68k                             allyesconfig   gcc  
m68k                                defconfig   gcc  
m68k                 randconfig-r001-20230619   gcc  
m68k                 randconfig-r002-20230619   gcc  
m68k                 randconfig-r023-20230619   gcc  
m68k                 randconfig-r034-20230619   gcc  
m68k                 randconfig-r036-20230619   gcc  
microblaze           randconfig-r001-20230619   gcc  
mips                             allmodconfig   gcc  
mips                             allyesconfig   gcc  
mips                 randconfig-r015-20230619   gcc  
mips                 randconfig-r032-20230619   clang
nios2                               defconfig   gcc  
nios2                randconfig-r032-20230619   gcc  
openrisc             randconfig-r036-20230619   gcc  
parisc                           allyesconfig   gcc  
parisc                              defconfig   gcc  
parisc               randconfig-r003-20230619   gcc  
parisc64                            defconfig   gcc  
powerpc                          allmodconfig   gcc  
powerpc                           allnoconfig   gcc  
powerpc                       holly_defconfig   gcc  
powerpc              randconfig-r005-20230619   gcc  
powerpc              randconfig-r013-20230619   clang
powerpc              randconfig-r021-20230619   clang
powerpc                     skiroot_defconfig   clang
riscv                            allmodconfig   gcc  
riscv                             allnoconfig   gcc  
riscv                            allyesconfig   gcc  
riscv                               defconfig   gcc  
riscv                    nommu_k210_defconfig   gcc  
riscv                randconfig-r042-20230619   clang
riscv                          rv32_defconfig   gcc  
s390                             allmodconfig   gcc  
s390                             allyesconfig   gcc  
s390                                defconfig   gcc  
s390                 randconfig-r035-20230619   gcc  
s390                 randconfig-r044-20230619   clang
sh                               allmodconfig   gcc  
sparc                            allyesconfig   gcc  
sparc                               defconfig   gcc  
sparc                randconfig-r024-20230619   gcc  
sparc64              randconfig-r006-20230619   gcc  
sparc64              randconfig-r025-20230619   gcc  
um                                  defconfig   gcc  
um                             i386_defconfig   gcc  
um                   randconfig-r014-20230619   gcc  
um                   randconfig-r022-20230619   gcc  
um                           x86_64_defconfig   gcc  
x86_64                           allyesconfig   gcc  
x86_64       buildonly-randconfig-r001-20230619   gcc  
x86_64       buildonly-randconfig-r002-20230619   gcc  
x86_64       buildonly-randconfig-r003-20230619   gcc  
x86_64                              defconfig   gcc  
x86_64                                  kexec   gcc  
x86_64               randconfig-a001-20230619   gcc  
x86_64               randconfig-a002-20230619   gcc  
x86_64               randconfig-a003-20230619   gcc  
x86_64               randconfig-a004-20230619   gcc  
x86_64               randconfig-a005-20230619   gcc  
x86_64               randconfig-a006-20230619   gcc  
x86_64               randconfig-a011-20230619   clang
x86_64               randconfig-a012-20230619   clang
x86_64               randconfig-a013-20230619   clang
x86_64               randconfig-a014-20230619   clang
x86_64               randconfig-a015-20230619   clang
x86_64               randconfig-a016-20230619   clang
x86_64               randconfig-r003-20230619   gcc  
x86_64               randconfig-r013-20230619   clang
x86_64               randconfig-r014-20230619   clang
x86_64                          rhel-8.3-rust   clang
x86_64                               rhel-8.3   gcc  
xtensa               randconfig-r012-20230619   gcc  
xtensa               randconfig-r025-20230619   gcc  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
