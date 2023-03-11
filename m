Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3E77C6B5D6B
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 11 Mar 2023 16:45:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230043AbjCKPo7 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Sat, 11 Mar 2023 10:44:59 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60832 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229810AbjCKPo6 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sat, 11 Mar 2023 10:44:58 -0500
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6C3DF2A173
        for <linux-renesas-soc@vger.kernel.org>; Sat, 11 Mar 2023 07:44:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1678549497; x=1710085497;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=I43TL00OSE3AzbuH7dX7ZLOYAd0weh9WJEe42KPI3g0=;
  b=cryO7S55wuY4G/8cwBnuNc1LudFBcrLyRx/+/cgMm/VQOFFE5MDg7Mzr
   JhrfpN4mEQAkxqolRE2lYnRuOUKDTxuYuxw8RFRyuxcqGjbeRd+R8ZwjC
   64yXIYIA91b6i0enkgynl9Q2+rZV8w5++cK2f7UfJeAtpZAlzCoaGru2d
   m28rGiKX0ggYcnQzJKfpmOwlLvbFbdlEaM5NHrqjfSnbP/GVdUeWrCH4M
   MgZqQI6vinkutGJ3XmzS8bAVYelLVruNJlrk8GiYbAS5/gnbigZXBiRCM
   ixwG7+PjVNQMFXpitQ3OfK7rcwX9jkkT7UqlrDHzOjWNssqRzjVvPO74j
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10646"; a="316559290"
X-IronPort-AV: E=Sophos;i="5.98,252,1673942400"; 
   d="scan'208";a="316559290"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Mar 2023 07:44:57 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10646"; a="747080792"
X-IronPort-AV: E=Sophos;i="5.98,252,1673942400"; 
   d="scan'208";a="747080792"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by fmsmga004.fm.intel.com with ESMTP; 11 Mar 2023 07:44:56 -0800
Received: from kbuild by b613635ddfff with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1pb1Ox-0004fG-11;
        Sat, 11 Mar 2023 15:44:55 +0000
Date:   Sat, 11 Mar 2023 23:44:11 +0800
From:   kernel test robot <lkp@intel.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     linux-renesas-soc@vger.kernel.org
Subject: [geert-renesas-devel:master] BUILD SUCCESS
 c520d1376b59c054cec31c3ca09f4df3eddd5296
Message-ID: <640ca1cb.okgJjtrOrY29GbCa%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_PASS,SPF_NONE,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git master
branch HEAD: c520d1376b59c054cec31c3ca09f4df3eddd5296  Merge branches 'renesas-next' and 'topic/renesas-defconfig' into renesas-devel

elapsed time: 1304m

configs tested: 116
configs skipped: 9

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                            alldefconfig   gcc  
alpha                            allyesconfig   gcc  
alpha                               defconfig   gcc  
alpha                randconfig-r036-20230310   gcc  
arc                              allyesconfig   gcc  
arc                          axs101_defconfig   gcc  
arc                                 defconfig   gcc  
arc                  randconfig-r012-20230310   gcc  
arc                  randconfig-r014-20230310   gcc  
arc                  randconfig-r025-20230310   gcc  
arc                  randconfig-r043-20230310   gcc  
arc                        vdk_hs38_defconfig   gcc  
arm                              allmodconfig   gcc  
arm                              allyesconfig   gcc  
arm                     am200epdkit_defconfig   clang
arm          buildonly-randconfig-r004-20230310   clang
arm                                 defconfig   gcc  
arm                          pxa910_defconfig   gcc  
arm                            qcom_defconfig   gcc  
arm                  randconfig-r046-20230310   clang
arm                         s5pv210_defconfig   clang
arm64                            allyesconfig   gcc  
arm64                               defconfig   gcc  
csky                                defconfig   gcc  
csky                 randconfig-r026-20230310   gcc  
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
i386                          randconfig-c001   gcc  
ia64                             allmodconfig   gcc  
ia64                                defconfig   gcc  
ia64                 randconfig-r006-20230310   gcc  
ia64                 randconfig-r015-20230310   gcc  
ia64                 randconfig-r034-20230310   gcc  
loongarch                        allmodconfig   gcc  
loongarch                         allnoconfig   gcc  
loongarch                           defconfig   gcc  
loongarch            randconfig-r023-20230310   gcc  
m68k                             allmodconfig   gcc  
m68k                                defconfig   gcc  
m68k                          multi_defconfig   gcc  
m68k                 randconfig-r024-20230310   gcc  
microblaze           randconfig-r005-20230310   gcc  
microblaze           randconfig-r022-20230310   gcc  
mips                             allmodconfig   gcc  
mips                             allyesconfig   gcc  
mips                            ar7_defconfig   gcc  
mips         buildonly-randconfig-r005-20230310   gcc  
nios2                               defconfig   gcc  
nios2                randconfig-r002-20230310   gcc  
openrisc             randconfig-r003-20230310   gcc  
parisc       buildonly-randconfig-r001-20230310   gcc  
parisc                              defconfig   gcc  
parisc               randconfig-r013-20230310   gcc  
parisc               randconfig-r031-20230310   gcc  
parisc64                            defconfig   gcc  
powerpc                          allmodconfig   gcc  
powerpc                           allnoconfig   gcc  
powerpc      buildonly-randconfig-r003-20230310   gcc  
powerpc                       maple_defconfig   gcc  
powerpc                mpc7448_hpc2_defconfig   gcc  
powerpc                      pcm030_defconfig   gcc  
powerpc                     sequoia_defconfig   gcc  
riscv                            allmodconfig   gcc  
riscv                             allnoconfig   gcc  
riscv                               defconfig   gcc  
riscv             nommu_k210_sdcard_defconfig   gcc  
riscv                randconfig-r001-20230310   clang
riscv                randconfig-r042-20230310   gcc  
riscv                          rv32_defconfig   gcc  
s390                             allmodconfig   gcc  
s390                             allyesconfig   gcc  
s390         buildonly-randconfig-r006-20230310   gcc  
s390                                defconfig   gcc  
s390                 randconfig-r016-20230310   gcc  
s390                 randconfig-r044-20230310   gcc  
sh                               allmodconfig   gcc  
sh                         ecovec24_defconfig   gcc  
sh                           se7722_defconfig   gcc  
sparc                               defconfig   gcc  
sparc64      buildonly-randconfig-r002-20230310   gcc  
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
xtensa                           allyesconfig   gcc  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
