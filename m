Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7D33A62B299
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 16 Nov 2022 06:14:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230083AbiKPFOg (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 16 Nov 2022 00:14:36 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46500 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229637AbiKPFOf (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 16 Nov 2022 00:14:35 -0500
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2AE732CE26
        for <linux-renesas-soc@vger.kernel.org>; Tue, 15 Nov 2022 21:14:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1668575674; x=1700111674;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=w8yXL8gaWQ1aKYg4T2gyWYdFcOCd+w5Uz33/KDa+90M=;
  b=c+FGza4UEC5BUTiRf3D1tOVGFDhZy8p7iL9bX4MaIull+mWNBb7+zCLH
   zscROQbKOazhe9uZAwlVm99tQg+PO1NzJ8ZlDFC3I/d9H5AQT0p0Gyj25
   j7SHAJx/KyoZ9P9lS3wkTzKKddTC+tlzD1hcBhs0iJAieqbJcQtB63+yd
   3TQCO+g/6lNKA+qqJPFfiU7HlBJIYSOVdyISQZgcJx4eXpNKzsH83btAk
   uLsYXVbJfp3UHzQIgOUui/CKqsVlpx1Y+I6gH67bTTitNJJ3r8wOO7xF1
   GFq38mSmKU3F7yzvlSQYEhm3rLLb95i6FUd+FzjU3s6TEj0/7h0qLJSSB
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10532"; a="312458687"
X-IronPort-AV: E=Sophos;i="5.96,167,1665471600"; 
   d="scan'208";a="312458687"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Nov 2022 21:14:33 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10532"; a="617029363"
X-IronPort-AV: E=Sophos;i="5.96,167,1665471600"; 
   d="scan'208";a="617029363"
Received: from lkp-server01.sh.intel.com (HELO ebd99836cbe0) ([10.239.97.150])
  by orsmga006.jf.intel.com with ESMTP; 15 Nov 2022 21:14:32 -0800
Received: from kbuild by ebd99836cbe0 with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1ovAkp-00021r-2J;
        Wed, 16 Nov 2022 05:14:31 +0000
Date:   Wed, 16 Nov 2022 13:14:30 +0800
From:   kernel test robot <lkp@intel.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     linux-renesas-soc@vger.kernel.org
Subject: [geert-renesas-drivers:renesas-clk-for-v6.2] BUILD SUCCESS
 7506b57f33e9da3ef33a762d5805fbce967e5141
Message-ID: <637471b6.Kw5Wwznlo+8K2yT+%lkp@intel.com>
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

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git renesas-clk-for-v6.2
branch HEAD: 7506b57f33e9da3ef33a762d5805fbce967e5141  clk: renesas: r8a779f0: Fix Ethernet Switch clocks

elapsed time: 726m

configs tested: 95
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arc                                 defconfig
alpha                               defconfig
um                             i386_defconfig
um                           x86_64_defconfig
s390                             allmodconfig
s390                                defconfig
s390                             allyesconfig
alpha                            allyesconfig
m68k                             allyesconfig
arc                  randconfig-r043-20221115
x86_64                        randconfig-a013
x86_64                          rhel-8.3-func
x86_64                        randconfig-a011
arc                              allyesconfig
x86_64                              defconfig
x86_64                    rhel-8.3-kselftests
x86_64                        randconfig-a015
s390                 randconfig-r044-20221115
m68k                             allmodconfig
riscv                randconfig-r042-20221115
i386                 randconfig-a001-20221114
i386                 randconfig-a004-20221114
i386                          randconfig-a001
i386                 randconfig-a002-20221114
i386                          randconfig-a003
i386                 randconfig-a005-20221114
i386                          randconfig-a014
i386                 randconfig-a006-20221114
i386                          randconfig-a005
i386                 randconfig-a003-20221114
x86_64                               rhel-8.3
i386                          randconfig-a012
i386                          randconfig-a016
x86_64                           allyesconfig
x86_64                        randconfig-a006
ia64                             allmodconfig
powerpc                           allnoconfig
mips                             allyesconfig
powerpc                          allmodconfig
i386                                defconfig
sh                               allmodconfig
x86_64                        randconfig-a002
x86_64                           rhel-8.3-syz
x86_64                         rhel-8.3-kunit
x86_64                           rhel-8.3-kvm
x86_64                        randconfig-a004
arm                                 defconfig
i386                             allyesconfig
arm64                            allyesconfig
arm                              allyesconfig
x86_64                            allnoconfig
m68k                            q40_defconfig
sparc                       sparc32_defconfig
powerpc                      makalu_defconfig
xtensa                  nommu_kc705_defconfig
arm                          pxa910_defconfig
mips                     decstation_defconfig
arm                      footbridge_defconfig
sh                         apsh4a3a_defconfig
openrisc                 simple_smp_defconfig
mips                           ci20_defconfig
powerpc                     stx_gp3_defconfig
m68k                       m5475evb_defconfig
powerpc                mpc7448_hpc2_defconfig
arm                            hisi_defconfig
powerpc                   motionpro_defconfig
mips                      maltasmvp_defconfig
sh                        apsh4ad0a_defconfig
arm                         axm55xx_defconfig
sh                          rsk7203_defconfig
powerpc                     asp8347_defconfig
arm                      integrator_defconfig
powerpc                      ppc6xx_defconfig
sh                 kfr2r09-romimage_defconfig

clang tested configs:
x86_64                        randconfig-a014
x86_64               randconfig-a014-20221114
x86_64               randconfig-a012-20221114
x86_64                        randconfig-a016
x86_64               randconfig-a016-20221114
hexagon              randconfig-r041-20221115
x86_64                        randconfig-a012
x86_64               randconfig-a015-20221114
x86_64               randconfig-a013-20221114
x86_64               randconfig-a011-20221114
hexagon              randconfig-r045-20221115
i386                          randconfig-a013
i386                          randconfig-a002
i386                          randconfig-a011
i386                          randconfig-a004
i386                          randconfig-a006
x86_64                        randconfig-a005
i386                          randconfig-a015
x86_64                        randconfig-a001
x86_64                        randconfig-a003
x86_64                        randconfig-k001

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
