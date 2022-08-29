Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9BF765A5577
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 29 Aug 2022 22:20:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229457AbiH2UUG (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 29 Aug 2022 16:20:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38040 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229975AbiH2UUF (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 29 Aug 2022 16:20:05 -0400
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 986A911C36
        for <linux-renesas-soc@vger.kernel.org>; Mon, 29 Aug 2022 13:20:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1661804403; x=1693340403;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=A0NMT438jZNjZmOiekOG25puQx/fmStNkSrX7Qaej2w=;
  b=SC7ySsRSd6dhiao5wSsNjhHiAfVnBngwmR4eEoM8BR3JLExLgJJ4WOjK
   dExXbGEp13vSqTO0RqIzCfCAIsk2KBYyQaZz1X7+8+BCv0ui8UT/GTOA0
   HBiP7e0YEpePV8m9GEltbHoimrGFRSvGqlwupygD9bM1R1bZLoreXiCyv
   utuyYY9x2muSIV9bdTH1o8w6kqnSwI6DMzOovhKJG3/2lNbcrzIpv+Puh
   JASKihCHkxJelT96tS1BKWHpxOVP6nXcPSKjs2e1r8Gv8nT1TK2oK06Ub
   QvOpzS/RvTKsIa51x+ff5v20aIFrv2EYFHOnkHL3GWJjE9BlhIDRdnLvg
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10454"; a="295769629"
X-IronPort-AV: E=Sophos;i="5.93,273,1654585200"; 
   d="scan'208";a="295769629"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Aug 2022 13:19:46 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,273,1654585200"; 
   d="scan'208";a="939718541"
Received: from lkp-server02.sh.intel.com (HELO e45bc14ccf4d) ([10.239.97.151])
  by fmsmga005.fm.intel.com with ESMTP; 29 Aug 2022 13:19:44 -0700
Received: from kbuild by e45bc14ccf4d with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1oSlEW-0000DH-0W;
        Mon, 29 Aug 2022 20:19:44 +0000
Date:   Tue, 30 Aug 2022 04:19:30 +0800
From:   kernel test robot <lkp@intel.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     linux-renesas-soc@vger.kernel.org
Subject: [geert-renesas-devel:topic/renesas-defconfig] BUILD SUCCESS
 f783ef6a698a2b554a41627869ad6591d9f43e37
Message-ID: <630d1f52.sw90vIyDs2B1E43U%lkp@intel.com>
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

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git topic/renesas-defconfig
branch HEAD: f783ef6a698a2b554a41627869ad6591d9f43e37  arm64: renesas: defconfig: Refresh for v6.0-rc1

elapsed time: 722m

configs tested: 81
configs skipped: 5

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
loongarch                         allnoconfig
loongarch                           defconfig
powerpc                           allnoconfig
um                             i386_defconfig
um                           x86_64_defconfig
arc                                 defconfig
s390                             allmodconfig
alpha                               defconfig
s390                                defconfig
i386                        debian-10.3-kunit
s390                             allyesconfig
i386                         debian-10.3-func
x86_64                              defconfig
i386                          debian-10.3-kvm
x86_64               randconfig-a003-20220829
x86_64               randconfig-a002-20220829
csky                                defconfig
sh                               allmodconfig
x86_64               randconfig-a001-20220829
arc                  randconfig-r043-20220829
i386                                defconfig
x86_64                           rhel-8.3-syz
arm                                 defconfig
i386                             allyesconfig
arc                    vdk_hs38_smp_defconfig
arm                        realview_defconfig
csky                              allnoconfig
ia64                         bigsur_defconfig
powerpc                     taishan_defconfig
m68k                        stmark2_defconfig
powerpc                       holly_defconfig
arm                              allyesconfig
arm64                            allyesconfig
arm                         axm55xx_defconfig
ia64                             allmodconfig
i386                 randconfig-a004-20220829
arm                          gemini_defconfig
xtensa                          iss_defconfig
i386                 randconfig-a005-20220829
i386                 randconfig-a006-20220829
arc                               allnoconfig
alpha                             allnoconfig
riscv                             allnoconfig
mips                     loongson1b_defconfig
powerpc                      pasemi_defconfig
m68k                          sun3x_defconfig
powerpc                     rainier_defconfig
alpha                            allyesconfig
arc                              allyesconfig
m68k                             allmodconfig
m68k                             allyesconfig
powerpc                          allmodconfig
mips                             allyesconfig
x86_64                               rhel-8.3
x86_64                          rhel-8.3-func
x86_64                         rhel-8.3-kunit
x86_64                    rhel-8.3-kselftests
x86_64                           rhel-8.3-kvm
x86_64                           allyesconfig

clang tested configs:
x86_64               randconfig-a011-20220829
hexagon              randconfig-r041-20220829
riscv                randconfig-r042-20220829
x86_64               randconfig-a012-20220829
x86_64               randconfig-a013-20220829
s390                 randconfig-r044-20220829
x86_64               randconfig-a014-20220829
hexagon              randconfig-r045-20220829
x86_64               randconfig-a016-20220829
x86_64               randconfig-a015-20220829
i386                 randconfig-a011-20220829
i386                 randconfig-a014-20220829
mips                     cu1830-neo_defconfig
arm                          pcm027_defconfig
i386                 randconfig-a013-20220829
i386                 randconfig-a012-20220829
powerpc               mpc834x_itxgp_defconfig
arm                          moxart_defconfig
i386                 randconfig-a015-20220829
i386                 randconfig-a016-20220829
arm                        spear3xx_defconfig
arm                        multi_v5_defconfig

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
