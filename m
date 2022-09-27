Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 57FF95EB97F
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 27 Sep 2022 07:20:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229531AbiI0FU3 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 27 Sep 2022 01:20:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58386 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229449AbiI0FU2 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 27 Sep 2022 01:20:28 -0400
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C066E1037
        for <linux-renesas-soc@vger.kernel.org>; Mon, 26 Sep 2022 22:20:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1664256026; x=1695792026;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=x6bkhwg0HgRHgW0B44AzncvL8icPVIKFeZnMmWTjBSA=;
  b=PtKzoDOlTlYko35iVVYpjxvY1Vv2AWHlsIDvLWwIIcK/dAQBwW4nYsll
   ytUCAXedMLPzv7kyFDsk8L0XtPTsqTeQfCAX4ne7ly6VigJTVevQRpeEd
   pam5iEmF/rPk19yLanxqL4310RPNqI+pixFJ8mc7q/TFHl/3upQyY0CRb
   2HES/YUd7dEs84XwWVzV3fh5DtCWYBxYMItR6hoQt4K+EdHCVOy4M/FgH
   Gq3xwJ3iFYCHxdXJ6fr7etlfRstuzvsct+X+7pglhSBo5WMUvxW4dWqGS
   jl+MLy9EfdRPd+gBSi+xiObUURsZGxkEuRoQ331T8bl6W4BcKUirVrRsR
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10482"; a="301203176"
X-IronPort-AV: E=Sophos;i="5.93,348,1654585200"; 
   d="scan'208";a="301203176"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Sep 2022 22:20:26 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10482"; a="950152920"
X-IronPort-AV: E=Sophos;i="5.93,348,1654585200"; 
   d="scan'208";a="950152920"
Received: from lkp-server02.sh.intel.com (HELO dfa2c9fcd321) ([10.239.97.151])
  by fmsmga005.fm.intel.com with ESMTP; 26 Sep 2022 22:20:25 -0700
Received: from kbuild by dfa2c9fcd321 with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1od316-0000dP-1D;
        Tue, 27 Sep 2022 05:20:24 +0000
Date:   Tue, 27 Sep 2022 13:20:07 +0800
From:   kernel test robot <lkp@intel.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     linux-renesas-soc@vger.kernel.org
Subject: [geert-renesas-drivers:topic/renesas-overlays] BUILD SUCCESS
 88f65e516d426aaa105416557f8157a38147cb21
Message-ID: <63328807.fvGuky6bRQ/mLHQL%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-7.2 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git topic/renesas-overlays
branch HEAD: 88f65e516d426aaa105416557f8157a38147cb21  arm64: dts: renesas: r8a779g0: whitehawk: Add overlay for MSIOF2 on CN6

elapsed time: 725m

configs tested: 105
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
um                             i386_defconfig
um                           x86_64_defconfig
arc                                 defconfig
s390                             allmodconfig
alpha                               defconfig
s390                                defconfig
s390                             allyesconfig
arc                              allyesconfig
alpha                            allyesconfig
x86_64                          rhel-8.3-func
x86_64                    rhel-8.3-kselftests
x86_64                           rhel-8.3-syz
x86_64                         rhel-8.3-kunit
x86_64                           rhel-8.3-kvm
m68k                             allmodconfig
m68k                             allyesconfig
i386                                defconfig
x86_64                              defconfig
sh                   secureedge5410_defconfig
arm                          gemini_defconfig
powerpc                      tqm8xx_defconfig
sh                               alldefconfig
m68k                        m5307c3_defconfig
powerpc                      cm5200_defconfig
x86_64                               rhel-8.3
powerpc                           allnoconfig
powerpc                          allmodconfig
i386                             allyesconfig
mips                             allyesconfig
x86_64                           allyesconfig
csky                              allnoconfig
alpha                             allnoconfig
arc                               allnoconfig
riscv                             allnoconfig
x86_64               randconfig-a002-20220926
x86_64               randconfig-a001-20220926
x86_64               randconfig-a004-20220926
x86_64               randconfig-a006-20220926
x86_64               randconfig-a005-20220926
x86_64               randconfig-a003-20220926
arm64                            allyesconfig
arm                                 defconfig
arm                              allyesconfig
sh                               allmodconfig
s390                          debug_defconfig
i386                 randconfig-a003-20220926
i386                 randconfig-a001-20220926
i386                 randconfig-a006-20220926
i386                 randconfig-a004-20220926
i386                 randconfig-a005-20220926
i386                 randconfig-a002-20220926
i386                          randconfig-c001
riscv                    nommu_virt_defconfig
riscv                          rv32_defconfig
riscv                    nommu_k210_defconfig
i386                   debian-10.3-kselftests
i386                              debian-10.3
powerpc                     mpc83xx_defconfig
arm                         vf610m4_defconfig
openrisc                    or1ksim_defconfig
x86_64                        randconfig-a006
x86_64                        randconfig-a004
x86_64                        randconfig-a002
i386                          debian-10.3-kvm
i386                        debian-10.3-kunit
i386                         debian-10.3-func
x86_64                        randconfig-c001
arm                  randconfig-c002-20220925
ia64                             allmodconfig
nios2                            allyesconfig
nios2                               defconfig
parisc                              defconfig
parisc64                            defconfig
parisc                           allyesconfig
arm                         axm55xx_defconfig
powerpc                 canyonlands_defconfig

clang tested configs:
i386                 randconfig-a011-20220926
i386                 randconfig-a015-20220926
i386                 randconfig-a014-20220926
i386                 randconfig-a012-20220926
i386                 randconfig-a013-20220926
i386                 randconfig-a016-20220926
x86_64                        randconfig-k001
x86_64               randconfig-a016-20220926
x86_64               randconfig-a012-20220926
x86_64               randconfig-a014-20220926
x86_64               randconfig-a013-20220926
x86_64               randconfig-a011-20220926
x86_64               randconfig-a015-20220926
powerpc                      katmai_defconfig
powerpc                      ppc44x_defconfig
hexagon              randconfig-r041-20220925
hexagon              randconfig-r041-20220926
hexagon              randconfig-r045-20220925
hexagon              randconfig-r045-20220926
riscv                randconfig-r042-20220926
s390                 randconfig-r044-20220926
powerpc                          allmodconfig
arm                          collie_defconfig
mips                           mtx1_defconfig
i386                          randconfig-a002
i386                          randconfig-a006
i386                          randconfig-a004
powerpc                   microwatt_defconfig
mips                          ath25_defconfig
arm                     davinci_all_defconfig

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
