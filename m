Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 112C756B9C7
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  8 Jul 2022 14:38:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237853AbiGHMhF (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 8 Jul 2022 08:37:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58176 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234695AbiGHMhE (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 8 Jul 2022 08:37:04 -0400
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C22677C1BB
        for <linux-renesas-soc@vger.kernel.org>; Fri,  8 Jul 2022 05:37:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1657283824; x=1688819824;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=wa60QzDkRVC3SKwbyoQVpeBADGgVmykleZhcbN8Rl20=;
  b=OGLgDVRGw9EJCPtcJl35OoZ2VKibvPF44EKeBt0McTic41qSs68aOoWn
   FM2kBD2LrgrEEvrrzXZJv8zJHZlhckCe2rd7kyqLhhRs4bs6zaBSMUsBP
   jO1gdBaJ9kqgPR+Ne6X73DPqeCvz4piKRRJUeq/CweeUoQoIQg308bPJw
   cOutjijeUFH+dsTFXmyN6rdanFNv7ade/5k4+DGJO5MYfJ4zvZZC32nFi
   KqnwfzccvDXIHDflRs9jJAjLhjgJfBQnMq2/ooMwpQ53YdypQA07GQLZq
   ZXAMjQrBCucxsyroSoV1hm+oxZ71LcKoHyg2ChGMu7gsx3MXmSSpHBq6K
   w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10401"; a="345959038"
X-IronPort-AV: E=Sophos;i="5.92,255,1650956400"; 
   d="scan'208";a="345959038"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jul 2022 05:36:50 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.92,255,1650956400"; 
   d="scan'208";a="568927569"
Received: from lkp-server01.sh.intel.com (HELO 68b931ab7ac1) ([10.239.97.150])
  by orsmga006.jf.intel.com with ESMTP; 08 Jul 2022 05:36:49 -0700
Received: from kbuild by 68b931ab7ac1 with local (Exim 4.95)
        (envelope-from <lkp@intel.com>)
        id 1o9nE0-000NTs-DO;
        Fri, 08 Jul 2022 12:36:48 +0000
Date:   Fri, 08 Jul 2022 20:35:47 +0800
From:   kernel test robot <lkp@intel.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     linux-renesas-soc@vger.kernel.org
Subject: [geert-renesas-devel:renesas-arm-dt-for-v5.20] BUILD SUCCESS
 fec6d133cee53971841159c33e95b17b421dd0a1
Message-ID: <62c824a3./aNYQfbUd0Tb3AAd%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-5.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git renesas-arm-dt-for-v5.20
branch HEAD: fec6d133cee53971841159c33e95b17b421dd0a1  arm64: dts: renesas: Add panel overlay for Draak and Ebisu boards

elapsed time: 1603m

configs tested: 156
configs skipped: 4

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm64                            allyesconfig
arm                                 defconfig
arm                              allyesconfig
i386                          randconfig-c001
m68k                        mvme147_defconfig
m68k                             alldefconfig
xtensa                       common_defconfig
sh                                  defconfig
sh                          rsk7269_defconfig
alpha                            alldefconfig
openrisc                            defconfig
arm                          badge4_defconfig
powerpc                  storcenter_defconfig
arc                         haps_hs_defconfig
mips                             allmodconfig
arc                            hsdk_defconfig
arm                        cerfcube_defconfig
powerpc                     asp8347_defconfig
arm                          pxa910_defconfig
arc                      axs103_smp_defconfig
powerpc                      mgcoge_defconfig
sh                             shx3_defconfig
mips                           xway_defconfig
powerpc                 mpc8540_ads_defconfig
nios2                            allyesconfig
sh                           se7705_defconfig
powerpc                     tqm8548_defconfig
m68k                       m5249evb_defconfig
arc                        nsimosci_defconfig
powerpc                mpc7448_hpc2_defconfig
arm                           stm32_defconfig
sh                   sh7770_generic_defconfig
mips                         tb0226_defconfig
arm                        mvebu_v7_defconfig
sh                         ap325rxa_defconfig
arm                        spear6xx_defconfig
sh                      rts7751r2d1_defconfig
riscv                               defconfig
sh                           se7722_defconfig
xtensa                              defconfig
powerpc                     tqm8555_defconfig
arm                             ezx_defconfig
mips                 decstation_r4k_defconfig
powerpc                    adder875_defconfig
sh                              ul2_defconfig
arm                        keystone_defconfig
sh                   secureedge5410_defconfig
arm                           u8500_defconfig
arc                     nsimosci_hs_defconfig
sh                           se7712_defconfig
sh                        edosk7705_defconfig
m68k                            q40_defconfig
powerpc                      ppc6xx_defconfig
arm                      jornada720_defconfig
powerpc                     ep8248e_defconfig
m68k                           sun3_defconfig
sh                          r7780mp_defconfig
x86_64                           alldefconfig
xtensa                generic_kc705_defconfig
sh                   sh7724_generic_defconfig
sh                           se7724_defconfig
sh                     magicpanelr2_defconfig
xtensa                    xip_kc705_defconfig
arm                            qcom_defconfig
microblaze                      mmu_defconfig
s390                          debug_defconfig
sh                               j2_defconfig
m68k                       m5475evb_defconfig
arm                           h3600_defconfig
sh                         microdev_defconfig
sh                           sh2007_defconfig
sh                         ecovec24_defconfig
sparc                               defconfig
xtensa                           allyesconfig
csky                                defconfig
sparc                            allyesconfig
x86_64                                  kexec
s390                                defconfig
s390                             allmodconfig
arc                                 defconfig
alpha                               defconfig
s390                             allyesconfig
powerpc                          allyesconfig
riscv                            allmodconfig
riscv                            allyesconfig
nios2                               defconfig
parisc                              defconfig
parisc64                            defconfig
parisc                           allyesconfig
riscv                    nommu_virt_defconfig
riscv                          rv32_defconfig
riscv                    nommu_k210_defconfig
riscv                             allnoconfig
i386                   debian-10.3-kselftests
i386                              debian-10.3
x86_64                        randconfig-c001
arm                  randconfig-c002-20220707
ia64                             allmodconfig
m68k                             allyesconfig
m68k                             allmodconfig
arc                              allyesconfig
alpha                            allyesconfig
powerpc                           allnoconfig
mips                             allyesconfig
powerpc                          allmodconfig
sh                               allmodconfig
i386                             allyesconfig
i386                                defconfig
x86_64                        randconfig-a006
x86_64                        randconfig-a004
x86_64                        randconfig-a002
i386                          randconfig-a001
i386                          randconfig-a005
i386                          randconfig-a003
x86_64                        randconfig-a011
x86_64                        randconfig-a013
x86_64                        randconfig-a015
i386                          randconfig-a012
i386                          randconfig-a014
i386                          randconfig-a016
arc                  randconfig-r043-20220707
riscv                randconfig-r042-20220707
s390                 randconfig-r044-20220707
x86_64                    rhel-8.3-kselftests
um                           x86_64_defconfig
um                             i386_defconfig
x86_64                              defconfig
x86_64                           allyesconfig
x86_64                               rhel-8.3
x86_64                          rhel-8.3-func
x86_64                           rhel-8.3-syz
x86_64                         rhel-8.3-kunit

clang tested configs:
powerpc                  mpc885_ads_defconfig
powerpc                    mvme5100_defconfig
mips                     loongson1c_defconfig
arm                      pxa255-idp_defconfig
powerpc                     tqm8540_defconfig
mips                         tb0287_defconfig
powerpc                 xes_mpc85xx_defconfig
arm                        multi_v5_defconfig
powerpc                 mpc8315_rdb_defconfig
x86_64                        randconfig-k001
x86_64                        randconfig-a005
x86_64                        randconfig-a003
x86_64                        randconfig-a001
i386                          randconfig-a002
i386                          randconfig-a006
i386                          randconfig-a004
x86_64                        randconfig-a012
x86_64                        randconfig-a014
x86_64                        randconfig-a016
i386                          randconfig-a013
i386                          randconfig-a015
i386                          randconfig-a011
hexagon              randconfig-r045-20220707
hexagon              randconfig-r041-20220707

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
