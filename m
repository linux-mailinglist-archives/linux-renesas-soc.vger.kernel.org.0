Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DA64162219B
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  9 Nov 2022 03:06:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229549AbiKICGO (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 8 Nov 2022 21:06:14 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46132 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229470AbiKICGN (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 8 Nov 2022 21:06:13 -0500
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7A08C663E1
        for <linux-renesas-soc@vger.kernel.org>; Tue,  8 Nov 2022 18:06:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1667959572; x=1699495572;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=HJc6mstVhTJt4Z2aUK4Bvj67QNwtM7a12iooO5iTBKY=;
  b=P43KG7cTzLAOBJgry4cQv5H25Wp1qI93QCmpNR8EeeX1PFsluihTR3Mq
   H1Ou/T+FmWThXJTUWqbGUuFEcrIoQKDCZ+AvjS6X5j58cLAUq5W1NgDE2
   PNAeUoLZ6bhs+4uscSKOCsrJhRsU0j07cUKuU6B8LaEic/PYv2y59IlFP
   VorG8sFA81Fl0yXdUh56u/cCHiGEtwPOlqEKs56S/66a+NmKtXwpJllJk
   EWG4BmTAqt1Q4bGusoO5xqoxdVbkObv/5y0qOShx+1Wqy9r/2agzc3fgI
   8FOfu1lfXrvT7rKZPrl1QmD5qsbeJ6r00le5SRVe/Cb0JQKeTzYI/7OOJ
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10525"; a="310860351"
X-IronPort-AV: E=Sophos;i="5.96,149,1665471600"; 
   d="scan'208";a="310860351"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Nov 2022 18:06:12 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10525"; a="965812442"
X-IronPort-AV: E=Sophos;i="5.96,149,1665471600"; 
   d="scan'208";a="965812442"
Received: from lkp-server01.sh.intel.com (HELO e783503266e8) ([10.239.97.150])
  by fmsmga005.fm.intel.com with ESMTP; 08 Nov 2022 18:06:11 -0800
Received: from kbuild by e783503266e8 with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1osaTi-0000uU-2G;
        Wed, 09 Nov 2022 02:06:10 +0000
Date:   Wed, 09 Nov 2022 10:05:55 +0800
From:   kernel test robot <lkp@intel.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     linux-renesas-soc@vger.kernel.org
Subject: [geert-renesas-devel:next] BUILD SUCCESS
 cb7df0645f0f5f3d940190c323b56ce69718c418
Message-ID: <636b0b03.h+Os12BPMxGPPFdU%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git next
branch HEAD: cb7df0645f0f5f3d940190c323b56ce69718c418  Merge branch 'renesas-arm-dt-for-v6.2' into renesas-next

elapsed time: 726m

configs tested: 121
configs skipped: 5

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
um                           x86_64_defconfig
um                             i386_defconfig
x86_64                            allnoconfig
x86_64                           rhel-8.3-kvm
x86_64                           rhel-8.3-syz
x86_64                         rhel-8.3-kunit
ia64                             allmodconfig
i386                             allyesconfig
i386                                defconfig
x86_64                              defconfig
x86_64                           allyesconfig
x86_64                               rhel-8.3
x86_64                          rhel-8.3-func
x86_64                    rhel-8.3-kselftests
i386                          randconfig-a012
i386                          randconfig-a014
i386                          randconfig-a016
sh                          rsk7203_defconfig
powerpc                     asp8347_defconfig
nios2                            alldefconfig
s390                                defconfig
s390                             allmodconfig
arc                                 defconfig
alpha                               defconfig
s390                             allyesconfig
powerpc                    sam440ep_defconfig
arm                             ezx_defconfig
sh                        edosk7705_defconfig
x86_64                        randconfig-a006
x86_64                        randconfig-a004
x86_64                        randconfig-a002
arm64                            allyesconfig
arm                                 defconfig
arm                              allyesconfig
i386                          randconfig-c001
powerpc                           allnoconfig
mips                             allyesconfig
powerpc                          allmodconfig
sh                               allmodconfig
m68k                             allyesconfig
m68k                             allmodconfig
arc                              allyesconfig
alpha                            allyesconfig
arc                              alldefconfig
sh                           se7751_defconfig
powerpc                 linkstation_defconfig
sh                           se7206_defconfig
ia64                         bigsur_defconfig
sh                          rsk7269_defconfig
arm                        shmobile_defconfig
arm                         at91_dt_defconfig
mips                      loongson3_defconfig
sh                  sh7785lcr_32bit_defconfig
powerpc                     sequoia_defconfig
powerpc                     mpc83xx_defconfig
powerpc                       holly_defconfig
arm                             rpc_defconfig
i386                 randconfig-a001-20221107
i386                 randconfig-a006-20221107
i386                 randconfig-a003-20221107
i386                 randconfig-a002-20221107
i386                 randconfig-a005-20221107
i386                 randconfig-a004-20221107
arm                        cerfcube_defconfig
arm                       aspeed_g5_defconfig
parisc                generic-32bit_defconfig
mips                           xway_defconfig
mips                          rb532_defconfig
sparc                       sparc32_defconfig
csky                             alldefconfig
sh                           se7712_defconfig
arm                          exynos_defconfig
nios2                            allyesconfig
nios2                               defconfig
parisc                              defconfig
parisc64                            defconfig
parisc                           allyesconfig
x86_64               randconfig-a006-20221107
x86_64               randconfig-a001-20221107
x86_64               randconfig-a004-20221107
x86_64               randconfig-a003-20221107
x86_64               randconfig-a005-20221107
x86_64               randconfig-a002-20221107
x86_64                        randconfig-a011
x86_64                        randconfig-a013
x86_64                        randconfig-a015
xtensa                           allyesconfig
powerpc                      makalu_defconfig
powerpc                       maple_defconfig
arm                        trizeps4_defconfig
arm                           sunxi_defconfig
arc                        vdk_hs38_defconfig
m68k                        m5272c3_defconfig
arm                      integrator_defconfig
powerpc                        cell_defconfig
powerpc                     rainier_defconfig

clang tested configs:
i386                          randconfig-a002
i386                          randconfig-a006
i386                          randconfig-a004
powerpc                     tqm8560_defconfig
arm                           omap1_defconfig
mips                     cu1000-neo_defconfig
x86_64                        randconfig-a012
x86_64                        randconfig-a014
x86_64                        randconfig-a016
hexagon              randconfig-r041-20221108
hexagon              randconfig-r045-20221108
x86_64                        randconfig-k001
riscv                randconfig-r042-20221107
hexagon              randconfig-r041-20221107
hexagon              randconfig-r045-20221107
s390                 randconfig-r044-20221107
x86_64                        randconfig-a005
x86_64                        randconfig-a003
x86_64                        randconfig-a001
mips                          ath25_defconfig
arm                       imx_v4_v5_defconfig
arm                          moxart_defconfig
mips                        qi_lb60_defconfig
arm                         mv78xx0_defconfig
powerpc                 mpc836x_rdk_defconfig

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
