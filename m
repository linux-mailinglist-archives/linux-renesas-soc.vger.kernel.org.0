Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AA84D6C2412
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 20 Mar 2023 22:48:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229610AbjCTVsW (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 20 Mar 2023 17:48:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60590 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229529AbjCTVsV (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 20 Mar 2023 17:48:21 -0400
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BB546132CE
        for <linux-renesas-soc@vger.kernel.org>; Mon, 20 Mar 2023 14:48:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1679348892; x=1710884892;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=BBCSg5/DklNsatorD2Nrmh78FHGOcFFQ6v0vvScAkT4=;
  b=NIa6bO8NYbg0TD73CepKq7fv3WiX2GRUyGbuwlzRnJY5s6+OZdq4CXNe
   zlQ7wSd4zYbJdQ02JVHRi9ktyewcpkEt0Hc+kfrcHOblfSRsT9DnoF5Js
   NeNwXhXsGQKCROnZG8D2TiMR1ZqUlL6z0XFzQmZrWs7ArR6tKLk+EQLIv
   bgi41NDcwnyGvSpvr2Y7sz+Hlyr7huN9olaPZ8nkJBJTkzF07rPShb7Qn
   8/fv1cBI1Si+g3Ih1Vs0drPXHKGYUuJ0J4eGWzywxJQie8VEXZCqx9Nx5
   zOjho451wj0BA32PvxUsqp1WQiEy4tkpba3+eNWaoeH+cNCVsRDRJyICK
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10655"; a="403659652"
X-IronPort-AV: E=Sophos;i="5.98,276,1673942400"; 
   d="scan'208";a="403659652"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Mar 2023 14:48:00 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10655"; a="745565251"
X-IronPort-AV: E=Sophos;i="5.98,276,1673942400"; 
   d="scan'208";a="745565251"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by fmsmga008.fm.intel.com with ESMTP; 20 Mar 2023 14:47:58 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1peNME-000BLI-0A;
        Mon, 20 Mar 2023 21:47:58 +0000
Date:   Tue, 21 Mar 2023 05:47:21 +0800
From:   kernel test robot <lkp@intel.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     linux-renesas-soc@vger.kernel.org
Subject: [geert-renesas-devel:master] BUILD SUCCESS
 66c91e0a046e821d0a1f6ba6f95fe72ebd67960d
Message-ID: <6418d469.O9gvSJVygMFKJ9D8%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git master
branch HEAD: 66c91e0a046e821d0a1f6ba6f95fe72ebd67960d  Merge tag 'v6.3-rc3' into renesas-devel

elapsed time: 723m

configs tested: 135
configs skipped: 9

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                            allyesconfig   gcc  
alpha        buildonly-randconfig-r005-20230319   gcc  
alpha                               defconfig   gcc  
alpha                randconfig-r012-20230320   gcc  
arc                              allyesconfig   gcc  
arc                                 defconfig   gcc  
arc                  randconfig-r015-20230320   gcc  
arc                  randconfig-r022-20230313   gcc  
arc                  randconfig-r024-20230312   gcc  
arc                  randconfig-r043-20230319   gcc  
arm                              allmodconfig   gcc  
arm                              allyesconfig   gcc  
arm                                 defconfig   gcc  
arm                  randconfig-r046-20230319   gcc  
arm                  randconfig-r046-20230320   clang
arm64                            allyesconfig   gcc  
arm64                               defconfig   gcc  
arm64                randconfig-r001-20230320   clang
arm64                randconfig-r023-20230312   gcc  
arm64                randconfig-r034-20230320   clang
csky                                defconfig   gcc  
csky                 randconfig-r006-20230320   gcc  
csky                 randconfig-r012-20230319   gcc  
csky                 randconfig-r022-20230312   gcc  
hexagon      buildonly-randconfig-r001-20230319   clang
hexagon              randconfig-r001-20230319   clang
hexagon              randconfig-r016-20230319   clang
hexagon              randconfig-r024-20230313   clang
hexagon              randconfig-r026-20230320   clang
hexagon              randconfig-r041-20230319   clang
hexagon              randconfig-r041-20230320   clang
hexagon              randconfig-r045-20230319   clang
hexagon              randconfig-r045-20230320   clang
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
i386                 randconfig-r035-20230320   clang
ia64                             allmodconfig   gcc  
ia64         buildonly-randconfig-r003-20230319   gcc  
ia64                                defconfig   gcc  
ia64                 randconfig-r032-20230319   gcc  
ia64                 randconfig-r036-20230320   gcc  
loongarch                        allmodconfig   gcc  
loongarch                         allnoconfig   gcc  
loongarch                           defconfig   gcc  
loongarch            randconfig-r004-20230320   gcc  
m68k                             allmodconfig   gcc  
m68k                                defconfig   gcc  
m68k                 randconfig-r005-20230319   gcc  
m68k                 randconfig-r036-20230319   gcc  
microblaze           randconfig-r021-20230320   gcc  
microblaze           randconfig-r025-20230312   gcc  
microblaze           randconfig-r031-20230319   gcc  
mips                             allmodconfig   gcc  
mips                             allyesconfig   gcc  
mips                 randconfig-r005-20230320   gcc  
mips                 randconfig-r011-20230320   clang
mips                 randconfig-r013-20230319   gcc  
mips                 randconfig-r014-20230320   clang
mips                 randconfig-r021-20230312   clang
nios2                               defconfig   gcc  
nios2                randconfig-r003-20230319   gcc  
nios2                randconfig-r023-20230313   gcc  
nios2                randconfig-r032-20230320   gcc  
openrisc             randconfig-r001-20230319   gcc  
openrisc             randconfig-r002-20230319   gcc  
openrisc             randconfig-r034-20230319   gcc  
parisc                              defconfig   gcc  
parisc               randconfig-r004-20230319   gcc  
parisc               randconfig-r011-20230319   gcc  
parisc               randconfig-r015-20230319   gcc  
parisc64                            defconfig   gcc  
powerpc                          allmodconfig   gcc  
powerpc                           allnoconfig   gcc  
powerpc              randconfig-r013-20230320   gcc  
powerpc              randconfig-r026-20230312   gcc  
riscv                            allmodconfig   gcc  
riscv                             allnoconfig   gcc  
riscv                               defconfig   gcc  
riscv                randconfig-r006-20230319   gcc  
riscv                randconfig-r016-20230320   gcc  
riscv                randconfig-r042-20230319   clang
riscv                          rv32_defconfig   gcc  
s390                             allmodconfig   gcc  
s390                             allyesconfig   gcc  
s390                                defconfig   gcc  
s390                 randconfig-r014-20230319   clang
s390                 randconfig-r044-20230319   clang
sh                               allmodconfig   gcc  
sh           buildonly-randconfig-r004-20230319   gcc  
sh                   randconfig-r021-20230313   gcc  
sh                   randconfig-r022-20230320   gcc  
sh                   randconfig-r033-20230320   gcc  
sparc                               defconfig   gcc  
sparc                randconfig-r003-20230320   gcc  
sparc                randconfig-r004-20230319   gcc  
sparc                randconfig-r023-20230320   gcc  
sparc64              randconfig-r006-20230319   gcc  
sparc64              randconfig-r024-20230320   gcc  
sparc64              randconfig-r025-20230320   gcc  
sparc64              randconfig-r033-20230319   gcc  
um                             i386_defconfig   gcc  
um                           x86_64_defconfig   gcc  
x86_64                            allnoconfig   gcc  
x86_64                           allyesconfig   gcc  
x86_64                              defconfig   gcc  
x86_64                                  kexec   gcc  
x86_64               randconfig-a001-20230320   clang
x86_64               randconfig-a002-20230320   clang
x86_64               randconfig-a003-20230320   clang
x86_64               randconfig-a004-20230320   clang
x86_64               randconfig-a005-20230320   clang
x86_64               randconfig-a006-20230320   clang
x86_64                        randconfig-a011   gcc  
x86_64                        randconfig-a012   clang
x86_64                        randconfig-a013   gcc  
x86_64                        randconfig-a014   clang
x86_64                        randconfig-a015   gcc  
x86_64                        randconfig-a016   clang
x86_64               randconfig-r025-20230313   clang
x86_64                               rhel-8.3   gcc  
xtensa               randconfig-r002-20230320   gcc  
xtensa               randconfig-r035-20230319   gcc  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
