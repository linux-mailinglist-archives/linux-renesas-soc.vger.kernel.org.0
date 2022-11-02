Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CC129615A0E
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  2 Nov 2022 04:23:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230304AbiKBDXp (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 1 Nov 2022 23:23:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43586 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230292AbiKBDXn (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 1 Nov 2022 23:23:43 -0400
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2468F24BD8
        for <linux-renesas-soc@vger.kernel.org>; Tue,  1 Nov 2022 20:23:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1667359422; x=1698895422;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=ASwMEQJWbECsv/2KuAklSoiFAbyb/iMq3Nlu9iTgUGY=;
  b=YTDB2ITgHnJVYecyz6I4Yt8nOOZk9X+h0iAH9NeBo5+zKIVZXvlhM+Rd
   u7j8SG4NlnkxsTrDX/hwTxdF5MdRPRNVxZu8wvcxMep2Skk0N7E+GuTR1
   nad1G8TW6518seO5iIv9ydd1hLp9jXHqaDNqa8C66L6PQ7Oe0OWf8gTqD
   Lhy+rVbA9A13pKBsJ+2VUucIarYz3XFfJcJhf+WJPHErOM10Q+YSdd3PP
   sASLWhZVxLKZ6iL4Usnu4iVNDSZBMCgbCPg00+pEfGrjaP8JxbYnm3x0d
   2uRgrmpeKMOHpM6/gYJyS48ooQuH6Uwc+zyKn+kK2URICqIYQzkk9QTuf
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10518"; a="335976430"
X-IronPort-AV: E=Sophos;i="5.95,232,1661842800"; 
   d="scan'208";a="335976430"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Nov 2022 20:23:41 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10518"; a="667425520"
X-IronPort-AV: E=Sophos;i="5.95,232,1661842800"; 
   d="scan'208";a="667425520"
Received: from lkp-server02.sh.intel.com (HELO b6d29c1a0365) ([10.239.97.151])
  by orsmga001.jf.intel.com with ESMTP; 01 Nov 2022 20:23:40 -0700
Received: from kbuild by b6d29c1a0365 with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1oq4Lr-000EOJ-1T;
        Wed, 02 Nov 2022 03:23:39 +0000
Date:   Wed, 02 Nov 2022 11:23:01 +0800
From:   kernel test robot <lkp@intel.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     linux-renesas-soc@vger.kernel.org
Subject: [geert-renesas-drivers:renesas-clk-for-v6.2] BUILD SUCCESS
 02693e11611e082e3c4d8653e8af028e43d31164
Message-ID: <6361e295.1iIGDzQVRfXPE6Tv%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-8.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git renesas-clk-for-v6.2
branch HEAD: 02693e11611e082e3c4d8653e8af028e43d31164  clk: renesas: r9a06g032: Repair grave increment error

elapsed time: 723m

configs tested: 136
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
um                             i386_defconfig
um                           x86_64_defconfig
x86_64                          rhel-8.3-func
x86_64                    rhel-8.3-kselftests
x86_64                        randconfig-a013
x86_64                        randconfig-a011
x86_64                        randconfig-a015
arm                                 defconfig
arc                                 defconfig
s390                             allmodconfig
x86_64                              defconfig
alpha                               defconfig
i386                                defconfig
s390                                defconfig
x86_64                           rhel-8.3-kvm
x86_64                           rhel-8.3-syz
x86_64                         rhel-8.3-kunit
arm                              allyesconfig
s390                             allyesconfig
arm64                            allyesconfig
arc                  randconfig-r043-20221101
i386                             allyesconfig
x86_64                               rhel-8.3
m68k                             allmodconfig
arc                              allyesconfig
alpha                            allyesconfig
ia64                             allmodconfig
powerpc                           allnoconfig
mips                             allyesconfig
powerpc                          allmodconfig
sh                               allmodconfig
x86_64                           allyesconfig
i386                 randconfig-a016-20221031
i386                 randconfig-a012-20221031
i386                 randconfig-a015-20221031
i386                 randconfig-a013-20221031
i386                 randconfig-a014-20221031
i386                 randconfig-a011-20221031
m68k                             allyesconfig
x86_64                        randconfig-a006
x86_64                        randconfig-a004
x86_64                        randconfig-a002
x86_64               randconfig-k001-20221031
sparc                             allnoconfig
xtensa                    smp_lx200_defconfig
arm                          gemini_defconfig
sh                 kfr2r09-romimage_defconfig
xtensa                       common_defconfig
arm                      footbridge_defconfig
powerpc                     taishan_defconfig
sh                  sh7785lcr_32bit_defconfig
alpha                             allnoconfig
s390                 randconfig-r044-20221031
riscv                randconfig-r042-20221031
arc                  randconfig-r043-20221031
i386                          randconfig-a012
i386                          randconfig-a014
i386                          randconfig-a016
i386                 randconfig-c001-20221031
mips                 randconfig-c004-20221031
i386                          randconfig-c001
powerpc                 linkstation_defconfig
openrisc                            defconfig
mips                    maltaup_xpa_defconfig
arc                      axs103_smp_defconfig
arm                       omap2plus_defconfig
arm                          iop32x_defconfig
riscv                    nommu_k210_defconfig
sh                        sh7757lcr_defconfig
openrisc                    or1ksim_defconfig
powerpc                     stx_gp3_defconfig
ia64                        generic_defconfig
sh                          rsk7203_defconfig
sh                      rts7751r2d1_defconfig
x86_64               randconfig-a016-20221031
x86_64               randconfig-a011-20221031
x86_64               randconfig-a013-20221031
x86_64               randconfig-a012-20221031
x86_64               randconfig-a014-20221031
x86_64               randconfig-a015-20221031
arm                             ezx_defconfig
arm                           sama5_defconfig
ia64                            zx1_defconfig
arm64                            alldefconfig
m68k                        stmark2_defconfig
arm                            mps2_defconfig
mips                         db1xxx_defconfig
mips                            ar7_defconfig
sh                     sh7710voipgw_defconfig
i386                          debian-10.3-kvm
i386                        debian-10.3-kunit
i386                         debian-10.3-func
m68k                        m5272c3_defconfig
sh                          r7780mp_defconfig
sh                          r7785rp_defconfig
sparc64                          alldefconfig

clang tested configs:
x86_64                        randconfig-a014
x86_64                        randconfig-a012
x86_64                        randconfig-a016
hexagon              randconfig-r041-20221101
hexagon              randconfig-r045-20221101
riscv                randconfig-r042-20221101
s390                 randconfig-r044-20221101
i386                          randconfig-a002
i386                          randconfig-a006
i386                          randconfig-a004
x86_64                        randconfig-a005
x86_64                        randconfig-a003
x86_64                        randconfig-a001
mips                        qi_lb60_defconfig
arm                        vexpress_defconfig
powerpc                       ebony_defconfig
powerpc                      obs600_defconfig
arm                      pxa255-idp_defconfig
mips                      bmips_stb_defconfig
arm                       spear13xx_defconfig
riscv                             allnoconfig
x86_64               randconfig-a005-20221031
x86_64               randconfig-a006-20221031
x86_64               randconfig-a004-20221031
x86_64               randconfig-a001-20221031
x86_64               randconfig-a003-20221031
x86_64               randconfig-a002-20221031
i386                 randconfig-a002-20221031
i386                 randconfig-a005-20221031
i386                 randconfig-a004-20221031
i386                 randconfig-a006-20221031
i386                 randconfig-a003-20221031
i386                 randconfig-a001-20221031
riscv                    nommu_virt_defconfig
riscv                          rv32_defconfig
arm64                            allyesconfig
arm                          ep93xx_defconfig
arm                        mvebu_v5_defconfig
powerpc                   microwatt_defconfig
arm                         bcm2835_defconfig
mips                           ip28_defconfig

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
