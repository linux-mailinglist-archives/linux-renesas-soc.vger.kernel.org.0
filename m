Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7DCEF6C2A97
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 21 Mar 2023 07:44:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230109AbjCUGoV (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 21 Mar 2023 02:44:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51568 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229671AbjCUGoU (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 21 Mar 2023 02:44:20 -0400
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E10C214212
        for <linux-renesas-soc@vger.kernel.org>; Mon, 20 Mar 2023 23:44:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1679381058; x=1710917058;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=4U73syZCqlpcE9qixuSI0ribgpnt5wFHyuLc32KP6wk=;
  b=DPLfb2pgt9jPJMCfAtdg0FKEwZ78LlDZg/ivQowH3nSYjUVO9T1Yx+Ie
   F9ZQEuFSW2wkJAnrVj+Qx3hkys/mEX3Ahey124OFRmxuEV/+BHpt4MvFP
   TE1TjfMw2FUifE404dHwrF9Cu38uQ9HeyAa49IIKSD5Kt4KGhV5K28qNh
   qiH3CbTIX9OWNJivmei4DXciro9iWXyM52MvP+loYE/kRKplPcd9IMcY4
   MkJRpWU2EtNjLyxc37HVUIO5rzXQxp3qb/peVSuINWDLbhjW72WYqrExV
   kEo7Bg3GPM7uAKiO7hXYERsEAe78/pkGkR6h9A2sDxFILbGWcROSOaUYy
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10655"; a="319256531"
X-IronPort-AV: E=Sophos;i="5.98,278,1673942400"; 
   d="scan'208";a="319256531"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Mar 2023 23:44:18 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10655"; a="1010816188"
X-IronPort-AV: E=Sophos;i="5.98,278,1673942400"; 
   d="scan'208";a="1010816188"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by fmsmga005.fm.intel.com with ESMTP; 20 Mar 2023 23:44:17 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1peVjE-000BgA-1o;
        Tue, 21 Mar 2023 06:44:16 +0000
Date:   Tue, 21 Mar 2023 14:43:34 +0800
From:   kernel test robot <lkp@intel.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     linux-renesas-soc@vger.kernel.org
Subject: [geert-renesas-drivers:topic/renesas-overlays-v6.3-rc1] BUILD
 SUCCESS 86edaf2bae2c40d4f79b04f6a06c641ba1c4c223
Message-ID: <64195216.6RaGoxLo2wnhZGMt%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git topic/renesas-overlays-v6.3-rc1
branch HEAD: 86edaf2bae2c40d4f79b04f6a06c641ba1c4c223  arm64: dts: renesas: whitehawk-cpu: Add overlay for CP97/98

elapsed time: 731m

configs tested: 144
configs skipped: 11

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                            allyesconfig   gcc  
alpha        buildonly-randconfig-r005-20230319   gcc  
alpha                               defconfig   gcc  
alpha                randconfig-r011-20230319   gcc  
alpha                randconfig-r024-20230319   gcc  
alpha                randconfig-r031-20230319   gcc  
alpha                randconfig-r033-20230319   gcc  
alpha                randconfig-r036-20230319   gcc  
arc                              allyesconfig   gcc  
arc                                 defconfig   gcc  
arm                              allmodconfig   gcc  
arm                              allyesconfig   gcc  
arm                                 defconfig   gcc  
arm                        mvebu_v7_defconfig   gcc  
arm                  randconfig-r013-20230319   gcc  
arm                  randconfig-r046-20230320   clang
arm64                            allyesconfig   gcc  
arm64                               defconfig   gcc  
arm64                randconfig-r034-20230320   clang
csky                                defconfig   gcc  
csky                 randconfig-r006-20230319   gcc  
csky                 randconfig-r014-20230319   gcc  
csky                 randconfig-r035-20230319   gcc  
hexagon              randconfig-r003-20230319   clang
hexagon              randconfig-r006-20230319   clang
hexagon              randconfig-r015-20230319   clang
hexagon              randconfig-r022-20230319   clang
hexagon              randconfig-r041-20230319   clang
hexagon              randconfig-r041-20230320   clang
hexagon              randconfig-r045-20230319   clang
hexagon              randconfig-r045-20230320   clang
i386                             allyesconfig   gcc  
i386                         debian-10.3-func   gcc  
i386                   debian-10.3-kselftests   gcc  
i386                        debian-10.3-kunit   gcc  
i386                          debian-10.3-kvm   gcc  
i386                              debian-10.3   gcc  
i386                                defconfig   gcc  
i386                 randconfig-a001-20230320   clang
i386                 randconfig-a002-20230320   clang
i386                          randconfig-a002   clang
i386                 randconfig-a003-20230320   clang
i386                 randconfig-a004-20230320   clang
i386                          randconfig-a004   clang
i386                 randconfig-a005-20230320   clang
i386                 randconfig-a006-20230320   clang
i386                          randconfig-a006   clang
i386                          randconfig-a011   clang
i386                          randconfig-a012   gcc  
i386                          randconfig-a013   clang
i386                          randconfig-a014   gcc  
i386                          randconfig-a015   clang
i386                          randconfig-a016   gcc  
i386                          randconfig-c001   gcc  
i386                 randconfig-r035-20230320   clang
ia64                             allmodconfig   gcc  
ia64         buildonly-randconfig-r003-20230319   gcc  
ia64                                defconfig   gcc  
ia64                 randconfig-r032-20230319   gcc  
ia64                 randconfig-r036-20230319   gcc  
ia64                 randconfig-r036-20230320   gcc  
ia64                          tiger_defconfig   gcc  
loongarch                        allmodconfig   gcc  
loongarch                         allnoconfig   gcc  
loongarch                           defconfig   gcc  
loongarch            randconfig-r013-20230319   gcc  
loongarch            randconfig-r014-20230319   gcc  
m68k                             allmodconfig   gcc  
m68k                                defconfig   gcc  
m68k                 randconfig-r015-20230319   gcc  
m68k                 randconfig-r031-20230319   gcc  
m68k                 randconfig-r036-20230319   gcc  
microblaze           randconfig-r014-20230319   gcc  
microblaze           randconfig-r031-20230319   gcc  
microblaze           randconfig-r034-20230319   gcc  
mips                             allmodconfig   gcc  
mips                             allyesconfig   gcc  
mips                 randconfig-r002-20230319   clang
mips                 randconfig-r023-20230319   gcc  
nios2                               defconfig   gcc  
nios2                randconfig-r032-20230320   gcc  
nios2                randconfig-r034-20230319   gcc  
openrisc             randconfig-r021-20230319   gcc  
openrisc             randconfig-r022-20230319   gcc  
openrisc             randconfig-r034-20230319   gcc  
parisc                              defconfig   gcc  
parisc64                            defconfig   gcc  
powerpc                          allmodconfig   gcc  
powerpc                           allnoconfig   gcc  
powerpc                mpc7448_hpc2_defconfig   gcc  
powerpc              randconfig-r002-20230319   gcc  
powerpc              randconfig-r016-20230319   clang
powerpc              randconfig-r021-20230319   clang
powerpc              randconfig-r033-20230319   gcc  
riscv                            allmodconfig   gcc  
riscv                             allnoconfig   gcc  
riscv                               defconfig   gcc  
riscv                randconfig-r005-20230319   gcc  
riscv                randconfig-r016-20230319   clang
riscv                randconfig-r025-20230319   clang
riscv                randconfig-r042-20230319   clang
riscv                          rv32_defconfig   gcc  
s390                             allmodconfig   gcc  
s390                             allyesconfig   gcc  
s390                                defconfig   gcc  
s390                 randconfig-r023-20230319   clang
s390                 randconfig-r044-20230319   clang
sh                               alldefconfig   gcc  
sh                               allmodconfig   gcc  
sh           buildonly-randconfig-r004-20230319   gcc  
sh                            hp6xx_defconfig   gcc  
sh                   randconfig-r011-20230319   gcc  
sh                   randconfig-r032-20230319   gcc  
sh                   randconfig-r033-20230320   gcc  
sh                          rsk7269_defconfig   gcc  
sparc                               defconfig   gcc  
sparc                randconfig-r012-20230319   gcc  
sparc                randconfig-r015-20230319   gcc  
sparc                randconfig-r032-20230319   gcc  
sparc                randconfig-r035-20230319   gcc  
sparc64              randconfig-r011-20230319   gcc  
sparc64              randconfig-r033-20230319   gcc  
um                             i386_defconfig   gcc  
um                           x86_64_defconfig   gcc  
x86_64                            allnoconfig   gcc  
x86_64                           allyesconfig   gcc  
x86_64                              defconfig   gcc  
x86_64                                  kexec   gcc  
x86_64               randconfig-a001-20230320   clang
x86_64                        randconfig-a001   clang
x86_64               randconfig-a002-20230320   clang
x86_64               randconfig-a003-20230320   clang
x86_64                        randconfig-a003   clang
x86_64               randconfig-a004-20230320   clang
x86_64               randconfig-a005-20230320   clang
x86_64                        randconfig-a005   clang
x86_64               randconfig-a006-20230320   clang
x86_64                        randconfig-a012   clang
x86_64                        randconfig-a014   clang
x86_64                        randconfig-a016   clang
x86_64                        randconfig-k001   clang
x86_64                               rhel-8.3   gcc  
xtensa               randconfig-r035-20230319   gcc  
xtensa                    xip_kc705_defconfig   gcc  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
