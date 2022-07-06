Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 494BF567D5C
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  6 Jul 2022 06:32:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229521AbiGFEc1 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 6 Jul 2022 00:32:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49934 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229493AbiGFEcZ (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 6 Jul 2022 00:32:25 -0400
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2C0B2140E7
        for <linux-renesas-soc@vger.kernel.org>; Tue,  5 Jul 2022 21:32:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1657081945; x=1688617945;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=7cmQRqXmWvhS4nuSJuDiGkGcRCezMYhv75HbtY/Z6O4=;
  b=IoNU5ym9WieZjQsuwfFR/O0ctLFkapAtp4bdNjLaib5OWaahTMRGb/gT
   lNQEHaisYLkDfSNHt47K5UB9lVb3EkbIWuVYwgtXyjOrZ0kvWa9cwL6UU
   w2aLiw9mvTI0dB2Z1M0ScJO8SwFBORLUKr09aMKtGo8TSj+UgDcmbM/kx
   +e5ZSbfKNBa4FJMwmG6PwEuvksSYTZfrT688PXqVaNB3HaOViZVnsTjv3
   79RzGT0iLCh93g5sdlAz8zrWDHc6riW8znAJrkYBwF/+YTLlTN/5supy5
   MzzlKA2wdWJkbJ28PVf/qEbQZrYu60HfmIRF9SnD24wSsab5YlhcPfX9d
   Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10399"; a="282391359"
X-IronPort-AV: E=Sophos;i="5.92,248,1650956400"; 
   d="scan'208";a="282391359"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Jul 2022 21:32:25 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.92,248,1650956400"; 
   d="scan'208";a="660808813"
Received: from lkp-server01.sh.intel.com (HELO 68b931ab7ac1) ([10.239.97.150])
  by fmsmga004.fm.intel.com with ESMTP; 05 Jul 2022 21:32:23 -0700
Received: from kbuild by 68b931ab7ac1 with local (Exim 4.95)
        (envelope-from <lkp@intel.com>)
        id 1o8wi7-000K0a-5C;
        Wed, 06 Jul 2022 04:32:23 +0000
Date:   Wed, 06 Jul 2022 12:31:24 +0800
From:   kernel test robot <lkp@intel.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     linux-renesas-soc@vger.kernel.org
Subject: [geert-renesas-drivers:master] BUILD SUCCESS
 e3fa3b4c04d13d042e259755e2d48d2170e667ca
Message-ID: <62c5101c.WEfMAsCqGyX/Yr7o%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-5.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git master
branch HEAD: e3fa3b4c04d13d042e259755e2d48d2170e667ca  [LOCAL] arm64: renesas: defconfig: Update renesas_defconfig

elapsed time: 725m

configs tested: 52
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                                 defconfig
arm                              allyesconfig
arm64                            allyesconfig
ia64                             allmodconfig
m68k                             allmodconfig
arc                              allyesconfig
alpha                            allyesconfig
m68k                             allyesconfig
mips                             allyesconfig
powerpc                          allmodconfig
powerpc                           allnoconfig
sh                               allmodconfig
i386                                defconfig
i386                             allyesconfig
x86_64                        randconfig-a002
x86_64                        randconfig-a004
x86_64                        randconfig-a006
i386                          randconfig-a001
i386                          randconfig-a003
i386                          randconfig-a005
x86_64                        randconfig-a013
x86_64                        randconfig-a011
x86_64                        randconfig-a015
i386                          randconfig-a014
i386                          randconfig-a012
i386                          randconfig-a016
riscv                randconfig-r042-20220703
arc                  randconfig-r043-20220703
s390                 randconfig-r044-20220703
um                             i386_defconfig
um                           x86_64_defconfig
x86_64                              defconfig
x86_64                               rhel-8.3
x86_64                           allyesconfig
x86_64                          rhel-8.3-func
x86_64                         rhel-8.3-kunit
x86_64                    rhel-8.3-kselftests
x86_64                           rhel-8.3-syz

clang tested configs:
x86_64                        randconfig-a005
x86_64                        randconfig-a001
x86_64                        randconfig-a003
i386                          randconfig-a004
i386                          randconfig-a002
i386                          randconfig-a006
x86_64                        randconfig-a012
x86_64                        randconfig-a014
x86_64                        randconfig-a016
i386                          randconfig-a013
i386                          randconfig-a011
i386                          randconfig-a015
hexagon              randconfig-r041-20220703
hexagon              randconfig-r045-20220703

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
