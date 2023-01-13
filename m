Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6EF34668C0A
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 13 Jan 2023 07:00:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240475AbjAMGA1 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 13 Jan 2023 01:00:27 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50188 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240727AbjAMF6x (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 13 Jan 2023 00:58:53 -0500
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8F2916E0E6
        for <linux-renesas-soc@vger.kernel.org>; Thu, 12 Jan 2023 21:54:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1673589249; x=1705125249;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=A5/d0fgOHygb+sTM52crjO9gakYSfSY2C4HMoX+FFqU=;
  b=axW1NyqHh+Q2DU7ZkarFcJFrU458HvImKPmXCm0NJkTPAG1f5MQB/5jZ
   U9oJZT8nMbklrv40lADqr042b6VLT81fzmQBnS0drS1RIslQC1H1CtLkd
   b4Jr4vAtjj0bkP/k3Yi1d/PMH4y4YzVm5RBBoQJdz8zr4XwHSrkZOW7Fc
   S7H3RLy+iNzjtaQeswf2Gi16DRdT7ZYrIoN7/aHmzAtKOCAx9VBnXBy1j
   XR5sNOjiLLSLrrBtejgufSZe38XMl8nMLHA690R2WVCyvoyKmxuujNCpA
   DWGliOydHrInqbN4ETR7pMnBFkalMOBkHVP6HIwgu4eYRmEuvhVSV8BG8
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10588"; a="321618544"
X-IronPort-AV: E=Sophos;i="5.97,213,1669104000"; 
   d="scan'208";a="321618544"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jan 2023 21:54:08 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10588"; a="658115332"
X-IronPort-AV: E=Sophos;i="5.97,213,1669104000"; 
   d="scan'208";a="658115332"
Received: from lkp-server02.sh.intel.com (HELO f1920e93ebb5) ([10.239.97.151])
  by orsmga002.jf.intel.com with ESMTP; 12 Jan 2023 21:54:07 -0800
Received: from kbuild by f1920e93ebb5 with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1pGD0w-000AnM-1G;
        Fri, 13 Jan 2023 05:54:06 +0000
Date:   Fri, 13 Jan 2023 13:53:40 +0800
From:   kernel test robot <lkp@intel.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     linux-renesas-soc@vger.kernel.org
Subject: [geert-renesas-devel:next] BUILD SUCCESS
 1f57de01e0be7bd12dba400abd81d17840768a1b
Message-ID: <63c0f1e4.ND0y0Ts6JSegA4Yo%lkp@intel.com>
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
branch HEAD: 1f57de01e0be7bd12dba400abd81d17840768a1b  Merge branch 'renesas-dts-for-v6.3' into renesas-next

elapsed time: 728m

configs tested: 97
configs skipped: 4

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
um                             i386_defconfig
x86_64                            allnoconfig
um                           x86_64_defconfig
powerpc                           allnoconfig
arc                                 defconfig
s390                             allmodconfig
alpha                               defconfig
s390                                defconfig
m68k                             allmodconfig
arc                              allyesconfig
alpha                            allyesconfig
m68k                             allyesconfig
s390                             allyesconfig
sh                               allmodconfig
mips                             allyesconfig
powerpc                          allmodconfig
x86_64                              defconfig
x86_64                          rhel-8.3-func
x86_64                    rhel-8.3-kselftests
x86_64                               rhel-8.3
riscv                randconfig-r042-20230112
s390                 randconfig-r044-20230112
arc                  randconfig-r043-20230112
x86_64                           rhel-8.3-kvm
x86_64                           rhel-8.3-bpf
x86_64                        randconfig-a004
ia64                             allmodconfig
x86_64                         rhel-8.3-kunit
x86_64                        randconfig-a002
x86_64                           rhel-8.3-syz
x86_64                        randconfig-a006
x86_64                           allyesconfig
i386                             allyesconfig
i386                                defconfig
arm                          pxa3xx_defconfig
sh                         ap325rxa_defconfig
sh                         microdev_defconfig
arm                           h3600_defconfig
arm                               allnoconfig
alpha                            alldefconfig
arm64                            allyesconfig
arm                                 defconfig
arm                              allyesconfig
arc                              alldefconfig
sparc                       sparc64_defconfig
sh                        apsh4ad0a_defconfig
i386                          randconfig-a012
i386                          randconfig-a014
i386                          randconfig-a016
nios2                            allyesconfig
nios2                               defconfig
parisc                              defconfig
parisc64                            defconfig
parisc                           allyesconfig
sh                        edosk7760_defconfig
arc                      axs103_smp_defconfig
x86_64                        randconfig-a011
x86_64                        randconfig-a013
x86_64                        randconfig-a015
riscv                    nommu_virt_defconfig
riscv                          rv32_defconfig
riscv                    nommu_k210_defconfig
riscv                             allnoconfig
i386                   debian-10.3-kselftests
i386                              debian-10.3
arm                      integrator_defconfig
sh                           se7721_defconfig
m68k                          atari_defconfig
arc                          axs103_defconfig
m68k                       bvme6000_defconfig
sparc                               defconfig
xtensa                           allyesconfig
csky                                defconfig
sparc                            allyesconfig
x86_64                                  kexec
arm                        realview_defconfig
mips                            ar7_defconfig
arm                            zeus_defconfig
arc                            hsdk_defconfig
i386                          randconfig-c001
arm                           tegra_defconfig

clang tested configs:
i386                          randconfig-a002
i386                          randconfig-a006
i386                          randconfig-a004
x86_64                        randconfig-a001
x86_64                        randconfig-a003
x86_64                        randconfig-a005
x86_64                        randconfig-a012
x86_64                        randconfig-a014
x86_64                        randconfig-a016
x86_64                        randconfig-k001
powerpc                      walnut_defconfig
s390                             alldefconfig
mips                       rbtx49xx_defconfig
arm                         s5pv210_defconfig
powerpc                      ppc44x_defconfig
x86_64                          rhel-8.3-rust

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
