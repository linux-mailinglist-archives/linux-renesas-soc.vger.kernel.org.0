Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9FAD674E04A
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 10 Jul 2023 23:35:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231825AbjGJVfd (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 10 Jul 2023 17:35:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44064 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229814AbjGJVfc (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 10 Jul 2023 17:35:32 -0400
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C6B0C10D
        for <linux-renesas-soc@vger.kernel.org>; Mon, 10 Jul 2023 14:35:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1689024931; x=1720560931;
  h=date:from:to:cc:subject:message-id;
  bh=a+Ffk65HByjd2ykp1jBLudcPiiQJ4NuvQ3SUImRhmYQ=;
  b=mfKmEYzJkL43NYSaowh3PJ5SI32FT6mRHkD6Q0e1eo67bls1lOA3K1J4
   0y8wzkh878dOB9c8hwG8B/c8cE1+yrinxq8t+mIoh46O3LwmjRKwbXaQ+
   Krc4Rbb76huCQumeYr6ViQnAcvavsEGytwTskLMSbWqP8kHxX0ptQeOOL
   qJgV2+k0+WpELMWPbbQuExJH+WH8UBCvU6AbfnxYx+ou4Sz/UdF8Ozoi5
   N1m+vbtO+aX7jyB9eh6Cdnl6wfJxf5VyG5tV496DZQ6Po0EBw6j+HgjyJ
   uOVqpOAoiYaSAfQYGlNedR+uUIW3ZLJKjETE1v6UWg90xnCoV8H4YjqTP
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10767"; a="354323496"
X-IronPort-AV: E=Sophos;i="6.01,195,1684825200"; 
   d="scan'208";a="354323496"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jul 2023 14:35:30 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10767"; a="967557890"
X-IronPort-AV: E=Sophos;i="6.01,195,1684825200"; 
   d="scan'208";a="967557890"
Received: from lkp-server01.sh.intel.com (HELO c544d7fc5005) ([10.239.97.150])
  by fmsmga006.fm.intel.com with ESMTP; 10 Jul 2023 14:35:29 -0700
Received: from kbuild by c544d7fc5005 with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1qIyXY-00041r-2Q;
        Mon, 10 Jul 2023 21:35:28 +0000
Date:   Tue, 11 Jul 2023 05:35:04 +0800
From:   kernel test robot <lkp@intel.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     linux-renesas-soc@vger.kernel.org
Subject: [geert-renesas-devel:master] BUILD SUCCESS
 cef3836cf144ef3b5eca62d30b6b866f147aae17
Message-ID: <202307110502.cd8STUMR-lkp@intel.com>
User-Agent: s-nail v14.9.24
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        RCVD_IN_DNSWL_BLOCKED,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,
        SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git master
branch HEAD: cef3836cf144ef3b5eca62d30b6b866f147aae17  Merge branch 'renesas-next' into renesas-devel

elapsed time: 724m

configs tested: 128
configs skipped: 4

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                            allyesconfig   gcc  
alpha                               defconfig   gcc  
alpha                randconfig-r014-20230710   gcc  
alpha                randconfig-r032-20230710   gcc  
arc                              allyesconfig   gcc  
arc                                 defconfig   gcc  
arc                        nsimosci_defconfig   gcc  
arc                  randconfig-r015-20230710   gcc  
arc                  randconfig-r016-20230710   gcc  
arc                  randconfig-r043-20230710   gcc  
arm                              allmodconfig   gcc  
arm                              allyesconfig   gcc  
arm                       aspeed_g5_defconfig   gcc  
arm                          collie_defconfig   clang
arm                                 defconfig   gcc  
arm                          ep93xx_defconfig   clang
arm                          exynos_defconfig   gcc  
arm                           imxrt_defconfig   gcc  
arm                        multi_v5_defconfig   clang
arm                          pxa3xx_defconfig   gcc  
arm                  randconfig-r012-20230710   gcc  
arm                  randconfig-r046-20230710   gcc  
arm                           sama7_defconfig   clang
arm                           tegra_defconfig   gcc  
arm64                            allyesconfig   gcc  
arm64                               defconfig   gcc  
csky                                defconfig   gcc  
csky                 randconfig-r021-20230710   gcc  
hexagon              randconfig-r006-20230710   clang
hexagon              randconfig-r041-20230710   clang
hexagon              randconfig-r045-20230710   clang
i386                             allyesconfig   gcc  
i386         buildonly-randconfig-r004-20230710   gcc  
i386         buildonly-randconfig-r005-20230710   gcc  
i386         buildonly-randconfig-r006-20230710   gcc  
i386                              debian-10.3   gcc  
i386                                defconfig   gcc  
i386                 randconfig-i001-20230710   gcc  
i386                 randconfig-i002-20230710   gcc  
i386                 randconfig-i003-20230710   gcc  
i386                 randconfig-i004-20230710   gcc  
i386                 randconfig-i005-20230710   gcc  
i386                 randconfig-i006-20230710   gcc  
i386                 randconfig-i011-20230710   clang
i386                 randconfig-i012-20230710   clang
i386                 randconfig-i013-20230710   clang
i386                 randconfig-i014-20230710   clang
i386                 randconfig-i015-20230710   clang
i386                 randconfig-i016-20230710   clang
i386                 randconfig-r022-20230710   clang
i386                 randconfig-r033-20230710   gcc  
loongarch                        allmodconfig   gcc  
loongarch                         allnoconfig   gcc  
loongarch                           defconfig   gcc  
m68k                             allmodconfig   gcc  
m68k                             allyesconfig   gcc  
m68k                                defconfig   gcc  
m68k                       m5475evb_defconfig   gcc  
m68k                 randconfig-r001-20230710   gcc  
m68k                 randconfig-r004-20230710   gcc  
microblaze           randconfig-r026-20230710   gcc  
mips                             allmodconfig   gcc  
mips                             allyesconfig   gcc  
mips                         cobalt_defconfig   gcc  
mips                 randconfig-r034-20230710   clang
nios2                               defconfig   gcc  
openrisc                         alldefconfig   gcc  
openrisc             randconfig-r013-20230710   gcc  
parisc                           allyesconfig   gcc  
parisc                              defconfig   gcc  
parisc64                            defconfig   gcc  
powerpc                          allmodconfig   gcc  
powerpc                           allnoconfig   gcc  
powerpc                        cell_defconfig   gcc  
powerpc                  iss476-smp_defconfig   gcc  
powerpc                 mpc832x_rdb_defconfig   clang
powerpc                    mvme5100_defconfig   clang
powerpc                      ppc6xx_defconfig   gcc  
riscv                            allmodconfig   gcc  
riscv                             allnoconfig   gcc  
riscv                            allyesconfig   gcc  
riscv                               defconfig   gcc  
riscv                randconfig-r003-20230710   gcc  
riscv                randconfig-r042-20230710   clang
riscv                          rv32_defconfig   gcc  
s390                             allmodconfig   gcc  
s390                             allyesconfig   gcc  
s390                                defconfig   gcc  
s390                 randconfig-r025-20230710   clang
s390                 randconfig-r031-20230710   gcc  
s390                 randconfig-r044-20230710   clang
sh                               allmodconfig   gcc  
sh                 kfr2r09-romimage_defconfig   gcc  
sh                   randconfig-r011-20230710   gcc  
sparc                            allyesconfig   gcc  
sparc                               defconfig   gcc  
sparc64              randconfig-r002-20230710   gcc  
um                               allmodconfig   clang
um                                allnoconfig   clang
um                               allyesconfig   clang
um                                  defconfig   gcc  
um                             i386_defconfig   gcc  
um                   randconfig-r005-20230710   clang
um                   randconfig-r023-20230710   gcc  
um                           x86_64_defconfig   gcc  
x86_64                           allyesconfig   gcc  
x86_64       buildonly-randconfig-r001-20230710   gcc  
x86_64       buildonly-randconfig-r002-20230710   gcc  
x86_64       buildonly-randconfig-r003-20230710   gcc  
x86_64                              defconfig   gcc  
x86_64                                  kexec   gcc  
x86_64               randconfig-x001-20230710   clang
x86_64               randconfig-x002-20230710   clang
x86_64               randconfig-x003-20230710   clang
x86_64               randconfig-x004-20230710   clang
x86_64               randconfig-x005-20230710   clang
x86_64               randconfig-x006-20230710   clang
x86_64               randconfig-x011-20230710   gcc  
x86_64               randconfig-x012-20230710   gcc  
x86_64               randconfig-x013-20230710   gcc  
x86_64               randconfig-x014-20230710   gcc  
x86_64               randconfig-x015-20230710   gcc  
x86_64               randconfig-x016-20230710   gcc  
x86_64                          rhel-8.3-rust   clang
x86_64                               rhel-8.3   gcc  
xtensa                  nommu_kc705_defconfig   gcc  
xtensa               randconfig-r035-20230710   gcc  
xtensa                    xip_kc705_defconfig   gcc  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
