Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 170735A5578
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 29 Aug 2022 22:20:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229958AbiH2UUH (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 29 Aug 2022 16:20:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38128 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229836AbiH2UUG (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 29 Aug 2022 16:20:06 -0400
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 747F417E30
        for <linux-renesas-soc@vger.kernel.org>; Mon, 29 Aug 2022 13:20:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1661804405; x=1693340405;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=nWJRnvycfRGMyyF52DBjmNjaPahV6JnXxBkraCWQpIM=;
  b=MxhR+WqinEd7fw8Dqzc5KJSGTEYTTgyyFkDrwn/p4iqf+7CQlAQZ7gZM
   dXvDR40aGUtn/PK1Ycs951RxB8eCn2PeM2/jIO6OcE/H0pW8y4EbAznCf
   eaq6f4GZ4rRdaf9a+F1HHGhTihaxpdUE6GerZlEr3E6H1Bnz0X4fiFyBX
   Jkb+ZVIqrqinK8DNhgsFW71U4ViqSNLGiolOMbV6uvJ+wLNeCxO4ks/Bj
   hZVXEI2BVIwWfeKySYKYd1hkPNk9st6EGM43jpi5lSPii4w1aEXrXBcR3
   pBv8cW1T2H3g2y3VEOxBZHBj60lu8Gou7xKw5C+FmyTHWNCCCtJUNK2Kn
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10454"; a="295769630"
X-IronPort-AV: E=Sophos;i="5.93,273,1654585200"; 
   d="scan'208";a="295769630"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Aug 2022 13:19:46 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,273,1654585200"; 
   d="scan'208";a="939718544"
Received: from lkp-server02.sh.intel.com (HELO e45bc14ccf4d) ([10.239.97.151])
  by fmsmga005.fm.intel.com with ESMTP; 29 Aug 2022 13:19:44 -0700
Received: from kbuild by e45bc14ccf4d with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1oSlEW-0000DQ-0i;
        Mon, 29 Aug 2022 20:19:44 +0000
Date:   Tue, 30 Aug 2022 04:19:29 +0800
From:   kernel test robot <lkp@intel.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     linux-renesas-soc@vger.kernel.org
Subject: [geert-renesas-devel:master] BUILD SUCCESS
 535a41e64e25d97c2595d9c80a278600e7b76a9b
Message-ID: <630d1f51.zQxSvGHDmVhncS1L%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git master
branch HEAD: 535a41e64e25d97c2595d9c80a278600e7b76a9b  Merge branch 'topic/renesas-defconfig' into renesas-devel

elapsed time: 724m

configs tested: 66
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
loongarch                         allnoconfig
loongarch                           defconfig
um                             i386_defconfig
um                           x86_64_defconfig
arc                                 defconfig
alpha                               defconfig
powerpc                           allnoconfig
i386                         debian-10.3-func
i386                          debian-10.3-kvm
i386                        debian-10.3-kunit
csky                                defconfig
sparc                               defconfig
i386                                defconfig
arc                  randconfig-r043-20220829
arm                                 defconfig
i386                             allyesconfig
i386                 randconfig-a001-20220829
i386                 randconfig-a003-20220829
arm                              allyesconfig
i386                 randconfig-a002-20220829
arm64                            allyesconfig
i386                 randconfig-a004-20220829
i386                 randconfig-a005-20220829
i386                 randconfig-a006-20220829
arm                         nhk8815_defconfig
x86_64                    rhel-8.3-kselftests
ia64                             allmodconfig
x86_64                          rhel-8.3-func
xtensa                              defconfig
x86_64                         rhel-8.3-kunit
mips                       bmips_be_defconfig
powerpc                      makalu_defconfig
x86_64                           rhel-8.3-kvm
powerpc                      tqm8xx_defconfig
x86_64                           rhel-8.3-syz
x86_64               randconfig-a005-20220829
x86_64               randconfig-a006-20220829
x86_64                              defconfig
arc                              allyesconfig
alpha                            allyesconfig
x86_64                               rhel-8.3
sh                               allmodconfig
m68k                             allyesconfig
mips                             allyesconfig
x86_64                           allyesconfig
m68k                             allmodconfig
powerpc                          allmodconfig
ia64                             allyesconfig

clang tested configs:
hexagon              randconfig-r041-20220829
riscv                randconfig-r042-20220829
s390                 randconfig-r044-20220829
hexagon              randconfig-r045-20220829
arm                             mxs_defconfig
i386                 randconfig-a011-20220829
i386                 randconfig-a014-20220829
i386                 randconfig-a013-20220829
i386                 randconfig-a012-20220829
riscv                             allnoconfig
i386                 randconfig-a015-20220829
i386                 randconfig-a016-20220829
x86_64               randconfig-a011-20220829
x86_64               randconfig-a012-20220829
x86_64               randconfig-a013-20220829
x86_64               randconfig-a014-20220829
x86_64               randconfig-a015-20220829
x86_64               randconfig-a016-20220829

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
