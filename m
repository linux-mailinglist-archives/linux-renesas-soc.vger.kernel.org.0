Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6D923704322
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 16 May 2023 03:54:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229483AbjEPByy (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 15 May 2023 21:54:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35028 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229735AbjEPByw (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 15 May 2023 21:54:52 -0400
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 156A046B4
        for <linux-renesas-soc@vger.kernel.org>; Mon, 15 May 2023 18:54:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1684202091; x=1715738091;
  h=date:from:to:cc:subject:message-id;
  bh=Zj3Qd0FzFz3Ul/eBP/TXIIy308mXrLZoPVlNmGefFgk=;
  b=UgaF16CHZAtBVZvIlQiIqCBmu8mESYm5J3jUngR+YQrcqDVpT5aJWF/x
   Ep97GlR7bIGsLjTeNrz9WDfuC06XE+czj5dTzCMgWvXOvccul2GwwrHfO
   CENhQve932ufxZxmqIszBbzKI8tQg76Qfy2eY7rHGnJeNxqs9wrc30Wtj
   ax4CchRl1ZyOM4Rwpj9D5FQ2KIfA5N6SzhFaoy/kMtbr7Asy67hVm2nh3
   GWifWl2LeYBd7egBfZkik5UnVbj6RuBc4pc31V3SeK85uyXkn4js82dgY
   eCWtw+zDbThP9ajJ2q4ZzS0PsCPIkp5buUq6as3ZyVMdcQ0gMbSaXoy7V
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10711"; a="417011382"
X-IronPort-AV: E=Sophos;i="5.99,277,1677571200"; 
   d="scan'208";a="417011382"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 May 2023 18:54:50 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10711"; a="766178454"
X-IronPort-AV: E=Sophos;i="5.99,277,1677571200"; 
   d="scan'208";a="766178454"
Received: from lkp-server01.sh.intel.com (HELO dea6d5a4f140) ([10.239.97.150])
  by fmsmga008.fm.intel.com with ESMTP; 15 May 2023 18:54:49 -0700
Received: from kbuild by dea6d5a4f140 with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1pyjto-0006rB-1f;
        Tue, 16 May 2023 01:54:48 +0000
Date:   Tue, 16 May 2023 09:54:10 +0800
From:   kernel test robot <lkp@intel.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     linux-renesas-soc@vger.kernel.org
Subject: [geert-renesas-devel:topic/renesas-defconfig] BUILD SUCCESS
 f60684f9ad9bbf61adc9fc0b0b60550cbf90b856
Message-ID: <20230516015410._IC4U%lkp@intel.com>
User-Agent: s-nail v14.9.24
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,
        URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git topic/renesas-defconfig
branch HEAD: f60684f9ad9bbf61adc9fc0b0b60550cbf90b856  arm64: renesas: defconfig: Refresh for v6.4-rc1

elapsed time: 951m

configs tested: 167
configs skipped: 7

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                            allyesconfig   gcc  
alpha        buildonly-randconfig-r005-20230515   gcc  
alpha                               defconfig   gcc  
alpha                randconfig-r002-20230515   gcc  
arc                              allyesconfig   gcc  
arc                                 defconfig   gcc  
arc                 nsimosci_hs_smp_defconfig   gcc  
arc                  randconfig-r043-20230515   gcc  
arc                    vdk_hs38_smp_defconfig   gcc  
arm                              allmodconfig   gcc  
arm                              allyesconfig   gcc  
arm                                 defconfig   gcc  
arm                          exynos_defconfig   gcc  
arm                  randconfig-r026-20230515   clang
arm                  randconfig-r046-20230515   clang
arm                         socfpga_defconfig   clang
arm64                            allyesconfig   gcc  
arm64        buildonly-randconfig-r003-20230515   clang
arm64                               defconfig   gcc  
arm64                randconfig-r006-20230515   clang
arm64                randconfig-r014-20230515   gcc  
csky                                defconfig   gcc  
csky                 randconfig-r023-20230515   gcc  
hexagon              randconfig-r041-20230515   clang
hexagon              randconfig-r045-20230515   clang
i386                             allyesconfig   gcc  
i386                              debian-10.3   gcc  
i386                                defconfig   gcc  
i386                 randconfig-a001-20230515   clang
i386                 randconfig-a002-20230515   clang
i386                 randconfig-a003-20230515   clang
i386                 randconfig-a004-20230515   clang
i386                 randconfig-a005-20230515   clang
i386                 randconfig-a006-20230515   clang
i386                 randconfig-a011-20230515   gcc  
i386                 randconfig-a012-20230515   gcc  
i386                 randconfig-a013-20230515   gcc  
i386                 randconfig-a014-20230515   gcc  
i386                 randconfig-a015-20230515   gcc  
i386                 randconfig-a016-20230515   gcc  
i386                 randconfig-i051-20230515   clang
i386                 randconfig-i052-20230515   clang
i386                 randconfig-i053-20230515   clang
i386                 randconfig-i054-20230515   clang
i386                 randconfig-i055-20230515   clang
i386                 randconfig-i056-20230515   clang
i386                 randconfig-i061-20230515   clang
i386                 randconfig-i062-20230515   clang
i386                 randconfig-i063-20230515   clang
i386                 randconfig-i064-20230515   clang
i386                 randconfig-i065-20230515   clang
i386                 randconfig-i066-20230515   clang
i386                 randconfig-i071-20230515   gcc  
i386                 randconfig-i072-20230515   gcc  
i386                 randconfig-i073-20230515   gcc  
i386                 randconfig-i074-20230515   gcc  
i386                 randconfig-i075-20230515   gcc  
i386                 randconfig-i076-20230515   gcc  
i386                 randconfig-i081-20230515   gcc  
i386                 randconfig-i082-20230515   gcc  
i386                 randconfig-i083-20230515   gcc  
i386                 randconfig-i084-20230515   gcc  
i386                 randconfig-i085-20230515   gcc  
i386                 randconfig-i086-20230515   gcc  
i386                 randconfig-i091-20230515   clang
i386                 randconfig-i092-20230515   clang
i386                 randconfig-i093-20230515   clang
i386                 randconfig-i094-20230515   clang
i386                 randconfig-i095-20230515   clang
i386                 randconfig-i096-20230515   clang
i386                 randconfig-r036-20230515   clang
ia64                             allmodconfig   gcc  
ia64                             allyesconfig   gcc  
ia64         buildonly-randconfig-r004-20230515   gcc  
ia64                                defconfig   gcc  
ia64                 randconfig-r013-20230515   gcc  
loongarch                        allmodconfig   gcc  
loongarch                         allnoconfig   gcc  
loongarch    buildonly-randconfig-r002-20230515   gcc  
loongarch                           defconfig   gcc  
loongarch            randconfig-r021-20230515   gcc  
loongarch            randconfig-r032-20230515   gcc  
m68k                             allmodconfig   gcc  
m68k                                defconfig   gcc  
m68k                        mvme16x_defconfig   gcc  
m68k                 randconfig-r003-20230515   gcc  
m68k                 randconfig-r016-20230515   gcc  
m68k                        stmark2_defconfig   gcc  
mips                             allmodconfig   gcc  
mips                             allyesconfig   gcc  
mips                           ip27_defconfig   clang
nios2                               defconfig   gcc  
openrisc                    or1ksim_defconfig   gcc  
openrisc             randconfig-r015-20230515   gcc  
openrisc             randconfig-r031-20230515   gcc  
parisc                              defconfig   gcc  
parisc64                            defconfig   gcc  
powerpc                          allmodconfig   gcc  
powerpc                           allnoconfig   gcc  
powerpc                       maple_defconfig   gcc  
powerpc                  mpc885_ads_defconfig   clang
powerpc                     skiroot_defconfig   clang
riscv                            allmodconfig   gcc  
riscv                             allnoconfig   gcc  
riscv                               defconfig   gcc  
riscv                randconfig-r012-20230515   gcc  
riscv                randconfig-r025-20230515   gcc  
riscv                randconfig-r042-20230515   gcc  
riscv                          rv32_defconfig   gcc  
s390                             allmodconfig   gcc  
s390                             allyesconfig   gcc  
s390                                defconfig   gcc  
s390                 randconfig-r005-20230515   clang
s390                 randconfig-r024-20230515   gcc  
s390                 randconfig-r033-20230515   clang
s390                 randconfig-r044-20230515   gcc  
sh                               allmodconfig   gcc  
sh                          lboxre2_defconfig   gcc  
sh                   randconfig-r034-20230515   gcc  
sparc                               defconfig   gcc  
sparc64              randconfig-r035-20230515   gcc  
um                             i386_defconfig   gcc  
um                           x86_64_defconfig   gcc  
x86_64                            allnoconfig   gcc  
x86_64                           allyesconfig   gcc  
x86_64                              defconfig   gcc  
x86_64                                  kexec   gcc  
x86_64               randconfig-a001-20230515   clang
x86_64               randconfig-a002-20230515   clang
x86_64               randconfig-a003-20230515   clang
x86_64               randconfig-a004-20230515   clang
x86_64               randconfig-a005-20230515   clang
x86_64               randconfig-a006-20230515   clang
x86_64               randconfig-a011-20230515   gcc  
x86_64               randconfig-a012-20230515   gcc  
x86_64               randconfig-a013-20230515   gcc  
x86_64               randconfig-a014-20230515   gcc  
x86_64               randconfig-a015-20230515   gcc  
x86_64               randconfig-a016-20230515   gcc  
x86_64               randconfig-x051-20230515   gcc  
x86_64               randconfig-x052-20230515   gcc  
x86_64               randconfig-x053-20230515   gcc  
x86_64               randconfig-x054-20230515   gcc  
x86_64               randconfig-x055-20230515   gcc  
x86_64               randconfig-x056-20230515   gcc  
x86_64               randconfig-x061-20230515   gcc  
x86_64               randconfig-x062-20230515   gcc  
x86_64               randconfig-x063-20230515   gcc  
x86_64               randconfig-x064-20230515   gcc  
x86_64               randconfig-x065-20230515   gcc  
x86_64               randconfig-x066-20230515   gcc  
x86_64               randconfig-x071-20230515   clang
x86_64               randconfig-x072-20230515   clang
x86_64               randconfig-x073-20230515   clang
x86_64               randconfig-x074-20230515   clang
x86_64               randconfig-x075-20230515   clang
x86_64               randconfig-x076-20230515   clang
x86_64               randconfig-x081-20230515   clang
x86_64               randconfig-x082-20230515   clang
x86_64               randconfig-x083-20230515   clang
x86_64               randconfig-x084-20230515   clang
x86_64               randconfig-x085-20230515   clang
x86_64               randconfig-x086-20230515   clang
x86_64               randconfig-x093-20230515   gcc  
x86_64                               rhel-8.3   gcc  
xtensa       buildonly-randconfig-r001-20230515   gcc  
xtensa                    smp_lx200_defconfig   gcc  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
