Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8FE5D6B58D2
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 11 Mar 2023 07:02:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229603AbjCKGCr (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Sat, 11 Mar 2023 01:02:47 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54856 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229927AbjCKGCr (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sat, 11 Mar 2023 01:02:47 -0500
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D82CF12B67E
        for <linux-renesas-soc@vger.kernel.org>; Fri, 10 Mar 2023 22:02:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1678514565; x=1710050565;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=DokmCq6A38Mvf8LjMZCV7j19Ujt/Z70CTdElf++Jdy8=;
  b=H6TcV092TNpdZIA/6NBV05ZEs3PhQxTXJR605CPqY7a7Az1ErwQG8Cmw
   tqBSyTXXAunoylSn9MsY9hlaDFgO4SYX4A4nu+yA+TBlPBH9cM/z7Mi+O
   hjwiGsEZG5K8rUT2T2hsJOaRGxepwJx8ErG+B4W25sPQwebq1VRAASmEX
   ewOvBcdrTMY4efbhLQGtkt/ZyZhARDGjNHuL5meHZahxPxpTjhw3zpJK4
   jgtA4exN1j3NfBo0oT+kFyV1N94KYG77y8esu6HRF/dVlbSbyupzAZWgB
   1BORfR5K9LEU/4t/jqKDhdQAvNYmh0kfSMbkLB/HvwCkWWaRrYqEOK1Su
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10645"; a="338437529"
X-IronPort-AV: E=Sophos;i="5.98,252,1673942400"; 
   d="scan'208";a="338437529"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Mar 2023 22:02:43 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10645"; a="923935502"
X-IronPort-AV: E=Sophos;i="5.98,252,1673942400"; 
   d="scan'208";a="923935502"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by fmsmga006.fm.intel.com with ESMTP; 10 Mar 2023 22:02:42 -0800
Received: from kbuild by b613635ddfff with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1pasJV-0004NL-2T;
        Sat, 11 Mar 2023 06:02:41 +0000
Date:   Sat, 11 Mar 2023 14:02:39 +0800
From:   kernel test robot <lkp@intel.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     linux-renesas-soc@vger.kernel.org
Subject: [geert-renesas-drivers:renesas-pinctrl-for-v6.4] BUILD SUCCESS
 47ea7ff19f0bedba4209a641bca60e0ef6fdabc0
Message-ID: <640c197f.dnDPioS+FqdHh9lQ%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,
        URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git renesas-pinctrl-for-v6.4
branch HEAD: 47ea7ff19f0bedba4209a641bca60e0ef6fdabc0  pinctrl: renesas: Remove R-Car H3 ES1.* handling

elapsed time: 722m

configs tested: 121
configs skipped: 14

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                            allyesconfig   gcc  
alpha                               defconfig   gcc  
alpha                randconfig-r035-20230310   gcc  
alpha                randconfig-r036-20230310   gcc  
arc                              allyesconfig   gcc  
arc          buildonly-randconfig-r006-20230310   gcc  
arc                                 defconfig   gcc  
arc                  randconfig-r043-20230310   gcc  
arm                              allmodconfig   gcc  
arm                              allyesconfig   gcc  
arm          buildonly-randconfig-r004-20230310   clang
arm                                 defconfig   gcc  
arm                  randconfig-r046-20230310   clang
arm64                            allyesconfig   gcc  
arm64                               defconfig   gcc  
arm64                randconfig-r001-20230310   clang
arm64                randconfig-r011-20230310   gcc  
csky                                defconfig   gcc  
csky                 randconfig-r026-20230310   gcc  
csky                 randconfig-r032-20230310   gcc  
csky                 randconfig-r035-20230310   gcc  
hexagon              randconfig-r003-20230310   clang
hexagon              randconfig-r036-20230310   clang
hexagon              randconfig-r041-20230310   clang
hexagon              randconfig-r045-20230310   clang
i386                             allyesconfig   gcc  
i386                              debian-10.3   gcc  
i386                                defconfig   gcc  
i386                          randconfig-a001   gcc  
i386                          randconfig-a002   clang
i386                          randconfig-a003   gcc  
i386                          randconfig-a004   clang
i386                          randconfig-a005   gcc  
i386                          randconfig-a006   clang
i386                          randconfig-a011   clang
i386                          randconfig-a012   gcc  
i386                          randconfig-a013   clang
i386                          randconfig-a014   gcc  
i386                          randconfig-a015   clang
i386                          randconfig-a016   gcc  
ia64                             allmodconfig   gcc  
ia64         buildonly-randconfig-r001-20230310   gcc  
ia64                                defconfig   gcc  
ia64                 randconfig-r006-20230310   gcc  
ia64                 randconfig-r014-20230310   gcc  
ia64                 randconfig-r034-20230310   gcc  
loongarch                        allmodconfig   gcc  
loongarch                         allnoconfig   gcc  
loongarch                           defconfig   gcc  
loongarch            randconfig-r016-20230310   gcc  
m68k                             allmodconfig   gcc  
m68k         buildonly-randconfig-r004-20230310   gcc  
m68k                                defconfig   gcc  
m68k                 randconfig-r015-20230310   gcc  
m68k                 randconfig-r033-20230310   gcc  
m68k                 randconfig-r034-20230310   gcc  
microblaze           randconfig-r005-20230310   gcc  
microblaze           randconfig-r031-20230310   gcc  
mips                             allmodconfig   gcc  
mips                             allyesconfig   gcc  
mips         buildonly-randconfig-r005-20230310   gcc  
nios2                               defconfig   gcc  
nios2                randconfig-r002-20230310   gcc  
nios2                randconfig-r022-20230310   gcc  
openrisc             randconfig-r003-20230310   gcc  
openrisc             randconfig-r023-20230310   gcc  
openrisc             randconfig-r025-20230310   gcc  
parisc       buildonly-randconfig-r001-20230310   gcc  
parisc                              defconfig   gcc  
parisc               randconfig-r005-20230310   gcc  
parisc               randconfig-r011-20230310   gcc  
parisc               randconfig-r031-20230310   gcc  
parisc64                            defconfig   gcc  
powerpc                          allmodconfig   gcc  
powerpc                           allnoconfig   gcc  
powerpc      buildonly-randconfig-r003-20230310   gcc  
powerpc              randconfig-r021-20230310   gcc  
riscv                            allmodconfig   gcc  
riscv                             allnoconfig   gcc  
riscv        buildonly-randconfig-r003-20230310   gcc  
riscv                               defconfig   gcc  
riscv                randconfig-r001-20230310   clang
riscv                randconfig-r042-20230310   gcc  
riscv                          rv32_defconfig   gcc  
s390                             allmodconfig   gcc  
s390                             allyesconfig   gcc  
s390         buildonly-randconfig-r006-20230310   gcc  
s390                                defconfig   gcc  
s390                 randconfig-r012-20230310   gcc  
s390                 randconfig-r013-20230310   gcc  
s390                 randconfig-r044-20230310   gcc  
sh                               allmodconfig   gcc  
sh                   randconfig-r014-20230310   gcc  
sh                   randconfig-r015-20230310   gcc  
sh                   randconfig-r024-20230310   gcc  
sparc                               defconfig   gcc  
sparc                randconfig-r016-20230310   gcc  
sparc64      buildonly-randconfig-r002-20230310   gcc  
sparc64              randconfig-r002-20230310   gcc  
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
x86_64                        randconfig-a011   gcc  
x86_64                        randconfig-a012   clang
x86_64                        randconfig-a013   gcc  
x86_64                        randconfig-a014   clang
x86_64                        randconfig-a015   gcc  
x86_64                        randconfig-a016   clang
x86_64                               rhel-8.3   gcc  
xtensa               randconfig-r022-20230310   gcc  
xtensa               randconfig-r025-20230310   gcc  
xtensa               randconfig-r026-20230310   gcc  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
