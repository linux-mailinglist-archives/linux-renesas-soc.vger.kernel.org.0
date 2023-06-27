Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AC56173F07D
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 27 Jun 2023 03:26:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230073AbjF0B0y (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 26 Jun 2023 21:26:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39362 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230051AbjF0B0t (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 26 Jun 2023 21:26:49 -0400
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7D871173A
        for <linux-renesas-soc@vger.kernel.org>; Mon, 26 Jun 2023 18:26:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1687829208; x=1719365208;
  h=date:from:to:cc:subject:message-id;
  bh=Bl+V95GOt1y1ZS7VGSIh5LskZaOkF6yowthbw7BKACo=;
  b=Ni4YSTueLEH19elomq5F+VoowY8lXOi+x/U03Tqt5eekgeGpY/CvBhRw
   onMa2qYkovF7I9oOMkFbUjrrzumxDnEHZhJ8r9dmwFX4T530UWv2zoUnS
   DQuSZcS8VZ/MBew0yDtmtvQOUCQctGEkxgpXz2vBO3V0twj6fGNBHqqFy
   rwnBxV9xtemd9HdlnCQbdTfmprmRerwjyH7JbXBR8auk1aAV2f5j+ICav
   k6iT+USxxoILRGpjZdPmUfvGgYdoYHLQbZOS69YUQtDBNJST7z7fiRToJ
   sjnfU4s2h56FfgWO1fjBk94vMKjeNrnOnTGzEc5aokB8OMUyNByNeFwgE
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10753"; a="341779600"
X-IronPort-AV: E=Sophos;i="6.01,161,1684825200"; 
   d="scan'208";a="341779600"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jun 2023 18:26:46 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10753"; a="710432933"
X-IronPort-AV: E=Sophos;i="6.01,161,1684825200"; 
   d="scan'208";a="710432933"
Received: from lkp-server01.sh.intel.com (HELO 783282924a45) ([10.239.97.150])
  by orsmga007.jf.intel.com with ESMTP; 26 Jun 2023 18:26:45 -0700
Received: from kbuild by 783282924a45 with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1qDxTg-000BUg-39;
        Tue, 27 Jun 2023 01:26:44 +0000
Date:   Tue, 27 Jun 2023 09:26:35 +0800
From:   kernel test robot <lkp@intel.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     linux-renesas-soc@vger.kernel.org
Subject: [geert-renesas-drivers:master] BUILD SUCCESS
 e4573b8546b2fc032a63651b5aedf364acf0a98c
Message-ID: <202306270934.AYtZ1iX4-lkp@intel.com>
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

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git master
branch HEAD: e4573b8546b2fc032a63651b5aedf364acf0a98c  [LOCAL] arm64: renesas: defconfig: Update renesas_defconfig

elapsed time: 9365m

configs tested: 109
configs skipped: 5

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                            allyesconfig   gcc  
alpha                               defconfig   gcc  
alpha                randconfig-r035-20230620   gcc  
alpha                randconfig-r036-20230620   gcc  
arc                              allyesconfig   gcc  
arc                                 defconfig   gcc  
arc                  randconfig-r015-20230620   gcc  
arc                  randconfig-r043-20230620   gcc  
arm                              allmodconfig   gcc  
arm                              allyesconfig   gcc  
arm                                 defconfig   gcc  
arm                  randconfig-r046-20230620   clang
arm                          sp7021_defconfig   clang
arm                    vt8500_v6_v7_defconfig   clang
arm64                            allyesconfig   clang
arm64                            allyesconfig   gcc  
arm64                               defconfig   gcc  
arm64                randconfig-r005-20230620   clang
arm64                randconfig-r013-20230620   gcc  
arm64                randconfig-r031-20230620   clang
arm64                randconfig-r034-20230620   clang
csky                                defconfig   gcc  
csky                 randconfig-r011-20230620   gcc  
hexagon              randconfig-r041-20230620   clang
hexagon              randconfig-r045-20230620   clang
i386                             allyesconfig   gcc  
i386         buildonly-randconfig-r004-20230620   clang
i386         buildonly-randconfig-r005-20230620   clang
i386         buildonly-randconfig-r006-20230620   clang
i386                              debian-10.3   gcc  
i386                                defconfig   gcc  
i386                 randconfig-i001-20230620   clang
i386                 randconfig-i002-20230620   clang
i386                 randconfig-i003-20230620   clang
i386                 randconfig-i004-20230620   clang
i386                 randconfig-i005-20230620   clang
i386                 randconfig-i006-20230620   clang
i386                 randconfig-i011-20230620   gcc  
i386                 randconfig-i012-20230620   gcc  
i386                 randconfig-i013-20230620   gcc  
i386                 randconfig-i014-20230620   gcc  
i386                 randconfig-i015-20230620   gcc  
i386                 randconfig-i016-20230620   gcc  
loongarch                        allmodconfig   gcc  
loongarch                         allnoconfig   gcc  
loongarch                           defconfig   gcc  
m68k                             allmodconfig   gcc  
m68k                             allyesconfig   gcc  
m68k                                defconfig   gcc  
m68k                 randconfig-r001-20230620   gcc  
mips                             allmodconfig   gcc  
mips                             allyesconfig   gcc  
mips                     loongson1c_defconfig   clang
mips                 randconfig-r026-20230620   clang
mips                   sb1250_swarm_defconfig   clang
nios2                               defconfig   gcc  
openrisc                  or1klitex_defconfig   gcc  
openrisc             randconfig-r002-20230620   gcc  
parisc                           allyesconfig   gcc  
parisc                              defconfig   gcc  
parisc64                            defconfig   gcc  
powerpc                          allmodconfig   gcc  
powerpc                           allnoconfig   gcc  
powerpc                        cell_defconfig   gcc  
powerpc                      katmai_defconfig   clang
powerpc                   motionpro_defconfig   gcc  
powerpc                 mpc832x_rdb_defconfig   clang
powerpc                      ppc64e_defconfig   clang
powerpc              randconfig-r014-20230620   gcc  
powerpc              randconfig-r021-20230620   gcc  
powerpc                     tqm5200_defconfig   clang
riscv                            allmodconfig   gcc  
riscv                             allnoconfig   gcc  
riscv                            allyesconfig   gcc  
riscv                               defconfig   gcc  
riscv             nommu_k210_sdcard_defconfig   gcc  
riscv                randconfig-r042-20230620   gcc  
riscv                          rv32_defconfig   gcc  
s390                             alldefconfig   clang
s390                             allmodconfig   gcc  
s390                             allyesconfig   gcc  
s390                                defconfig   gcc  
s390                 randconfig-r044-20230620   gcc  
sh                               allmodconfig   gcc  
sh                   randconfig-r012-20230620   gcc  
sh                   randconfig-r016-20230620   gcc  
sh                           se7343_defconfig   gcc  
sparc                            allyesconfig   gcc  
sparc                               defconfig   gcc  
sparc64              randconfig-r023-20230620   gcc  
um                               allmodconfig   clang
um                                allnoconfig   clang
um                               allyesconfig   clang
um                                  defconfig   gcc  
um                             i386_defconfig   gcc  
um                   randconfig-r022-20230620   clang
um                           x86_64_defconfig   gcc  
x86_64                           allyesconfig   gcc  
x86_64       buildonly-randconfig-r001-20230620   clang
x86_64       buildonly-randconfig-r002-20230620   clang
x86_64       buildonly-randconfig-r003-20230620   clang
x86_64                              defconfig   gcc  
x86_64                                  kexec   gcc  
x86_64               randconfig-r003-20230620   clang
x86_64               randconfig-r032-20230620   clang
x86_64                          rhel-8.3-rust   clang
x86_64                               rhel-8.3   gcc  
xtensa               randconfig-r004-20230620   gcc  
xtensa               randconfig-r006-20230620   gcc  
xtensa               randconfig-r025-20230620   gcc  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
