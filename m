Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 193634C532D
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 26 Feb 2022 02:57:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229455AbiBZB5n (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 25 Feb 2022 20:57:43 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60652 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229518AbiBZB5k (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 25 Feb 2022 20:57:40 -0500
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 634702E0E1D
        for <linux-renesas-soc@vger.kernel.org>; Fri, 25 Feb 2022 17:56:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1645840601; x=1677376601;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=7LYME0TTKNQZL90Hk7qaNjhS6vo2Whw3TyOC5/TsNSo=;
  b=jVmrOvj4ArIDmS7J/oP/GOLv3sh9zFJ6tjaOsN8uzlqdXL8+UOQ6QSqj
   eamWWfWkC563StGCHNdRIRaKtAtHRrINbSAohqYqpuIdZPLzG+yITUFdP
   OqNpmD6e9iUp6dZr5gyq10sMn6MAtg3/mcBJfi2Px2soErN4cGkAh3l+f
   19us+Js09+8gTnktVc3z2qM34JGExthYC7VM9ip80zWgO5gbxXWJr/Z8z
   9CqHXt4pjRgkjQPEeDlIgubw/aBr6CtuRVFjd59rwQzqUU3yJcCpxlxlW
   ORxJQad++/JhouHz01CoAJ3kTS3nYxJHm/s5KijM5jKbgdSSuAgKr5XU4
   Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10269"; a="232591860"
X-IronPort-AV: E=Sophos;i="5.90,138,1643702400"; 
   d="scan'208";a="232591860"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Feb 2022 17:56:33 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,138,1643702400"; 
   d="scan'208";a="549510581"
Received: from lkp-server01.sh.intel.com (HELO 788b1cd46f0d) ([10.239.97.150])
  by orsmga008.jf.intel.com with ESMTP; 25 Feb 2022 17:56:32 -0800
Received: from kbuild by 788b1cd46f0d with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1nNmJz-0004vq-P8; Sat, 26 Feb 2022 01:56:31 +0000
Date:   Sat, 26 Feb 2022 09:55:56 +0800
From:   kernel test robot <lkp@intel.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     linux-renesas-soc@vger.kernel.org
Subject: [geert-renesas-devel:master] BUILD SUCCESS
 33f7c4e932578eddccd9218b72990a1ef248eb07
Message-ID: <621988ac.UY48hQQJ+PKcJrhl%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,HEXHASH_WORD,
        RCVD_IN_DNSWL_MED,SPF_HELO_PASS,SPF_NONE,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git master
branch HEAD: 33f7c4e932578eddccd9218b72990a1ef248eb07  Merge branch 'renesas-next' into renesas-devel

elapsed time: 722m

configs tested: 136
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                                 defconfig
arm64                            allyesconfig
arm64                               defconfig
arm                              allyesconfig
arm                              allmodconfig
i386                          randconfig-c001
mips                 randconfig-c004-20220225
powerpc              randconfig-c003-20220225
s390                          debug_defconfig
arm                        shmobile_defconfig
sh                         microdev_defconfig
xtensa                           allyesconfig
sh                          sdk7780_defconfig
powerpc                     asp8347_defconfig
arm                          exynos_defconfig
sh                        apsh4ad0a_defconfig
sh                  sh7785lcr_32bit_defconfig
openrisc                            defconfig
nios2                         3c120_defconfig
sh                        edosk7705_defconfig
arm                       imx_v6_v7_defconfig
arm                         assabet_defconfig
mips                  decstation_64_defconfig
sh                        dreamcast_defconfig
arm                           sama5_defconfig
mips                         rt305x_defconfig
arm64                            alldefconfig
sh                            shmin_defconfig
powerpc                     pq2fads_defconfig
sh                          kfr2r09_defconfig
arc                      axs103_smp_defconfig
m68k                       m5475evb_defconfig
powerpc                     tqm8548_defconfig
s390                       zfcpdump_defconfig
powerpc                      tqm8xx_defconfig
mips                        vocore2_defconfig
arm                        trizeps4_defconfig
i386                             alldefconfig
powerpc                         wii_defconfig
arm                          pxa910_defconfig
arm                           sunxi_defconfig
m68k                          hp300_defconfig
parisc                generic-32bit_defconfig
powerpc                      ppc40x_defconfig
arm                            zeus_defconfig
arc                            hsdk_defconfig
arm                        keystone_defconfig
powerpc                     tqm8555_defconfig
h8300                               defconfig
arc                          axs103_defconfig
mips                     decstation_defconfig
mips                         tb0226_defconfig
um                               alldefconfig
arm                      integrator_defconfig
arm                  randconfig-c002-20220225
ia64                             allmodconfig
ia64                                defconfig
ia64                             allyesconfig
m68k                             allmodconfig
m68k                                defconfig
m68k                             allyesconfig
nds32                             allnoconfig
nios2                               defconfig
arc                              allyesconfig
nds32                               defconfig
nios2                            allyesconfig
csky                                defconfig
alpha                               defconfig
alpha                            allyesconfig
h8300                            allyesconfig
arc                                 defconfig
sh                               allmodconfig
s390                             allyesconfig
parisc                              defconfig
s390                             allmodconfig
parisc64                            defconfig
parisc                           allyesconfig
s390                                defconfig
i386                             allyesconfig
i386                              debian-10.3
i386                                defconfig
sparc                            allyesconfig
sparc                               defconfig
i386                   debian-10.3-kselftests
mips                             allyesconfig
mips                             allmodconfig
powerpc                          allyesconfig
powerpc                          allmodconfig
powerpc                           allnoconfig
x86_64                        randconfig-a006
x86_64                        randconfig-a004
x86_64                        randconfig-a002
x86_64                        randconfig-a013
x86_64                        randconfig-a011
x86_64                        randconfig-a015
arc                  randconfig-r043-20220225
riscv                    nommu_k210_defconfig
riscv                            allyesconfig
riscv                    nommu_virt_defconfig
riscv                             allnoconfig
riscv                               defconfig
riscv                          rv32_defconfig
riscv                            allmodconfig
x86_64                    rhel-8.3-kselftests
um                           x86_64_defconfig
um                             i386_defconfig
x86_64                              defconfig
x86_64                           allyesconfig
x86_64                                  kexec
x86_64                               rhel-8.3
x86_64                          rhel-8.3-func

clang tested configs:
powerpc              randconfig-c003-20220225
x86_64                        randconfig-c007
s390                 randconfig-c005-20220225
mips                 randconfig-c004-20220225
arm                  randconfig-c002-20220225
i386                          randconfig-c001
riscv                randconfig-c006-20220225
arm                       netwinder_defconfig
mips                         tb0219_defconfig
mips                      bmips_stb_defconfig
powerpc                   microwatt_defconfig
powerpc                  mpc885_ads_defconfig
powerpc                     ppa8548_defconfig
i386                          randconfig-a004
i386                          randconfig-a002
i386                          randconfig-a006
x86_64                        randconfig-a014
x86_64                        randconfig-a016
x86_64                        randconfig-a012
i386                          randconfig-a011
i386                          randconfig-a013
i386                          randconfig-a015
x86_64                        randconfig-a001
x86_64                        randconfig-a003
x86_64                        randconfig-a005
hexagon              randconfig-r045-20220225
hexagon              randconfig-r041-20220225
riscv                randconfig-r042-20220225
s390                 randconfig-r044-20220225

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
