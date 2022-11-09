Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6B37D62219A
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  9 Nov 2022 03:06:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229600AbiKICGO (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 8 Nov 2022 21:06:14 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46134 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229549AbiKICGN (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 8 Nov 2022 21:06:13 -0500
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EA43A67F40
        for <linux-renesas-soc@vger.kernel.org>; Tue,  8 Nov 2022 18:06:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1667959572; x=1699495572;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=1+bgl88bT4l84dWxe1Esxv0aN/tc0w23er9ayL4UHmo=;
  b=DUyoZn+m8MKVRW4CXI5LQya1u+B8pF4c5RZGFBuuMOzNXFQo7ZsiKRo0
   OHkogufCaOmgP0UcFEaBTsLZyJS2yS3uYYhm1k/dYydg5S2bpB+HnDsHl
   xahY6du0nDFELhEY00HB8KFAHQI0Qdp1iFr7wmosyIba/JSWECyw0RSQX
   iCWGZeCNmW1T08CrthO4Vnw2rBRcKILn+UDVo7B066DUD4yyFkjI1aX0S
   X+xW+bMa7I1x/xWl+YN3EXSpVyl+L2/zpCCHjgXflS+eOFA7JbM2uQx3N
   o4oECQoM6985yuX3wPQjKdcXZ1bMp1zyPR7Dy7zr/W+SjWc+stJIENQmw
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10525"; a="298382474"
X-IronPort-AV: E=Sophos;i="5.96,149,1665471600"; 
   d="scan'208";a="298382474"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Nov 2022 18:06:12 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10525"; a="811455704"
X-IronPort-AV: E=Sophos;i="5.96,149,1665471600"; 
   d="scan'208";a="811455704"
Received: from lkp-server01.sh.intel.com (HELO e783503266e8) ([10.239.97.150])
  by orsmga005.jf.intel.com with ESMTP; 08 Nov 2022 18:06:11 -0800
Received: from kbuild by e783503266e8 with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1osaTi-0000uc-2S;
        Wed, 09 Nov 2022 02:06:10 +0000
Date:   Wed, 09 Nov 2022 10:05:57 +0800
From:   kernel test robot <lkp@intel.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     linux-renesas-soc@vger.kernel.org
Subject: [geert-renesas-devel:master] BUILD SUCCESS
 ed9fa6187434bcda5af0af31b20d30a839b0200a
Message-ID: <636b0b05.cLY6JLAxLju2tE66%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git master
branch HEAD: ed9fa6187434bcda5af0af31b20d30a839b0200a  Merge branch 'renesas-next' into renesas-devel

elapsed time: 727m

configs tested: 66
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
x86_64                          rhel-8.3-func
x86_64                    rhel-8.3-kselftests
arc                                 defconfig
s390                             allmodconfig
alpha                               defconfig
s390                                defconfig
powerpc                           allnoconfig
mips                             allyesconfig
um                           x86_64_defconfig
powerpc                          allmodconfig
um                             i386_defconfig
arc                  randconfig-r043-20221108
riscv                randconfig-r042-20221108
alpha                            allyesconfig
s390                             allyesconfig
sh                               allmodconfig
arc                              allyesconfig
s390                 randconfig-r044-20221108
i386                                defconfig
i386                          randconfig-a001
i386                          randconfig-a003
i386                          randconfig-a005
m68k                             allyesconfig
x86_64               randconfig-a004-20221107
x86_64               randconfig-a005-20221107
m68k                             allmodconfig
x86_64               randconfig-a001-20221107
x86_64               randconfig-a003-20221107
x86_64               randconfig-a006-20221107
x86_64               randconfig-a002-20221107
i386                          randconfig-a014
i386                          randconfig-a012
i386                          randconfig-a016
x86_64                        randconfig-a015
x86_64                        randconfig-a013
ia64                             allmodconfig
x86_64                           rhel-8.3-syz
x86_64                         rhel-8.3-kunit
x86_64                        randconfig-a011
x86_64                              defconfig
x86_64                           rhel-8.3-kvm
i386                             allyesconfig
x86_64                               rhel-8.3
x86_64                           allyesconfig
arm                                 defconfig
arm64                            allyesconfig
arm                              allyesconfig
x86_64                            allnoconfig

clang tested configs:
hexagon              randconfig-r045-20221108
hexagon              randconfig-r041-20221108
i386                          randconfig-a002
i386                          randconfig-a004
i386                          randconfig-a013
i386                          randconfig-a015
i386                          randconfig-a011
i386                          randconfig-a006
x86_64                        randconfig-a014
x86_64                        randconfig-a016
x86_64                        randconfig-a012
riscv                randconfig-r042-20221107
hexagon              randconfig-r041-20221107
hexagon              randconfig-r045-20221107
s390                 randconfig-r044-20221107
x86_64                        randconfig-a005
x86_64                        randconfig-a003
x86_64                        randconfig-a001

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
