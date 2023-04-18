Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D72776E55B8
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 18 Apr 2023 02:22:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230094AbjDRAWQ (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 17 Apr 2023 20:22:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48196 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230105AbjDRAWN (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 17 Apr 2023 20:22:13 -0400
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 771A32114
        for <linux-renesas-soc@vger.kernel.org>; Mon, 17 Apr 2023 17:22:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1681777330; x=1713313330;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=nIxB6ouY5PLjoWq4J9OnbcGOT5nK28jpQ4QDxoNYHmk=;
  b=ijU7JqvWAPoAs2zH9i9bh0FmO8HeLzrRcGRCGGtfaSUAxcin1RmlWtnd
   dL8c5iSYEu+DfkrHiwI2A4cOnMqeZ6cr9qYro/PtDOVb78/v3gMrgSJcd
   1QVEsKgi+hfXW3BS2gvvZNYCZlbXL0mBrJyMknehdMVXEgTNU9lsmCf/i
   FkkiLUW7e8sPvRm7wee55M2KWLnMzUAM+53IjUph6eh4W8hkVP3C8yM8b
   6mqK+foBZwJbQY09g9RzIPiVlMs42KswKbIwoRbAqZ6HCFiiI6G9Id6n8
   mBa3Z9nGVLaoKDQESLSQ0xVTTDrotkMmZ3Da3nfIs/zTryL8wtF7FvmJU
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10683"; a="345035673"
X-IronPort-AV: E=Sophos;i="5.99,205,1677571200"; 
   d="scan'208";a="345035673"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Apr 2023 17:22:10 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10683"; a="723435224"
X-IronPort-AV: E=Sophos;i="5.99,205,1677571200"; 
   d="scan'208";a="723435224"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga001.jf.intel.com with ESMTP; 17 Apr 2023 17:22:08 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1poZ6l-000cla-2h;
        Tue, 18 Apr 2023 00:22:07 +0000
Date:   Tue, 18 Apr 2023 08:21:46 +0800
From:   kernel test robot <lkp@intel.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     linux-renesas-soc@vger.kernel.org
Subject: [geert-renesas-devel:master] BUILD SUCCESS
 53ed7cc3a28d0a629a2167e35a25cccbdc64ed42
Message-ID: <643de29a.I9M0rfGezdB68EFL%lkp@intel.com>
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

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git master
branch HEAD: 53ed7cc3a28d0a629a2167e35a25cccbdc64ed42  Merge tag 'v6.3-rc7' into renesas-devel

elapsed time: 875m

configs tested: 128
configs skipped: 8

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                            allyesconfig   gcc  
alpha                               defconfig   gcc  
alpha                randconfig-r021-20230409   gcc  
alpha                randconfig-r021-20230417   gcc  
alpha                randconfig-r025-20230410   gcc  
arc                              allyesconfig   gcc  
arc                                 defconfig   gcc  
arc                  randconfig-r011-20230416   gcc  
arc                  randconfig-r024-20230409   gcc  
arc                  randconfig-r025-20230417   gcc  
arc                  randconfig-r043-20230416   gcc  
arc                  randconfig-r043-20230417   gcc  
arm                              allmodconfig   gcc  
arm                              allyesconfig   gcc  
arm          buildonly-randconfig-r005-20230416   clang
arm                                 defconfig   gcc  
arm                  randconfig-r012-20230416   clang
arm                  randconfig-r026-20230409   clang
arm                  randconfig-r026-20230415   gcc  
arm                  randconfig-r046-20230416   clang
arm                  randconfig-r046-20230417   gcc  
arm64                            allyesconfig   gcc  
arm64                               defconfig   gcc  
arm64                randconfig-r016-20230416   gcc  
arm64                randconfig-r024-20230415   clang
arm64                randconfig-r036-20230416   clang
csky                                defconfig   gcc  
csky                 randconfig-r024-20230410   gcc  
hexagon              randconfig-r015-20230416   clang
hexagon              randconfig-r023-20230415   clang
hexagon              randconfig-r035-20230416   clang
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
i386                 randconfig-r026-20230417   clang
ia64                             allmodconfig   gcc  
ia64         buildonly-randconfig-r001-20230417   gcc  
ia64                                defconfig   gcc  
ia64                 randconfig-r013-20230417   gcc  
ia64                 randconfig-r023-20230409   gcc  
ia64                 randconfig-r023-20230410   gcc  
ia64                 randconfig-r034-20230416   gcc  
loongarch                        allmodconfig   gcc  
loongarch                         allnoconfig   gcc  
loongarch                           defconfig   gcc  
m68k                             allmodconfig   gcc  
m68k         buildonly-randconfig-r006-20230416   gcc  
m68k                                defconfig   gcc  
m68k                 randconfig-r021-20230410   gcc  
m68k                 randconfig-r022-20230409   gcc  
mips                             allmodconfig   gcc  
mips                             allyesconfig   gcc  
mips                 randconfig-r025-20230409   clang
mips                 randconfig-r026-20230410   clang
nios2        buildonly-randconfig-r001-20230416   gcc  
nios2                               defconfig   gcc  
openrisc             randconfig-r015-20230417   gcc  
parisc       buildonly-randconfig-r003-20230416   gcc  
parisc                              defconfig   gcc  
parisc64                            defconfig   gcc  
powerpc                          allmodconfig   gcc  
powerpc                           allnoconfig   gcc  
powerpc      buildonly-randconfig-r003-20230417   clang
powerpc      buildonly-randconfig-r004-20230417   clang
powerpc              randconfig-r022-20230410   gcc  
powerpc              randconfig-r023-20230417   clang
riscv                            allmodconfig   gcc  
riscv                             allnoconfig   gcc  
riscv                               defconfig   gcc  
riscv                randconfig-r014-20230416   gcc  
riscv                randconfig-r024-20230417   clang
riscv                randconfig-r032-20230416   clang
riscv                randconfig-r042-20230416   gcc  
riscv                randconfig-r042-20230417   clang
riscv                          rv32_defconfig   gcc  
s390                             allmodconfig   gcc  
s390                             allyesconfig   gcc  
s390         buildonly-randconfig-r004-20230416   gcc  
s390                                defconfig   gcc  
s390                 randconfig-r022-20230415   clang
s390                 randconfig-r044-20230416   gcc  
s390                 randconfig-r044-20230417   clang
sh                               allmodconfig   gcc  
sh           buildonly-randconfig-r002-20230416   gcc  
sh           buildonly-randconfig-r005-20230417   gcc  
sh                   randconfig-r012-20230417   gcc  
sh                   randconfig-r013-20230416   gcc  
sh                   randconfig-r014-20230417   gcc  
sparc                               defconfig   gcc  
sparc                randconfig-r011-20230417   gcc  
sparc                randconfig-r016-20230417   gcc  
sparc                randconfig-r021-20230415   gcc  
sparc64      buildonly-randconfig-r002-20230417   gcc  
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
x86_64                               rhel-8.3   gcc  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
