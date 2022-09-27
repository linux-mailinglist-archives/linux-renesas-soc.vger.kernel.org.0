Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 42D945ECD28
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 27 Sep 2022 21:50:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232032AbiI0Tt4 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 27 Sep 2022 15:49:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35360 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231269AbiI0Ttz (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 27 Sep 2022 15:49:55 -0400
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2C8CD796AA
        for <linux-renesas-soc@vger.kernel.org>; Tue, 27 Sep 2022 12:49:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1664308194; x=1695844194;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=+QLnsGiuHnTq1GJNDgCfr9MVoXOLhEPYOhtuoHXdgyo=;
  b=XIcEONRAjsO0QHl0BeKGxLVHANFw97Sfzzc4ljnvS0UBMzV7hVmAIA3+
   mm3i2XCUop/spzVX2JHgr2/Yhe1ojjttrWONGNDElxUVe8uKVNLHqIYBL
   a8NtAOWytHoqQURtTTiCDNl59lw9uoYJgIs/ROI946BhJGtqlm+9Gjdb4
   PyfXb7q+YdN9RVBPT26RKbGutfHA5cF7aeZcVk8Du2aHR9bR9k6QBYdOT
   Ig0uXEwTwV7vtrCc1MzY9VdGJC6c8EKutpdMik0Ea6uGVIAQFlhzgxQWw
   9cGl7ZiDYzfh/JKly2daGnu2VJogVARsnokkoI5gjQZ63/Wkja0F5n8tv
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10483"; a="302897569"
X-IronPort-AV: E=Sophos;i="5.93,350,1654585200"; 
   d="scan'208";a="302897569"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Sep 2022 12:49:53 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10483"; a="764001415"
X-IronPort-AV: E=Sophos;i="5.93,350,1654585200"; 
   d="scan'208";a="764001415"
Received: from lkp-server02.sh.intel.com (HELO dfa2c9fcd321) ([10.239.97.151])
  by fmsmga001.fm.intel.com with ESMTP; 27 Sep 2022 12:49:52 -0700
Received: from kbuild by dfa2c9fcd321 with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1odGaV-0001Wa-1q;
        Tue, 27 Sep 2022 19:49:51 +0000
Date:   Wed, 28 Sep 2022 03:49:10 +0800
From:   kernel test robot <lkp@intel.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     linux-renesas-soc@vger.kernel.org
Subject: [geert-renesas-devel:renesas-arm-dt-for-v6.2] BUILD SUCCESS
 49145dc254b11c454f4d38ebf5fe745e849a1a2b
Message-ID: <633353b6.stQLNXRvxUalVNdL%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.5 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git renesas-arm-dt-for-v6.2
branch HEAD: 49145dc254b11c454f4d38ebf5fe745e849a1a2b  arm64: dts: renesas: rzg2ul-smarc: Move spi1 pinmux to carrier board DTSI

elapsed time: 722m

configs tested: 63
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
um                             i386_defconfig
um                           x86_64_defconfig
powerpc                           allnoconfig
arc                                 defconfig
alpha                               defconfig
x86_64                              defconfig
s390                                defconfig
sh                               allmodconfig
x86_64                               rhel-8.3
powerpc                          allmodconfig
s390                             allmodconfig
x86_64                          rhel-8.3-func
mips                             allyesconfig
x86_64                    rhel-8.3-kselftests
x86_64                           allyesconfig
m68k                             allyesconfig
m68k                             allmodconfig
arc                              allyesconfig
alpha                            allyesconfig
s390                             allyesconfig
x86_64                        randconfig-a002
arc                  randconfig-r043-20220925
x86_64                        randconfig-a004
riscv                randconfig-r042-20220925
x86_64                        randconfig-a006
arc                  randconfig-r043-20220926
s390                 randconfig-r044-20220925
x86_64                           rhel-8.3-syz
x86_64                         rhel-8.3-kunit
x86_64                           rhel-8.3-kvm
i386                 randconfig-a001-20220926
i386                 randconfig-a004-20220926
i386                 randconfig-a002-20220926
i386                 randconfig-a003-20220926
i386                 randconfig-a005-20220926
i386                 randconfig-a006-20220926
i386                                defconfig
i386                             allyesconfig
arm                                 defconfig
arm                              allyesconfig
arm64                            allyesconfig
ia64                             allmodconfig

clang tested configs:
i386                 randconfig-a011-20220926
i386                 randconfig-a015-20220926
i386                 randconfig-a014-20220926
x86_64                        randconfig-a001
hexagon              randconfig-r045-20220925
i386                 randconfig-a013-20220926
x86_64                        randconfig-a003
hexagon              randconfig-r041-20220926
i386                 randconfig-a012-20220926
i386                 randconfig-a016-20220926
hexagon              randconfig-r045-20220926
x86_64                        randconfig-a005
hexagon              randconfig-r041-20220925
riscv                randconfig-r042-20220926
s390                 randconfig-r044-20220926
x86_64               randconfig-a015-20220926
x86_64               randconfig-a012-20220926
x86_64               randconfig-a014-20220926
x86_64               randconfig-a013-20220926
x86_64               randconfig-a011-20220926
x86_64               randconfig-a016-20220926

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
