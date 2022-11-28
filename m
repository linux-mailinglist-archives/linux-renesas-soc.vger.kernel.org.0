Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C4C3463B43E
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 28 Nov 2022 22:30:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231252AbiK1VaE (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 28 Nov 2022 16:30:04 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60022 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234136AbiK1VaC (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 28 Nov 2022 16:30:02 -0500
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7E0C629832
        for <linux-renesas-soc@vger.kernel.org>; Mon, 28 Nov 2022 13:30:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1669671000; x=1701207000;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=OsS6Z4dRuShhCNFbW4ecZsSAeZ9DkQ+AvBhp3FBwSHM=;
  b=harxt3UXHsbVWGdR65A7a/naRatfQ97pp+xUjtMLk37AePf8qmvzHrU8
   UBTM8nJUcBiic5QDWYAv8ObORw2qk2FitEhteY/0MqEdz2YE4yDDDIxo0
   f5snxP/gpp+pg09te9lCyjDw7rjdsOpx0DdW6EXxzRxrPQuMMA9CS2Lxu
   bpuV+ynAGYS1Af6U2+f3GexQAxF4cCJEA93+bSDrm640ufU66sKvTMM/s
   xlBX2X4w4EPZevHvCsxaYaQE6rFCtBiIvrBxvUbnKazd2hjOH3fZS6tOD
   qgyIwMQY0Jsj5XBMPa/VSMjApWC9VxGL4ey6BbYZXdeH+I2Q3StZDjDT3
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10545"; a="312578916"
X-IronPort-AV: E=Sophos;i="5.96,201,1665471600"; 
   d="scan'208";a="312578916"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Nov 2022 13:29:59 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10545"; a="888588019"
X-IronPort-AV: E=Sophos;i="5.96,201,1665471600"; 
   d="scan'208";a="888588019"
Received: from lkp-server01.sh.intel.com (HELO 64a2d449c951) ([10.239.97.150])
  by fmsmga006.fm.intel.com with ESMTP; 28 Nov 2022 13:29:58 -0800
Received: from kbuild by 64a2d449c951 with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1ozlhN-0008Iz-2z;
        Mon, 28 Nov 2022 21:29:57 +0000
Date:   Tue, 29 Nov 2022 05:29:38 +0800
From:   kernel test robot <lkp@intel.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     linux-renesas-soc@vger.kernel.org
Subject: [geert-renesas-drivers:topic/renesas-bsp-rebase-v6.1] BUILD
 SUCCESS df174606b1cd2a72d28415653b1b4fc1975a4848
Message-ID: <63852842.cwZWQGjXCHSIRS5D%lkp@intel.com>
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

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git topic/renesas-bsp-rebase-v6.1
branch HEAD: df174606b1cd2a72d28415653b1b4fc1975a4848  BSP rebase: Drop upstreamed r8a779g0 HSCIF parent clk fix

elapsed time: 763m

configs tested: 58
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
powerpc                           allnoconfig
um                           x86_64_defconfig
arc                  randconfig-r043-20221128
x86_64                              defconfig
x86_64                          rhel-8.3-func
x86_64                    rhel-8.3-kselftests
i386                                defconfig
x86_64                               rhel-8.3
ia64                             allmodconfig
x86_64               randconfig-a002-20221128
x86_64               randconfig-a001-20221128
x86_64                           allyesconfig
x86_64               randconfig-a003-20221128
x86_64                           rhel-8.3-syz
x86_64                         rhel-8.3-kunit
x86_64                           rhel-8.3-kvm
x86_64               randconfig-a004-20221128
x86_64               randconfig-a005-20221128
x86_64               randconfig-a006-20221128
i386                             allyesconfig
sh                               allmodconfig
i386                 randconfig-a003-20221128
i386                 randconfig-a001-20221128
i386                 randconfig-a002-20221128
i386                 randconfig-a005-20221128
i386                 randconfig-a004-20221128
i386                 randconfig-a006-20221128
mips                             allyesconfig
powerpc                          allmodconfig
um                             i386_defconfig
m68k                             allmodconfig
arc                              allyesconfig
alpha                            allyesconfig
m68k                             allyesconfig
arc                                 defconfig
s390                             allmodconfig
alpha                               defconfig
s390                                defconfig
s390                             allyesconfig
arm                                 defconfig
arm                              allyesconfig
arm64                            allyesconfig

clang tested configs:
i386                 randconfig-a012-20221128
i386                 randconfig-a011-20221128
i386                 randconfig-a013-20221128
i386                 randconfig-a014-20221128
hexagon              randconfig-r045-20221128
i386                 randconfig-a015-20221128
i386                 randconfig-a016-20221128
hexagon              randconfig-r041-20221128
riscv                randconfig-r042-20221128
s390                 randconfig-r044-20221128
x86_64               randconfig-a012-20221128
x86_64               randconfig-a014-20221128
x86_64               randconfig-a011-20221128
x86_64               randconfig-a016-20221128
x86_64               randconfig-a015-20221128
x86_64               randconfig-a013-20221128

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
