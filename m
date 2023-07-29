Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E1157767FB8
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 29 Jul 2023 15:50:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230452AbjG2Nuf (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Sat, 29 Jul 2023 09:50:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45292 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231368AbjG2Nub (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sat, 29 Jul 2023 09:50:31 -0400
Received: from mgamail.intel.com (unknown [192.55.52.93])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 70D5B10C6
        for <linux-renesas-soc@vger.kernel.org>; Sat, 29 Jul 2023 06:50:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1690638625; x=1722174625;
  h=date:from:to:cc:subject:message-id;
  bh=/vv1qwxCxyohmt3eq+wA0FsbVneEr/IdmYE06mxmp40=;
  b=a52AU95xV9mExMpQI5dVKUHOdkH3bo7LyCXXcHVVI3AoWhxB/eB9Z4KL
   42kpv12d8zfT3fN+dbJAa2kB3S6LEkieDvmL6a67MvD/ri8NsODjBY2zz
   9xCoutZ0k7sFOKQdKLzdwW1kKne7ePlyNcwUpmjWSSIczWyXo9Da9Mn4x
   HaTf3DNZfVn93114LmKEHKUXaGJVUqq36utbB20f+rraWUWwjmk8tp7I5
   O32Ze/NxpZzYr2lAXhhFdTpQ2q/I7Kn6HufcxZp0fOFqtIxt0O8VbOHUW
   9RT+FDjr6HZ8dj+ZG00IvQluH5ZrTSNcsXRpWNZmlGbG8bW3UjotU7u52
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10786"; a="366232437"
X-IronPort-AV: E=Sophos;i="6.01,240,1684825200"; 
   d="scan'208";a="366232437"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Jul 2023 06:49:18 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.01,202,1684825200"; 
   d="scan'208";a="871129475"
Received: from lkp-server02.sh.intel.com (HELO 953e8cd98f7d) ([10.239.97.151])
  by fmsmga001.fm.intel.com with ESMTP; 29 Jul 2023 06:49:19 -0700
Received: from kbuild by 953e8cd98f7d with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1qPkJU-00043b-1O;
        Sat, 29 Jul 2023 13:49:05 +0000
Date:   Sat, 29 Jul 2023 21:48:28 +0800
From:   kernel test robot <lkp@intel.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     linux-renesas-soc@vger.kernel.org
Subject: [geert-renesas-drivers:topic/renesas-overlays-v6.5-rc1]
 BUILD SUCCESS 57e72fc601884805fcc4a4c2c43051d10449ef91
Message-ID: <202307292126.F9JBydIM-lkp@intel.com>
User-Agent: s-nail v14.9.24
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,
        URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git topic/renesas-overlays-v6.5-rc1
branch HEAD: 57e72fc601884805fcc4a4c2c43051d10449ef91  arm64: dts: renesas: whitehawk-cpu: Add overlay for CP97/98

elapsed time: 1444m

configs tested: 123
configs skipped: 5

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                            allyesconfig   gcc  
alpha                               defconfig   gcc  
alpha                randconfig-r013-20230728   gcc  
alpha                randconfig-r021-20230727   gcc  
alpha                randconfig-r036-20230728   gcc  
arc                              allyesconfig   gcc  
arc                                 defconfig   gcc  
arc                  randconfig-r011-20230728   gcc  
arc                  randconfig-r043-20230728   gcc  
arm                              allmodconfig   gcc  
arm                              allyesconfig   gcc  
arm                                 defconfig   gcc  
arm                  randconfig-r006-20230728   clang
arm                  randconfig-r013-20230728   gcc  
arm                  randconfig-r046-20230728   gcc  
arm64                            allyesconfig   gcc  
arm64                               defconfig   gcc  
csky                                defconfig   gcc  
csky                 randconfig-r034-20230728   gcc  
csky                 randconfig-r035-20230728   gcc  
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
i386                 randconfig-r014-20230728   clang
i386                 randconfig-r022-20230727   gcc  
loongarch                        allmodconfig   gcc  
loongarch                         allnoconfig   gcc  
loongarch                           defconfig   gcc  
loongarch            randconfig-r003-20230728   gcc  
m68k                             allmodconfig   gcc  
m68k                             allyesconfig   gcc  
m68k                                defconfig   gcc  
m68k                 randconfig-r002-20230728   gcc  
m68k                 randconfig-r003-20230728   gcc  
m68k                 randconfig-r031-20230728   gcc  
microblaze           randconfig-r001-20230728   gcc  
microblaze           randconfig-r012-20230728   gcc  
microblaze           randconfig-r025-20230727   gcc  
mips                             allmodconfig   gcc  
mips                             allyesconfig   gcc  
mips                 randconfig-r004-20230728   clang
mips                 randconfig-r006-20230728   clang
nios2                               defconfig   gcc  
nios2                randconfig-r005-20230728   gcc  
nios2                randconfig-r031-20230728   gcc  
nios2                randconfig-r036-20230728   gcc  
openrisc             randconfig-r002-20230728   gcc  
openrisc             randconfig-r016-20230728   gcc  
parisc                           allyesconfig   gcc  
parisc                              defconfig   gcc  
parisc64                            defconfig   gcc  
powerpc                          allmodconfig   gcc  
powerpc                           allnoconfig   gcc  
riscv                            allmodconfig   gcc  
riscv                             allnoconfig   gcc  
riscv                            allyesconfig   gcc  
riscv                               defconfig   gcc  
riscv                randconfig-r004-20230728   gcc  
riscv                randconfig-r005-20230728   gcc  
riscv                randconfig-r042-20230728   clang
riscv                          rv32_defconfig   gcc  
s390                             allmodconfig   gcc  
s390                             allyesconfig   gcc  
s390                                defconfig   gcc  
s390                 randconfig-r011-20230728   clang
s390                 randconfig-r014-20230728   clang
s390                 randconfig-r032-20230728   gcc  
s390                 randconfig-r044-20230728   clang
sh                               allmodconfig   gcc  
sh                   randconfig-r012-20230728   gcc  
sh                   randconfig-r024-20230727   gcc  
sh                   randconfig-r034-20230728   gcc  
sparc                            allyesconfig   gcc  
sparc                               defconfig   gcc  
sparc64              randconfig-r015-20230728   gcc  
sparc64              randconfig-r016-20230728   gcc  
um                               allmodconfig   clang
um                                allnoconfig   clang
um                               allyesconfig   clang
um                                  defconfig   gcc  
um                             i386_defconfig   gcc  
um                   randconfig-r015-20230728   gcc  
um                           x86_64_defconfig   gcc  
x86_64                           allyesconfig   gcc  
x86_64       buildonly-randconfig-r001-20230728   gcc  
x86_64       buildonly-randconfig-r002-20230728   gcc  
x86_64       buildonly-randconfig-r003-20230728   gcc  
x86_64                              defconfig   gcc  
x86_64                                  kexec   gcc  
x86_64               randconfig-r033-20230728   gcc  
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
xtensa               randconfig-r026-20230727   gcc  
xtensa               randconfig-r035-20230728   gcc  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
