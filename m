Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9654C7DA4FF
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 28 Oct 2023 05:15:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229481AbjJ1DPN (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 27 Oct 2023 23:15:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50090 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229475AbjJ1DPM (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 27 Oct 2023 23:15:12 -0400
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8DDDC9C
        for <linux-renesas-soc@vger.kernel.org>; Fri, 27 Oct 2023 20:15:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1698462909; x=1729998909;
  h=date:from:to:cc:subject:message-id;
  bh=nMMnnioOU0rTAPBUNfPTNDG7+V0t+AWNWUEEwsq+ClY=;
  b=j0/mE781IMdF0UR2UXHsCDCW0+s9SS4FymtiTRXegnULicI88akrAqwk
   QGNYSbqDCwCcfsalui94LykvoLHtTpyHeXwEa+NLH7FA+1T/A41bnPPTk
   pu14Xg1nTRSMcFXqWeASZpMChlRwojjWUddGGSUotUWrQgqAGXKfs8Bkx
   OchcTgPg0oKsADWMsi2TCizCrmrnhF5ITgATKhy56miJz5LwGrsOacADK
   PYmm9k6Y0gCPSsyren0vxfEJ14luQio68eB1LziE+PbmXz5hRJh8REVoW
   ugnll/Z8y53FlA0pdUbLQTTd3jQJis6fBI7BvCrnOI6iJDHj6DQATpT+7
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10876"; a="368093735"
X-IronPort-AV: E=Sophos;i="6.03,258,1694761200"; 
   d="scan'208";a="368093735"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Oct 2023 20:15:09 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10876"; a="759775870"
X-IronPort-AV: E=Sophos;i="6.03,258,1694761200"; 
   d="scan'208";a="759775870"
Received: from lkp-server01.sh.intel.com (HELO 8917679a5d3e) ([10.239.97.150])
  by orsmga002.jf.intel.com with ESMTP; 27 Oct 2023 20:15:07 -0700
Received: from kbuild by 8917679a5d3e with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1qwZmz-000BQO-1r;
        Sat, 28 Oct 2023 03:15:05 +0000
Date:   Sat, 28 Oct 2023 11:14:25 +0800
From:   kernel test robot <lkp@intel.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     linux-renesas-soc@vger.kernel.org
Subject: [geert-renesas-devel:next] BUILD SUCCESS
 fb39831a07ec1fd914da56caede80e2997f1dbc5
Message-ID: <202310281122.lIhTmezf-lkp@intel.com>
User-Agent: s-nail v14.9.24
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_NONE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git next
branch HEAD: fb39831a07ec1fd914da56caede80e2997f1dbc5  Merge branch 'renesas-fixes-for-v6.6' into renesas-next

elapsed time: 2484m

configs tested: 260
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig   gcc  
alpha                            allyesconfig   gcc  
alpha                               defconfig   gcc  
arc                              allmodconfig   gcc  
arc                               allnoconfig   gcc  
arc                              allyesconfig   gcc  
arc                      axs103_smp_defconfig   gcc  
arc                                 defconfig   gcc  
arc                        nsim_700_defconfig   gcc  
arc                     nsimosci_hs_defconfig   gcc  
arc                   randconfig-001-20231026   gcc  
arc                   randconfig-001-20231027   gcc  
arc                   randconfig-001-20231028   gcc  
arm                              allmodconfig   gcc  
arm                               allnoconfig   gcc  
arm                              allyesconfig   gcc  
arm                     davinci_all_defconfig   clang
arm                                 defconfig   gcc  
arm                      footbridge_defconfig   gcc  
arm                          gemini_defconfig   gcc  
arm                      integrator_defconfig   gcc  
arm                   randconfig-001-20231027   gcc  
arm                   randconfig-001-20231028   gcc  
arm                        realview_defconfig   gcc  
arm                         vf610m4_defconfig   gcc  
arm64                            allmodconfig   gcc  
arm64                             allnoconfig   gcc  
arm64                            allyesconfig   gcc  
arm64                               defconfig   gcc  
csky                             allmodconfig   gcc  
csky                              allnoconfig   gcc  
csky                             allyesconfig   gcc  
csky                                defconfig   gcc  
hexagon                           allnoconfig   clang
i386                              allnoconfig   gcc  
i386         buildonly-randconfig-001-20231026   gcc  
i386         buildonly-randconfig-001-20231027   gcc  
i386         buildonly-randconfig-001-20231028   gcc  
i386         buildonly-randconfig-002-20231026   gcc  
i386         buildonly-randconfig-002-20231027   gcc  
i386         buildonly-randconfig-002-20231028   gcc  
i386         buildonly-randconfig-003-20231026   gcc  
i386         buildonly-randconfig-003-20231027   gcc  
i386         buildonly-randconfig-003-20231028   gcc  
i386         buildonly-randconfig-004-20231026   gcc  
i386         buildonly-randconfig-004-20231027   gcc  
i386         buildonly-randconfig-004-20231028   gcc  
i386         buildonly-randconfig-005-20231026   gcc  
i386         buildonly-randconfig-005-20231027   gcc  
i386         buildonly-randconfig-005-20231028   gcc  
i386         buildonly-randconfig-006-20231026   gcc  
i386         buildonly-randconfig-006-20231027   gcc  
i386         buildonly-randconfig-006-20231028   gcc  
i386                                defconfig   gcc  
i386                  randconfig-001-20231026   gcc  
i386                  randconfig-001-20231027   gcc  
i386                  randconfig-001-20231028   gcc  
i386                  randconfig-002-20231026   gcc  
i386                  randconfig-002-20231027   gcc  
i386                  randconfig-002-20231028   gcc  
i386                  randconfig-003-20231026   gcc  
i386                  randconfig-003-20231027   gcc  
i386                  randconfig-003-20231028   gcc  
i386                  randconfig-004-20231026   gcc  
i386                  randconfig-004-20231027   gcc  
i386                  randconfig-004-20231028   gcc  
i386                  randconfig-005-20231026   gcc  
i386                  randconfig-005-20231027   gcc  
i386                  randconfig-005-20231028   gcc  
i386                  randconfig-006-20231026   gcc  
i386                  randconfig-006-20231027   gcc  
i386                  randconfig-006-20231028   gcc  
i386                  randconfig-011-20231026   gcc  
i386                  randconfig-011-20231027   gcc  
i386                  randconfig-011-20231028   gcc  
i386                  randconfig-012-20231026   gcc  
i386                  randconfig-012-20231027   gcc  
i386                  randconfig-012-20231028   gcc  
i386                  randconfig-013-20231026   gcc  
i386                  randconfig-013-20231027   gcc  
i386                  randconfig-013-20231028   gcc  
i386                  randconfig-014-20231026   gcc  
i386                  randconfig-014-20231027   gcc  
i386                  randconfig-014-20231028   gcc  
i386                  randconfig-015-20231026   gcc  
i386                  randconfig-015-20231027   gcc  
i386                  randconfig-015-20231028   gcc  
i386                  randconfig-016-20231026   gcc  
i386                  randconfig-016-20231027   gcc  
i386                  randconfig-016-20231028   gcc  
loongarch                        allmodconfig   gcc  
loongarch                         allnoconfig   gcc  
loongarch                        allyesconfig   gcc  
loongarch                           defconfig   gcc  
loongarch             randconfig-001-20231026   gcc  
loongarch             randconfig-001-20231027   gcc  
loongarch             randconfig-001-20231028   gcc  
m68k                             allmodconfig   gcc  
m68k                              allnoconfig   gcc  
m68k                             allyesconfig   gcc  
m68k                                defconfig   gcc  
m68k                          hp300_defconfig   gcc  
m68k                        m5272c3_defconfig   gcc  
m68k                        m5407c3_defconfig   gcc  
m68k                          sun3x_defconfig   gcc  
microblaze                       allmodconfig   gcc  
microblaze                        allnoconfig   gcc  
microblaze                       allyesconfig   gcc  
microblaze                          defconfig   gcc  
mips                             allmodconfig   gcc  
mips                              allnoconfig   gcc  
mips                             allyesconfig   gcc  
mips                            ar7_defconfig   gcc  
mips                        bcm63xx_defconfig   clang
mips                         cobalt_defconfig   gcc  
mips                     decstation_defconfig   gcc  
mips                      loongson3_defconfig   gcc  
mips                      maltasmvp_defconfig   gcc  
nios2                            allmodconfig   gcc  
nios2                             allnoconfig   gcc  
nios2                            allyesconfig   gcc  
nios2                               defconfig   gcc  
openrisc                         allmodconfig   gcc  
openrisc                          allnoconfig   gcc  
openrisc                         allyesconfig   gcc  
openrisc                            defconfig   gcc  
openrisc                       virt_defconfig   gcc  
parisc                           allmodconfig   gcc  
parisc                            allnoconfig   gcc  
parisc                           allyesconfig   gcc  
parisc                              defconfig   gcc  
parisc64                            defconfig   gcc  
powerpc                          allmodconfig   gcc  
powerpc                           allnoconfig   gcc  
powerpc                          allyesconfig   gcc  
powerpc                       holly_defconfig   gcc  
powerpc                      katmai_defconfig   clang
powerpc                     ksi8560_defconfig   clang
powerpc                   lite5200b_defconfig   clang
powerpc                      ppc40x_defconfig   gcc  
powerpc                         ps3_defconfig   gcc  
powerpc                     taishan_defconfig   gcc  
powerpc                         wii_defconfig   gcc  
powerpc64                           defconfig   gcc  
riscv                             allnoconfig   gcc  
riscv                               defconfig   gcc  
riscv                    nommu_virt_defconfig   clang
riscv                 randconfig-001-20231026   gcc  
riscv                 randconfig-001-20231027   gcc  
riscv                 randconfig-001-20231028   gcc  
riscv                          rv32_defconfig   gcc  
s390                             allmodconfig   gcc  
s390                              allnoconfig   gcc  
s390                             allyesconfig   gcc  
s390                          debug_defconfig   gcc  
s390                                defconfig   gcc  
s390                  randconfig-001-20231026   gcc  
s390                  randconfig-001-20231027   gcc  
s390                  randconfig-001-20231028   gcc  
sh                               allmodconfig   gcc  
sh                                allnoconfig   gcc  
sh                               allyesconfig   gcc  
sh                                  defconfig   gcc  
sh                ecovec24-romimage_defconfig   gcc  
sh                         ecovec24_defconfig   gcc  
sh                             espt_defconfig   gcc  
sh                            hp6xx_defconfig   gcc  
sh                          lboxre2_defconfig   gcc  
sh                          rsk7203_defconfig   gcc  
sh                           se7705_defconfig   gcc  
sh                           se7750_defconfig   gcc  
sh                           se7780_defconfig   gcc  
sh                        sh7763rdp_defconfig   gcc  
sh                            shmin_defconfig   gcc  
sparc                            alldefconfig   gcc  
sparc                            allmodconfig   gcc  
sparc                             allnoconfig   gcc  
sparc                            allyesconfig   gcc  
sparc                               defconfig   gcc  
sparc                 randconfig-001-20231026   gcc  
sparc                 randconfig-001-20231027   gcc  
sparc                 randconfig-001-20231028   gcc  
sparc64                          allmodconfig   gcc  
sparc64                          allyesconfig   gcc  
sparc64                             defconfig   gcc  
um                               allmodconfig   clang
um                                allnoconfig   clang
um                               allyesconfig   clang
um                                  defconfig   gcc  
um                             i386_defconfig   gcc  
um                           x86_64_defconfig   gcc  
x86_64                            allnoconfig   gcc  
x86_64                           allyesconfig   gcc  
x86_64       buildonly-randconfig-001-20231026   gcc  
x86_64       buildonly-randconfig-001-20231027   gcc  
x86_64       buildonly-randconfig-001-20231028   gcc  
x86_64       buildonly-randconfig-002-20231026   gcc  
x86_64       buildonly-randconfig-002-20231027   gcc  
x86_64       buildonly-randconfig-002-20231028   gcc  
x86_64       buildonly-randconfig-003-20231026   gcc  
x86_64       buildonly-randconfig-003-20231027   gcc  
x86_64       buildonly-randconfig-003-20231028   gcc  
x86_64       buildonly-randconfig-004-20231026   gcc  
x86_64       buildonly-randconfig-004-20231027   gcc  
x86_64       buildonly-randconfig-004-20231028   gcc  
x86_64       buildonly-randconfig-005-20231026   gcc  
x86_64       buildonly-randconfig-005-20231027   gcc  
x86_64       buildonly-randconfig-005-20231028   gcc  
x86_64       buildonly-randconfig-006-20231026   gcc  
x86_64       buildonly-randconfig-006-20231027   gcc  
x86_64       buildonly-randconfig-006-20231028   gcc  
x86_64                              defconfig   gcc  
x86_64                randconfig-001-20231026   gcc  
x86_64                randconfig-001-20231027   gcc  
x86_64                randconfig-001-20231028   gcc  
x86_64                randconfig-002-20231026   gcc  
x86_64                randconfig-002-20231027   gcc  
x86_64                randconfig-002-20231028   gcc  
x86_64                randconfig-003-20231026   gcc  
x86_64                randconfig-003-20231027   gcc  
x86_64                randconfig-003-20231028   gcc  
x86_64                randconfig-004-20231026   gcc  
x86_64                randconfig-004-20231027   gcc  
x86_64                randconfig-004-20231028   gcc  
x86_64                randconfig-005-20231026   gcc  
x86_64                randconfig-005-20231027   gcc  
x86_64                randconfig-005-20231028   gcc  
x86_64                randconfig-006-20231026   gcc  
x86_64                randconfig-006-20231027   gcc  
x86_64                randconfig-006-20231028   gcc  
x86_64                randconfig-011-20231027   gcc  
x86_64                randconfig-011-20231028   gcc  
x86_64                randconfig-012-20231027   gcc  
x86_64                randconfig-012-20231028   gcc  
x86_64                randconfig-013-20231027   gcc  
x86_64                randconfig-013-20231028   gcc  
x86_64                randconfig-014-20231027   gcc  
x86_64                randconfig-014-20231028   gcc  
x86_64                randconfig-015-20231027   gcc  
x86_64                randconfig-015-20231028   gcc  
x86_64                randconfig-016-20231027   gcc  
x86_64                randconfig-016-20231028   gcc  
x86_64                randconfig-071-20231027   gcc  
x86_64                randconfig-071-20231028   gcc  
x86_64                randconfig-072-20231027   gcc  
x86_64                randconfig-072-20231028   gcc  
x86_64                randconfig-073-20231027   gcc  
x86_64                randconfig-073-20231028   gcc  
x86_64                randconfig-074-20231027   gcc  
x86_64                randconfig-074-20231028   gcc  
x86_64                randconfig-075-20231027   gcc  
x86_64                randconfig-075-20231028   gcc  
x86_64                randconfig-076-20231027   gcc  
x86_64                randconfig-076-20231028   gcc  
x86_64                          rhel-8.3-rust   clang
x86_64                               rhel-8.3   gcc  
xtensa                            allnoconfig   gcc  
xtensa                       common_defconfig   gcc  
xtensa                          iss_defconfig   gcc  
xtensa                         virt_defconfig   gcc  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
