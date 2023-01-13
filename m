Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 22E57668C09
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 13 Jan 2023 07:00:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240331AbjAMGAY (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 13 Jan 2023 01:00:24 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50364 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240712AbjAMF6s (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 13 Jan 2023 00:58:48 -0500
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 17ABB6E0E0
        for <linux-renesas-soc@vger.kernel.org>; Thu, 12 Jan 2023 21:54:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1673589249; x=1705125249;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=qOvgglhNLRlg6Mc4p7dUJk9Of0JMOzxZISVub9f6qP0=;
  b=WmJJAyp8QHH2qdbd9kpvggdu+59PvjCjwgb1jfpkFl/aN08XbcZGT6Tk
   szT790Um+MZquR5ZjSAVREW+fpcs6bbFMJWzCEn4g14Xzd/umUFLknxCc
   s0EhDEPkXNO6JsCax8jQu3LW/GS/a4sIqwq1Upcd7SenU+hf9F779huAc
   v0IUUoD0XpxVojRFAAc+kE7qGe+gab01+RUiORChuwU32QEttUsQ4EMRE
   DfVgoGgbcjxZM+a8ebQ11y6EhFhkyXJh4YKWxDrHawY9gmC7fBpb9lqUe
   aTLIhrBgBSU15V7xOyp7raNwzwMSvvltAuUbx6uSPY1v6GYMqa5k2AHaD
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10588"; a="323980751"
X-IronPort-AV: E=Sophos;i="5.97,213,1669104000"; 
   d="scan'208";a="323980751"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jan 2023 21:54:08 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10588"; a="688630257"
X-IronPort-AV: E=Sophos;i="5.97,213,1669104000"; 
   d="scan'208";a="688630257"
Received: from lkp-server02.sh.intel.com (HELO f1920e93ebb5) ([10.239.97.151])
  by orsmga008.jf.intel.com with ESMTP; 12 Jan 2023 21:54:06 -0800
Received: from kbuild by f1920e93ebb5 with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1pGD0w-000An8-0I;
        Fri, 13 Jan 2023 05:54:06 +0000
Date:   Fri, 13 Jan 2023 13:53:44 +0800
From:   kernel test robot <lkp@intel.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     linux-renesas-soc@vger.kernel.org
Subject: [geert-renesas-devel:master] BUILD SUCCESS
 5268d311d704e178f1b4c5afcf0ca9073238412b
Message-ID: <63c0f1e8.7C9AGzEGD7fJgvkQ%lkp@intel.com>
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

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git master
branch HEAD: 5268d311d704e178f1b4c5afcf0ca9073238412b  Merge branch 'renesas-next' into renesas-devel

elapsed time: 729m

configs tested: 66
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
um                           x86_64_defconfig
um                             i386_defconfig
arc                                 defconfig
alpha                               defconfig
x86_64                            allnoconfig
x86_64                              defconfig
s390                                defconfig
x86_64                        randconfig-a004
x86_64                               rhel-8.3
s390                             allmodconfig
x86_64                        randconfig-a002
x86_64                        randconfig-a006
x86_64                           allyesconfig
s390                             allyesconfig
i386                          randconfig-a001
i386                          randconfig-a003
ia64                             allmodconfig
i386                          randconfig-a005
arc                  randconfig-r043-20230112
x86_64                           rhel-8.3-bpf
s390                 randconfig-r044-20230112
x86_64                           rhel-8.3-syz
x86_64                         rhel-8.3-kunit
riscv                randconfig-r042-20230112
x86_64                           rhel-8.3-kvm
m68k                             allmodconfig
alpha                            allyesconfig
m68k                             allyesconfig
i386                                defconfig
arc                              allyesconfig
arm                                 defconfig
powerpc                           allnoconfig
arm                              allyesconfig
powerpc                          allmodconfig
mips                             allyesconfig
arm64                            allyesconfig
i386                             allyesconfig
x86_64                        randconfig-a013
x86_64                          rhel-8.3-func
x86_64                        randconfig-a011
x86_64                    rhel-8.3-kselftests
x86_64                        randconfig-a015
sh                               allmodconfig
i386                          randconfig-a014
i386                          randconfig-a012
i386                          randconfig-a016
ia64                          tiger_defconfig
riscv                            allmodconfig

clang tested configs:
x86_64                        randconfig-a001
x86_64                        randconfig-a003
x86_64                        randconfig-a005
i386                          randconfig-a002
i386                          randconfig-a004
arm                  randconfig-r046-20230112
i386                          randconfig-a006
hexagon              randconfig-r041-20230112
hexagon              randconfig-r045-20230112
x86_64                        randconfig-a012
x86_64                          rhel-8.3-rust
x86_64                        randconfig-a014
x86_64                        randconfig-a016
i386                          randconfig-a013
i386                          randconfig-a015
i386                          randconfig-a011
arm                       aspeed_g4_defconfig
arm                          collie_defconfig

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
