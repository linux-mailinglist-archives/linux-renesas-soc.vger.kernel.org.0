Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 02D5267A575
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 24 Jan 2023 23:15:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230151AbjAXWP1 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 24 Jan 2023 17:15:27 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48402 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229926AbjAXWP0 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 24 Jan 2023 17:15:26 -0500
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7A057EC50
        for <linux-renesas-soc@vger.kernel.org>; Tue, 24 Jan 2023 14:15:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1674598525; x=1706134525;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=76sSyp1VppFC/Gx+pRAOlGq1B5JdACuMbrNIzHi/UTk=;
  b=jl7LTTBX5OJH2B2eAGy4FmDLX7BxbTimRLrmcdGkHZgNbYEg/q2rUqk6
   V7U08n7BlGL8HMogNAzF9H2hSFVpZ7exAOX90fcWbH63EVjCRqGqiLkUA
   fLDtqd0Lmt2O6D1kY1DwcOtskah3oOzljr/esucQzHGMjVR9eXffhrqPg
   hYThEFuJkbO6ZwWLTKLqMiEC7+aY868PKfzIKIQzM6KBU2W/9YXPAV8pg
   bcT7I8DXIAdrVfhb9y5mgRGCbTvSYtG2Mtzw9KIU2zq3HlraDdmJseLUT
   y0IDdvCgrlpmbb2r4CuaxIrBQYO5Rt/tVQSMpdBpOyHVMYU5Ix7Bzq1AM
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10600"; a="326453854"
X-IronPort-AV: E=Sophos;i="5.97,243,1669104000"; 
   d="scan'208";a="326453854"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Jan 2023 14:15:25 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10600"; a="730839362"
X-IronPort-AV: E=Sophos;i="5.97,243,1669104000"; 
   d="scan'208";a="730839362"
Received: from lkp-server01.sh.intel.com (HELO 5646d64e7320) ([10.239.97.150])
  by fmsmga004.fm.intel.com with ESMTP; 24 Jan 2023 14:15:24 -0800
Received: from kbuild by 5646d64e7320 with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1pKRZb-0006pF-1H;
        Tue, 24 Jan 2023 22:15:23 +0000
Date:   Wed, 25 Jan 2023 06:14:51 +0800
From:   kernel test robot <lkp@intel.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     linux-renesas-soc@vger.kernel.org
Subject: [geert-renesas-drivers:renesas-clk-for-v6.3] BUILD SUCCESS
 584d29912db27e56eaaccd225e283e1f429e4f83
Message-ID: <63d0585b.OKzRRHSTwHcL86My%lkp@intel.com>
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

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git renesas-clk-for-v6.3
branch HEAD: 584d29912db27e56eaaccd225e283e1f429e4f83  clk: renesas: r8a779g0: Add custom clock for PLL2

elapsed time: 730m

configs tested: 75
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
x86_64                            allnoconfig
um                             i386_defconfig
um                           x86_64_defconfig
arc                                 defconfig
alpha                               defconfig
s390                             allmodconfig
s390                             allyesconfig
s390                                defconfig
powerpc                           allnoconfig
x86_64                              defconfig
x86_64                               rhel-8.3
m68k                             allyesconfig
m68k                             allmodconfig
arc                              allyesconfig
alpha                            allyesconfig
arc                  randconfig-r043-20230123
x86_64                           allyesconfig
arm                  randconfig-r046-20230123
x86_64                          rhel-8.3-func
ia64                             allmodconfig
x86_64                    rhel-8.3-kselftests
i386                 randconfig-a006-20230123
i386                          randconfig-a014
i386                                defconfig
i386                          randconfig-a012
i386                          randconfig-a016
x86_64                           rhel-8.3-syz
x86_64                         rhel-8.3-kunit
x86_64                           rhel-8.3-kvm
sh                               allmodconfig
x86_64                           rhel-8.3-bpf
i386                 randconfig-a004-20230123
x86_64               randconfig-a006-20230123
x86_64               randconfig-a002-20230123
i386                 randconfig-a003-20230123
i386                 randconfig-a002-20230123
i386                 randconfig-a001-20230123
x86_64               randconfig-a001-20230123
arm                                 defconfig
x86_64               randconfig-a004-20230123
i386                 randconfig-a005-20230123
x86_64               randconfig-a003-20230123
i386                             allyesconfig
x86_64               randconfig-a005-20230123
mips                             allyesconfig
arm64                            allyesconfig
powerpc                          allmodconfig
arm                              allyesconfig
riscv                    nommu_virt_defconfig
riscv                          rv32_defconfig
riscv                    nommu_k210_defconfig
riscv                             allnoconfig
i386                   debian-10.3-kselftests
i386                              debian-10.3

clang tested configs:
hexagon              randconfig-r045-20230123
hexagon              randconfig-r041-20230123
s390                 randconfig-r044-20230123
riscv                randconfig-r042-20230123
x86_64                          rhel-8.3-rust
i386                          randconfig-a013
x86_64               randconfig-a013-20230123
i386                          randconfig-a011
x86_64               randconfig-a011-20230123
x86_64               randconfig-a012-20230123
i386                          randconfig-a015
x86_64               randconfig-a015-20230123
x86_64               randconfig-a014-20230123
x86_64               randconfig-a016-20230123
i386                 randconfig-a012-20230123
i386                 randconfig-a013-20230123
i386                 randconfig-a015-20230123
i386                 randconfig-a011-20230123
i386                 randconfig-a014-20230123
i386                 randconfig-a016-20230123
x86_64               randconfig-k001-20230123

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
