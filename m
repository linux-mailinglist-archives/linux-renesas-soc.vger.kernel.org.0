Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6A93F5B432A
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 10 Sep 2022 01:45:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231164AbiIIXpT (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 9 Sep 2022 19:45:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37340 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229986AbiIIXpS (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 9 Sep 2022 19:45:18 -0400
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8D08E5C36F
        for <linux-renesas-soc@vger.kernel.org>; Fri,  9 Sep 2022 16:45:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1662767117; x=1694303117;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=wSqktRcwIizj3vYj0D4g5wzT1p8y5TEOrDyGhC9BfVc=;
  b=AS6VTFpw1IEWvQOrkThCn9ruklkYDqs45DOcoeU6flVk6+nUAUvlIJ5A
   ss0mN3kTJyBhmaGBINeVQBmpWYOCsFn0vuRUAx/YWWOMFCLP+tWa/Woxk
   vbC9Q2jf2fcJY7K7aOHSX6pbyuzohiWVUn43CzItsAHvPpH1rOHu3N2dJ
   yXX6YRFiQksBvYF7yq2Fzplw1tqf+VQZYkGmfcajuZLDt70YDE2plZ2I5
   9UeHQjNDIf9NTvxf+oq2bKcH2mJVapV1KKa9eEo/m2HGskGPYUpk6SsqY
   fhXBL8jW9RYvR1OCQOddy0gIOUSY3dlIZ7U5GVe2PWx6xIdQiz7v1HCIn
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10465"; a="280612513"
X-IronPort-AV: E=Sophos;i="5.93,304,1654585200"; 
   d="scan'208";a="280612513"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Sep 2022 16:45:15 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,304,1654585200"; 
   d="scan'208";a="943957158"
Received: from lkp-server02.sh.intel.com (HELO b2938d2e5c5a) ([10.239.97.151])
  by fmsmga005.fm.intel.com with ESMTP; 09 Sep 2022 16:45:14 -0700
Received: from kbuild by b2938d2e5c5a with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1oWngP-0001sD-2g;
        Fri, 09 Sep 2022 23:45:13 +0000
Date:   Sat, 10 Sep 2022 07:44:51 +0800
From:   kernel test robot <lkp@intel.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     linux-renesas-soc@vger.kernel.org
Subject: [geert-renesas-devel:next] BUILD SUCCESS
 3319a5eda420fede8f0336d5ee1135a758856ced
Message-ID: <631bcff3.izww3NMMZBqxRMEe%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,
        SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git next
branch HEAD: 3319a5eda420fede8f0336d5ee1135a758856ced  Merge branch 'renesas-arm-dt-for-v6.1' into renesas-next

elapsed time: 731m

configs tested: 117
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
um                           x86_64_defconfig
um                             i386_defconfig
alpha                            allyesconfig
m68k                             allmodconfig
arc                              allyesconfig
m68k                             allyesconfig
x86_64                              defconfig
x86_64                               rhel-8.3
x86_64                           allyesconfig
i386                                defconfig
x86_64                        randconfig-a013
x86_64                        randconfig-a011
i386                          randconfig-a001
i386                          randconfig-a003
x86_64                        randconfig-a015
arm                                 defconfig
i386                          randconfig-a005
i386                             allyesconfig
powerpc                          allmodconfig
mips                             allyesconfig
x86_64                           rhel-8.3-kvm
x86_64                    rhel-8.3-kselftests
x86_64                          rhel-8.3-func
powerpc                           allnoconfig
x86_64                        randconfig-a002
x86_64                         rhel-8.3-kunit
sh                               allmodconfig
arm                              allyesconfig
x86_64                           rhel-8.3-syz
arm64                            allyesconfig
arc                  randconfig-r043-20220907
x86_64                        randconfig-a004
x86_64                        randconfig-a006
loongarch                           defconfig
loongarch                         allnoconfig
i386                          randconfig-a012
i386                          randconfig-a014
arc                    vdk_hs38_smp_defconfig
sh                         microdev_defconfig
m68k                       m5475evb_defconfig
powerpc                 mpc834x_itx_defconfig
powerpc                     tqm8548_defconfig
csky                              allnoconfig
arc                               allnoconfig
nios2                            allyesconfig
sh                             espt_defconfig
sh                     magicpanelr2_defconfig
sh                             shx3_defconfig
xtensa                              defconfig
s390                       zfcpdump_defconfig
mips                        bcm47xx_defconfig
riscv                               defconfig
nios2                         10m50_defconfig
powerpc                 mpc837x_rdb_defconfig
mips                            ar7_defconfig
mips                         rt305x_defconfig
openrisc                    or1ksim_defconfig
arm                           sunxi_defconfig
sh                        dreamcast_defconfig
arm                            zeus_defconfig
riscv                randconfig-r042-20220908
arc                  randconfig-r043-20220908
s390                 randconfig-r044-20220908
i386                          debian-10.3-kvm
i386                        debian-10.3-kunit
i386                         debian-10.3-func
sh                        sh7763rdp_defconfig
xtensa                           allyesconfig
powerpc                     tqm8541_defconfig
powerpc                       holly_defconfig
i386                          randconfig-a016
riscv             nommu_k210_sdcard_defconfig
arm                            mps2_defconfig
alpha                             allnoconfig
riscv                             allnoconfig
arm                        clps711x_defconfig
sh                         ecovec24_defconfig
riscv                            allmodconfig
arm                        keystone_defconfig
x86_64                           alldefconfig
xtensa                    xip_kc705_defconfig
mips                    maltaup_xpa_defconfig
mips                      maltasmvp_defconfig
powerpc                      ppc40x_defconfig
arm                         axm55xx_defconfig
mips                         db1xxx_defconfig
parisc                              defconfig
sh                     sh7710voipgw_defconfig
i386                          randconfig-c001
m68k                        m5407c3_defconfig
nios2                         3c120_defconfig
ia64                             allmodconfig
arm                         cm_x300_defconfig
powerpc                    klondike_defconfig
arm                          badge4_defconfig

clang tested configs:
x86_64                        randconfig-a012
i386                          randconfig-a002
x86_64                        randconfig-a014
x86_64                        randconfig-a016
i386                          randconfig-a004
i386                          randconfig-a006
x86_64                        randconfig-a001
hexagon              randconfig-r041-20220907
x86_64                        randconfig-a003
riscv                randconfig-r042-20220907
hexagon              randconfig-r045-20220907
x86_64                        randconfig-a005
riscv                randconfig-r042-20220909
hexagon              randconfig-r041-20220909
hexagon              randconfig-r045-20220909
s390                 randconfig-r044-20220909
s390                 randconfig-r044-20220907
x86_64                        randconfig-k001
powerpc                          allmodconfig
powerpc                     tqm8540_defconfig
powerpc                      ppc44x_defconfig
hexagon              randconfig-r041-20220908
hexagon              randconfig-r045-20220908

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
