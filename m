Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 120795963D5
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 16 Aug 2022 22:41:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237086AbiHPUlE (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 16 Aug 2022 16:41:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46422 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231594AbiHPUlE (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 16 Aug 2022 16:41:04 -0400
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F26BA83BC3
        for <linux-renesas-soc@vger.kernel.org>; Tue, 16 Aug 2022 13:41:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1660682462; x=1692218462;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=fHXTYdOvqTLL63P4trBo1ZVXP25YnIu7z/Sz86h0jO4=;
  b=X9kaZu9AhOf/XjkI9/GjsrWcQNh0EN/Zv9MClSDL4tKfjklpXjcrnq9n
   g8wkhAynXE6rkO1sWB1Jf7Dn+a+lCrNb0N9MxSj63GRcsrrEXKupAZoU+
   vzheo7DZOmb1/2DBexPA/GVepT8PxQJBjxrZ3MI3W+h+Sl4ah+pGy1/Cr
   Nd4aiTtuFFxC5APs5175etgrpVdMZ43soW7bnPFPUxPcfaQn+0LeSIrLw
   Axr634o/AZdUzM23/HTZLQdWJYm5nZ7WBdhfO6QDEytdDK8l7I3HXzd0a
   HDpAvJvf0sEV3Dq8Cjtz8AFGKg6pgH0oBpB4rZEQ2h9SNGHWN/pAzbaFh
   A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10441"; a="289895715"
X-IronPort-AV: E=Sophos;i="5.93,242,1654585200"; 
   d="scan'208";a="289895715"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Aug 2022 13:41:02 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,242,1654585200"; 
   d="scan'208";a="749444240"
Received: from lkp-server02.sh.intel.com (HELO 81d7e1ade3ba) ([10.239.97.151])
  by fmsmga001.fm.intel.com with ESMTP; 16 Aug 2022 13:41:01 -0700
Received: from kbuild by 81d7e1ade3ba with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1oO3Mz-0000EG-0R;
        Tue, 16 Aug 2022 20:41:01 +0000
Date:   Wed, 17 Aug 2022 04:40:16 +0800
From:   kernel test robot <lkp@intel.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     linux-renesas-soc@vger.kernel.org
Subject: [geert-renesas-devel:master] BUILD SUCCESS
 a9c4a500b27ef2b4904a076bc44eb14dfefdff68
Message-ID: <62fc00b0.Ptl/WhrXHE7F9VpS%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git master
branch HEAD: a9c4a500b27ef2b4904a076bc44eb14dfefdff68  Merge branch 'renesas-next' into renesas-devel

elapsed time: 702m

configs tested: 68
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
um                             i386_defconfig
um                           x86_64_defconfig
i386                 randconfig-a003-20220815
i386                 randconfig-a002-20220815
i386                 randconfig-a001-20220815
i386                 randconfig-a005-20220815
i386                 randconfig-a004-20220815
arc                              allyesconfig
alpha                            allyesconfig
arc                  randconfig-r043-20220815
i386                 randconfig-a006-20220815
m68k                             allyesconfig
arm                                 defconfig
m68k                             allmodconfig
x86_64                        randconfig-a013
powerpc                           allnoconfig
x86_64                        randconfig-a011
powerpc                          allmodconfig
mips                             allyesconfig
x86_64                              defconfig
i386                                defconfig
i386                 randconfig-c001-20220815
sh                               allmodconfig
x86_64                               rhel-8.3
x86_64                        randconfig-a015
arc                               allnoconfig
alpha                             allnoconfig
x86_64                           allyesconfig
riscv                             allnoconfig
csky                              allnoconfig
x86_64               randconfig-a001-20220815
x86_64               randconfig-a003-20220815
arm                              allyesconfig
x86_64               randconfig-a005-20220815
arm64                            allyesconfig
x86_64               randconfig-a004-20220815
x86_64               randconfig-a002-20220815
x86_64               randconfig-a006-20220815
x86_64                          rhel-8.3-func
x86_64                         rhel-8.3-kunit
ia64                             allmodconfig
x86_64                    rhel-8.3-kselftests
x86_64                           rhel-8.3-syz
x86_64                           rhel-8.3-kvm
i386                             allyesconfig
arm                      integrator_defconfig
m68k                        m5307c3_defconfig
arm                         at91_dt_defconfig
sh                            shmin_defconfig
xtensa                              defconfig
m68k                        m5272c3_defconfig
mips                          rb532_defconfig
xtensa                generic_kc705_defconfig

clang tested configs:
hexagon              randconfig-r045-20220815
hexagon              randconfig-r041-20220815
riscv                randconfig-r042-20220815
s390                 randconfig-r044-20220815
i386                 randconfig-a012-20220815
i386                 randconfig-a011-20220815
i386                 randconfig-a013-20220815
i386                 randconfig-a014-20220815
i386                 randconfig-a015-20220815
x86_64                        randconfig-a012
i386                 randconfig-a016-20220815
x86_64                        randconfig-a016
x86_64                        randconfig-a014
arm                       versatile_defconfig
arm                        multi_v5_defconfig

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
