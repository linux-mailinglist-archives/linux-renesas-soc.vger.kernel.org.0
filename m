Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D570C6B594E
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 11 Mar 2023 08:30:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229473AbjCKHat (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Sat, 11 Mar 2023 02:30:49 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36868 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229801AbjCKHas (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sat, 11 Mar 2023 02:30:48 -0500
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 10A8C12143E
        for <linux-renesas-soc@vger.kernel.org>; Fri, 10 Mar 2023 23:30:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1678519847; x=1710055847;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=z8o+b99luONI8PPBnfHql7VGGe59tnJ2uBRHTarvlzM=;
  b=N4nmCl0TkOJwXo2kf+uTDfCaa47Ht63IWQUe/TgFefMNc82NdAIeXdKV
   8WMZcGcGUcleRa68dwp5vJk9IUiciyu1jQeDvSQkpQ2Eih7LfB5TwHzE1
   FXAXgQzKcpJ79mEmlDe/ZBdxKaCQRtTnPUB3wEksBS1z+TjBbNHcyJsW2
   ppXw9WiEd2tE2M04GGhowUMTcOn/ojS07zqTQ+wr7I0zZbcBE+xZFEHOQ
   3rjbRKZUs+MpiDVOQtJNoEt1ybCjJPCAYjvOMsxW4JDSakFuns5sQEGH5
   GAPG9s6HHG89lvFqrsKA4tJrkQifNJbF2Ic/s1wioh7vRaGVF+w6Lzy1A
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10645"; a="338441519"
X-IronPort-AV: E=Sophos;i="5.98,252,1673942400"; 
   d="scan'208";a="338441519"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Mar 2023 23:30:46 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10645"; a="767114856"
X-IronPort-AV: E=Sophos;i="5.98,252,1673942400"; 
   d="scan'208";a="767114856"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by FMSMGA003.fm.intel.com with ESMTP; 10 Mar 2023 23:30:45 -0800
Received: from kbuild by b613635ddfff with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1patgi-0004Qr-1P;
        Sat, 11 Mar 2023 07:30:44 +0000
Date:   Sat, 11 Mar 2023 15:30:21 +0800
From:   kernel test robot <lkp@intel.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     linux-renesas-soc@vger.kernel.org
Subject: [geert-renesas-drivers:renesas-clk] BUILD SUCCESS
 1ef48138f90785ba7091fb8fa317039cd3cf9494
Message-ID: <640c2e0d.c0TJG/TrcsBA1BeS%lkp@intel.com>
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

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git renesas-clk
branch HEAD: 1ef48138f90785ba7091fb8fa317039cd3cf9494  clk: renesas: r9a06g032: Improve clock tables

elapsed time: 811m

configs tested: 123
configs skipped: 12

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                            allyesconfig   gcc  
alpha                               defconfig   gcc  
alpha                randconfig-r003-20230310   gcc  
alpha                randconfig-r016-20230310   gcc  
alpha                randconfig-r036-20230310   gcc  
arc                              allyesconfig   gcc  
arc                                 defconfig   gcc  
arc                  randconfig-r001-20230310   gcc  
arc                  randconfig-r014-20230310   gcc  
arc                  randconfig-r032-20230310   gcc  
arc                  randconfig-r043-20230310   gcc  
arm                              allmodconfig   gcc  
arm                              allyesconfig   gcc  
arm                                 defconfig   gcc  
arm                  randconfig-r036-20230310   gcc  
arm                  randconfig-r046-20230310   clang
arm64                            allyesconfig   gcc  
arm64        buildonly-randconfig-r003-20230310   clang
arm64                               defconfig   gcc  
csky                                defconfig   gcc  
csky                 randconfig-r001-20230310   gcc  
csky                 randconfig-r015-20230310   gcc  
csky                 randconfig-r035-20230310   gcc  
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
ia64                                defconfig   gcc  
ia64                 randconfig-r034-20230310   gcc  
loongarch                        allmodconfig   gcc  
loongarch                         allnoconfig   gcc  
loongarch    buildonly-randconfig-r002-20230310   gcc  
loongarch                           defconfig   gcc  
loongarch            randconfig-r005-20230310   gcc  
loongarch            randconfig-r021-20230310   gcc  
m68k                             allmodconfig   gcc  
m68k                                defconfig   gcc  
m68k                 randconfig-r024-20230310   gcc  
microblaze           randconfig-r006-20230310   gcc  
microblaze           randconfig-r022-20230310   gcc  
microblaze           randconfig-r035-20230310   gcc  
mips                             allmodconfig   gcc  
mips                             allyesconfig   gcc  
mips                 randconfig-r012-20230310   clang
nios2        buildonly-randconfig-r004-20230310   gcc  
nios2                               defconfig   gcc  
nios2                randconfig-r004-20230310   gcc  
nios2                randconfig-r005-20230310   gcc  
nios2                randconfig-r025-20230310   gcc  
openrisc     buildonly-randconfig-r001-20230310   gcc  
openrisc     buildonly-randconfig-r003-20230310   gcc  
openrisc     buildonly-randconfig-r004-20230310   gcc  
openrisc             randconfig-r003-20230310   gcc  
openrisc             randconfig-r023-20230310   gcc  
openrisc             randconfig-r026-20230310   gcc  
parisc                              defconfig   gcc  
parisc               randconfig-r004-20230310   gcc  
parisc               randconfig-r011-20230310   gcc  
parisc               randconfig-r015-20230310   gcc  
parisc               randconfig-r031-20230310   gcc  
parisc64                            defconfig   gcc  
powerpc                          allmodconfig   gcc  
powerpc                           allnoconfig   gcc  
powerpc              randconfig-r002-20230310   clang
powerpc              randconfig-r012-20230310   gcc  
powerpc              randconfig-r033-20230310   clang
riscv                            allmodconfig   gcc  
riscv                             allnoconfig   gcc  
riscv        buildonly-randconfig-r005-20230310   gcc  
riscv                               defconfig   gcc  
riscv                randconfig-r023-20230310   gcc  
riscv                randconfig-r042-20230310   gcc  
riscv                          rv32_defconfig   gcc  
s390                             allmodconfig   gcc  
s390                             allyesconfig   gcc  
s390         buildonly-randconfig-r001-20230310   gcc  
s390                                defconfig   gcc  
s390                 randconfig-r034-20230310   clang
s390                 randconfig-r044-20230310   gcc  
sh                               allmodconfig   gcc  
sh                   randconfig-r013-20230310   gcc  
sh                   randconfig-r024-20230310   gcc  
sparc                               defconfig   gcc  
sparc                randconfig-r014-20230310   gcc  
sparc64              randconfig-r011-20230310   gcc  
sparc64              randconfig-r031-20230310   gcc  
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
xtensa               randconfig-r002-20230310   gcc  
xtensa               randconfig-r022-20230310   gcc  
xtensa               randconfig-r025-20230310   gcc  
xtensa               randconfig-r026-20230310   gcc  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
