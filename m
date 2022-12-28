Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F1AAB6571FA
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 28 Dec 2022 03:07:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229526AbiL1CHK (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 27 Dec 2022 21:07:10 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47136 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229525AbiL1CGt (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 27 Dec 2022 21:06:49 -0500
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EA8ADF56
        for <linux-renesas-soc@vger.kernel.org>; Tue, 27 Dec 2022 18:06:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1672193208; x=1703729208;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=aE8JaBr/mGYX4envPutFOiU2k5yl0LZDsEnaRaZqEK4=;
  b=nGoBjRocsuPBqVpXHHiSH57NFtj+/2HF6ryXgBV2cg96gE4fLm3b/fzV
   Nk67QVDrhyd1JcXpPbwkZ0go+doZwGUukpigLRZm9+XqxNMJagdfk0OPu
   6tyjno6gbj1ICYRoLiO0w1Alwm9VZwQi8ujzylTiQQJNN+Af5j9l4Yx2X
   2y/t7LDoeaPMTDHDPhDwlMf6MQS0I/pgqW4BDH395rlvKGywctYTtfmxo
   EIdcFBQxJ9Im+EPS7CyEmI+pR44L4s8E1tNGbQldEfBZZYqirLAa1mW2B
   t0//AKqWO3/gA199a9IArJWSTg92ExatCoFRRZpL6ltDqShL+UshuOTr+
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10573"; a="301152770"
X-IronPort-AV: E=Sophos;i="5.96,280,1665471600"; 
   d="scan'208";a="301152770"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Dec 2022 18:06:48 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10573"; a="898532497"
X-IronPort-AV: E=Sophos;i="5.96,280,1665471600"; 
   d="scan'208";a="898532497"
Received: from lkp-server01.sh.intel.com (HELO b5d47979f3ad) ([10.239.97.150])
  by fmsmga006.fm.intel.com with ESMTP; 27 Dec 2022 18:06:46 -0800
Received: from kbuild by b5d47979f3ad with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1pALqA-000FKe-10;
        Wed, 28 Dec 2022 02:06:46 +0000
Date:   Wed, 28 Dec 2022 10:06:14 +0800
From:   kernel test robot <lkp@intel.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     linux-renesas-soc@vger.kernel.org
Subject: [geert-renesas-drivers:master] BUILD SUCCESS
 c8c1657ff8dfd2374f0d82f0ea37b56dff9cf5b5
Message-ID: <63aba496.8PyONqZFtWAGE5nx%lkp@intel.com>
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

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git master
branch HEAD: c8c1657ff8dfd2374f0d82f0ea37b56dff9cf5b5  [LOCAL] arm64: renesas: defconfig: Update renesas_defconfig

elapsed time: 725m

configs tested: 83
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
um                           x86_64_defconfig
um                             i386_defconfig
powerpc                           allnoconfig
s390                             allmodconfig
alpha                               defconfig
arc                                 defconfig
s390                                defconfig
arm                                 defconfig
ia64                             allmodconfig
s390                             allyesconfig
i386                 randconfig-a012-20221226
i386                 randconfig-a011-20221226
i386                 randconfig-a013-20221226
i386                 randconfig-a014-20221226
i386                 randconfig-a016-20221226
i386                                defconfig
i386                 randconfig-a015-20221226
x86_64               randconfig-a014-20221226
x86_64               randconfig-a016-20221226
x86_64                              defconfig
arm64                            allyesconfig
x86_64               randconfig-a013-20221226
arm                              allyesconfig
sh                               allmodconfig
x86_64               randconfig-a011-20221226
x86_64                               rhel-8.3
x86_64               randconfig-a012-20221226
x86_64               randconfig-a015-20221226
x86_64                           rhel-8.3-bpf
x86_64                          rhel-8.3-func
x86_64                           rhel-8.3-syz
x86_64                    rhel-8.3-kselftests
x86_64                         rhel-8.3-kunit
x86_64                           rhel-8.3-kvm
powerpc                          allmodconfig
m68k                             allyesconfig
mips                             allyesconfig
m68k                             allmodconfig
arc                              allyesconfig
alpha                            allyesconfig
x86_64                           allyesconfig
i386                             allyesconfig
arm                  randconfig-r046-20221225
arc                  randconfig-r043-20221225
arc                  randconfig-r043-20221227
sh                      rts7751r2d1_defconfig
x86_64                            allnoconfig
arm                  randconfig-r046-20221227
sh                          sdk7786_defconfig
arc                  randconfig-r043-20221226
riscv                randconfig-r042-20221226
s390                 randconfig-r044-20221226
arc                        nsim_700_defconfig
arm                            xcep_defconfig
arm                            qcom_defconfig
sparc                       sparc32_defconfig
nios2                            allyesconfig

clang tested configs:
x86_64               randconfig-a002-20221226
x86_64               randconfig-a003-20221226
x86_64               randconfig-a001-20221226
i386                 randconfig-a004-20221226
i386                 randconfig-a001-20221226
x86_64               randconfig-a004-20221226
i386                 randconfig-a003-20221226
x86_64               randconfig-a005-20221226
i386                 randconfig-a002-20221226
i386                 randconfig-a006-20221226
i386                 randconfig-a005-20221226
x86_64               randconfig-a006-20221226
x86_64                          rhel-8.3-rust
hexagon              randconfig-r045-20221225
riscv                randconfig-r042-20221227
hexagon              randconfig-r041-20221225
s390                 randconfig-r044-20221227
hexagon              randconfig-r041-20221227
hexagon              randconfig-r041-20221226
arm                  randconfig-r046-20221226
s390                 randconfig-r044-20221225
hexagon              randconfig-r045-20221226
riscv                randconfig-r042-20221225
hexagon              randconfig-r045-20221227
s390                             alldefconfig
powerpc                     kmeter1_defconfig

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
