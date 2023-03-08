Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 54DA66AFCB2
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  8 Mar 2023 03:08:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229486AbjCHCIi (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 7 Mar 2023 21:08:38 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58360 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229477AbjCHCIh (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 7 Mar 2023 21:08:37 -0500
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 839979CBC4
        for <linux-renesas-soc@vger.kernel.org>; Tue,  7 Mar 2023 18:08:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1678241316; x=1709777316;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=oBAsYnWdgSX7/N3H9EkuV90TlIt6Lim32oK9UxIV8JU=;
  b=Qj5Z4ob1+l45eRgOS8tftksctSct1sNeTxPiZGuqHwG7tpo0E8TyNpHy
   cc4mA+rgmg2cy98NeuH0ImkpORyD46a+zgc0cxqv8Sv6GGT/vSdmJf6cm
   dyn8tVj36l0PWg1qbUamg0fqZykoR2FyN22VpThVSQH66vfrt556GC/aG
   /82pPtwLEQjbp947vwlHWemXzwqMpzFncrlpkpLXZLRXap3HnWX2yEpwe
   dUxiPfzKxAtH2dhrcZn0pTm++J6FiXJgfXdSPqA+NhjvrZNPq1rl7EL1g
   YcSTNtrqXVveZet0TGTf18VgxG9AiGvSr1ZRZyewGgs3WilAMcqBLGGnA
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10642"; a="398610554"
X-IronPort-AV: E=Sophos;i="5.98,242,1673942400"; 
   d="scan'208";a="398610554"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Mar 2023 18:08:33 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10642"; a="654177183"
X-IronPort-AV: E=Sophos;i="5.98,242,1673942400"; 
   d="scan'208";a="654177183"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga006.jf.intel.com with ESMTP; 07 Mar 2023 18:08:32 -0800
Received: from kbuild by b613635ddfff with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1pZjEF-0001mx-2D;
        Wed, 08 Mar 2023 02:08:31 +0000
Date:   Wed, 08 Mar 2023 10:08:16 +0800
From:   kernel test robot <lkp@intel.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     linux-renesas-soc@vger.kernel.org
Subject: [geert-renesas-drivers:renesas-clk] BUILD SUCCESS
 1f04b7939704fce82d2bb5ef5561e2499a91170a
Message-ID: <6407ee10.56MNgv96kY9l9ZVr%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git renesas-clk
branch HEAD: 1f04b7939704fce82d2bb5ef5561e2499a91170a  clk: renesas: r8a77995: Fix VIN parent clock

elapsed time: 727m

configs tested: 178
configs skipped: 15

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                            allyesconfig   gcc  
alpha                               defconfig   gcc  
alpha                randconfig-r001-20230305   gcc  
alpha                randconfig-r012-20230305   gcc  
arc                              allyesconfig   gcc  
arc          buildonly-randconfig-r003-20230306   gcc  
arc                                 defconfig   gcc  
arc                  randconfig-r015-20230306   gcc  
arc                  randconfig-r032-20230306   gcc  
arc                  randconfig-r033-20230306   gcc  
arc                  randconfig-r043-20230305   gcc  
arc                  randconfig-r043-20230306   gcc  
arm                              allmodconfig   gcc  
arm                              allyesconfig   gcc  
arm                                 defconfig   gcc  
arm                  randconfig-r003-20230306   clang
arm                  randconfig-r016-20230306   gcc  
arm                  randconfig-r025-20230305   clang
arm                  randconfig-r031-20230306   clang
arm                  randconfig-r033-20230305   gcc  
arm                  randconfig-r046-20230305   clang
arm                  randconfig-r046-20230306   gcc  
arm64                            allyesconfig   gcc  
arm64        buildonly-randconfig-r005-20230306   gcc  
arm64                               defconfig   gcc  
arm64                randconfig-r013-20230305   gcc  
arm64                randconfig-r013-20230306   clang
arm64                randconfig-r016-20230306   clang
arm64                randconfig-r021-20230305   gcc  
arm64                randconfig-r022-20230306   clang
arm64                randconfig-r026-20230306   clang
csky                                defconfig   gcc  
csky                 randconfig-r002-20230305   gcc  
csky                 randconfig-r011-20230305   gcc  
csky                 randconfig-r025-20230306   gcc  
hexagon              randconfig-r012-20230306   clang
hexagon              randconfig-r022-20230305   clang
hexagon              randconfig-r023-20230305   clang
hexagon              randconfig-r024-20230306   clang
hexagon              randconfig-r034-20230305   clang
hexagon              randconfig-r041-20230305   clang
hexagon              randconfig-r041-20230306   clang
hexagon              randconfig-r045-20230305   clang
hexagon              randconfig-r045-20230306   clang
i386                             allyesconfig   gcc  
i386         buildonly-randconfig-r006-20230306   gcc  
i386                              debian-10.3   gcc  
i386                                defconfig   gcc  
i386                 randconfig-a001-20230306   gcc  
i386                 randconfig-a002-20230306   gcc  
i386                 randconfig-a003-20230306   gcc  
i386                 randconfig-a004-20230306   gcc  
i386                 randconfig-a005-20230306   gcc  
i386                 randconfig-a006-20230306   gcc  
i386                 randconfig-a011-20230306   clang
i386                 randconfig-a012-20230306   clang
i386                 randconfig-a013-20230306   clang
i386                 randconfig-a014-20230306   clang
i386                 randconfig-a015-20230306   clang
i386                 randconfig-a016-20230306   clang
i386                 randconfig-r001-20230306   gcc  
i386                 randconfig-r002-20230306   gcc  
i386                 randconfig-r025-20230306   clang
ia64                             allmodconfig   gcc  
ia64                                defconfig   gcc  
ia64                 randconfig-r011-20230306   gcc  
ia64                 randconfig-r021-20230306   gcc  
ia64                 randconfig-r022-20230306   gcc  
ia64                 randconfig-r023-20230306   gcc  
ia64                 randconfig-r035-20230305   gcc  
loongarch                        allmodconfig   gcc  
loongarch                         allnoconfig   gcc  
loongarch                           defconfig   gcc  
loongarch            randconfig-r003-20230305   gcc  
loongarch            randconfig-r004-20230306   gcc  
loongarch            randconfig-r006-20230305   gcc  
loongarch            randconfig-r015-20230306   gcc  
m68k                             allmodconfig   gcc  
m68k                                defconfig   gcc  
m68k                 randconfig-r032-20230305   gcc  
microblaze   buildonly-randconfig-r005-20230305   gcc  
microblaze           randconfig-r014-20230306   gcc  
microblaze           randconfig-r015-20230305   gcc  
microblaze           randconfig-r016-20230305   gcc  
microblaze           randconfig-r034-20230306   gcc  
mips                             allmodconfig   gcc  
mips                             allyesconfig   gcc  
mips         buildonly-randconfig-r001-20230306   clang
mips         buildonly-randconfig-r006-20230306   clang
mips                 randconfig-r011-20230306   gcc  
mips                 randconfig-r022-20230305   clang
nios2                               defconfig   gcc  
nios2                randconfig-r036-20230306   gcc  
openrisc     buildonly-randconfig-r002-20230306   gcc  
openrisc             randconfig-r005-20230306   gcc  
openrisc             randconfig-r013-20230305   gcc  
openrisc             randconfig-r013-20230306   gcc  
openrisc             randconfig-r024-20230305   gcc  
parisc       buildonly-randconfig-r005-20230306   gcc  
parisc                              defconfig   gcc  
parisc               randconfig-r014-20230305   gcc  
parisc               randconfig-r014-20230306   gcc  
parisc               randconfig-r034-20230305   gcc  
parisc               randconfig-r035-20230305   gcc  
parisc               randconfig-r036-20230305   gcc  
parisc64                            defconfig   gcc  
powerpc                          allmodconfig   gcc  
powerpc                           allnoconfig   gcc  
powerpc      buildonly-randconfig-r006-20230305   gcc  
powerpc              randconfig-r021-20230306   clang
powerpc              randconfig-r031-20230305   clang
powerpc              randconfig-r033-20230306   gcc  
riscv                            allmodconfig   gcc  
riscv                             allnoconfig   gcc  
riscv        buildonly-randconfig-r004-20230306   clang
riscv                               defconfig   gcc  
riscv                randconfig-r001-20230306   gcc  
riscv                randconfig-r014-20230305   gcc  
riscv                randconfig-r021-20230305   gcc  
riscv                randconfig-r024-20230305   gcc  
riscv                randconfig-r032-20230306   gcc  
riscv                randconfig-r035-20230306   gcc  
riscv                randconfig-r042-20230305   gcc  
riscv                randconfig-r042-20230306   clang
riscv                          rv32_defconfig   gcc  
s390                             allmodconfig   gcc  
s390                             allyesconfig   gcc  
s390         buildonly-randconfig-r003-20230306   clang
s390         buildonly-randconfig-r004-20230306   clang
s390                                defconfig   gcc  
s390                 randconfig-r001-20230305   clang
s390                 randconfig-r023-20230305   gcc  
s390                 randconfig-r026-20230305   gcc  
s390                 randconfig-r033-20230305   clang
s390                 randconfig-r034-20230306   gcc  
s390                 randconfig-r035-20230306   gcc  
s390                 randconfig-r044-20230305   gcc  
s390                 randconfig-r044-20230306   clang
sh                               allmodconfig   gcc  
sh                   randconfig-r005-20230305   gcc  
sh                   randconfig-r031-20230305   gcc  
sparc        buildonly-randconfig-r001-20230305   gcc  
sparc        buildonly-randconfig-r002-20230305   gcc  
sparc                               defconfig   gcc  
sparc                randconfig-r004-20230305   gcc  
sparc                randconfig-r011-20230305   gcc  
sparc                randconfig-r023-20230306   gcc  
sparc                randconfig-r031-20230306   gcc  
sparc                randconfig-r036-20230305   gcc  
sparc64              randconfig-r003-20230305   gcc  
sparc64              randconfig-r004-20230305   gcc  
sparc64              randconfig-r006-20230306   gcc  
sparc64              randconfig-r012-20230305   gcc  
sparc64              randconfig-r016-20230305   gcc  
sparc64              randconfig-r024-20230306   gcc  
sparc64              randconfig-r036-20230306   gcc  
um                             i386_defconfig   gcc  
um                           x86_64_defconfig   gcc  
x86_64                            allnoconfig   gcc  
x86_64                           allyesconfig   gcc  
x86_64       buildonly-randconfig-r001-20230306   gcc  
x86_64                              defconfig   gcc  
x86_64                                  kexec   gcc  
x86_64               randconfig-a001-20230306   gcc  
x86_64               randconfig-a002-20230306   gcc  
x86_64               randconfig-a003-20230306   gcc  
x86_64               randconfig-a004-20230306   gcc  
x86_64               randconfig-a005-20230306   gcc  
x86_64               randconfig-a006-20230306   gcc  
x86_64               randconfig-a011-20230306   clang
x86_64               randconfig-a012-20230306   clang
x86_64               randconfig-a013-20230306   clang
x86_64               randconfig-a014-20230306   clang
x86_64               randconfig-a015-20230306   clang
x86_64               randconfig-a016-20230306   clang
x86_64               randconfig-r006-20230306   gcc  
x86_64               randconfig-r026-20230306   clang
x86_64                               rhel-8.3   gcc  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
