Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 30B7360EBFA
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 27 Oct 2022 01:01:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229510AbiJZXB0 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 26 Oct 2022 19:01:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41540 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233976AbiJZXBI (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 26 Oct 2022 19:01:08 -0400
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 10E3E3AE44
        for <linux-renesas-soc@vger.kernel.org>; Wed, 26 Oct 2022 16:00:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1666825222; x=1698361222;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=7d9Au/Tq0hN3hD0LqKiP2ZvoLT9KvCOYqE2xoKONPNU=;
  b=ATauj5VpdJsV42nC6vWrdb/cACN2RtXgRGTL7u0Nfp5kEZ6oQYitk+J1
   nsJBhCP34AGL2jaTV00CPEL8LQg2iAroG+JyC6+hVeTDLhef06esR/oxN
   Lx24eGdAx8nwnQ4y9uSEVw8PSyQs9NRjWxkC2i3G26klnTD9zTsk1fZ7H
   5CSy2+FHvDDjYBGGRNOKXWnvCx5szU0H47WKrWSFDrkiXjU+BsD85LVhI
   jklOv4SHTHFX2LNsb5Y9/e1hVGSMKPCVqFeDtEWgAYzMbr9AQ2MSo7AHO
   g9lAjESdTfIH11ABi0RLWeOm4h1ecD7bZ6mhdrcFY8+cioOtd3G8zC/oF
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10512"; a="287796895"
X-IronPort-AV: E=Sophos;i="5.95,215,1661842800"; 
   d="scan'208";a="287796895"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Oct 2022 16:00:20 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10512"; a="774776661"
X-IronPort-AV: E=Sophos;i="5.95,215,1661842800"; 
   d="scan'208";a="774776661"
Received: from lkp-server02.sh.intel.com (HELO b6d29c1a0365) ([10.239.97.151])
  by fmsmga001.fm.intel.com with ESMTP; 26 Oct 2022 16:00:19 -0700
Received: from kbuild by b6d29c1a0365 with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1onpNj-0007xS-1A;
        Wed, 26 Oct 2022 23:00:19 +0000
Date:   Thu, 27 Oct 2022 06:59:51 +0800
From:   kernel test robot <lkp@intel.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     linux-renesas-soc@vger.kernel.org
Subject: [geert-renesas-drivers:renesas-clk-fixes-for-v6.1] BUILD SUCCESS
 a9003f74f5a2f487e101f3aa1dd5c3d3a78c6999
Message-ID: <6359bbe7.4zev5UV4d+oHEoVT%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.9 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_PASS,SPF_NONE,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git renesas-clk-fixes-for-v6.1
branch HEAD: a9003f74f5a2f487e101f3aa1dd5c3d3a78c6999  clk: renesas: r8a779g0: Fix HSCIF parent clocks

elapsed time: 725m

configs tested: 70
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arc                                 defconfig
s390                             allmodconfig
alpha                               defconfig
um                             i386_defconfig
um                           x86_64_defconfig
i386                                defconfig
x86_64                              defconfig
s390                                defconfig
s390                             allyesconfig
arm                                 defconfig
x86_64                               rhel-8.3
x86_64                         rhel-8.3-kunit
x86_64                        randconfig-a013
x86_64                           rhel-8.3-kvm
x86_64                        randconfig-a011
x86_64                           allyesconfig
riscv                randconfig-r042-20221026
ia64                             allmodconfig
x86_64                        randconfig-a002
x86_64                           rhel-8.3-syz
x86_64                        randconfig-a015
arc                  randconfig-r043-20221026
x86_64                          rhel-8.3-func
s390                 randconfig-r044-20221026
x86_64                    rhel-8.3-kselftests
powerpc                          allmodconfig
x86_64                        randconfig-a004
mips                             allyesconfig
x86_64                        randconfig-a006
i386                          randconfig-a014
powerpc                           allnoconfig
i386                          randconfig-a012
arm                              allyesconfig
i386                          randconfig-a016
i386                             allyesconfig
arm64                            allyesconfig
sh                               allmodconfig
i386                          randconfig-a003
i386                          randconfig-a001
i386                          randconfig-a005
m68k                             allyesconfig
m68k                             allmodconfig
arc                              allyesconfig
alpha                            allyesconfig
m68k                            q40_defconfig
arm                           imxrt_defconfig
arm                         assabet_defconfig
arm                          gemini_defconfig
powerpc                    amigaone_defconfig
sh                           se7724_defconfig
sh                          rsk7201_defconfig
sparc                             allnoconfig
m68k                        m5272c3_defconfig
xtensa                    smp_lx200_defconfig
i386                          randconfig-c001

clang tested configs:
hexagon              randconfig-r045-20221026
hexagon              randconfig-r041-20221026
x86_64                        randconfig-a016
x86_64                        randconfig-a012
x86_64                        randconfig-a014
x86_64                        randconfig-a001
x86_64                        randconfig-a003
i386                          randconfig-a013
x86_64                        randconfig-a005
i386                          randconfig-a011
i386                          randconfig-a015
i386                          randconfig-a004
i386                          randconfig-a002
i386                          randconfig-a006
x86_64                        randconfig-k001

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
