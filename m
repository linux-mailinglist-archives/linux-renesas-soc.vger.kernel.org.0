Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C33AB704310
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 16 May 2023 03:45:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229551AbjEPBpM (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 15 May 2023 21:45:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60158 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229655AbjEPBpK (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 15 May 2023 21:45:10 -0400
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B621E55B3
        for <linux-renesas-soc@vger.kernel.org>; Mon, 15 May 2023 18:45:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1684201509; x=1715737509;
  h=date:from:to:cc:subject:message-id;
  bh=AuX41q01oWM7dBDyvxwfNlzTZ75qtPgfaLfOMnR9RYE=;
  b=UxlqWp+f2V9+M1TEyb/p/2zVbx2se3CbqLe1LtwWd61Uu15ldFUGbI15
   xXK7HwwkoJi3x0AoppftwMn0AwPI7mfpEAlsnwEnrLZ5gHCP6VV98Dh0Y
   hFORwZX2d3QByvWpEjKpR3nsYs2VKp8jw26nenyc/BwGxhtIiqze1WwJH
   BnuykbFWnVrCwvAC8e8ZGjjC1R1Wlh4LsAfhZvS8GWi8G1rUIHTJHT+3P
   n55X/PhPDbvxUZJRjLKorJk7Azh9I/BGupx+zjBr029VXtO3HJYo1NUKM
   uUnV7VUnEXuBxsIU65TNOWMMDS5R7smTdNI6JShhx0CkoK1M7nI7CU5DP
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10711"; a="348851593"
X-IronPort-AV: E=Sophos;i="5.99,277,1677571200"; 
   d="scan'208";a="348851593"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 May 2023 18:44:50 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10711"; a="734104129"
X-IronPort-AV: E=Sophos;i="5.99,277,1677571200"; 
   d="scan'208";a="734104129"
Received: from lkp-server01.sh.intel.com (HELO dea6d5a4f140) ([10.239.97.150])
  by orsmga001.jf.intel.com with ESMTP; 15 May 2023 18:44:48 -0700
Received: from kbuild by dea6d5a4f140 with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1pyjk8-0006qU-0g;
        Tue, 16 May 2023 01:44:48 +0000
Date:   Tue, 16 May 2023 09:43:59 +0800
From:   kernel test robot <lkp@intel.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     linux-renesas-soc@vger.kernel.org
Subject: [geert-renesas-devel:next] BUILD SUCCESS
 21330625d0f5970080f69db3d7634441d6484a07
Message-ID: <20230516014359.DARRa%lkp@intel.com>
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

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git next
branch HEAD: 21330625d0f5970080f69db3d7634441d6484a07  Merge branches 'renesas-arm-defconfig-for-v6.5' and 'renesas-drivers-for-v6.5' into renesas-next

elapsed time: 944m

configs tested: 186
configs skipped: 7

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                            allyesconfig   gcc  
alpha        buildonly-randconfig-r003-20230515   gcc  
alpha                               defconfig   gcc  
arc                              allyesconfig   gcc  
arc                                 defconfig   gcc  
arc                     nsimosci_hs_defconfig   gcc  
arc                  randconfig-r006-20230515   gcc  
arc                  randconfig-r023-20230515   gcc  
arc                  randconfig-r043-20230515   gcc  
arm                              allmodconfig   gcc  
arm                              allyesconfig   gcc  
arm                         axm55xx_defconfig   gcc  
arm                                 defconfig   gcc  
arm                           imxrt_defconfig   gcc  
arm                  randconfig-r003-20230515   gcc  
arm                  randconfig-r046-20230515   clang
arm                       versatile_defconfig   clang
arm64                            allyesconfig   gcc  
arm64                               defconfig   gcc  
arm64                randconfig-r011-20230515   gcc  
arm64                randconfig-r015-20230515   gcc  
arm64                randconfig-r022-20230515   gcc  
csky                                defconfig   gcc  
csky                 randconfig-r005-20230515   gcc  
csky                 randconfig-r031-20230515   gcc  
hexagon              randconfig-r006-20230515   clang
hexagon              randconfig-r012-20230515   clang
hexagon              randconfig-r041-20230515   clang
hexagon              randconfig-r045-20230515   clang
i386                             allyesconfig   gcc  
i386         buildonly-randconfig-r005-20230515   clang
i386                              debian-10.3   gcc  
i386                                defconfig   gcc  
i386                 randconfig-a001-20230515   clang
i386                 randconfig-a002-20230515   clang
i386                 randconfig-a003-20230515   clang
i386                 randconfig-a004-20230515   clang
i386                 randconfig-a005-20230515   clang
i386                 randconfig-a006-20230515   clang
i386                 randconfig-a011-20230515   gcc  
i386                 randconfig-a012-20230515   gcc  
i386                 randconfig-a013-20230515   gcc  
i386                 randconfig-a014-20230515   gcc  
i386                 randconfig-a015-20230515   gcc  
i386                 randconfig-a016-20230515   gcc  
i386                 randconfig-i051-20230515   clang
i386                 randconfig-i052-20230515   clang
i386                 randconfig-i053-20230515   clang
i386                 randconfig-i054-20230515   clang
i386                 randconfig-i055-20230515   clang
i386                 randconfig-i056-20230515   clang
i386                 randconfig-i061-20230515   clang
i386                 randconfig-i062-20230515   clang
i386                 randconfig-i063-20230515   clang
i386                 randconfig-i064-20230515   clang
i386                 randconfig-i065-20230515   clang
i386                 randconfig-i066-20230515   clang
i386                 randconfig-i071-20230515   gcc  
i386                          randconfig-i071   clang
i386                 randconfig-i072-20230515   gcc  
i386                 randconfig-i073-20230515   gcc  
i386                          randconfig-i073   clang
i386                 randconfig-i074-20230515   gcc  
i386                 randconfig-i075-20230515   gcc  
i386                          randconfig-i075   clang
i386                 randconfig-i076-20230515   gcc  
i386                 randconfig-i081-20230515   gcc  
i386                 randconfig-i082-20230515   gcc  
i386                 randconfig-i083-20230515   gcc  
i386                 randconfig-i084-20230515   gcc  
i386                 randconfig-i085-20230515   gcc  
i386                 randconfig-i086-20230515   gcc  
i386                 randconfig-i091-20230515   clang
i386                 randconfig-i092-20230515   clang
i386                 randconfig-i093-20230515   clang
i386                 randconfig-i094-20230515   clang
i386                 randconfig-i095-20230515   clang
i386                 randconfig-i096-20230515   clang
ia64                             allmodconfig   gcc  
ia64         buildonly-randconfig-r006-20230515   gcc  
ia64                                defconfig   gcc  
ia64                 randconfig-r002-20230515   gcc  
loongarch                        alldefconfig   gcc  
loongarch                        allmodconfig   gcc  
loongarch                         allnoconfig   gcc  
loongarch                           defconfig   gcc  
loongarch            randconfig-r016-20230515   gcc  
m68k                             allmodconfig   gcc  
m68k         buildonly-randconfig-r001-20230515   gcc  
m68k                                defconfig   gcc  
m68k                 randconfig-r014-20230515   gcc  
m68k                 randconfig-r034-20230515   gcc  
microblaze           randconfig-r026-20230515   gcc  
mips                             allmodconfig   gcc  
mips                             allyesconfig   gcc  
mips                       bmips_be_defconfig   gcc  
mips                 randconfig-r035-20230515   gcc  
mips                           rs90_defconfig   clang
nios2                               defconfig   gcc  
nios2                randconfig-r026-20230515   gcc  
nios2                randconfig-r033-20230515   gcc  
openrisc     buildonly-randconfig-r003-20230515   gcc  
openrisc     buildonly-randconfig-r006-20230515   gcc  
openrisc             randconfig-r036-20230515   gcc  
parisc       buildonly-randconfig-r001-20230515   gcc  
parisc                              defconfig   gcc  
parisc               randconfig-r023-20230515   gcc  
parisc               randconfig-r024-20230515   gcc  
parisc64                            defconfig   gcc  
powerpc                          allmodconfig   gcc  
powerpc                           allnoconfig   gcc  
powerpc                        fsp2_defconfig   clang
powerpc                   microwatt_defconfig   clang
powerpc                     tqm8560_defconfig   clang
powerpc                      tqm8xx_defconfig   gcc  
riscv                            allmodconfig   gcc  
riscv                             allnoconfig   gcc  
riscv                               defconfig   gcc  
riscv                randconfig-r004-20230515   clang
riscv                randconfig-r013-20230515   gcc  
riscv                randconfig-r042-20230515   gcc  
riscv                          rv32_defconfig   gcc  
s390                             allmodconfig   gcc  
s390                             allyesconfig   gcc  
s390                                defconfig   gcc  
s390                 randconfig-r001-20230515   clang
s390                 randconfig-r004-20230515   clang
s390                 randconfig-r044-20230515   gcc  
sh                               allmodconfig   gcc  
sh                   randconfig-r033-20230515   gcc  
sparc                               defconfig   gcc  
sparc                randconfig-r025-20230515   gcc  
sparc                randconfig-r032-20230515   gcc  
sparc                randconfig-r034-20230515   gcc  
sparc64              randconfig-r024-20230515   gcc  
um                             i386_defconfig   gcc  
um                           x86_64_defconfig   gcc  
x86_64                            allnoconfig   gcc  
x86_64                           allyesconfig   gcc  
x86_64                              defconfig   gcc  
x86_64                                  kexec   gcc  
x86_64               randconfig-a001-20230515   clang
x86_64               randconfig-a002-20230515   clang
x86_64               randconfig-a003-20230515   clang
x86_64               randconfig-a004-20230515   clang
x86_64               randconfig-a005-20230515   clang
x86_64               randconfig-a006-20230515   clang
x86_64               randconfig-a011-20230515   gcc  
x86_64               randconfig-a012-20230515   gcc  
x86_64               randconfig-a013-20230515   gcc  
x86_64               randconfig-a014-20230515   gcc  
x86_64               randconfig-a015-20230515   gcc  
x86_64               randconfig-a016-20230515   gcc  
x86_64               randconfig-k001-20230515   gcc  
x86_64               randconfig-x051-20230515   gcc  
x86_64               randconfig-x052-20230515   gcc  
x86_64               randconfig-x053-20230515   gcc  
x86_64               randconfig-x054-20230515   gcc  
x86_64               randconfig-x055-20230515   gcc  
x86_64               randconfig-x056-20230515   gcc  
x86_64               randconfig-x061-20230515   gcc  
x86_64               randconfig-x062-20230515   gcc  
x86_64               randconfig-x063-20230515   gcc  
x86_64               randconfig-x064-20230515   gcc  
x86_64               randconfig-x065-20230515   gcc  
x86_64               randconfig-x066-20230515   gcc  
x86_64               randconfig-x071-20230515   clang
x86_64               randconfig-x072-20230515   clang
x86_64               randconfig-x073-20230515   clang
x86_64               randconfig-x074-20230515   clang
x86_64               randconfig-x075-20230515   clang
x86_64               randconfig-x076-20230515   clang
x86_64               randconfig-x081-20230515   clang
x86_64               randconfig-x082-20230515   clang
x86_64               randconfig-x083-20230515   clang
x86_64               randconfig-x084-20230515   clang
x86_64               randconfig-x085-20230515   clang
x86_64               randconfig-x086-20230515   clang
x86_64               randconfig-x091-20230515   gcc  
x86_64               randconfig-x092-20230515   gcc  
x86_64               randconfig-x093-20230515   gcc  
x86_64               randconfig-x094-20230515   gcc  
x86_64               randconfig-x095-20230515   gcc  
x86_64               randconfig-x096-20230515   gcc  
x86_64                               rhel-8.3   gcc  
xtensa               randconfig-r025-20230515   gcc  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
