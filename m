Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 86DFD62B29D
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 16 Nov 2022 06:15:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229586AbiKPFPi (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 16 Nov 2022 00:15:38 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46686 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229766AbiKPFPh (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 16 Nov 2022 00:15:37 -0500
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 843032F002
        for <linux-renesas-soc@vger.kernel.org>; Tue, 15 Nov 2022 21:15:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1668575736; x=1700111736;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=gtRrrZyOrz1AO/AKsbAA+x7b/FPLCQXbgcKPcA+OeYA=;
  b=bfKJrU1X5PkWRKM0zGnjVp/SuR2g8SfpGdGBOJs1mFGqEJxTOtVJSREl
   rTdsJDpZTB1Aaj0rzmSGto1ZHM1siRIiZDxTebpmTowlvyw3+z5mjeSci
   nVUhfveOSmibCuOOTCUGiRuk9HzXvdwZoL8CGieRpnTb7vz5vQxoYcidR
   eIAgjXkm+uH7guOMV/9EO/hzS3rtmhdt8bNwlvV35zpYCJcRvLqMKw+1I
   rvPnbftnU2yeXFSnUy3hfxBxlznZ7b4U1sM3oFwM6YabeG7SUL7L1HvF1
   KkbtuLw1QH4jLxMYVkW2qgVBpC8/pAkTPbUFCJKC6f0xsZ0IwQCurASCX
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10532"; a="299981753"
X-IronPort-AV: E=Sophos;i="5.96,167,1665471600"; 
   d="scan'208";a="299981753"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Nov 2022 21:15:33 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10532"; a="702722885"
X-IronPort-AV: E=Sophos;i="5.96,167,1665471600"; 
   d="scan'208";a="702722885"
Received: from lkp-server01.sh.intel.com (HELO ebd99836cbe0) ([10.239.97.150])
  by fmsmga008.fm.intel.com with ESMTP; 15 Nov 2022 21:15:32 -0800
Received: from kbuild by ebd99836cbe0 with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1ovAln-000228-2s;
        Wed, 16 Nov 2022 05:15:31 +0000
Date:   Wed, 16 Nov 2022 13:14:40 +0800
From:   kernel test robot <lkp@intel.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     linux-renesas-soc@vger.kernel.org
Subject: [geert-renesas-drivers:renesas-pinctrl] BUILD SUCCESS
 41a87e789c7c2cdeb302331043f866c0138f0413
Message-ID: <637471c0.HtfXTK7AiKFjeP74%lkp@intel.com>
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

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git renesas-pinctrl
branch HEAD: 41a87e789c7c2cdeb302331043f866c0138f0413  pinctrl: renesas: rzg2l: remove unnecessary check from rzg2l_dt_node_to_map()

elapsed time: 726m

configs tested: 113
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arc                                 defconfig
alpha                               defconfig
um                             i386_defconfig
um                           x86_64_defconfig
s390                             allmodconfig
s390                                defconfig
s390                             allyesconfig
m68k                             allmodconfig
arc                              allyesconfig
alpha                            allyesconfig
m68k                             allyesconfig
x86_64                        randconfig-a002
x86_64                        randconfig-a004
x86_64                        randconfig-a013
x86_64                        randconfig-a006
x86_64                        randconfig-a011
mips                             allyesconfig
s390                 randconfig-r044-20221115
x86_64                              defconfig
x86_64                        randconfig-a015
arc                  randconfig-r043-20221115
x86_64                               rhel-8.3
sh                               allmodconfig
powerpc                           allnoconfig
riscv                randconfig-r042-20221115
i386                          randconfig-a001
x86_64                           allyesconfig
powerpc                          allmodconfig
i386                          randconfig-a003
i386                          randconfig-a005
ia64                             allmodconfig
i386                                defconfig
i386                          randconfig-a012
x86_64                           rhel-8.3-syz
x86_64                         rhel-8.3-kunit
x86_64                           rhel-8.3-kvm
i386                          randconfig-a016
i386                          randconfig-a014
x86_64                            allnoconfig
i386                             allyesconfig
x86_64                          rhel-8.3-func
x86_64                    rhel-8.3-kselftests
mips                     decstation_defconfig
arm                      footbridge_defconfig
sh                         apsh4a3a_defconfig
openrisc                 simple_smp_defconfig
m68k                            q40_defconfig
sh                        dreamcast_defconfig
sh                          rsk7203_defconfig
mips                         cobalt_defconfig
arm                         vf610m4_defconfig
powerpc                      cm5200_defconfig
i386                          randconfig-c001
arm64                            allyesconfig
arm                                 defconfig
arm                              allyesconfig
arm                         lubbock_defconfig
sh                           se7722_defconfig
m68k                                defconfig
sh                           se7705_defconfig
powerpc                 mpc834x_mds_defconfig
riscv                    nommu_virt_defconfig
riscv                          rv32_defconfig
riscv                    nommu_k210_defconfig
riscv                             allnoconfig
i386                   debian-10.3-kselftests
i386                              debian-10.3
i386                 randconfig-a002-20221114
i386                 randconfig-a004-20221114
i386                 randconfig-a003-20221114
i386                 randconfig-a005-20221114
i386                 randconfig-a006-20221114
i386                 randconfig-a001-20221114
sparc                       sparc32_defconfig
powerpc                      makalu_defconfig
xtensa                  nommu_kc705_defconfig
arm                          pxa910_defconfig
mips                           ci20_defconfig
powerpc                     stx_gp3_defconfig
m68k                       m5475evb_defconfig
powerpc                mpc7448_hpc2_defconfig
arm                            hisi_defconfig
powerpc                   motionpro_defconfig
mips                      maltasmvp_defconfig
sh                        apsh4ad0a_defconfig
arm                         axm55xx_defconfig
powerpc                     asp8347_defconfig
arm                      integrator_defconfig
powerpc                      ppc6xx_defconfig
sh                 kfr2r09-romimage_defconfig

clang tested configs:
x86_64               randconfig-a012-20221114
x86_64               randconfig-a013-20221114
x86_64               randconfig-a011-20221114
x86_64               randconfig-a014-20221114
x86_64               randconfig-a016-20221114
x86_64               randconfig-a015-20221114
x86_64                        randconfig-a001
x86_64                        randconfig-a003
x86_64                        randconfig-a005
x86_64                        randconfig-a014
x86_64                        randconfig-a012
hexagon              randconfig-r041-20221115
x86_64                        randconfig-a016
hexagon              randconfig-r045-20221115
i386                          randconfig-a004
i386                          randconfig-a002
i386                          randconfig-a006
i386                          randconfig-a013
i386                          randconfig-a011
i386                          randconfig-a015
arm                           sama7_defconfig
powerpc                 mpc8315_rdb_defconfig
x86_64                        randconfig-k001

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
