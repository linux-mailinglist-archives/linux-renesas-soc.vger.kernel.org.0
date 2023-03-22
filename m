Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5AB826C4061
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 22 Mar 2023 03:28:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230141AbjCVC2c (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 21 Mar 2023 22:28:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47570 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230145AbjCVC23 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 21 Mar 2023 22:28:29 -0400
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5E2052596E
        for <linux-renesas-soc@vger.kernel.org>; Tue, 21 Mar 2023 19:28:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1679452092; x=1710988092;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=D8ybNt3sfqrr3W5ceKRKuops6hVpFyP6d3zGVJwAjP0=;
  b=OIuNmExnFKoQg/ktj+HkgoFv9UvO+uOdlnVwkLlSL2eO8/87h9FeLSx7
   bNav4SyN77y74oB14V827gqSmlusiBEzTcDgOEG9NpqyRdK2DSHneao0+
   EhXgMkiOyXpgo87fr5uOLXinhUqYjaVDA+MoyVVZyvs6fheYrbOD/q4VK
   eh6D9uHFlbmzbt82cUdGyLW33MWOnunOSW3P2ixTyNJyOkKVURiMk2DYu
   bO4Yvm9L4m0QpwofSHaaU+Lldci+KekzTtnb9nBdwB9JMMHD/m2d+iKH4
   TXVQo9BGuluijxUmZvcc/ba1zKkWJ7p9nl/qSzp2BEo69M4OjUk3nHAMe
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10656"; a="327489459"
X-IronPort-AV: E=Sophos;i="5.98,280,1673942400"; 
   d="scan'208";a="327489459"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Mar 2023 19:28:11 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10656"; a="825210773"
X-IronPort-AV: E=Sophos;i="5.98,280,1673942400"; 
   d="scan'208";a="825210773"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by fmsmga001.fm.intel.com with ESMTP; 21 Mar 2023 19:28:10 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1peoCv-000CjE-1K;
        Wed, 22 Mar 2023 02:28:09 +0000
Date:   Wed, 22 Mar 2023 10:27:21 +0800
From:   kernel test robot <lkp@intel.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     linux-renesas-soc@vger.kernel.org
Subject: [geert-renesas-drivers:master] BUILD SUCCESS
 a11233aee5fa41a8897aaf71daf74978f25209e1
Message-ID: <641a6789.jWdKmxPZfeymC1qI%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,
        URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git master
branch HEAD: a11233aee5fa41a8897aaf71daf74978f25209e1  [LOCAL] arm64: renesas: defconfig: Update renesas_defconfig

elapsed time: 733m

configs tested: 110
configs skipped: 8

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                            allyesconfig   gcc  
alpha                               defconfig   gcc  
alpha                randconfig-r014-20230319   gcc  
arc                              allyesconfig   gcc  
arc          buildonly-randconfig-r003-20230319   gcc  
arc                                 defconfig   gcc  
arc                  randconfig-r043-20230319   gcc  
arc                  randconfig-r043-20230320   gcc  
arc                  randconfig-r043-20230321   gcc  
arm                              allmodconfig   gcc  
arm                              allyesconfig   gcc  
arm          buildonly-randconfig-r005-20230319   gcc  
arm                                 defconfig   gcc  
arm                  randconfig-r046-20230319   gcc  
arm                  randconfig-r046-20230320   clang
arm                  randconfig-r046-20230321   gcc  
arm64                            allyesconfig   gcc  
arm64                               defconfig   gcc  
csky                                defconfig   gcc  
csky                 randconfig-r002-20230319   gcc  
csky                 randconfig-r005-20230319   gcc  
hexagon              randconfig-r022-20230319   clang
hexagon              randconfig-r041-20230319   clang
hexagon              randconfig-r041-20230320   clang
hexagon              randconfig-r041-20230321   clang
hexagon              randconfig-r045-20230319   clang
hexagon              randconfig-r045-20230320   clang
hexagon              randconfig-r045-20230321   clang
i386                             allyesconfig   gcc  
i386                              debian-10.3   gcc  
i386                                defconfig   gcc  
i386                 randconfig-a001-20230320   clang
i386                 randconfig-a002-20230320   clang
i386                 randconfig-a003-20230320   clang
i386                 randconfig-a004-20230320   clang
i386                 randconfig-a005-20230320   clang
i386                 randconfig-a006-20230320   clang
i386                          randconfig-a011   clang
i386                          randconfig-a012   gcc  
i386                          randconfig-a013   clang
i386                          randconfig-a014   gcc  
i386                          randconfig-a015   clang
i386                          randconfig-a016   gcc  
ia64                             allmodconfig   gcc  
ia64                                defconfig   gcc  
ia64                 randconfig-r003-20230319   gcc  
loongarch                        allmodconfig   gcc  
loongarch                         allnoconfig   gcc  
loongarch                           defconfig   gcc  
loongarch            randconfig-r032-20230321   gcc  
m68k                             allmodconfig   gcc  
m68k                                defconfig   gcc  
microblaze   buildonly-randconfig-r001-20230319   gcc  
microblaze           randconfig-r015-20230319   gcc  
mips                             allmodconfig   gcc  
mips                             allyesconfig   gcc  
nios2                               defconfig   gcc  
nios2                randconfig-r004-20230319   gcc  
nios2                randconfig-r034-20230321   gcc  
openrisc             randconfig-r011-20230319   gcc  
openrisc             randconfig-r024-20230319   gcc  
openrisc             randconfig-r033-20230321   gcc  
parisc                              defconfig   gcc  
parisc               randconfig-r012-20230319   gcc  
parisc64                            defconfig   gcc  
powerpc                          allmodconfig   gcc  
powerpc                           allnoconfig   gcc  
powerpc      buildonly-randconfig-r004-20230319   clang
powerpc              randconfig-r031-20230321   gcc  
riscv                            allmodconfig   gcc  
riscv                             allnoconfig   gcc  
riscv                               defconfig   gcc  
riscv                randconfig-r042-20230319   clang
riscv                randconfig-r042-20230320   gcc  
riscv                randconfig-r042-20230321   clang
riscv                          rv32_defconfig   gcc  
s390                             allmodconfig   gcc  
s390                             allyesconfig   gcc  
s390         buildonly-randconfig-r002-20230319   clang
s390                                defconfig   gcc  
s390                 randconfig-r021-20230319   clang
s390                 randconfig-r044-20230319   clang
s390                 randconfig-r044-20230320   gcc  
s390                 randconfig-r044-20230321   clang
sh                               allmodconfig   gcc  
sh                   randconfig-r013-20230319   gcc  
sh                   randconfig-r023-20230319   gcc  
sparc        buildonly-randconfig-r006-20230319   gcc  
sparc                               defconfig   gcc  
sparc64              randconfig-r025-20230319   gcc  
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
x86_64               randconfig-a011-20230320   gcc  
x86_64               randconfig-a012-20230320   gcc  
x86_64               randconfig-a013-20230320   gcc  
x86_64               randconfig-a014-20230320   gcc  
x86_64               randconfig-a015-20230320   gcc  
x86_64               randconfig-a016-20230320   gcc  
x86_64                               rhel-8.3   gcc  
xtensa               randconfig-r001-20230319   gcc  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
