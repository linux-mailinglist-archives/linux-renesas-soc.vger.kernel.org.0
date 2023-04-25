Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4463D6ED941
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 25 Apr 2023 02:16:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231189AbjDYAQJ (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 24 Apr 2023 20:16:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40424 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229756AbjDYAQI (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 24 Apr 2023 20:16:08 -0400
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AF8F959C5
        for <linux-renesas-soc@vger.kernel.org>; Mon, 24 Apr 2023 17:16:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1682381767; x=1713917767;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=YSjpUyNPFOTuUnDhOx8xc8h4pb3mADRZ9oeHU0S1dM0=;
  b=BF6GoMN545X6xmdbAYrOebWIC738zDA4afMJK3unq/9o3Ns2db6PE2wk
   yJ4CYdQ73BABRnuyJIw9LKr0AuQb68Apunj880iQ2bINhVqwP/3rBLTAI
   YNLNNc9sPeviduNeLHdGrjcdwMcM7t66miBYSUmsTbWJTmhaWC3+wxJIB
   C+tapNYi4Rzag8oeIRcsP88pFg3gAWlmNu5UDZLyS1pntcDR0P7KFzmVL
   dnR/E/3eJcLPla62oxe0UIvZlk5v21CqLE2Nk5WBLRokX55gDg2nPhRiP
   PjwZd6bo77Nbbd3VgdNk/rYqiNdlMLClMBGhV+HxTByBe4fH3mwNKpSUk
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10690"; a="326213633"
X-IronPort-AV: E=Sophos;i="5.99,223,1677571200"; 
   d="scan'208";a="326213633"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Apr 2023 17:16:07 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10690"; a="693274413"
X-IronPort-AV: E=Sophos;i="5.99,223,1677571200"; 
   d="scan'208";a="693274413"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga002.jf.intel.com with ESMTP; 24 Apr 2023 17:16:05 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1pr6Ll-000ika-0J;
        Tue, 25 Apr 2023 00:16:05 +0000
Date:   Tue, 25 Apr 2023 08:15:38 +0800
From:   kernel test robot <lkp@intel.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     linux-renesas-soc@vger.kernel.org
Subject: [geert-renesas-devel:master] BUILD SUCCESS
 e5cb7b418f58d865520f56b1fb541616ee6f8754
Message-ID: <64471baa.STYYoII37kbswTeG%lkp@intel.com>
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

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git master
branch HEAD: e5cb7b418f58d865520f56b1fb541616ee6f8754  Merge tag 'v6.3' into renesas-devel

elapsed time: 844m

configs tested: 181
configs skipped: 15

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                            allyesconfig   gcc  
alpha        buildonly-randconfig-r001-20230423   gcc  
alpha        buildonly-randconfig-r006-20230424   gcc  
alpha                               defconfig   gcc  
alpha                randconfig-r005-20230423   gcc  
alpha                randconfig-r013-20230424   gcc  
alpha                randconfig-r021-20230423   gcc  
alpha                randconfig-r031-20230424   gcc  
alpha                randconfig-r033-20230424   gcc  
alpha                randconfig-r035-20230423   gcc  
arc                              allyesconfig   gcc  
arc                                 defconfig   gcc  
arc                  randconfig-r001-20230423   gcc  
arc                  randconfig-r001-20230424   gcc  
arc                  randconfig-r011-20230423   gcc  
arc                  randconfig-r016-20230424   gcc  
arc                  randconfig-r022-20230424   gcc  
arc                  randconfig-r025-20230423   gcc  
arc                  randconfig-r026-20230424   gcc  
arc                  randconfig-r035-20230424   gcc  
arc                  randconfig-r043-20230423   gcc  
arc                  randconfig-r043-20230424   gcc  
arm                              allmodconfig   gcc  
arm                              allyesconfig   gcc  
arm          buildonly-randconfig-r003-20230424   clang
arm                                 defconfig   gcc  
arm                  randconfig-r005-20230424   gcc  
arm                  randconfig-r006-20230423   clang
arm                  randconfig-r025-20230423   gcc  
arm                  randconfig-r046-20230423   gcc  
arm                  randconfig-r046-20230424   clang
arm64                            allyesconfig   gcc  
arm64                               defconfig   gcc  
arm64                randconfig-r016-20230423   clang
arm64                randconfig-r023-20230424   gcc  
arm64                randconfig-r025-20230424   gcc  
arm64                randconfig-r035-20230423   gcc  
csky         buildonly-randconfig-r001-20230423   gcc  
csky         buildonly-randconfig-r003-20230423   gcc  
csky                                defconfig   gcc  
csky                 randconfig-r022-20230424   gcc  
csky                 randconfig-r023-20230423   gcc  
csky                 randconfig-r033-20230423   gcc  
hexagon      buildonly-randconfig-r002-20230424   clang
hexagon              randconfig-r006-20230424   clang
hexagon              randconfig-r041-20230423   clang
hexagon              randconfig-r041-20230424   clang
hexagon              randconfig-r045-20230423   clang
hexagon              randconfig-r045-20230424   clang
i386                             allyesconfig   gcc  
i386                              debian-10.3   gcc  
i386                                defconfig   gcc  
i386                 randconfig-a001-20230424   clang
i386                 randconfig-a002-20230424   clang
i386                          randconfig-a002   clang
i386                 randconfig-a003-20230424   clang
i386                 randconfig-a004-20230424   clang
i386                          randconfig-a004   clang
i386                 randconfig-a005-20230424   clang
i386                 randconfig-a006-20230424   clang
i386                          randconfig-a006   clang
i386                 randconfig-a011-20230424   gcc  
i386                 randconfig-a012-20230424   gcc  
i386                 randconfig-a013-20230424   gcc  
i386                 randconfig-a014-20230424   gcc  
i386                 randconfig-a015-20230424   gcc  
i386                 randconfig-a016-20230424   gcc  
ia64                             allmodconfig   gcc  
ia64                                defconfig   gcc  
ia64                 randconfig-r014-20230423   gcc  
loongarch                        allmodconfig   gcc  
loongarch                         allnoconfig   gcc  
loongarch    buildonly-randconfig-r005-20230423   gcc  
loongarch    buildonly-randconfig-r005-20230424   gcc  
loongarch                           defconfig   gcc  
loongarch            randconfig-r031-20230424   gcc  
loongarch            randconfig-r034-20230423   gcc  
m68k                             allmodconfig   gcc  
m68k         buildonly-randconfig-r002-20230423   gcc  
m68k                                defconfig   gcc  
m68k                 randconfig-r004-20230424   gcc  
m68k                 randconfig-r011-20230424   gcc  
m68k                 randconfig-r016-20230423   gcc  
m68k                 randconfig-r016-20230424   gcc  
m68k                 randconfig-r021-20230424   gcc  
m68k                 randconfig-r036-20230424   gcc  
microblaze   buildonly-randconfig-r006-20230423   gcc  
microblaze           randconfig-r002-20230423   gcc  
microblaze           randconfig-r002-20230424   gcc  
microblaze           randconfig-r011-20230423   gcc  
microblaze           randconfig-r011-20230424   gcc  
microblaze           randconfig-r015-20230424   gcc  
microblaze           randconfig-r021-20230423   gcc  
microblaze           randconfig-r025-20230424   gcc  
microblaze           randconfig-r032-20230423   gcc  
mips                             allmodconfig   gcc  
mips                             allyesconfig   gcc  
mips                 randconfig-r013-20230423   gcc  
mips                 randconfig-r022-20230423   gcc  
mips                 randconfig-r024-20230424   clang
nios2                               defconfig   gcc  
nios2                randconfig-r023-20230424   gcc  
nios2                randconfig-r031-20230423   gcc  
nios2                randconfig-r034-20230424   gcc  
openrisc     buildonly-randconfig-r005-20230423   gcc  
openrisc     buildonly-randconfig-r006-20230423   gcc  
openrisc             randconfig-r035-20230424   gcc  
parisc       buildonly-randconfig-r004-20230423   gcc  
parisc                              defconfig   gcc  
parisc               randconfig-r004-20230423   gcc  
parisc               randconfig-r012-20230423   gcc  
parisc               randconfig-r012-20230424   gcc  
parisc               randconfig-r013-20230424   gcc  
parisc               randconfig-r032-20230424   gcc  
parisc64                            defconfig   gcc  
powerpc                          allmodconfig   gcc  
powerpc                           allnoconfig   gcc  
powerpc      buildonly-randconfig-r001-20230424   gcc  
powerpc              randconfig-r015-20230424   gcc  
riscv                            allmodconfig   gcc  
riscv                             allnoconfig   gcc  
riscv                               defconfig   gcc  
riscv                randconfig-r005-20230423   gcc  
riscv                randconfig-r015-20230423   clang
riscv                randconfig-r023-20230423   clang
riscv                randconfig-r033-20230424   clang
riscv                randconfig-r036-20230423   gcc  
riscv                randconfig-r042-20230423   clang
riscv                randconfig-r042-20230424   gcc  
riscv                          rv32_defconfig   gcc  
s390                             allmodconfig   gcc  
s390                             allyesconfig   gcc  
s390                                defconfig   gcc  
s390                 randconfig-r036-20230424   clang
s390                 randconfig-r044-20230423   clang
s390                 randconfig-r044-20230424   gcc  
sh                               allmodconfig   gcc  
sh           buildonly-randconfig-r002-20230423   gcc  
sh                   randconfig-r012-20230424   gcc  
sh                   randconfig-r022-20230423   gcc  
sh                   randconfig-r024-20230423   gcc  
sparc                               defconfig   gcc  
sparc                randconfig-r006-20230423   gcc  
sparc                randconfig-r012-20230423   gcc  
sparc                randconfig-r024-20230423   gcc  
sparc64      buildonly-randconfig-r004-20230423   gcc  
sparc64              randconfig-r002-20230424   gcc  
sparc64              randconfig-r003-20230423   gcc  
sparc64              randconfig-r013-20230423   gcc  
sparc64              randconfig-r026-20230423   gcc  
sparc64              randconfig-r026-20230424   gcc  
sparc64              randconfig-r031-20230423   gcc  
um                             i386_defconfig   gcc  
um                           x86_64_defconfig   gcc  
x86_64                            allnoconfig   gcc  
x86_64                           allyesconfig   gcc  
x86_64                              defconfig   gcc  
x86_64                                  kexec   gcc  
x86_64               randconfig-a001-20230424   clang
x86_64                        randconfig-a001   clang
x86_64               randconfig-a002-20230424   clang
x86_64                        randconfig-a002   gcc  
x86_64                        randconfig-a003   clang
x86_64               randconfig-a004-20230424   clang
x86_64                        randconfig-a004   gcc  
x86_64               randconfig-a005-20230424   clang
x86_64                        randconfig-a005   clang
x86_64               randconfig-a006-20230424   clang
x86_64                        randconfig-a006   gcc  
x86_64               randconfig-a011-20230424   gcc  
x86_64               randconfig-a012-20230424   gcc  
x86_64               randconfig-a013-20230424   gcc  
x86_64               randconfig-a014-20230424   gcc  
x86_64               randconfig-a015-20230424   gcc  
x86_64               randconfig-a016-20230424   gcc  
x86_64               randconfig-r024-20230424   gcc  
x86_64                               rhel-8.3   gcc  
xtensa               randconfig-r003-20230424   gcc  
xtensa               randconfig-r021-20230424   gcc  
xtensa               randconfig-r026-20230423   gcc  
xtensa               randconfig-r034-20230423   gcc  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
