Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 95DD66154E1
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  1 Nov 2022 23:21:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230187AbiKAWVb (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 1 Nov 2022 18:21:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57670 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230184AbiKAWV3 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 1 Nov 2022 18:21:29 -0400
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2775D1A234
        for <linux-renesas-soc@vger.kernel.org>; Tue,  1 Nov 2022 15:21:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1667341289; x=1698877289;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=Z8sNO1yzWnkTVUMbcZzmzfAewawAwdaihiKCT6p+7+U=;
  b=gciG8KtaEwLZymlnQL8/0tkcNYllNYMo8F+2rpU85H3ARqXv7x5x4T/Q
   hIHprNerFfL1vOHq2nzzCZjuoWOKsvIwMZmW36PJlZHa5sgLLbLz/l5oT
   HVyo4mGtPqjDLB8Nf02mapy36dmwnQVmfGXD9IhaFlaMLAkjfa89fmAYk
   7x5vhJjou+dPYmIqEhQHOgR5xiiDDHWzQBYxLuvSPZXkVGMWS6XTG3NG5
   U/zF1UfZTTCGucfsfx7uLFtjYu1p/oZ4r0qyBhVxF3bakvJWV6us78swC
   koK2RwWrL0LVtNMswsshDBhlNjn/rAsERlh6LgToqTyl08Vchx8/wfN8v
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10518"; a="307977792"
X-IronPort-AV: E=Sophos;i="5.95,232,1661842800"; 
   d="scan'208";a="307977792"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Nov 2022 15:21:28 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10518"; a="759328723"
X-IronPort-AV: E=Sophos;i="5.95,232,1661842800"; 
   d="scan'208";a="759328723"
Received: from lkp-server02.sh.intel.com (HELO b6d29c1a0365) ([10.239.97.151])
  by orsmga004.jf.intel.com with ESMTP; 01 Nov 2022 15:21:27 -0700
Received: from kbuild by b6d29c1a0365 with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1opzdO-000E6U-2p;
        Tue, 01 Nov 2022 22:21:26 +0000
Date:   Wed, 02 Nov 2022 06:21:17 +0800
From:   kernel test robot <lkp@intel.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     linux-renesas-soc@vger.kernel.org
Subject: [geert-renesas-devel:master] BUILD SUCCESS
 484e5fc34235bd38f3d58742e7af8455e2699205
Message-ID: <63619bdd.IgF1ISrAPJWCbKmD%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-5.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git master
branch HEAD: 484e5fc34235bd38f3d58742e7af8455e2699205  Merge tag 'v6.1-rc3' into renesas-devel

elapsed time: 721m

configs tested: 67
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
x86_64                              defconfig
um                             i386_defconfig
um                           x86_64_defconfig
arc                                 defconfig
alpha                               defconfig
x86_64                        randconfig-a011
i386                          randconfig-a001
i386                          randconfig-a003
x86_64                               rhel-8.3
s390                             allmodconfig
s390                                defconfig
i386                 randconfig-a014-20221031
x86_64                           rhel-8.3-kvm
i386                 randconfig-a011-20221031
i386                                defconfig
i386                 randconfig-a012-20221031
x86_64                           rhel-8.3-syz
arc                  randconfig-r043-20221101
i386                          randconfig-a005
x86_64                        randconfig-a013
i386                 randconfig-a013-20221031
x86_64                         rhel-8.3-kunit
x86_64                           allyesconfig
i386                 randconfig-a015-20221031
x86_64                        randconfig-a002
i386                 randconfig-a016-20221031
s390                             allyesconfig
powerpc                           allnoconfig
x86_64                        randconfig-a015
x86_64                        randconfig-a004
powerpc                          allmodconfig
x86_64                        randconfig-a006
mips                             allyesconfig
x86_64                    rhel-8.3-kselftests
x86_64                          rhel-8.3-func
ia64                             allmodconfig
sh                               allmodconfig
alpha                            allyesconfig
arc                              allyesconfig
arm                                 defconfig
m68k                             allyesconfig
m68k                             allmodconfig
i386                             allyesconfig
arm                              allyesconfig
arm64                            allyesconfig
i386                          randconfig-a012
i386                          randconfig-a014
i386                          randconfig-a016

clang tested configs:
x86_64                        randconfig-a012
i386                          randconfig-a002
hexagon              randconfig-r041-20221101
i386                          randconfig-a004
x86_64                        randconfig-a016
x86_64                        randconfig-a001
x86_64                        randconfig-a003
i386                          randconfig-a006
x86_64                        randconfig-a005
riscv                randconfig-r042-20221101
x86_64                        randconfig-a014
hexagon              randconfig-r045-20221101
s390                 randconfig-r044-20221101
x86_64               randconfig-a005-20221031
x86_64               randconfig-a006-20221031
x86_64               randconfig-a004-20221031
x86_64               randconfig-a001-20221031
x86_64               randconfig-a003-20221031
x86_64               randconfig-a002-20221031

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
