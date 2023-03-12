Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 07F5C6B630B
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 12 Mar 2023 04:26:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229557AbjCLD0N (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Sat, 11 Mar 2023 22:26:13 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48146 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229450AbjCLD0N (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sat, 11 Mar 2023 22:26:13 -0500
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 36AF334C28
        for <linux-renesas-soc@vger.kernel.org>; Sat, 11 Mar 2023 19:26:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1678591572; x=1710127572;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=HZnGlazUClZC0SwVDa8PhE0AdGsRj3R1NyloWhpE/X0=;
  b=JtnRJFRKwylg3bkWTNU4cTzAkKR6ZWZdBa1++b3aQQ4EnW5bM3ItDDiB
   KxLCtVw7oC5oeW5RgsLkw14itCzuqF/IQW+Lx9eQFS72iQkUjIPqDQThX
   PMB3l1QjgCPV0nGvHXUGZ8/GYyhRIwbJQ5M9NfFsZ5STK6Q4ygQdZrFSH
   v0shV79z/yhVR8+6eYlH785Xw95XUndSZtMeGS02e73D67l4CAWjjFQYO
   /uwaZbJ1y42M8mcHK3IfvAEZ3nzYsImL5/alEf6hTxVzny3QemvdLLoDs
   7Zf6r9cfPctdp5Q8xnbLrUIynK92LRrId3x/jr9tnaCUnbOBcQmQOtGmM
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10646"; a="335656008"
X-IronPort-AV: E=Sophos;i="5.98,253,1673942400"; 
   d="scan'208";a="335656008"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Mar 2023 19:26:11 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10646"; a="628242563"
X-IronPort-AV: E=Sophos;i="5.98,253,1673942400"; 
   d="scan'208";a="628242563"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga003.jf.intel.com with ESMTP; 11 Mar 2023 19:26:10 -0800
Received: from kbuild by b613635ddfff with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1pbCLZ-0004xP-1e;
        Sun, 12 Mar 2023 03:26:09 +0000
Date:   Sun, 12 Mar 2023 11:25:12 +0800
From:   kernel test robot <lkp@intel.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     linux-renesas-soc@vger.kernel.org
Subject: [geert-renesas-devel:next] BUILD SUCCESS
 cc8231630ee44792603a05386e094432f7415af4
Message-ID: <640d4618.9VM2MxXODx7FcQKK%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git next
branch HEAD: cc8231630ee44792603a05386e094432f7415af4  Merge branches 'renesas-arm-defconfig-for-v6.4', 'renesas-drivers-for-v6.4', 'renesas-dt-bindings-for-v6.4' and 'renesas-dts-for-v6.4' into renesas-next

elapsed time: 2005m

configs tested: 105
configs skipped: 10

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                            allyesconfig   gcc  
alpha                               defconfig   gcc  
alpha                randconfig-r003-20230310   gcc  
arc                              allyesconfig   gcc  
arc                                 defconfig   gcc  
arc                  randconfig-r005-20230310   gcc  
arc                  randconfig-r006-20230310   gcc  
arc                  randconfig-r043-20230310   gcc  
arm                              allmodconfig   gcc  
arm                              allyesconfig   gcc  
arm                                 defconfig   gcc  
arm                  randconfig-r046-20230310   clang
arm                        spear3xx_defconfig   clang
arm64                            allyesconfig   gcc  
arm64                               defconfig   gcc  
csky                                defconfig   gcc  
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
ia64                         bigsur_defconfig   gcc  
ia64                                defconfig   gcc  
loongarch                        allmodconfig   gcc  
loongarch                         allnoconfig   gcc  
loongarch                           defconfig   gcc  
loongarch            randconfig-r021-20230310   gcc  
loongarch            randconfig-r034-20230310   gcc  
m68k                             allmodconfig   gcc  
m68k         buildonly-randconfig-r003-20230310   gcc  
m68k                                defconfig   gcc  
m68k                 randconfig-r015-20230310   gcc  
m68k                 randconfig-r024-20230310   gcc  
microblaze           randconfig-r004-20230310   gcc  
microblaze           randconfig-r022-20230310   gcc  
mips                             allmodconfig   gcc  
mips                             allyesconfig   gcc  
nios2        buildonly-randconfig-r002-20230310   gcc  
nios2                               defconfig   gcc  
nios2                randconfig-r025-20230310   gcc  
openrisc             randconfig-r026-20230310   gcc  
openrisc                 simple_smp_defconfig   gcc  
parisc                              defconfig   gcc  
parisc               randconfig-r011-20230310   gcc  
parisc64                            defconfig   gcc  
powerpc                          allmodconfig   gcc  
powerpc                           allnoconfig   gcc  
powerpc                 mpc834x_itx_defconfig   gcc  
powerpc                     stx_gp3_defconfig   gcc  
powerpc                 xes_mpc85xx_defconfig   clang
riscv                            allmodconfig   gcc  
riscv                             allnoconfig   gcc  
riscv        buildonly-randconfig-r004-20230310   gcc  
riscv        buildonly-randconfig-r006-20230310   gcc  
riscv                               defconfig   gcc  
riscv                randconfig-r023-20230310   gcc  
riscv                randconfig-r042-20230310   gcc  
riscv                          rv32_defconfig   gcc  
s390                             allmodconfig   gcc  
s390                             allyesconfig   gcc  
s390                                defconfig   gcc  
s390                 randconfig-r044-20230310   gcc  
sh                               allmodconfig   gcc  
sh                         apsh4a3a_defconfig   gcc  
sh                            hp6xx_defconfig   gcc  
sh                   randconfig-r002-20230310   gcc  
sh                   randconfig-r014-20230310   gcc  
sparc        buildonly-randconfig-r005-20230310   gcc  
sparc                               defconfig   gcc  
sparc                randconfig-r016-20230310   gcc  
sparc64              randconfig-r032-20230310   gcc  
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
xtensa               randconfig-r035-20230310   gcc  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
