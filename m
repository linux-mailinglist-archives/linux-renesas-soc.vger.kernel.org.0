Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B52296EB456
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 22 Apr 2023 00:02:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231955AbjDUWCa (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 21 Apr 2023 18:02:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47482 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231297AbjDUWCa (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 21 Apr 2023 18:02:30 -0400
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AC6BE10F2
        for <linux-renesas-soc@vger.kernel.org>; Fri, 21 Apr 2023 15:02:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1682114548; x=1713650548;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=yBM83SmSkaUNXe8FsCqIV7Vjwuqi/JEfD7h/k3F+iSw=;
  b=AJliXNb5vNfZchDJztEEQfV8YNj2iRuCc+vMotvE7Bq5DoGbJ9g0JAJg
   DLtZVzieNxHp6WJ/ThTDZ+mKl4cWvbup672868wcfOwsGbj0BgctQkRER
   qLMXcNY7IXA0DHfIGw47rjOyGL1gsLJqY/pe0GqOmGIbSzFpaxgbyYAp6
   jMJWjEN7hS1BV62+yJM92CuBMYjYD9KFJa512Q+YqEYv4s2qLwqwZYjZh
   G8pk0Lt+JlPVACKC0prQRjMhmBtvOUVrkd3/3mFVifkTA8YbF78wEdbTc
   uAs1hGaxmGu4PoPNyvHZBvmgTpjI0Tu6NAlSRttboR/0dF965dsCb02/P
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10687"; a="411363805"
X-IronPort-AV: E=Sophos;i="5.99,216,1677571200"; 
   d="scan'208";a="411363805"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Apr 2023 15:02:26 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10687"; a="866828093"
X-IronPort-AV: E=Sophos;i="5.99,216,1677571200"; 
   d="scan'208";a="866828093"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga005.jf.intel.com with ESMTP; 21 Apr 2023 15:02:25 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1ppypk-000gqv-1W;
        Fri, 21 Apr 2023 22:02:24 +0000
Date:   Sat, 22 Apr 2023 06:01:45 +0800
From:   kernel test robot <lkp@intel.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     linux-renesas-soc@vger.kernel.org
Subject: [geert-renesas-devel:renesas-dts-for-v6.5] BUILD SUCCESS
 a08a4a7c7adaf33cb32701495a6a23d95b46e8f3
Message-ID: <644307c9.mRTCp5jv8MKqv01q%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,
        URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git renesas-dts-for-v6.5
branch HEAD: a08a4a7c7adaf33cb32701495a6a23d95b46e8f3  arm64: dts: renesas: r9a07g054: Add MTU3a node

elapsed time: 724m

configs tested: 229
configs skipped: 15

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                            allyesconfig   gcc  
alpha        buildonly-randconfig-r001-20230421   gcc  
alpha                               defconfig   gcc  
alpha                randconfig-r004-20230421   gcc  
alpha                randconfig-r023-20230421   gcc  
alpha                randconfig-r035-20230416   gcc  
arc                              allyesconfig   gcc  
arc                                 defconfig   gcc  
arc                  randconfig-r003-20230421   gcc  
arc                  randconfig-r006-20230421   gcc  
arc                  randconfig-r011-20230420   gcc  
arc                  randconfig-r012-20230418   gcc  
arc                  randconfig-r031-20230421   gcc  
arc                  randconfig-r033-20230420   gcc  
arc                  randconfig-r033-20230421   gcc  
arc                  randconfig-r043-20230416   gcc  
arc                  randconfig-r043-20230417   gcc  
arc                  randconfig-r043-20230420   gcc  
arm                              allmodconfig   gcc  
arm                              allyesconfig   gcc  
arm                                 defconfig   gcc  
arm                  randconfig-r005-20230421   clang
arm                  randconfig-r013-20230417   gcc  
arm                  randconfig-r031-20230416   gcc  
arm                  randconfig-r046-20230416   clang
arm                  randconfig-r046-20230417   gcc  
arm                  randconfig-r046-20230420   clang
arm64                            allyesconfig   gcc  
arm64        buildonly-randconfig-r004-20230421   gcc  
arm64                               defconfig   gcc  
arm64                randconfig-r013-20230418   gcc  
arm64                randconfig-r031-20230421   gcc  
csky                                defconfig   gcc  
csky                 randconfig-r011-20230418   gcc  
csky                 randconfig-r012-20230416   gcc  
csky                 randconfig-r012-20230421   gcc  
csky                 randconfig-r015-20230421   gcc  
csky                 randconfig-r023-20230421   gcc  
csky                 randconfig-r025-20230421   gcc  
csky                 randconfig-r032-20230416   gcc  
csky                 randconfig-r033-20230416   gcc  
csky                 randconfig-r034-20230417   gcc  
csky                 randconfig-r036-20230421   gcc  
hexagon      buildonly-randconfig-r001-20230421   clang
hexagon              randconfig-r022-20230421   clang
hexagon              randconfig-r041-20230416   clang
hexagon              randconfig-r041-20230417   clang
hexagon              randconfig-r041-20230420   clang
hexagon              randconfig-r041-20230421   clang
hexagon              randconfig-r045-20230416   clang
hexagon              randconfig-r045-20230417   clang
hexagon              randconfig-r045-20230420   clang
hexagon              randconfig-r045-20230421   clang
i386                             allyesconfig   gcc  
i386                              debian-10.3   gcc  
i386                                defconfig   gcc  
i386                 randconfig-a001-20230417   gcc  
i386                          randconfig-a001   gcc  
i386                 randconfig-a002-20230417   gcc  
i386                          randconfig-a002   clang
i386                 randconfig-a003-20230417   gcc  
i386                          randconfig-a003   gcc  
i386                 randconfig-a004-20230417   gcc  
i386                          randconfig-a004   clang
i386                 randconfig-a005-20230417   gcc  
i386                          randconfig-a005   gcc  
i386                 randconfig-a006-20230417   gcc  
i386                          randconfig-a006   clang
i386                 randconfig-a011-20230417   clang
i386                 randconfig-a012-20230417   clang
i386                          randconfig-a012   gcc  
i386                 randconfig-a013-20230417   clang
i386                 randconfig-a014-20230417   clang
i386                          randconfig-a014   gcc  
i386                 randconfig-a015-20230417   clang
i386                 randconfig-a016-20230417   clang
i386                          randconfig-a016   gcc  
ia64                             allmodconfig   gcc  
ia64         buildonly-randconfig-r005-20230421   gcc  
ia64                                defconfig   gcc  
ia64                 randconfig-r001-20230421   gcc  
ia64                 randconfig-r022-20230421   gcc  
ia64                 randconfig-r034-20230420   gcc  
ia64                 randconfig-r034-20230421   gcc  
loongarch                        allmodconfig   gcc  
loongarch                         allnoconfig   gcc  
loongarch                           defconfig   gcc  
loongarch            randconfig-r011-20230421   gcc  
loongarch            randconfig-r015-20230420   gcc  
loongarch            randconfig-r016-20230416   gcc  
loongarch            randconfig-r031-20230417   gcc  
loongarch            randconfig-r035-20230421   gcc  
loongarch            randconfig-r036-20230421   gcc  
m68k                             allmodconfig   gcc  
m68k                                defconfig   gcc  
m68k                       m5249evb_defconfig   gcc  
m68k                 randconfig-r004-20230421   gcc  
m68k                 randconfig-r014-20230421   gcc  
m68k                 randconfig-r016-20230421   gcc  
microblaze           randconfig-r011-20230417   gcc  
microblaze           randconfig-r012-20230421   gcc  
microblaze           randconfig-r013-20230421   gcc  
microblaze           randconfig-r014-20230418   gcc  
microblaze           randconfig-r015-20230421   gcc  
microblaze           randconfig-r024-20230421   gcc  
microblaze           randconfig-r034-20230421   gcc  
microblaze           randconfig-r036-20230416   gcc  
mips                             allmodconfig   gcc  
mips                             allyesconfig   gcc  
mips                  maltasmvp_eva_defconfig   gcc  
mips                 randconfig-r014-20230421   gcc  
mips                 randconfig-r022-20230421   gcc  
nios2        buildonly-randconfig-r002-20230421   gcc  
nios2        buildonly-randconfig-r005-20230421   gcc  
nios2                               defconfig   gcc  
nios2                randconfig-r006-20230421   gcc  
nios2                randconfig-r014-20230417   gcc  
nios2                randconfig-r026-20230421   gcc  
nios2                randconfig-r032-20230417   gcc  
nios2                randconfig-r032-20230420   gcc  
nios2                randconfig-r035-20230421   gcc  
openrisc     buildonly-randconfig-r002-20230421   gcc  
openrisc     buildonly-randconfig-r003-20230421   gcc  
openrisc     buildonly-randconfig-r006-20230421   gcc  
openrisc             randconfig-r012-20230417   gcc  
openrisc             randconfig-r013-20230420   gcc  
openrisc             randconfig-r015-20230417   gcc  
openrisc             randconfig-r016-20230420   gcc  
openrisc             randconfig-r031-20230421   gcc  
openrisc             randconfig-r032-20230421   gcc  
parisc       buildonly-randconfig-r002-20230421   gcc  
parisc       buildonly-randconfig-r004-20230421   gcc  
parisc                              defconfig   gcc  
parisc               randconfig-r011-20230416   gcc  
parisc               randconfig-r014-20230421   gcc  
parisc               randconfig-r024-20230421   gcc  
parisc               randconfig-r034-20230416   gcc  
parisc               randconfig-r035-20230420   gcc  
parisc               randconfig-r036-20230421   gcc  
parisc64                            defconfig   gcc  
powerpc                          allmodconfig   gcc  
powerpc                           allnoconfig   gcc  
powerpc      buildonly-randconfig-r006-20230421   clang
powerpc                 mpc834x_mds_defconfig   gcc  
powerpc                       ppc64_defconfig   gcc  
powerpc              randconfig-r002-20230421   gcc  
powerpc              randconfig-r022-20230421   clang
powerpc              randconfig-r025-20230421   clang
powerpc              randconfig-r032-20230421   gcc  
powerpc              randconfig-r033-20230421   gcc  
powerpc              randconfig-r034-20230421   gcc  
powerpc              randconfig-r036-20230417   gcc  
riscv                            allmodconfig   gcc  
riscv                             allnoconfig   gcc  
riscv        buildonly-randconfig-r004-20230421   clang
riscv        buildonly-randconfig-r005-20230421   clang
riscv                               defconfig   gcc  
riscv                randconfig-r002-20230421   gcc  
riscv                randconfig-r012-20230420   gcc  
riscv                randconfig-r035-20230421   gcc  
riscv                randconfig-r042-20230416   gcc  
riscv                randconfig-r042-20230417   clang
riscv                randconfig-r042-20230420   gcc  
riscv                randconfig-r042-20230421   clang
riscv                          rv32_defconfig   gcc  
s390                             allmodconfig   gcc  
s390                             allyesconfig   gcc  
s390         buildonly-randconfig-r002-20230421   clang
s390         buildonly-randconfig-r004-20230421   clang
s390         buildonly-randconfig-r005-20230421   clang
s390                                defconfig   gcc  
s390                 randconfig-r015-20230416   gcc  
s390                 randconfig-r023-20230421   clang
s390                 randconfig-r044-20230416   gcc  
s390                 randconfig-r044-20230417   clang
s390                 randconfig-r044-20230420   gcc  
s390                 randconfig-r044-20230421   clang
sh                               allmodconfig   gcc  
sh                            hp6xx_defconfig   gcc  
sh                   randconfig-r011-20230421   gcc  
sh                   randconfig-r012-20230421   gcc  
sh                   randconfig-r014-20230416   gcc  
sh                          rsk7264_defconfig   gcc  
sparc        buildonly-randconfig-r004-20230421   gcc  
sparc        buildonly-randconfig-r005-20230421   gcc  
sparc                               defconfig   gcc  
sparc                randconfig-r005-20230421   gcc  
sparc                randconfig-r021-20230421   gcc  
sparc                randconfig-r033-20230417   gcc  
sparc                randconfig-r034-20230421   gcc  
sparc64      buildonly-randconfig-r001-20230421   gcc  
sparc64              randconfig-r016-20230418   gcc  
sparc64              randconfig-r025-20230421   gcc  
sparc64              randconfig-r031-20230420   gcc  
sparc64              randconfig-r035-20230421   gcc  
um                             i386_defconfig   gcc  
um                           x86_64_defconfig   gcc  
x86_64                            allnoconfig   gcc  
x86_64                           allyesconfig   gcc  
x86_64                              defconfig   gcc  
x86_64                                  kexec   gcc  
x86_64               randconfig-a001-20230417   gcc  
x86_64                        randconfig-a001   clang
x86_64               randconfig-a002-20230417   gcc  
x86_64               randconfig-a003-20230417   gcc  
x86_64                        randconfig-a003   clang
x86_64               randconfig-a004-20230417   gcc  
x86_64               randconfig-a005-20230417   gcc  
x86_64                        randconfig-a005   clang
x86_64               randconfig-a006-20230417   gcc  
x86_64               randconfig-a011-20230417   clang
x86_64                        randconfig-a011   gcc  
x86_64               randconfig-a012-20230417   clang
x86_64                        randconfig-a012   clang
x86_64               randconfig-a013-20230417   clang
x86_64                        randconfig-a013   gcc  
x86_64               randconfig-a014-20230417   clang
x86_64                        randconfig-a014   clang
x86_64               randconfig-a015-20230417   clang
x86_64                        randconfig-a015   gcc  
x86_64               randconfig-a016-20230417   clang
x86_64                        randconfig-a016   clang
x86_64                        randconfig-k001   clang
x86_64                               rhel-8.3   gcc  
xtensa               randconfig-r005-20230421   gcc  
xtensa               randconfig-r013-20230421   gcc  
xtensa               randconfig-r015-20230418   gcc  
xtensa               randconfig-r021-20230421   gcc  
xtensa               randconfig-r035-20230417   gcc  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
