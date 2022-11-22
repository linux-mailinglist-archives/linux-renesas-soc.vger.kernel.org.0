Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 38EB9633985
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 22 Nov 2022 11:16:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232254AbiKVKQM (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 22 Nov 2022 05:16:12 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42776 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232419AbiKVKQL (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 22 Nov 2022 05:16:11 -0500
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E02B545A37
        for <linux-renesas-soc@vger.kernel.org>; Tue, 22 Nov 2022 02:16:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1669112169; x=1700648169;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=Sb+r/nE9GlBni0RZldvftI8uaB9AbFJvLpAUsgnL4mE=;
  b=oHP9cpIOWjzUVMC8cMhrdzv28IID3rvNT8NRqWFvNAaO/DQBBuqYwKw+
   9GbEnHVUATQokifiZqbCNA3NQ4WAUYKpIgnIknI09DUW8oa206+rhlccF
   qEyWr/9GtLBetl8aceNteUV7+W7f0VVcTz6Q2cNZil+iT+h5uGvKlYqnj
   kRKIxj90KTQeI+pa9KIzmfrrkIprsRwX6713UTfylcW9FxO1zcyhqGuXZ
   cq1pY/HyKJN1t2R1Jjz32v9ZynYmsKFSa0XiPWFA5OrUxVEaSDCZqH7Vz
   jE4vWrSEF6+wHZpsqJQ9VrHVIxxpmQaPKuzUMzqBNi/EaewEtlVE3ikqt
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10538"; a="294172797"
X-IronPort-AV: E=Sophos;i="5.96,183,1665471600"; 
   d="scan'208";a="294172797"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Nov 2022 02:16:09 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10538"; a="886477860"
X-IronPort-AV: E=Sophos;i="5.96,183,1665471600"; 
   d="scan'208";a="886477860"
Received: from lkp-server01.sh.intel.com (HELO 64a2d449c951) ([10.239.97.150])
  by fmsmga006.fm.intel.com with ESMTP; 22 Nov 2022 02:16:08 -0800
Received: from kbuild by 64a2d449c951 with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1oxQJz-0001MJ-39;
        Tue, 22 Nov 2022 10:16:07 +0000
Date:   Tue, 22 Nov 2022 18:16:06 +0800
From:   kernel test robot <lkp@intel.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     linux-renesas-soc@vger.kernel.org
Subject: [geert-renesas-devel:renesas-arm-dt-for-v6.2] BUILD SUCCESS
 599cb2c6d76485c55b150868482c4003976327a1
Message-ID: <637ca166.MAi5gLpc52y9Z16d%lkp@intel.com>
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

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git renesas-arm-dt-for-v6.2
branch HEAD: 599cb2c6d76485c55b150868482c4003976327a1  arm64: dts: renesas: Rename DTB overlay source files from .dts to .dtso

elapsed time: 1405m

configs tested: 123
configs skipped: 4

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arc                                 defconfig
alpha                               defconfig
um                             i386_defconfig
um                           x86_64_defconfig
powerpc                           allnoconfig
s390                                defconfig
s390                             allmodconfig
s390                             allyesconfig
sh                               allmodconfig
x86_64                            allnoconfig
x86_64                           rhel-8.3-kvm
x86_64                           rhel-8.3-syz
x86_64                         rhel-8.3-kunit
mips                             allyesconfig
powerpc                          allmodconfig
x86_64                          rhel-8.3-func
x86_64                    rhel-8.3-kselftests
m68k                          hp300_defconfig
arm                        realview_defconfig
powerpc                    sam440ep_defconfig
sh                         ap325rxa_defconfig
i386                             allyesconfig
i386                                defconfig
arm                            hisi_defconfig
sh                          sdk7786_defconfig
sparc                       sparc64_defconfig
sh                          rsk7264_defconfig
sh                           se7712_defconfig
s390                 randconfig-r044-20221121
riscv                randconfig-r042-20221121
arc                  randconfig-r043-20221121
ia64                             allmodconfig
i386                          randconfig-c001
x86_64               randconfig-a011-20221121
x86_64               randconfig-a014-20221121
x86_64               randconfig-a012-20221121
x86_64               randconfig-a013-20221121
x86_64               randconfig-a016-20221121
x86_64               randconfig-a015-20221121
x86_64                              defconfig
x86_64                           allyesconfig
x86_64                               rhel-8.3
i386                 randconfig-a014-20221121
i386                 randconfig-a011-20221121
i386                 randconfig-a013-20221121
i386                 randconfig-a016-20221121
i386                 randconfig-a012-20221121
i386                 randconfig-a015-20221121
m68k                        m5272c3_defconfig
arm                         nhk8815_defconfig
arm                                 defconfig
arc                              allyesconfig
mips                           jazz_defconfig
powerpc                      ep88xc_defconfig
m68k                       m5249evb_defconfig
sh                  sh7785lcr_32bit_defconfig
arm                           sama5_defconfig
arm                      footbridge_defconfig
powerpc                       eiger_defconfig
arc                           tb10x_defconfig
mips                          rb532_defconfig
powerpc                      bamboo_defconfig
sh                               alldefconfig
m68k                        m5307c3_defconfig
i386                          debian-10.3-kvm
i386                        debian-10.3-kunit
i386                         debian-10.3-func
riscv                    nommu_virt_defconfig
riscv                          rv32_defconfig
riscv                    nommu_k210_defconfig
riscv                             allnoconfig
i386                   debian-10.3-kselftests
i386                              debian-10.3
arc                  randconfig-r043-20221120
m68k                             allyesconfig
m68k                             allmodconfig
alpha                            allyesconfig
powerpc                     tqm8541_defconfig
powerpc                     asp8347_defconfig
loongarch                           defconfig
loongarch                         allnoconfig
xtensa                    xip_kc705_defconfig
powerpc                      pasemi_defconfig
arm                              allyesconfig
sparc                       sparc32_defconfig
sparc                            alldefconfig
sh                           se7705_defconfig
m68k                        stmark2_defconfig
powerpc                 mpc8540_ads_defconfig
arm                      jornada720_defconfig
x86_64                        randconfig-c001
arm                  randconfig-c002-20221120
nios2                               defconfig
parisc                              defconfig
parisc64                            defconfig
arm64                            allyesconfig

clang tested configs:
i386                          randconfig-a002
i386                          randconfig-a006
i386                          randconfig-a004
x86_64               randconfig-a002-20221121
x86_64               randconfig-a001-20221121
x86_64               randconfig-a004-20221121
x86_64               randconfig-a006-20221121
x86_64               randconfig-a005-20221121
x86_64               randconfig-a003-20221121
powerpc                    gamecube_defconfig
powerpc                  mpc866_ads_defconfig
arm                        neponset_defconfig
powerpc                     ksi8560_defconfig
x86_64                        randconfig-k001
i386                 randconfig-a001-20221121
i386                 randconfig-a005-20221121
i386                 randconfig-a006-20221121
i386                 randconfig-a004-20221121
i386                 randconfig-a003-20221121
i386                 randconfig-a002-20221121
powerpc                    mvme5100_defconfig
arm                         bcm2835_defconfig
arm                         lpc32xx_defconfig
x86_64                        randconfig-a005
x86_64                        randconfig-a003
x86_64                        randconfig-a001
powerpc                  mpc885_ads_defconfig

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
