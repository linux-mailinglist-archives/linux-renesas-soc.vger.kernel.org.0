Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 308AC5F734C
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  7 Oct 2022 05:22:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229695AbiJGDWF (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 6 Oct 2022 23:22:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46766 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229839AbiJGDVa (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 6 Oct 2022 23:21:30 -0400
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 92E1AA0246
        for <linux-renesas-soc@vger.kernel.org>; Thu,  6 Oct 2022 20:20:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1665112810; x=1696648810;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=cjq2rz2cYKInPRcdBn0y0NH1eQkGmEPAmvyW+m4MtOQ=;
  b=K8mhnUeQU5uz5G1inq9FV/CInpjPZ0nJFmCL4pbv24tZxlTYCy7d/6VA
   J7rScYENPGJfFckBMzgLZG1RrYAOrubf4xfbv7dB8HmST3UwzLO3FEyQf
   o4X8qmcxZieF0k8QSYf/qWzMmV7f+WMkKzQn1Fp+ti6LSM+XrQkAusbK/
   KxgzJw4FVgT60Et4XEXJCWf//hfVOUSqWIJe8zpk62IUs8Zuhr/5gMS8Y
   1kToPPyJjkeCyQ96XzFG+h6D06sOf7fQc4B3SsZSbPftMOmssYUOIwD9r
   Qr+8VXx5Bv5sSH2dlpozERdjxrKoSpRuyOVWljJzf4aP06nuZAwxR+aek
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10492"; a="302357634"
X-IronPort-AV: E=Sophos;i="5.95,164,1661842800"; 
   d="scan'208";a="302357634"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Oct 2022 20:20:03 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10492"; a="767410555"
X-IronPort-AV: E=Sophos;i="5.95,164,1661842800"; 
   d="scan'208";a="767410555"
Received: from lkp-server01.sh.intel.com (HELO 3c15167049b7) ([10.239.97.150])
  by fmsmga001.fm.intel.com with ESMTP; 06 Oct 2022 20:20:01 -0700
Received: from kbuild by 3c15167049b7 with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1ogdu5-0000jH-0y;
        Fri, 07 Oct 2022 03:20:01 +0000
Date:   Fri, 07 Oct 2022 11:19:52 +0800
From:   kernel test robot <lkp@intel.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     linux-renesas-soc@vger.kernel.org
Subject: [geert-renesas-drivers:topic/renesas-overlays] BUILD SUCCESS
 0fd386f8cb3565d1be59fd66cc96034e2875345c
Message-ID: <633f9ad8.lLgDsM0DdLolMFrl%lkp@intel.com>
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

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git topic/renesas-overlays
branch HEAD: 0fd386f8cb3565d1be59fd66cc96034e2875345c  arm64: dts: renesas: r8a779g0: whitehawk: cn6: Add overlay for SCIF1

elapsed time: 720m

configs tested: 138
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
um                             i386_defconfig
arc                                 defconfig
alpha                               defconfig
um                           x86_64_defconfig
i386                                defconfig
x86_64                           rhel-8.3-syz
x86_64                              defconfig
x86_64                         rhel-8.3-kunit
x86_64                           rhel-8.3-kvm
s390                                defconfig
s390                             allmodconfig
x86_64               randconfig-a011-20221003
x86_64               randconfig-a015-20221003
x86_64               randconfig-a014-20221003
x86_64               randconfig-a012-20221003
m68k                             allmodconfig
x86_64               randconfig-a013-20221003
arc                              allyesconfig
x86_64               randconfig-a016-20221003
x86_64                               rhel-8.3
alpha                            allyesconfig
powerpc                          allmodconfig
mips                             allyesconfig
m68k                             allyesconfig
powerpc                           allnoconfig
s390                             allyesconfig
sh                               allmodconfig
powerpc                 mpc85xx_cds_defconfig
sh                            migor_defconfig
powerpc                      tqm8xx_defconfig
powerpc                     tqm8555_defconfig
nios2                            alldefconfig
x86_64                          rhel-8.3-func
x86_64                    rhel-8.3-kselftests
x86_64                           allyesconfig
i386                             allyesconfig
ia64                             allmodconfig
csky                              allnoconfig
alpha                             allnoconfig
arc                               allnoconfig
riscv                             allnoconfig
i386                 randconfig-a011-20221003
i386                 randconfig-a016-20221003
i386                 randconfig-a012-20221003
i386                 randconfig-a014-20221003
i386                 randconfig-a015-20221003
i386                 randconfig-a013-20221003
arm                        clps711x_defconfig
arm                      integrator_defconfig
powerpc                     sequoia_defconfig
i386                          randconfig-c001
mips                 randconfig-c004-20221002
arm64                            allyesconfig
arm                                 defconfig
arm                              allyesconfig
riscv                randconfig-r042-20221003
arc                  randconfig-r043-20221003
arc                  randconfig-r043-20221002
s390                 randconfig-r044-20221003
xtensa                         virt_defconfig
powerpc                  iss476-smp_defconfig
sparc                            alldefconfig
m68k                        stmark2_defconfig
arm                  randconfig-c002-20221002
x86_64                        randconfig-c001
mips                        bcm47xx_defconfig
sparc64                             defconfig
mips                      loongson3_defconfig
microblaze                          defconfig
arm64                            alldefconfig
openrisc                    or1ksim_defconfig
riscv                    nommu_virt_defconfig
riscv                          rv32_defconfig
riscv                    nommu_k210_defconfig
i386                   debian-10.3-kselftests
i386                              debian-10.3
parisc64                            defconfig
sh                              ul2_defconfig
arc                          axs101_defconfig
xtensa                              defconfig
openrisc                 simple_smp_defconfig
powerpc                    adder875_defconfig
powerpc                      pcm030_defconfig
riscv                            allmodconfig
mips                       bmips_be_defconfig
powerpc                        warp_defconfig
powerpc                      makalu_defconfig
csky                             alldefconfig
arc                      axs103_smp_defconfig
mips                            gpr_defconfig
arm                         s3c6400_defconfig
mips                     loongson1b_defconfig
powerpc                     asp8347_defconfig
i386                          debian-10.3-kvm
i386                        debian-10.3-kunit
i386                         debian-10.3-func
m68k                          hp300_defconfig
arm                        keystone_defconfig
sh                           se7751_defconfig
sh                         ap325rxa_defconfig
powerpc                  storcenter_defconfig
powerpc                     mpc83xx_defconfig
mips                  maltasmvp_eva_defconfig
powerpc                       eiger_defconfig
sh                           se7619_defconfig
riscv                            allyesconfig
loongarch                           defconfig
loongarch                         allnoconfig
loongarch                        allmodconfig

clang tested configs:
x86_64                        randconfig-k001
x86_64               randconfig-a003-20221003
x86_64               randconfig-a005-20221003
x86_64               randconfig-a001-20221003
x86_64               randconfig-a004-20221003
x86_64               randconfig-a002-20221003
x86_64               randconfig-a006-20221003
powerpc                   bluestone_defconfig
powerpc                          g5_defconfig
powerpc                      pmac32_defconfig
arm                                 defconfig
powerpc                      ppc44x_defconfig
i386                 randconfig-a001-20221003
i386                 randconfig-a006-20221003
i386                 randconfig-a002-20221003
i386                 randconfig-a003-20221003
i386                 randconfig-a005-20221003
i386                 randconfig-a004-20221003
powerpc                   microwatt_defconfig
mips                malta_qemu_32r6_defconfig
powerpc                      obs600_defconfig
arm                       cns3420vb_defconfig
hexagon              randconfig-r041-20221003
hexagon              randconfig-r045-20221003
arm                          collie_defconfig
powerpc                 xes_mpc85xx_defconfig
riscv                randconfig-r042-20221006
hexagon              randconfig-r041-20221006
s390                 randconfig-r044-20221006
hexagon              randconfig-r045-20221006

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
