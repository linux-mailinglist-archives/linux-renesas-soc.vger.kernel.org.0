Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 02839567AEA
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  6 Jul 2022 01:53:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229455AbiGEXxF (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 5 Jul 2022 19:53:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50666 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229454AbiGEXxE (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 5 Jul 2022 19:53:04 -0400
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 86C73DFC2
        for <linux-renesas-soc@vger.kernel.org>; Tue,  5 Jul 2022 16:53:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1657065183; x=1688601183;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=dJ1Tita+FtSF73XQ78sSIjDQEf2mP0v9B5n6OmmE4Fc=;
  b=exUtj64Fi36X6rmsmaP0qZxRQ5Egcbc6GSry2qJYyqv7Flcm0gVkFh9r
   2xWP0uhnGmsAx03rOcbaVmj9XVVk5fGEvgPrqyNvljiKZMoDNJxpm0fRh
   w60WQFPDXPQPS1MjxcMVVbMSRsTlQN7hdUCn1ZSWKlfu26PrbA0lWgOfV
   1w2pu+Sw+TdCFqFJFcbXl9qhmxtcO/TcScSwvg0hTx9Wrwvx/z5RPLGpa
   Q92jsjWseYWuBeGsTWPyKtsWhucBQMzUuALp+/f0xXt6gpnKM7qRP3rXS
   y48N8ntR5hFndDyFIYS4tNCEPCr/38mrwQLR6djclqUdWUV2oM5Mv3PK5
   w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10399"; a="283606604"
X-IronPort-AV: E=Sophos;i="5.92,248,1650956400"; 
   d="scan'208";a="283606604"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Jul 2022 16:53:03 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.92,248,1650956400"; 
   d="scan'208";a="839310393"
Received: from lkp-server01.sh.intel.com (HELO 68b931ab7ac1) ([10.239.97.150])
  by fmsmga006.fm.intel.com with ESMTP; 05 Jul 2022 16:53:02 -0700
Received: from kbuild by 68b931ab7ac1 with local (Exim 4.95)
        (envelope-from <lkp@intel.com>)
        id 1o8sLl-000Jil-Iq;
        Tue, 05 Jul 2022 23:53:01 +0000
Date:   Wed, 06 Jul 2022 07:52:12 +0800
From:   kernel test robot <lkp@intel.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     linux-renesas-soc@vger.kernel.org
Subject: [geert-renesas-devel:renesas-arm-dt-for-v5.20] BUILD SUCCESS
 3896b8f09271403b641ce09de6b5362fbd622430
Message-ID: <62c4ceac.A+2u7Vp4i5hd/Rtt%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-7.8 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git renesas-arm-dt-for-v5.20
branch HEAD: 3896b8f09271403b641ce09de6b5362fbd622430  arm64: dts: renesas: spider-cpu: Fix scif0/scif3 sort order

elapsed time: 911m

configs tested: 125
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm64                            allyesconfig
arm                                 defconfig
arm                              allyesconfig
i386                          randconfig-c001
xtensa                  audio_kc705_defconfig
sh                            shmin_defconfig
sh                            migor_defconfig
arc                         haps_hs_defconfig
arm                        keystone_defconfig
s390                          debug_defconfig
powerpc                         wii_defconfig
powerpc                      tqm8xx_defconfig
powerpc                       maple_defconfig
sh                               j2_defconfig
arm                         lubbock_defconfig
m68k                          multi_defconfig
arc                     haps_hs_smp_defconfig
sh                                  defconfig
nios2                            allyesconfig
nios2                               defconfig
mips                         bigsur_defconfig
sh                            titan_defconfig
powerpc                 mpc8540_ads_defconfig
powerpc                     pq2fads_defconfig
sh                         ecovec24_defconfig
sparc64                             defconfig
sh                          rsk7264_defconfig
mips                     loongson1b_defconfig
sh                           se7206_defconfig
x86_64                           alldefconfig
openrisc                            defconfig
sh                        sh7785lcr_defconfig
sh                        dreamcast_defconfig
powerpc                 mpc834x_mds_defconfig
arm                           h3600_defconfig
m68k                        stmark2_defconfig
mips                       bmips_be_defconfig
m68k                        m5407c3_defconfig
sparc                       sparc64_defconfig
m68k                        mvme147_defconfig
sh                          polaris_defconfig
arm                         assabet_defconfig
arm                       multi_v4t_defconfig
sh                ecovec24-romimage_defconfig
arc                              allyesconfig
arm                         cm_x300_defconfig
xtensa                         virt_defconfig
sh                              ul2_defconfig
sh                          r7785rp_defconfig
m68k                       m5475evb_defconfig
m68k                          amiga_defconfig
sh                        sh7757lcr_defconfig
riscv                               defconfig
arc                          axs101_defconfig
arm                          gemini_defconfig
openrisc                    or1ksim_defconfig
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
arm                  randconfig-c002-20220703
m68k                             allyesconfig
m68k                             allmodconfig
alpha                            allyesconfig
powerpc                           allnoconfig
mips                             allyesconfig
powerpc                          allmodconfig
sh                               allmodconfig
i386                                defconfig
i386                             allyesconfig
x86_64                        randconfig-a002
x86_64                        randconfig-a004
x86_64                        randconfig-a006
i386                          randconfig-a001
i386                          randconfig-a003
i386                          randconfig-a005
x86_64                        randconfig-a011
x86_64                        randconfig-a013
x86_64                        randconfig-a015
i386                          randconfig-a012
i386                          randconfig-a014
i386                          randconfig-a016
arc                  randconfig-r043-20220703
riscv                randconfig-r042-20220703
s390                 randconfig-r044-20220703
x86_64                    rhel-8.3-kselftests
um                             i386_defconfig
um                           x86_64_defconfig
x86_64                              defconfig
x86_64                           allyesconfig
x86_64                               rhel-8.3
x86_64                          rhel-8.3-func
x86_64                           rhel-8.3-syz
x86_64                         rhel-8.3-kunit

clang tested configs:
powerpc                      ppc64e_defconfig
arm                       versatile_defconfig
mips                          ath25_defconfig
arm                         orion5x_defconfig
x86_64                        randconfig-k001
x86_64                        randconfig-a001
x86_64                        randconfig-a003
x86_64                        randconfig-a005
i386                          randconfig-a002
i386                          randconfig-a006
i386                          randconfig-a004
x86_64                        randconfig-a012
x86_64                        randconfig-a014
x86_64                        randconfig-a016
x86_64               randconfig-a013-20220704
x86_64               randconfig-a011-20220704
x86_64               randconfig-a014-20220704
x86_64               randconfig-a012-20220704
x86_64               randconfig-a015-20220704
x86_64               randconfig-a016-20220704
i386                          randconfig-a013
i386                          randconfig-a011
i386                          randconfig-a015
hexagon              randconfig-r041-20220703
hexagon              randconfig-r045-20220703

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
