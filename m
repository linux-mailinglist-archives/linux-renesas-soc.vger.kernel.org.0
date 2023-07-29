Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B305D767C85
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 29 Jul 2023 08:27:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235524AbjG2G1n (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Sat, 29 Jul 2023 02:27:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35128 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229469AbjG2G1m (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sat, 29 Jul 2023 02:27:42 -0400
Received: from mgamail.intel.com (unknown [134.134.136.65])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 455591FDA
        for <linux-renesas-soc@vger.kernel.org>; Fri, 28 Jul 2023 23:27:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1690612061; x=1722148061;
  h=date:from:to:cc:subject:message-id;
  bh=oPwXUBtKnqP83BzhXrL9Nx8VjRBxhcgPHblERDqatss=;
  b=Dsr1ySvu3Wfv2mQNUyut1h+TdBhNND9vp2+8lpegnzQ3q5tYB3WZSOI0
   9qeVgaH3gk9YAnClju8X+zd3PUflKmb/tadgFf3O3st0VdzWCobhDbzEJ
   jzXY3gwUeLJks0soYoWeisJ3yW9Qx70ddmWgdwXqYvVJFJ8WxrcVDet15
   ot/GP0aBN8rJcZ9rqiQqa/wxF2kE5hJsVLVdieX1+qfqWCCwi247qWU07
   a8GU/sw6OVvmuWdzJxK8A3RdgfskLiQ9OL0vUyYPvNeH6RK3bZ6rycBYI
   Q35UbyhYLCc6ZrKeIE1M8sMkAdTw/DIi9zIIQbZPuOwVxGghO3QeNQz4X
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10785"; a="372367513"
X-IronPort-AV: E=Sophos;i="6.01,239,1684825200"; 
   d="scan'208";a="372367513"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jul 2023 23:27:40 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10785"; a="730994471"
X-IronPort-AV: E=Sophos;i="6.01,239,1684825200"; 
   d="scan'208";a="730994471"
Received: from lkp-server02.sh.intel.com (HELO 953e8cd98f7d) ([10.239.97.151])
  by fmsmga007.fm.intel.com with ESMTP; 28 Jul 2023 23:27:39 -0700
Received: from kbuild by 953e8cd98f7d with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1qPdQR-0003sa-05;
        Sat, 29 Jul 2023 06:27:39 +0000
Date:   Sat, 29 Jul 2023 14:25:06 +0800
From:   kernel test robot <lkp@intel.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     linux-renesas-soc@vger.kernel.org
Subject: [geert-renesas-drivers:topic/overlays-v6.5-rc1] BUILD
 SUCCESS 8a53cb35869639f6b96c002fbb3674931261a541
Message-ID: <202307291404.pPbfpcIJ-lkp@intel.com>
User-Agent: s-nail v14.9.24
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git topic/overlays-v6.5-rc1
branch HEAD: 8a53cb35869639f6b96c002fbb3674931261a541  kbuild: Enable DT symbols when CONFIG_OF_OVERLAY is used

elapsed time: 1001m

configs tested: 126
configs skipped: 9

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                            allyesconfig   gcc  
alpha                               defconfig   gcc  
alpha                randconfig-r013-20230728   gcc  
arc                              allyesconfig   gcc  
arc                                 defconfig   gcc  
arc                  randconfig-r032-20230728   gcc  
arc                  randconfig-r034-20230728   gcc  
arc                  randconfig-r035-20230728   gcc  
arc                  randconfig-r043-20230728   gcc  
arm                              allmodconfig   gcc  
arm                              allyesconfig   gcc  
arm                                 defconfig   gcc  
arm                  randconfig-r046-20230728   gcc  
arm64                            allyesconfig   gcc  
arm64                               defconfig   gcc  
arm64                randconfig-r036-20230728   gcc  
csky                                defconfig   gcc  
csky                 randconfig-r033-20230728   gcc  
hexagon              randconfig-r026-20230727   clang
hexagon              randconfig-r041-20230728   clang
hexagon              randconfig-r045-20230728   clang
i386                             allyesconfig   gcc  
i386         buildonly-randconfig-r004-20230728   gcc  
i386         buildonly-randconfig-r005-20230728   gcc  
i386         buildonly-randconfig-r006-20230728   gcc  
i386                              debian-10.3   gcc  
i386                                defconfig   gcc  
i386                 randconfig-i001-20230728   gcc  
i386                 randconfig-i002-20230728   gcc  
i386                 randconfig-i003-20230728   gcc  
i386                 randconfig-i004-20230728   gcc  
i386                 randconfig-i005-20230728   gcc  
i386                 randconfig-i006-20230728   gcc  
i386                 randconfig-i011-20230728   clang
i386                 randconfig-i012-20230728   clang
i386                 randconfig-i013-20230728   clang
i386                 randconfig-i014-20230728   clang
i386                 randconfig-i015-20230728   clang
i386                 randconfig-i016-20230728   clang
i386                 randconfig-r001-20230728   gcc  
loongarch                        allmodconfig   gcc  
loongarch                         allnoconfig   gcc  
loongarch                           defconfig   gcc  
loongarch            randconfig-r003-20230728   gcc  
m68k                             allmodconfig   gcc  
m68k                             allyesconfig   gcc  
m68k                                defconfig   gcc  
m68k                 randconfig-r015-20230728   gcc  
microblaze           randconfig-r016-20230728   gcc  
microblaze           randconfig-r024-20230727   gcc  
microblaze           randconfig-r024-20230728   gcc  
mips                             allmodconfig   gcc  
mips                             allyesconfig   gcc  
mips                 randconfig-r002-20230728   clang
mips                 randconfig-r005-20230728   clang
mips                 randconfig-r034-20230728   clang
nios2                               defconfig   gcc  
nios2                randconfig-r005-20230728   gcc  
nios2                randconfig-r013-20230728   gcc  
nios2                randconfig-r022-20230727   gcc  
nios2                randconfig-r031-20230728   gcc  
openrisc             randconfig-r011-20230728   gcc  
openrisc             randconfig-r031-20230728   gcc  
parisc                           allyesconfig   gcc  
parisc                              defconfig   gcc  
parisc               randconfig-r023-20230728   gcc  
parisc               randconfig-r033-20230728   gcc  
parisc64                            defconfig   gcc  
powerpc                          allmodconfig   gcc  
powerpc                           allnoconfig   gcc  
powerpc              randconfig-r004-20230728   gcc  
powerpc              randconfig-r011-20230728   clang
powerpc              randconfig-r014-20230728   clang
powerpc              randconfig-r026-20230728   clang
riscv                            allmodconfig   gcc  
riscv                             allnoconfig   gcc  
riscv                            allyesconfig   gcc  
riscv                               defconfig   gcc  
riscv                randconfig-r042-20230728   clang
riscv                          rv32_defconfig   gcc  
s390                             allmodconfig   gcc  
s390                             allyesconfig   gcc  
s390                                defconfig   gcc  
s390                 randconfig-r044-20230728   clang
sh                               allmodconfig   gcc  
sh                   randconfig-r012-20230728   gcc  
sh                   randconfig-r015-20230728   gcc  
sparc                            allyesconfig   gcc  
sparc                               defconfig   gcc  
sparc                randconfig-r032-20230728   gcc  
sparc64              randconfig-r025-20230727   gcc  
um                               allmodconfig   clang
um                                allnoconfig   clang
um                               allyesconfig   clang
um                                  defconfig   gcc  
um                             i386_defconfig   gcc  
um                   randconfig-r001-20230728   clang
um                   randconfig-r006-20230728   clang
um                   randconfig-r023-20230727   clang
um                   randconfig-r036-20230728   clang
um                           x86_64_defconfig   gcc  
x86_64                           allyesconfig   gcc  
x86_64       buildonly-randconfig-r001-20230728   gcc  
x86_64       buildonly-randconfig-r002-20230728   gcc  
x86_64       buildonly-randconfig-r003-20230728   gcc  
x86_64                              defconfig   gcc  
x86_64                                  kexec   gcc  
x86_64               randconfig-x001-20230728   clang
x86_64               randconfig-x002-20230728   clang
x86_64               randconfig-x003-20230728   clang
x86_64               randconfig-x004-20230728   clang
x86_64               randconfig-x005-20230728   clang
x86_64               randconfig-x006-20230728   clang
x86_64               randconfig-x011-20230728   gcc  
x86_64               randconfig-x012-20230728   gcc  
x86_64               randconfig-x013-20230728   gcc  
x86_64               randconfig-x014-20230728   gcc  
x86_64               randconfig-x015-20230728   gcc  
x86_64               randconfig-x016-20230728   gcc  
x86_64                          rhel-8.3-rust   clang
x86_64                               rhel-8.3   gcc  
xtensa               randconfig-r002-20230728   gcc  
xtensa               randconfig-r004-20230728   gcc  
xtensa               randconfig-r012-20230728   gcc  
xtensa               randconfig-r014-20230728   gcc  
xtensa               randconfig-r021-20230727   gcc  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
