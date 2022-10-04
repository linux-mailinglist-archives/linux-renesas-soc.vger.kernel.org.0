Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 79D185F49E8
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  4 Oct 2022 21:52:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229591AbiJDTwn (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 4 Oct 2022 15:52:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49602 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229771AbiJDTwf (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 4 Oct 2022 15:52:35 -0400
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 31DA96B15F
        for <linux-renesas-soc@vger.kernel.org>; Tue,  4 Oct 2022 12:52:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1664913154; x=1696449154;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=x0TcE5IW2cOuwynmcp3Vz/uxV2x2Pk9TVOfR+AKwTDU=;
  b=LcES03Ou62LOnE4TieEPS5M4dcwwW4Kru5BrGDl3cKPkYWf37/3m0oDv
   +snzmsv2CrKC9lvjEXNSuv8tBDUY9ZxlwgPE5vfNcMeIZ9IZ9cq9NCShu
   hPEU2tCAZmOxVqr+3r9FyptwdnEi7wY/7/+NmR89MThzRRBfc1itoxK9p
   bFWe3vyKmAkQ2uilg/muYkUfREaEuo1hnQOLlrPNfFA69zNZo36Tr0bSk
   qiCz4iw4JHR4+9K5MYPZeA5Ywxh5ROTuR0E2d5pOxTNUh/bmyHheMD7p9
   Kry/tGe6p45s1byFuR0rPiJOEbPbYmWygzBHk2N9YDJyeZb+/hBTLZTWL
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10490"; a="367130832"
X-IronPort-AV: E=Sophos;i="5.95,158,1661842800"; 
   d="scan'208";a="367130832"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Oct 2022 12:52:33 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10490"; a="624060786"
X-IronPort-AV: E=Sophos;i="5.95,158,1661842800"; 
   d="scan'208";a="624060786"
Received: from lkp-server01.sh.intel.com (HELO d4f44333118a) ([10.239.97.150])
  by orsmga002.jf.intel.com with ESMTP; 04 Oct 2022 12:52:32 -0700
Received: from kbuild by d4f44333118a with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1ofnxv-0000Ur-2L;
        Tue, 04 Oct 2022 19:52:31 +0000
Date:   Wed, 05 Oct 2022 03:52:14 +0800
From:   kernel test robot <lkp@intel.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     linux-renesas-soc@vger.kernel.org
Subject: [geert-renesas-drivers:renesas-clk-for-v6.2] BUILD SUCCESS
 ba4bf53c3f48e2634500864076a79edbce8289ae
Message-ID: <633c8eee.bhhT2rwqlARbDWCX%lkp@intel.com>
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

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git renesas-clk-for-v6.2
branch HEAD: ba4bf53c3f48e2634500864076a79edbce8289ae  clk: renesas: r8a779g0: Add INTC-EX clock

elapsed time: 727m

configs tested: 121
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arc                                 defconfig
alpha                               defconfig
s390                             allmodconfig
x86_64                           rhel-8.3-syz
s390                                defconfig
x86_64                         rhel-8.3-kunit
x86_64                           rhel-8.3-kvm
um                             i386_defconfig
um                           x86_64_defconfig
x86_64                              defconfig
x86_64                               rhel-8.3
s390                             allyesconfig
x86_64                           allyesconfig
i386                 randconfig-a011-20221003
i386                 randconfig-a012-20221003
i386                                defconfig
i386                 randconfig-a013-20221003
i386                 randconfig-a015-20221003
i386                 randconfig-a016-20221003
i386                 randconfig-a014-20221003
arm                                 defconfig
riscv                randconfig-r042-20221003
arc                  randconfig-r043-20221003
x86_64                          rhel-8.3-func
x86_64               randconfig-a011-20221003
s390                 randconfig-r044-20221003
x86_64               randconfig-a015-20221003
x86_64               randconfig-a014-20221003
x86_64                    rhel-8.3-kselftests
x86_64               randconfig-a012-20221003
x86_64               randconfig-a013-20221003
x86_64               randconfig-a016-20221003
i386                             allyesconfig
powerpc                           allnoconfig
m68k                             allmodconfig
arm                              allyesconfig
mips                             allyesconfig
powerpc                          allmodconfig
sh                               allmodconfig
ia64                             allmodconfig
arm64                            allyesconfig
arc                  randconfig-r043-20221002
arc                              allyesconfig
alpha                            allyesconfig
m68k                             allyesconfig
csky                              allnoconfig
alpha                             allnoconfig
arc                               allnoconfig
riscv                             allnoconfig
powerpc                      mgcoge_defconfig
arc                 nsimosci_hs_smp_defconfig
powerpc                     mpc83xx_defconfig
sh                      rts7751r2d1_defconfig
arc                    vdk_hs38_smp_defconfig
arm                             ezx_defconfig
arm                        realview_defconfig
xtensa                           alldefconfig
sh                          kfr2r09_defconfig
arm                          exynos_defconfig
sh                           se7619_defconfig
m68k                         apollo_defconfig
m68k                          atari_defconfig
sh                   sh7770_generic_defconfig
sh                              ul2_defconfig
m68k                        stmark2_defconfig
i386                          randconfig-c001
nios2                               defconfig
m68k                          amiga_defconfig
arc                            hsdk_defconfig
loongarch                 loongson3_defconfig
powerpc                      cm5200_defconfig
xtensa                  cadence_csp_defconfig
powerpc                 mpc8540_ads_defconfig
arm                          simpad_defconfig
xtensa                          iss_defconfig
arm                            lart_defconfig
sh                     magicpanelr2_defconfig
sh                ecovec24-romimage_defconfig
arm64                            alldefconfig
powerpc                 mpc837x_mds_defconfig
mips                         cobalt_defconfig
arm                  randconfig-c002-20221002
x86_64                        randconfig-c001
mips                 randconfig-c004-20221002
m68k                          sun3x_defconfig
powerpc                     tqm8548_defconfig
i386                          debian-10.3-kvm
i386                        debian-10.3-kunit
i386                         debian-10.3-func
sh                   rts7751r2dplus_defconfig
riscv                    nommu_virt_defconfig
riscv                          rv32_defconfig
riscv                    nommu_k210_defconfig
i386                   debian-10.3-kselftests
i386                              debian-10.3
sparc64                             defconfig
arc                          axs101_defconfig
powerpc                 linkstation_defconfig
arm                            pleb_defconfig
s390                       zfcpdump_defconfig
powerpc                      chrp32_defconfig
sh                             espt_defconfig
powerpc                       maple_defconfig

clang tested configs:
x86_64               randconfig-a003-20221003
x86_64               randconfig-a005-20221003
x86_64               randconfig-a002-20221003
x86_64               randconfig-a001-20221003
x86_64               randconfig-a004-20221003
x86_64               randconfig-a006-20221003
hexagon              randconfig-r041-20221003
hexagon              randconfig-r045-20221003
i386                 randconfig-a001-20221003
i386                 randconfig-a006-20221003
i386                 randconfig-a002-20221003
i386                 randconfig-a003-20221003
i386                 randconfig-a005-20221003
i386                 randconfig-a004-20221003
x86_64                        randconfig-k001
powerpc                      walnut_defconfig
arm                  colibri_pxa300_defconfig
arm                       mainstone_defconfig
riscv                             allnoconfig

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
