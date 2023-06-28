Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C2E1374076E
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 28 Jun 2023 03:07:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229488AbjF1BHd (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 27 Jun 2023 21:07:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41264 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229459AbjF1BHc (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 27 Jun 2023 21:07:32 -0400
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7CE19E5B
        for <linux-renesas-soc@vger.kernel.org>; Tue, 27 Jun 2023 18:07:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1687914451; x=1719450451;
  h=date:from:to:cc:subject:message-id;
  bh=LUaDmzpGQZWxoQ4x2Qsd1qlwaYH+aD+FcGuEMPqDHCw=;
  b=M41KphL5f9xf3slznaXhYZ0s2eGolkXDkBQFm9o0E5lOt4eoT7/cLUXT
   1hAaGcxEfhcGsHHeUUD8m8cfisQ/+GkTpooQPY/0Pv/UPbUkAlgc4Y9rt
   AG5C9AfMkyDy4I4aJ+5vp+GXpyWnMQJhRHIMQqo/X05lLSoAaLfoskWBG
   6ycUdPcg4TWMkY29FSJmOu2jGsCtN/9PzgHdAkY+g/AqBOii1zbLkzVgT
   7M6OyOqEpb+afqMfSmZJ34F02NGvmYUxL6MsfCU7qKaL6EaNW+6225Raw
   WEp9Xv0HeTT+9qyD3bcV/uhHYTa+Ebr3nXd6itbBS3cn4qEfjXB56G5Qw
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10754"; a="392395072"
X-IronPort-AV: E=Sophos;i="6.01,164,1684825200"; 
   d="scan'208";a="392395072"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jun 2023 18:07:30 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10754"; a="694095729"
X-IronPort-AV: E=Sophos;i="6.01,164,1684825200"; 
   d="scan'208";a="694095729"
Received: from lkp-server01.sh.intel.com (HELO 783282924a45) ([10.239.97.150])
  by orsmga006.jf.intel.com with ESMTP; 27 Jun 2023 18:07:29 -0700
Received: from kbuild by 783282924a45 with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1qEJeb-000CQD-00;
        Wed, 28 Jun 2023 01:07:29 +0000
Date:   Wed, 28 Jun 2023 09:07:25 +0800
From:   kernel test robot <lkp@intel.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     linux-renesas-soc@vger.kernel.org
Subject: [geert-renesas-drivers:master] BUILD SUCCESS
 8cedb76bc309ad1c334b7a410f51e61332933c14
Message-ID: <202306280924.ik7bh9DK-lkp@intel.com>
User-Agent: s-nail v14.9.24
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git master
branch HEAD: 8cedb76bc309ad1c334b7a410f51e61332933c14  [LOCAL] arm64: renesas: defconfig: Update renesas_defconfig

elapsed time: 726m

configs tested: 124
configs skipped: 5

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                            alldefconfig   gcc  
alpha                            allyesconfig   gcc  
alpha                               defconfig   gcc  
alpha                randconfig-r012-20230627   gcc  
arc                              alldefconfig   gcc  
arc                              allyesconfig   gcc  
arc                                 defconfig   gcc  
arc                  randconfig-r043-20230627   gcc  
arm                              allmodconfig   gcc  
arm                              allyesconfig   gcc  
arm                     davinci_all_defconfig   clang
arm                                 defconfig   gcc  
arm                       imx_v4_v5_defconfig   clang
arm                         lpc32xx_defconfig   clang
arm                  randconfig-r003-20230627   clang
arm                  randconfig-r036-20230627   clang
arm                  randconfig-r046-20230627   gcc  
arm                           sama7_defconfig   clang
arm                          sp7021_defconfig   clang
arm64                            allyesconfig   gcc  
arm64                               defconfig   gcc  
arm64                randconfig-r013-20230627   clang
arm64                randconfig-r023-20230627   clang
csky                                defconfig   gcc  
hexagon              randconfig-r041-20230627   clang
hexagon              randconfig-r045-20230627   clang
i386                             allyesconfig   gcc  
i386         buildonly-randconfig-r004-20230627   gcc  
i386         buildonly-randconfig-r005-20230627   gcc  
i386         buildonly-randconfig-r006-20230627   gcc  
i386                              debian-10.3   gcc  
i386                                defconfig   gcc  
i386                 randconfig-i001-20230627   gcc  
i386                 randconfig-i002-20230627   gcc  
i386                 randconfig-i003-20230627   gcc  
i386                 randconfig-i004-20230627   gcc  
i386                 randconfig-i005-20230627   gcc  
i386                 randconfig-i006-20230627   gcc  
i386                 randconfig-i011-20230627   clang
i386                 randconfig-i012-20230627   clang
i386                 randconfig-i013-20230627   clang
i386                 randconfig-i014-20230627   clang
i386                 randconfig-i015-20230627   clang
i386                 randconfig-i016-20230627   clang
i386                 randconfig-r031-20230627   gcc  
loongarch                        allmodconfig   gcc  
loongarch                         allnoconfig   gcc  
loongarch                           defconfig   gcc  
m68k                             allmodconfig   gcc  
m68k                             allyesconfig   gcc  
m68k                                defconfig   gcc  
m68k                 randconfig-r015-20230627   gcc  
m68k                 randconfig-r032-20230627   gcc  
microblaze           randconfig-r005-20230627   gcc  
microblaze           randconfig-r022-20230627   gcc  
microblaze           randconfig-r026-20230627   gcc  
mips                             allmodconfig   gcc  
mips                             allyesconfig   gcc  
mips                           ip32_defconfig   gcc  
mips                 randconfig-r001-20230627   clang
mips                 randconfig-r011-20230627   gcc  
nios2                               defconfig   gcc  
openrisc             randconfig-r025-20230627   gcc  
openrisc                       virt_defconfig   gcc  
parisc                           allyesconfig   gcc  
parisc                              defconfig   gcc  
parisc64                            defconfig   gcc  
powerpc                          allmodconfig   gcc  
powerpc                           allnoconfig   gcc  
powerpc                     ep8248e_defconfig   gcc  
powerpc                       holly_defconfig   gcc  
powerpc                     kilauea_defconfig   clang
powerpc                    klondike_defconfig   gcc  
powerpc                   lite5200b_defconfig   clang
powerpc              randconfig-r033-20230627   gcc  
riscv                            allmodconfig   gcc  
riscv                             allnoconfig   gcc  
riscv                            allyesconfig   gcc  
riscv                               defconfig   gcc  
riscv                randconfig-r014-20230627   clang
riscv                randconfig-r042-20230627   clang
riscv                          rv32_defconfig   gcc  
s390                             allmodconfig   gcc  
s390                             allyesconfig   gcc  
s390                                defconfig   gcc  
s390                 randconfig-r044-20230627   clang
sh                               allmodconfig   gcc  
sh                        dreamcast_defconfig   gcc  
sh                             espt_defconfig   gcc  
sh                   randconfig-r021-20230627   gcc  
sh                   randconfig-r024-20230627   gcc  
sh                           se7751_defconfig   gcc  
sh                        sh7757lcr_defconfig   gcc  
sparc                            allyesconfig   gcc  
sparc                               defconfig   gcc  
sparc                randconfig-r004-20230627   gcc  
um                               allmodconfig   clang
um                                allnoconfig   clang
um                               allyesconfig   clang
um                                  defconfig   gcc  
um                             i386_defconfig   gcc  
um                   randconfig-r035-20230627   clang
um                           x86_64_defconfig   gcc  
x86_64                           allyesconfig   gcc  
x86_64       buildonly-randconfig-r001-20230627   gcc  
x86_64       buildonly-randconfig-r002-20230627   gcc  
x86_64       buildonly-randconfig-r003-20230627   gcc  
x86_64                              defconfig   gcc  
x86_64                                  kexec   gcc  
x86_64               randconfig-r002-20230627   gcc  
x86_64               randconfig-x001-20230627   clang
x86_64               randconfig-x002-20230627   clang
x86_64               randconfig-x003-20230627   clang
x86_64               randconfig-x004-20230627   clang
x86_64               randconfig-x005-20230627   clang
x86_64               randconfig-x006-20230627   clang
x86_64               randconfig-x011-20230627   gcc  
x86_64               randconfig-x012-20230627   gcc  
x86_64               randconfig-x013-20230627   gcc  
x86_64               randconfig-x014-20230627   gcc  
x86_64               randconfig-x015-20230627   gcc  
x86_64               randconfig-x016-20230627   gcc  
x86_64                          rhel-8.3-rust   clang
x86_64                               rhel-8.3   gcc  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
