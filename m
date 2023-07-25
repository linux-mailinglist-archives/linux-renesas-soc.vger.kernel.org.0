Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C87357624F5
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 25 Jul 2023 23:56:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229531AbjGYV4j (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 25 Jul 2023 17:56:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45530 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229513AbjGYV4j (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 25 Jul 2023 17:56:39 -0400
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 11D9E1FE6
        for <linux-renesas-soc@vger.kernel.org>; Tue, 25 Jul 2023 14:56:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1690322198; x=1721858198;
  h=date:from:to:cc:subject:message-id;
  bh=1hWy889PuEnQTJ5RPpBO0yqfOEzjWwm+pEpk0zd+ScA=;
  b=eX7n48Gb5s7uPn8WHvK1oYU2FzbRS1/GpDvWpqpGR1ltT3d7UfhRUPNn
   CxL8tWxKnmWl0gsLAOVxausxzw0QX5LvMUDrsXmH/g9z51zRKAbcfULQT
   4zhovCBMqZsRk9LuEi8hGFHJkj5Nkkse+2fjm34zGAiR3XQkibRDi57b3
   wdO09hX4REow0ge30WWqi082glaZCtdxLXA7ShQoXw5VpYIA3/4KIVna9
   1f1gzoV+1BxtQJchAhqIxJ8XTmzrmn0s3EA3caHVwKqdUUASNmYkxLmI0
   yOXc7FoSPJC3dQKjXKIJ5+VnPEdwHGMx/Jr2JOaPsDJW5pSKuXgtGS5Dl
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10782"; a="352754509"
X-IronPort-AV: E=Sophos;i="6.01,231,1684825200"; 
   d="scan'208";a="352754509"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Jul 2023 14:56:28 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10782"; a="676380191"
X-IronPort-AV: E=Sophos;i="6.01,231,1684825200"; 
   d="scan'208";a="676380191"
Received: from lkp-server02.sh.intel.com (HELO 953e8cd98f7d) ([10.239.97.151])
  by orsmga003.jf.intel.com with ESMTP; 25 Jul 2023 14:56:27 -0700
Received: from kbuild by 953e8cd98f7d with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1qOQ14-0000NJ-3D;
        Tue, 25 Jul 2023 21:56:26 +0000
Date:   Wed, 26 Jul 2023 05:55:34 +0800
From:   kernel test robot <lkp@intel.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     linux-renesas-soc@vger.kernel.org
Subject: [geert-renesas-devel:master] BUILD SUCCESS
 c942fe31c99b1322f58c89a671f5a780c36e80ee
Message-ID: <202307260533.HKaLsZ4o-lkp@intel.com>
User-Agent: s-nail v14.9.24
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,
        SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git master
branch HEAD: c942fe31c99b1322f58c89a671f5a780c36e80ee  Merge branch 'renesas-next' into renesas-devel

elapsed time: 721m

configs tested: 160
configs skipped: 9

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                            allyesconfig   gcc  
alpha                               defconfig   gcc  
alpha                randconfig-r001-20230725   gcc  
alpha                randconfig-r012-20230725   gcc  
alpha                randconfig-r016-20230725   gcc  
alpha                randconfig-r024-20230725   gcc  
arc                              allyesconfig   gcc  
arc                                 defconfig   gcc  
arc                  randconfig-r004-20230725   gcc  
arc                  randconfig-r006-20230725   gcc  
arc                  randconfig-r013-20230725   gcc  
arc                  randconfig-r016-20230725   gcc  
arc                  randconfig-r031-20230725   gcc  
arc                  randconfig-r033-20230725   gcc  
arc                  randconfig-r035-20230725   gcc  
arc                  randconfig-r043-20230725   gcc  
arm                              allmodconfig   gcc  
arm                              allyesconfig   gcc  
arm                                 defconfig   gcc  
arm                  randconfig-r001-20230725   gcc  
arm                  randconfig-r002-20230725   gcc  
arm                  randconfig-r032-20230725   gcc  
arm                  randconfig-r046-20230725   clang
arm64                            allyesconfig   gcc  
arm64                               defconfig   gcc  
arm64                randconfig-r003-20230725   clang
csky                                defconfig   gcc  
csky                 randconfig-r013-20230725   gcc  
csky                 randconfig-r016-20230725   gcc  
csky                 randconfig-r036-20230725   gcc  
hexagon              randconfig-r023-20230725   clang
hexagon              randconfig-r041-20230725   clang
hexagon              randconfig-r041-20230726   clang
hexagon              randconfig-r045-20230725   clang
hexagon              randconfig-r045-20230726   clang
i386                             allyesconfig   gcc  
i386         buildonly-randconfig-r004-20230725   clang
i386         buildonly-randconfig-r005-20230725   clang
i386         buildonly-randconfig-r006-20230725   clang
i386                              debian-10.3   gcc  
i386                                defconfig   gcc  
i386                 randconfig-i001-20230725   clang
i386                 randconfig-i002-20230725   clang
i386                 randconfig-i003-20230725   clang
i386                 randconfig-i004-20230725   clang
i386                 randconfig-i005-20230725   clang
i386                 randconfig-i006-20230725   clang
i386                 randconfig-i011-20230725   gcc  
i386                 randconfig-i012-20230725   gcc  
i386                 randconfig-i013-20230725   gcc  
i386                 randconfig-i014-20230725   gcc  
i386                 randconfig-i015-20230725   gcc  
i386                 randconfig-i016-20230725   gcc  
i386                 randconfig-r011-20230725   gcc  
i386                 randconfig-r022-20230725   gcc  
i386                 randconfig-r026-20230725   gcc  
loongarch                        allmodconfig   gcc  
loongarch                         allnoconfig   gcc  
loongarch                           defconfig   gcc  
loongarch            randconfig-r005-20230725   gcc  
loongarch            randconfig-r006-20230725   gcc  
loongarch            randconfig-r011-20230725   gcc  
loongarch            randconfig-r013-20230725   gcc  
loongarch            randconfig-r015-20230725   gcc  
loongarch            randconfig-r016-20230725   gcc  
loongarch            randconfig-r024-20230725   gcc  
loongarch            randconfig-r031-20230725   gcc  
loongarch            randconfig-r035-20230725   gcc  
m68k                             allmodconfig   gcc  
m68k                             allyesconfig   gcc  
m68k                                defconfig   gcc  
m68k                 randconfig-r021-20230725   gcc  
m68k                 randconfig-r036-20230725   gcc  
microblaze           randconfig-r012-20230725   gcc  
microblaze           randconfig-r025-20230725   gcc  
microblaze           randconfig-r033-20230725   gcc  
mips                             allmodconfig   gcc  
mips                             allyesconfig   gcc  
nios2                               defconfig   gcc  
nios2                randconfig-r012-20230725   gcc  
openrisc             randconfig-r016-20230725   gcc  
parisc                           allyesconfig   gcc  
parisc                              defconfig   gcc  
parisc               randconfig-r013-20230725   gcc  
parisc               randconfig-r015-20230725   gcc  
parisc               randconfig-r016-20230725   gcc  
parisc               randconfig-r033-20230725   gcc  
parisc64                            defconfig   gcc  
powerpc                          allmodconfig   gcc  
powerpc                           allnoconfig   gcc  
powerpc              randconfig-r023-20230725   gcc  
powerpc              randconfig-r035-20230725   clang
riscv                            allmodconfig   gcc  
riscv                             allnoconfig   gcc  
riscv                            allyesconfig   gcc  
riscv                               defconfig   gcc  
riscv                randconfig-r004-20230725   clang
riscv                randconfig-r012-20230725   gcc  
riscv                randconfig-r014-20230725   gcc  
riscv                randconfig-r024-20230725   gcc  
riscv                randconfig-r034-20230725   clang
riscv                randconfig-r042-20230725   gcc  
riscv                randconfig-r042-20230726   clang
riscv                          rv32_defconfig   gcc  
s390                             allmodconfig   gcc  
s390                             allyesconfig   gcc  
s390                                defconfig   gcc  
s390                 randconfig-r014-20230725   gcc  
s390                 randconfig-r015-20230725   gcc  
s390                 randconfig-r044-20230725   gcc  
s390                 randconfig-r044-20230726   clang
sh                               allmodconfig   gcc  
sh                   randconfig-r014-20230725   gcc  
sh                   randconfig-r021-20230725   gcc  
sh                   randconfig-r032-20230725   gcc  
sh                   randconfig-r035-20230725   gcc  
sh                   randconfig-r036-20230725   gcc  
sparc                            allyesconfig   gcc  
sparc                               defconfig   gcc  
sparc                randconfig-r022-20230725   gcc  
sparc                randconfig-r023-20230725   gcc  
sparc                randconfig-r031-20230725   gcc  
sparc64              randconfig-r002-20230725   gcc  
sparc64              randconfig-r005-20230725   gcc  
sparc64              randconfig-r014-20230725   gcc  
sparc64              randconfig-r026-20230725   gcc  
um                               allmodconfig   clang
um                                allnoconfig   clang
um                               allyesconfig   clang
um                                  defconfig   gcc  
um                             i386_defconfig   gcc  
um                   randconfig-r016-20230725   clang
um                   randconfig-r032-20230725   gcc  
um                   randconfig-r034-20230725   gcc  
um                           x86_64_defconfig   gcc  
x86_64                           allyesconfig   gcc  
x86_64       buildonly-randconfig-r001-20230725   clang
x86_64       buildonly-randconfig-r002-20230725   clang
x86_64       buildonly-randconfig-r003-20230725   clang
x86_64                              defconfig   gcc  
x86_64                                  kexec   gcc  
x86_64               randconfig-r013-20230725   gcc  
x86_64               randconfig-r015-20230725   gcc  
x86_64               randconfig-x001-20230725   gcc  
x86_64               randconfig-x002-20230725   gcc  
x86_64               randconfig-x003-20230725   gcc  
x86_64               randconfig-x004-20230725   gcc  
x86_64               randconfig-x005-20230725   gcc  
x86_64               randconfig-x006-20230725   gcc  
x86_64               randconfig-x011-20230725   clang
x86_64               randconfig-x012-20230725   clang
x86_64               randconfig-x013-20230725   clang
x86_64               randconfig-x014-20230725   clang
x86_64               randconfig-x015-20230725   clang
x86_64               randconfig-x016-20230725   clang
x86_64                          rhel-8.3-rust   clang
x86_64                               rhel-8.3   gcc  
xtensa               randconfig-r012-20230725   gcc  
xtensa               randconfig-r025-20230725   gcc  
xtensa               randconfig-r034-20230725   gcc  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
