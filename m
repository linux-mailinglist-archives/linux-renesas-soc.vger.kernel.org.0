Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D1E2274F96E
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 11 Jul 2023 22:58:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231260AbjGKU6Y (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 11 Jul 2023 16:58:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55936 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230398AbjGKU6X (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 11 Jul 2023 16:58:23 -0400
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DAF7D10EF
        for <linux-renesas-soc@vger.kernel.org>; Tue, 11 Jul 2023 13:58:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1689109102; x=1720645102;
  h=date:from:to:cc:subject:message-id;
  bh=gzdn7Sb8KD5CxdR1GDgngcohNqhtmKrpLE1CWOr2w0Y=;
  b=YVFBlmwrhzf/wvytLxFNLeETCq/tnl7YfpFS9QXGSunFaaDX+7ncQe6f
   T3zDogxToZXXSPPcUPliQWCPN5NZ2loL81wi0CC0kI4I4nEpebsxeZr6D
   B7VPCqr1JIde6HvwzOptPsPgI4SynbtwKrypXCW4TfXveIwi+6RRs7/yU
   5lwcEaxyMU2Jlx2cojElbrl/aZyCj4HnW8/gwMp6vljpMUAZxxlZovX1U
   iIBLx/SUa1DAKXBG6w5PuiP8Av2OPu2TYIpP795Ka1juViKq8ug9yMj6S
   bLXh+n0KtEUoKWAKKrlgWXZHDf1P+K9XfP5qdKCGwQPpVhnJkw+SIZpSb
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10768"; a="354634424"
X-IronPort-AV: E=Sophos;i="6.01,197,1684825200"; 
   d="scan'208";a="354634424"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jul 2023 13:58:22 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10768"; a="834856592"
X-IronPort-AV: E=Sophos;i="6.01,197,1684825200"; 
   d="scan'208";a="834856592"
Received: from lkp-server01.sh.intel.com (HELO c544d7fc5005) ([10.239.97.150])
  by fmsmga002.fm.intel.com with ESMTP; 11 Jul 2023 13:58:21 -0700
Received: from kbuild by c544d7fc5005 with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1qJKRA-00057X-1K;
        Tue, 11 Jul 2023 20:58:20 +0000
Date:   Wed, 12 Jul 2023 04:57:21 +0800
From:   kernel test robot <lkp@intel.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     linux-renesas-soc@vger.kernel.org
Subject: [geert-renesas-devel:master] BUILD SUCCESS
 98f58cd52ff5e3385f0a9d596fca1122ad0578ad
Message-ID: <202307120419.TTZXCyLE-lkp@intel.com>
User-Agent: s-nail v14.9.24
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        RCVD_IN_DNSWL_BLOCKED,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,
        SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git master
branch HEAD: 98f58cd52ff5e3385f0a9d596fca1122ad0578ad  Merge branch 'renesas-next' into renesas-devel

elapsed time: 726m

configs tested: 128
configs skipped: 6

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                            allyesconfig   gcc  
alpha                               defconfig   gcc  
alpha                randconfig-r011-20230710   gcc  
alpha                randconfig-r014-20230710   gcc  
arc                              allyesconfig   gcc  
arc                                 defconfig   gcc  
arc                  randconfig-r043-20230711   gcc  
arm                              allmodconfig   gcc  
arm                              allyesconfig   gcc  
arm                                 defconfig   gcc  
arm                  randconfig-r015-20230712   gcc  
arm                  randconfig-r024-20230711   clang
arm                  randconfig-r046-20230711   clang
arm                        shmobile_defconfig   gcc  
arm64                            allyesconfig   gcc  
arm64                               defconfig   gcc  
arm64                randconfig-r033-20230710   gcc  
csky                                defconfig   gcc  
csky                 randconfig-r001-20230711   gcc  
csky                 randconfig-r004-20230711   gcc  
csky                 randconfig-r036-20230710   gcc  
hexagon              randconfig-r041-20230711   clang
hexagon              randconfig-r045-20230711   clang
i386                             allyesconfig   gcc  
i386         buildonly-randconfig-r004-20230711   clang
i386         buildonly-randconfig-r005-20230711   clang
i386         buildonly-randconfig-r006-20230711   clang
i386                              debian-10.3   gcc  
i386                                defconfig   gcc  
i386                 randconfig-i001-20230710   gcc  
i386                 randconfig-i001-20230711   clang
i386                 randconfig-i002-20230710   gcc  
i386                 randconfig-i002-20230711   clang
i386                 randconfig-i003-20230710   gcc  
i386                 randconfig-i003-20230711   clang
i386                 randconfig-i004-20230710   gcc  
i386                 randconfig-i004-20230711   clang
i386                 randconfig-i005-20230710   gcc  
i386                 randconfig-i005-20230711   clang
i386                 randconfig-i006-20230710   gcc  
i386                 randconfig-i006-20230711   clang
i386                 randconfig-i011-20230711   gcc  
i386                 randconfig-i012-20230711   gcc  
i386                 randconfig-i013-20230711   gcc  
i386                 randconfig-i014-20230711   gcc  
i386                 randconfig-i015-20230711   gcc  
i386                 randconfig-i016-20230711   gcc  
loongarch                        allmodconfig   gcc  
loongarch                         allnoconfig   gcc  
loongarch                           defconfig   gcc  
loongarch            randconfig-r021-20230711   gcc  
m68k                             allmodconfig   gcc  
m68k                             allyesconfig   gcc  
m68k                                defconfig   gcc  
m68k                 randconfig-r013-20230712   gcc  
m68k                 randconfig-r016-20230710   gcc  
microblaze           randconfig-r002-20230711   gcc  
mips                             allmodconfig   gcc  
mips                             allyesconfig   gcc  
mips                         db1xxx_defconfig   gcc  
mips                      maltasmvp_defconfig   gcc  
mips                 randconfig-r031-20230710   clang
nios2                               defconfig   gcc  
nios2                randconfig-r012-20230710   gcc  
nios2                randconfig-r012-20230712   gcc  
nios2                randconfig-r013-20230710   gcc  
nios2                randconfig-r022-20230711   gcc  
openrisc             randconfig-r032-20230710   gcc  
parisc                           allyesconfig   gcc  
parisc                              defconfig   gcc  
parisc               randconfig-r011-20230712   gcc  
parisc64                            defconfig   gcc  
powerpc                          allmodconfig   gcc  
powerpc                           allnoconfig   gcc  
powerpc                      chrp32_defconfig   gcc  
powerpc              randconfig-r035-20230710   gcc  
riscv                            allmodconfig   gcc  
riscv                             allnoconfig   gcc  
riscv                            allyesconfig   gcc  
riscv                               defconfig   gcc  
riscv                randconfig-r003-20230711   clang
riscv                randconfig-r005-20230711   clang
riscv                randconfig-r042-20230711   gcc  
riscv                          rv32_defconfig   gcc  
s390                             allmodconfig   gcc  
s390                             allyesconfig   gcc  
s390                                defconfig   gcc  
s390                 randconfig-r044-20230711   gcc  
sh                               allmodconfig   gcc  
sparc                            allyesconfig   gcc  
sparc                               defconfig   gcc  
sparc                randconfig-r014-20230712   gcc  
sparc                randconfig-r026-20230711   gcc  
um                               allmodconfig   clang
um                                allnoconfig   clang
um                               allyesconfig   clang
um                                  defconfig   gcc  
um                             i386_defconfig   gcc  
um                   randconfig-r016-20230712   gcc  
um                   randconfig-r025-20230711   clang
um                           x86_64_defconfig   gcc  
x86_64                           allyesconfig   gcc  
x86_64       buildonly-randconfig-r001-20230711   clang
x86_64       buildonly-randconfig-r002-20230711   clang
x86_64       buildonly-randconfig-r003-20230711   clang
x86_64                              defconfig   gcc  
x86_64                                  kexec   gcc  
x86_64               randconfig-x001-20230710   clang
x86_64               randconfig-x001-20230711   gcc  
x86_64               randconfig-x002-20230710   clang
x86_64               randconfig-x002-20230711   gcc  
x86_64               randconfig-x003-20230710   clang
x86_64               randconfig-x003-20230711   gcc  
x86_64               randconfig-x004-20230710   clang
x86_64               randconfig-x004-20230711   gcc  
x86_64               randconfig-x005-20230710   clang
x86_64               randconfig-x005-20230711   gcc  
x86_64               randconfig-x006-20230710   clang
x86_64               randconfig-x006-20230711   gcc  
x86_64               randconfig-x011-20230710   gcc  
x86_64               randconfig-x012-20230710   gcc  
x86_64               randconfig-x013-20230710   gcc  
x86_64               randconfig-x014-20230710   gcc  
x86_64               randconfig-x015-20230710   gcc  
x86_64               randconfig-x016-20230710   gcc  
x86_64                          rhel-8.3-rust   clang
x86_64                               rhel-8.3   gcc  
xtensa               randconfig-r023-20230711   gcc  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
