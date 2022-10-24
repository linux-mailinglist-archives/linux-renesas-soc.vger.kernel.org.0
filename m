Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 81D8860BD51
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 25 Oct 2022 00:24:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230156AbiJXWYY (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 24 Oct 2022 18:24:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55474 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229520AbiJXWXx (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 24 Oct 2022 18:23:53 -0400
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 965E6B600D
        for <linux-renesas-soc@vger.kernel.org>; Mon, 24 Oct 2022 13:44:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1666644274; x=1698180274;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=HGKHVWYLVyX5GDWwu8zkJdxXgR2TyyvR5uxquxzTVA0=;
  b=TNgq9Wi6gNg6SMbWwKl4luCMVyAWhRCYMZ5sbrebmiXvbJ5mVrU7+eZL
   2ligoapOnWBAqzaLi8p+MKI0YEIeaqnPbANy7aSt0jTZO5AOOMMVeLTsU
   s3n7IGUctI89UoFAyEwZPE5xq+owt3T9h21B01Sqfhg+e4FXmjL2uIIUI
   AAGbzhI0rLoKJshXvIWGhVtveAOacAusP10TkjDd5VHJG12yLWYkrYQC6
   RV2vHmtG8Nen3WvSdBAgGHBftYoQE0lHqhwT0cQ4T2bxl4uPjziw2FJpN
   DPsQQE+56gsOnoqpzYQ8PCYbhWu1lpZCsgFbGF7aw5+Tt8z9gef9+AVB6
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10510"; a="307508412"
X-IronPort-AV: E=Sophos;i="5.95,210,1661842800"; 
   d="scan'208";a="307508412"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Oct 2022 13:40:50 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10510"; a="582535452"
X-IronPort-AV: E=Sophos;i="5.95,210,1661842800"; 
   d="scan'208";a="582535452"
Received: from lkp-server02.sh.intel.com (HELO b6d29c1a0365) ([10.239.97.151])
  by orsmga003.jf.intel.com with ESMTP; 24 Oct 2022 13:40:49 -0700
Received: from kbuild by b6d29c1a0365 with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1on4Fc-0005dW-37;
        Mon, 24 Oct 2022 20:40:48 +0000
Date:   Tue, 25 Oct 2022 04:40:30 +0800
From:   kernel test robot <lkp@intel.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     linux-renesas-soc@vger.kernel.org
Subject: [geert-renesas-devel:renesas-arm-dt-for-v6.2] BUILD SUCCESS
 39d9dfc6fbe1860e2ee7f72edd2582a071c90b20
Message-ID: <6356f83e.ifXmvnGh/jXa1m8Q%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-7.6 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git renesas-arm-dt-for-v6.2
branch HEAD: 39d9dfc6fbe1860e2ee7f72edd2582a071c90b20  arm64: dts: renesas: r8a779g0: Add remaining HSCIF nodes

elapsed time: 727m

configs tested: 98
configs skipped: 118

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm64                            allyesconfig
powerpc                           allnoconfig
mips                             allyesconfig
powerpc                          allmodconfig
sh                               allmodconfig
ia64                             allmodconfig
m68k                             allyesconfig
m68k                             allmodconfig
arc                              allyesconfig
alpha                            allyesconfig
arm                                 defconfig
arm                              allyesconfig
x86_64                          rhel-8.3-func
x86_64                    rhel-8.3-kselftests
arc                  randconfig-r043-20221023
arc                  randconfig-r043-20221024
s390                 randconfig-r044-20221024
riscv                randconfig-r042-20221024
um                           x86_64_defconfig
um                             i386_defconfig
x86_64                              defconfig
x86_64                           allyesconfig
x86_64                               rhel-8.3
x86_64                           rhel-8.3-kvm
x86_64                           rhel-8.3-syz
x86_64                         rhel-8.3-kunit
i386                 randconfig-a011-20221024
i386                 randconfig-a014-20221024
i386                 randconfig-a015-20221024
i386                 randconfig-a016-20221024
i386                 randconfig-a012-20221024
i386                 randconfig-a013-20221024
i386                             allyesconfig
i386                                defconfig
x86_64               randconfig-k001-20221024
mips                        bcm47xx_defconfig
powerpc                       eiger_defconfig
i386                             alldefconfig
mips                           jazz_defconfig
sh                           se7206_defconfig
powerpc                   motionpro_defconfig
sh                        sh7757lcr_defconfig
powerpc                        cell_defconfig
loongarch                        alldefconfig
sh                          polaris_defconfig
powerpc                 mpc8540_ads_defconfig
arc                      axs103_smp_defconfig
s390                                defconfig
s390                             allmodconfig
arc                                 defconfig
alpha                               defconfig
s390                             allyesconfig
x86_64               randconfig-a014-20221024
x86_64               randconfig-a015-20221024
x86_64               randconfig-a016-20221024
x86_64               randconfig-a013-20221024
x86_64               randconfig-a012-20221024
x86_64               randconfig-a011-20221024
sparc64                             defconfig
sh                          sdk7786_defconfig
powerpc                      tqm8xx_defconfig
csky                             alldefconfig
powerpc                 mpc837x_rdb_defconfig
openrisc                            defconfig
arm                        mini2440_defconfig
parisc                generic-64bit_defconfig
sh                           se7712_defconfig
i386                          randconfig-a012
i386                          randconfig-a014
i386                          randconfig-a016
powerpc                     tqm8555_defconfig
sh                          lboxre2_defconfig
i386                 randconfig-c001-20221024

clang tested configs:
x86_64               randconfig-a005-20221024
x86_64               randconfig-a002-20221024
x86_64               randconfig-a006-20221024
x86_64               randconfig-a001-20221024
x86_64               randconfig-a004-20221024
x86_64               randconfig-a003-20221024
powerpc                  mpc885_ads_defconfig
mips                           rs90_defconfig
i386                 randconfig-a004-20221024
i386                 randconfig-a006-20221024
i386                 randconfig-a002-20221024
i386                 randconfig-a003-20221024
i386                 randconfig-a001-20221024
i386                 randconfig-a005-20221024
s390                 randconfig-r044-20221023
hexagon              randconfig-r041-20221023
riscv                randconfig-r042-20221023
hexagon              randconfig-r045-20221023
x86_64                        randconfig-a012
x86_64                        randconfig-a014
x86_64                        randconfig-a016
arm                        mvebu_v5_defconfig
powerpc                 mpc832x_mds_defconfig
arm                        multi_v5_defconfig
arm                       spear13xx_defconfig

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
