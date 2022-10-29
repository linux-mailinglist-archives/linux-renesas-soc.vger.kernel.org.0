Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6B96D611F15
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 29 Oct 2022 03:30:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229489AbiJ2Ban (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 28 Oct 2022 21:30:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44058 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229473AbiJ2Bal (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 28 Oct 2022 21:30:41 -0400
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ADEF86CF5D
        for <linux-renesas-soc@vger.kernel.org>; Fri, 28 Oct 2022 18:30:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1667007040; x=1698543040;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=lcmIixKbgw7TMbWl/SPsOOJgAlqzhmoTg+f1mY1Veqo=;
  b=XUWaA+13tZuzYsusHoBscYUGomWjkooPkRDUYGPjuZT3VeZxKqahslR6
   x52yCl1QXhHsiBRY7+jcHKLO5oL147GTidwe378Ph52cJSnzg99gpM1Dq
   T/AyQHBXs/CYvUOCQ15up7TP8T8vOCqeQn9fTX9ILhObNhOcrL0RC/Ef0
   os3OOekQmRfPddFX5wCnr+9toY4G+htXYU4E1LHrp8U3FSAXT6XtbW9yu
   cDlJR7/9fvGtSgDzL5EKbGhOSlO+OHkOaYewcIiMSeIYug1Mj3+kHHmU6
   YwDX6OzZnIfPqXypiWTpYBuTphNUJMpX6r8/WvcdwSQJ+l2RM8BETM0fZ
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10514"; a="289018731"
X-IronPort-AV: E=Sophos;i="5.95,222,1661842800"; 
   d="scan'208";a="289018731"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Oct 2022 18:30:40 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10514"; a="722255585"
X-IronPort-AV: E=Sophos;i="5.95,222,1661842800"; 
   d="scan'208";a="722255585"
Received: from lkp-server02.sh.intel.com (HELO b6d29c1a0365) ([10.239.97.151])
  by FMSMGA003.fm.intel.com with ESMTP; 28 Oct 2022 18:30:39 -0700
Received: from kbuild by b6d29c1a0365 with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1ooagI-000APr-2P;
        Sat, 29 Oct 2022 01:30:38 +0000
Date:   Sat, 29 Oct 2022 09:29:58 +0800
From:   kernel test robot <lkp@intel.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     linux-renesas-soc@vger.kernel.org
Subject: [geert-renesas-devel:topic/renesas-defconfig] BUILD SUCCESS
 083fa8efbec4676c44d1bbf8a7d042a143c3cfd3
Message-ID: <635c8216.rcWNJ2lTMq+eGEef%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.9 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git topic/renesas-defconfig
branch HEAD: 083fa8efbec4676c44d1bbf8a7d042a143c3cfd3  arm64: renesas: defconfig: Refresh for v6.1-rc1

elapsed time: 725m

configs tested: 58
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
powerpc                           allnoconfig
um                             i386_defconfig
um                           x86_64_defconfig
arc                                 defconfig
alpha                               defconfig
x86_64                              defconfig
sh                               allmodconfig
mips                             allyesconfig
x86_64                           allyesconfig
powerpc                          allmodconfig
i386                                defconfig
x86_64                               rhel-8.3
ia64                             allmodconfig
x86_64                          rhel-8.3-func
s390                             allmodconfig
x86_64                    rhel-8.3-kselftests
i386                          randconfig-a001
m68k                             allmodconfig
i386                          randconfig-a014
i386                          randconfig-a003
s390                                defconfig
i386                          randconfig-a012
i386                          randconfig-a016
arm                                 defconfig
arc                  randconfig-r043-20221028
arc                              allyesconfig
s390                             allyesconfig
alpha                            allyesconfig
i386                          randconfig-a005
riscv                randconfig-r042-20221028
i386                             allyesconfig
x86_64                        randconfig-a002
x86_64                           rhel-8.3-syz
x86_64                        randconfig-a013
x86_64                         rhel-8.3-kunit
x86_64                           rhel-8.3-kvm
s390                 randconfig-r044-20221028
x86_64                        randconfig-a004
arm64                            allyesconfig
x86_64                        randconfig-a011
arm                              allyesconfig
x86_64                        randconfig-a006
x86_64                        randconfig-a015
m68k                             allyesconfig

clang tested configs:
i386                          randconfig-a013
i386                          randconfig-a011
i386                          randconfig-a002
i386                          randconfig-a015
hexagon              randconfig-r041-20221028
hexagon              randconfig-r045-20221028
x86_64                        randconfig-a014
i386                          randconfig-a006
i386                          randconfig-a004
x86_64                        randconfig-a001
x86_64                        randconfig-a003
x86_64                        randconfig-a016
x86_64                        randconfig-a012
x86_64                        randconfig-a005

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
