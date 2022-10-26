Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 17A0E60EBFB
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 27 Oct 2022 01:01:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233963AbiJZXB1 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 26 Oct 2022 19:01:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43676 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234042AbiJZXBJ (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 26 Oct 2022 19:01:09 -0400
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E515D3C174
        for <linux-renesas-soc@vger.kernel.org>; Wed, 26 Oct 2022 16:00:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1666825223; x=1698361223;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=cF9jda71zhVAhqGd/pMMPLaC+IhFAgghhy/Yuv6K6w0=;
  b=XZ9WbY4fQt76jJcKCnTVYZlEeklRirigygFJicUhuOCgOwmOQdgCkJWO
   jwCIXeIq9fUA31RZSsi2BCi3bveqy+2yRMSglBYy6bAeQAFJO9s+ZE21/
   ULc6+T79vYmU3NJ9UeZbgpuU/kIsT82ZnExqMJncPScJ2OEwrORkkvJW1
   t2D+RQKYIyrSX+36yy1fN8CQebGkPTfQOmiY6EhTh6yeuB4Qi+AlK1JbS
   rGCcmh+rp6P4dChM/kluJVZBb1Z9EXn1/0HJUdI6JiqzvIFp0nGDzI+mF
   WVF6AsFv9MsTLpIQ3rJNW0UDRz1XOJraqbGcVBocdSUiSOhFSnW+50qzs
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10512"; a="370147765"
X-IronPort-AV: E=Sophos;i="5.95,215,1661842800"; 
   d="scan'208";a="370147765"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Oct 2022 16:00:21 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10512"; a="757491418"
X-IronPort-AV: E=Sophos;i="5.95,215,1661842800"; 
   d="scan'208";a="757491418"
Received: from lkp-server02.sh.intel.com (HELO b6d29c1a0365) ([10.239.97.151])
  by orsmga004.jf.intel.com with ESMTP; 26 Oct 2022 16:00:20 -0700
Received: from kbuild by b6d29c1a0365 with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1onpNj-0007xV-1C;
        Wed, 26 Oct 2022 23:00:19 +0000
Date:   Thu, 27 Oct 2022 06:59:50 +0800
From:   kernel test robot <lkp@intel.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     linux-renesas-soc@vger.kernel.org
Subject: [geert-renesas-drivers:renesas-clk-for-v6.2] BUILD SUCCESS
 c82009584edb36dade0598dce840bed725cfcd56
Message-ID: <6359bbe6.32CFNQ/OA2XHsWs1%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.9 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git renesas-clk-for-v6.2
branch HEAD: c82009584edb36dade0598dce840bed725cfcd56  clk: renesas: rzg2l: Fix typo in struct rzg2l_cpg_priv kerneldoc

elapsed time: 726m

configs tested: 70
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arc                                 defconfig
alpha                               defconfig
um                             i386_defconfig
powerpc                           allnoconfig
um                           x86_64_defconfig
sh                               allmodconfig
mips                             allyesconfig
powerpc                          allmodconfig
x86_64                           rhel-8.3-kvm
x86_64                         rhel-8.3-kunit
x86_64                              defconfig
m68k                             allyesconfig
s390                             allmodconfig
i386                                defconfig
x86_64                           rhel-8.3-syz
m68k                             allmodconfig
x86_64                               rhel-8.3
alpha                            allyesconfig
x86_64                          rhel-8.3-func
arc                              allyesconfig
x86_64                    rhel-8.3-kselftests
x86_64                           allyesconfig
ia64                             allmodconfig
arc                  randconfig-r043-20221026
riscv                randconfig-r042-20221026
s390                 randconfig-r044-20221026
x86_64                        randconfig-a006
i386                          randconfig-a005
x86_64                        randconfig-a013
x86_64                        randconfig-a015
x86_64                        randconfig-a011
i386                          randconfig-a016
i386                          randconfig-a012
i386                          randconfig-a014
arm                                 defconfig
i386                             allyesconfig
i386                          randconfig-a003
i386                          randconfig-a001
x86_64                        randconfig-a002
arm                              allyesconfig
x86_64                        randconfig-a004
arm64                            allyesconfig
s390                                defconfig
s390                             allyesconfig
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
i386                          randconfig-a006
i386                          randconfig-a013
x86_64                        randconfig-a012
x86_64                        randconfig-a014
i386                          randconfig-a011
i386                          randconfig-a015
x86_64                        randconfig-a016
i386                          randconfig-a002
i386                          randconfig-a004
x86_64                        randconfig-a001
x86_64                        randconfig-a003
x86_64                        randconfig-a005
x86_64                        randconfig-k001

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
