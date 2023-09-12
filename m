Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DD43279C137
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 12 Sep 2023 02:44:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231318AbjILAo1 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 11 Sep 2023 20:44:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55118 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231645AbjILAoK (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 11 Sep 2023 20:44:10 -0400
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AB65A18DB2B
        for <linux-renesas-soc@vger.kernel.org>; Mon, 11 Sep 2023 17:40:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1694479242; x=1726015242;
  h=date:from:to:cc:subject:message-id;
  bh=u3CC43dp3fUuMMuU9DAL5WQTpakDMBCMrLFWYSxg7/c=;
  b=JqO1tnSI7RAC5yfjr6/Aq+GMnCUVk4Kpf+X93WhZjCmFhgDBmagBq1Ce
   XQKe5jWdpK+CSX4yl7kTyrrSmJ33+a0d9UxecwcQe8mjGIH7iJcOar/aS
   4V6U7LSZDFrbjGDRK06fVvCXBZYciMSr4aUUFg22W2R3/1q/RmuEv98lm
   dMTRq6Sa3lX76NDO8vDTtvtJDUMnlhH4RW26iXUsMGcv8QbGlhIK3iF/q
   8luVRxYsKNEGsg7HooY/ohiJuxe8mj8eW+M9Wefhq3gxlE85TlZXnNDxO
   L3kdjcBOkpG7DISMXr4RXf1TanCMdsCeyHd++07PQWGygXinofbAo0X1O
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10830"; a="378150627"
X-IronPort-AV: E=Sophos;i="6.02,244,1688454000"; 
   d="scan'208";a="378150627"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Sep 2023 17:34:01 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10830"; a="833697885"
X-IronPort-AV: E=Sophos;i="6.02,244,1688454000"; 
   d="scan'208";a="833697885"
Received: from lkp-server01.sh.intel.com (HELO 59b3c6e06877) ([10.239.97.150])
  by FMSMGA003.fm.intel.com with ESMTP; 11 Sep 2023 17:34:00 -0700
Received: from kbuild by 59b3c6e06877 with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1qfrLq-0006xO-1w;
        Tue, 12 Sep 2023 00:33:58 +0000
Date:   Tue, 12 Sep 2023 08:33:21 +0800
From:   kernel test robot <lkp@intel.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     linux-renesas-soc@vger.kernel.org
Subject: [geert-renesas-drivers:renesas-pinctrl] BUILD SUCCESS
 21c11421db1fdd5ed7c8ea7048178b365185cd3a
Message-ID: <202309120820.zCzDOo37-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git renesas-pinctrl
branch HEAD: 21c11421db1fdd5ed7c8ea7048178b365185cd3a  pinctrl: renesas: r8a7779: s/LSBC/LBSC/

elapsed time: 724m

configs tested: 258
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig   gcc  
alpha                            allyesconfig   gcc  
alpha                               defconfig   gcc  
alpha                randconfig-r013-20230911   gcc  
alpha                randconfig-r033-20230911   gcc  
alpha                randconfig-r036-20230911   gcc  
arc                              allmodconfig   gcc  
arc                               allnoconfig   gcc  
arc                              allyesconfig   gcc  
arc                                 defconfig   gcc  
arc                   randconfig-001-20230911   gcc  
arc                   randconfig-001-20230912   gcc  
arc                  randconfig-r031-20230912   gcc  
arc                  randconfig-r034-20230912   gcc  
arm                              allmodconfig   gcc  
arm                               allnoconfig   gcc  
arm                              allyesconfig   gcc  
arm                     am200epdkit_defconfig   clang
arm                       aspeed_g5_defconfig   gcc  
arm                                 defconfig   gcc  
arm                          pxa3xx_defconfig   gcc  
arm                             pxa_defconfig   gcc  
arm                   randconfig-001-20230911   gcc  
arm                   randconfig-001-20230912   clang
arm                  randconfig-r003-20230912   gcc  
arm                  randconfig-r006-20230912   gcc  
arm                  randconfig-r015-20230911   gcc  
arm                  randconfig-r036-20230912   gcc  
arm                         s3c6400_defconfig   gcc  
arm64                            allmodconfig   gcc  
arm64                             allnoconfig   gcc  
arm64                            allyesconfig   gcc  
arm64                               defconfig   gcc  
arm64                randconfig-r002-20230912   clang
arm64                randconfig-r006-20230912   clang
arm64                randconfig-r022-20230911   clang
arm64                randconfig-r036-20230912   clang
csky                             allmodconfig   gcc  
csky                              allnoconfig   gcc  
csky                             allyesconfig   gcc  
csky                                defconfig   gcc  
csky                 randconfig-r023-20230911   gcc  
hexagon               randconfig-001-20230911   clang
hexagon               randconfig-001-20230912   clang
hexagon               randconfig-002-20230911   clang
hexagon               randconfig-002-20230912   clang
hexagon              randconfig-r004-20230912   clang
hexagon              randconfig-r032-20230911   clang
hexagon              randconfig-r032-20230912   clang
i386                             allmodconfig   gcc  
i386                              allnoconfig   gcc  
i386                             allyesconfig   gcc  
i386         buildonly-randconfig-001-20230911   gcc  
i386         buildonly-randconfig-001-20230912   clang
i386         buildonly-randconfig-002-20230911   gcc  
i386         buildonly-randconfig-002-20230912   clang
i386         buildonly-randconfig-003-20230911   gcc  
i386         buildonly-randconfig-003-20230912   clang
i386         buildonly-randconfig-004-20230911   gcc  
i386         buildonly-randconfig-004-20230912   clang
i386         buildonly-randconfig-005-20230911   gcc  
i386         buildonly-randconfig-005-20230912   clang
i386         buildonly-randconfig-006-20230911   gcc  
i386         buildonly-randconfig-006-20230912   clang
i386                              debian-10.3   gcc  
i386                                defconfig   gcc  
i386                  randconfig-001-20230911   gcc  
i386                  randconfig-001-20230912   clang
i386                  randconfig-002-20230911   gcc  
i386                  randconfig-002-20230912   clang
i386                  randconfig-003-20230911   gcc  
i386                  randconfig-003-20230912   clang
i386                  randconfig-004-20230911   gcc  
i386                  randconfig-004-20230912   clang
i386                  randconfig-005-20230911   gcc  
i386                  randconfig-005-20230912   clang
i386                  randconfig-006-20230911   gcc  
i386                  randconfig-006-20230912   clang
i386                  randconfig-011-20230911   clang
i386                  randconfig-011-20230912   gcc  
i386                  randconfig-012-20230911   clang
i386                  randconfig-012-20230912   gcc  
i386                  randconfig-013-20230911   clang
i386                  randconfig-013-20230912   gcc  
i386                  randconfig-014-20230911   clang
i386                  randconfig-014-20230912   gcc  
i386                  randconfig-015-20230911   clang
i386                  randconfig-015-20230912   gcc  
i386                  randconfig-016-20230911   clang
i386                  randconfig-016-20230912   gcc  
i386                 randconfig-r003-20230911   gcc  
i386                 randconfig-r015-20230912   gcc  
i386                 randconfig-r023-20230911   clang
loongarch                        allmodconfig   gcc  
loongarch                         allnoconfig   gcc  
loongarch                        allyesconfig   gcc  
loongarch                           defconfig   gcc  
loongarch             randconfig-001-20230911   gcc  
loongarch             randconfig-001-20230912   gcc  
loongarch            randconfig-r033-20230912   gcc  
m68k                             allmodconfig   gcc  
m68k                              allnoconfig   gcc  
m68k                             allyesconfig   gcc  
m68k                                defconfig   gcc  
m68k                       m5249evb_defconfig   gcc  
m68k                 randconfig-r001-20230911   gcc  
m68k                 randconfig-r026-20230911   gcc  
m68k                 randconfig-r032-20230912   gcc  
microblaze                       allmodconfig   gcc  
microblaze                        allnoconfig   gcc  
microblaze                       allyesconfig   gcc  
microblaze                          defconfig   gcc  
microblaze           randconfig-r001-20230912   gcc  
microblaze           randconfig-r025-20230911   gcc  
mips                             allmodconfig   gcc  
mips                              allnoconfig   gcc  
mips                             allyesconfig   gcc  
mips                 randconfig-r013-20230912   clang
mips                 randconfig-r021-20230911   gcc  
mips                 randconfig-r035-20230912   gcc  
nios2                            allmodconfig   gcc  
nios2                             allnoconfig   gcc  
nios2                            allyesconfig   gcc  
nios2                               defconfig   gcc  
nios2                randconfig-r022-20230911   gcc  
openrisc                         allmodconfig   gcc  
openrisc                          allnoconfig   gcc  
openrisc                         allyesconfig   gcc  
openrisc                            defconfig   gcc  
parisc                           allmodconfig   gcc  
parisc                            allnoconfig   gcc  
parisc                           allyesconfig   gcc  
parisc                              defconfig   gcc  
parisc               randconfig-r005-20230912   gcc  
parisc               randconfig-r026-20230911   gcc  
parisc64                            defconfig   gcc  
powerpc                          allmodconfig   gcc  
powerpc                           allnoconfig   gcc  
powerpc                          allyesconfig   gcc  
powerpc                 mpc8315_rdb_defconfig   clang
powerpc                     ppa8548_defconfig   clang
powerpc              randconfig-r001-20230912   clang
powerpc              randconfig-r005-20230911   gcc  
powerpc              randconfig-r005-20230912   clang
powerpc              randconfig-r011-20230912   gcc  
powerpc              randconfig-r012-20230912   gcc  
powerpc64            randconfig-r016-20230912   gcc  
riscv                            allmodconfig   gcc  
riscv                             allnoconfig   gcc  
riscv                            allyesconfig   gcc  
riscv                               defconfig   gcc  
riscv                 randconfig-001-20230911   gcc  
riscv                 randconfig-001-20230912   clang
riscv                randconfig-r005-20230912   clang
riscv                randconfig-r031-20230911   gcc  
riscv                randconfig-r035-20230911   gcc  
riscv                randconfig-r035-20230912   clang
riscv                          rv32_defconfig   gcc  
s390                             allmodconfig   gcc  
s390                              allnoconfig   gcc  
s390                             allyesconfig   gcc  
s390                                defconfig   gcc  
s390                  randconfig-001-20230911   clang
s390                  randconfig-001-20230912   gcc  
s390                 randconfig-r004-20230911   gcc  
s390                 randconfig-r011-20230911   clang
s390                 randconfig-r031-20230912   clang
s390                 randconfig-r032-20230912   clang
sh                               allmodconfig   gcc  
sh                                allnoconfig   gcc  
sh                               allyesconfig   gcc  
sh                                  defconfig   gcc  
sh                          kfr2r09_defconfig   gcc  
sh                   randconfig-r012-20230911   gcc  
sh                   randconfig-r024-20230911   gcc  
sh                   randconfig-r034-20230911   gcc  
sparc                            allmodconfig   gcc  
sparc                             allnoconfig   gcc  
sparc                            allyesconfig   gcc  
sparc                               defconfig   gcc  
sparc                randconfig-r014-20230912   gcc  
sparc                randconfig-r016-20230911   gcc  
sparc                       sparc32_defconfig   gcc  
sparc64                          allmodconfig   gcc  
sparc64                          allyesconfig   gcc  
sparc64                             defconfig   gcc  
sparc64              randconfig-r002-20230912   gcc  
sparc64              randconfig-r004-20230912   gcc  
sparc64              randconfig-r024-20230911   gcc  
sparc64              randconfig-r025-20230911   gcc  
um                               allmodconfig   clang
um                                allnoconfig   clang
um                               allyesconfig   clang
um                                  defconfig   gcc  
um                             i386_defconfig   gcc  
um                   randconfig-r006-20230911   clang
um                   randconfig-r014-20230911   gcc  
um                   randconfig-r021-20230911   gcc  
um                           x86_64_defconfig   gcc  
x86_64                            allnoconfig   gcc  
x86_64                           allyesconfig   gcc  
x86_64       buildonly-randconfig-001-20230911   gcc  
x86_64       buildonly-randconfig-001-20230912   clang
x86_64       buildonly-randconfig-002-20230911   gcc  
x86_64       buildonly-randconfig-002-20230912   clang
x86_64       buildonly-randconfig-003-20230911   gcc  
x86_64       buildonly-randconfig-003-20230912   clang
x86_64       buildonly-randconfig-004-20230911   gcc  
x86_64       buildonly-randconfig-004-20230912   clang
x86_64       buildonly-randconfig-005-20230911   gcc  
x86_64       buildonly-randconfig-005-20230912   clang
x86_64       buildonly-randconfig-006-20230911   gcc  
x86_64       buildonly-randconfig-006-20230912   clang
x86_64                              defconfig   gcc  
x86_64                randconfig-001-20230911   clang
x86_64                randconfig-001-20230912   gcc  
x86_64                randconfig-002-20230911   clang
x86_64                randconfig-002-20230912   gcc  
x86_64                randconfig-003-20230911   clang
x86_64                randconfig-003-20230912   gcc  
x86_64                randconfig-004-20230911   clang
x86_64                randconfig-004-20230912   gcc  
x86_64                randconfig-005-20230911   clang
x86_64                randconfig-005-20230912   gcc  
x86_64                randconfig-006-20230911   clang
x86_64                randconfig-006-20230912   gcc  
x86_64                randconfig-011-20230911   gcc  
x86_64                randconfig-011-20230912   clang
x86_64                randconfig-012-20230911   gcc  
x86_64                randconfig-012-20230912   clang
x86_64                randconfig-013-20230911   gcc  
x86_64                randconfig-013-20230912   clang
x86_64                randconfig-014-20230911   gcc  
x86_64                randconfig-014-20230912   clang
x86_64                randconfig-015-20230911   gcc  
x86_64                randconfig-015-20230912   clang
x86_64                randconfig-016-20230911   gcc  
x86_64                randconfig-016-20230912   clang
x86_64                randconfig-071-20230911   gcc  
x86_64                randconfig-071-20230912   clang
x86_64                randconfig-072-20230911   gcc  
x86_64                randconfig-072-20230912   clang
x86_64                randconfig-073-20230911   gcc  
x86_64                randconfig-073-20230912   clang
x86_64                randconfig-074-20230911   gcc  
x86_64                randconfig-074-20230912   clang
x86_64                randconfig-075-20230911   gcc  
x86_64                randconfig-075-20230912   clang
x86_64                randconfig-076-20230911   gcc  
x86_64                randconfig-076-20230912   clang
x86_64               randconfig-r002-20230911   gcc  
x86_64                          rhel-8.3-func   gcc  
x86_64                    rhel-8.3-kselftests   gcc  
x86_64                           rhel-8.3-ltp   gcc  
x86_64                          rhel-8.3-rust   clang
x86_64                               rhel-8.3   gcc  
xtensa                            allnoconfig   gcc  
xtensa                           allyesconfig   gcc  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
