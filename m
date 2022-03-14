Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 60E584D8EA6
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 14 Mar 2022 22:28:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239744AbiCNVaH (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 14 Mar 2022 17:30:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33170 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236574AbiCNVaH (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 14 Mar 2022 17:30:07 -0400
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 760A821243
        for <linux-renesas-soc@vger.kernel.org>; Mon, 14 Mar 2022 14:28:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1647293336; x=1678829336;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=rM/ZAP85tgKEpvxFReb8R+0tNOV80/BOKDAv1Nbjjio=;
  b=gVr1X1EeTc+SHiZu0H21ObyXDq/sZVAdM/ka7Qe7xlBQkAIYivRHdd67
   DqovY8fVY7RcCzPiPny5JLTCapPECWdzJHQ5Z05RkLbnVtGSjj8LWvEp0
   5L6j1gNWeBXuqLKHl0czTZKkwLRHMf99dgS0s3vOV3xZ7OJKHmlF4rePa
   8pM/mhFW6CDfK6psAL7xf2gFfqWL+jgV5xtzwgb3SvQiYmjhXtw3MqNq1
   JPl6Nzv9fcIWskFzBEOZXYuFAp1mldH+T4QymerHulxIsODooFB4huatW
   Jn7za1AfyN/IaOIxnYAP3UqN8yyRU2W+imyVANc0z8zukJ5w5Ip9YYNGY
   w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10286"; a="319371642"
X-IronPort-AV: E=Sophos;i="5.90,181,1643702400"; 
   d="scan'208";a="319371642"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Mar 2022 14:28:56 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,181,1643702400"; 
   d="scan'208";a="497779782"
Received: from lkp-server02.sh.intel.com (HELO 89b41b6ae01c) ([10.239.97.151])
  by orsmga003.jf.intel.com with ESMTP; 14 Mar 2022 14:28:54 -0700
Received: from kbuild by 89b41b6ae01c with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1nTsFJ-000AF8-DC; Mon, 14 Mar 2022 21:28:53 +0000
Date:   Tue, 15 Mar 2022 05:28:09 +0800
From:   kernel test robot <lkp@intel.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     linux-renesas-soc@vger.kernel.org
Subject: [geert-renesas-devel:renesas-arm-dt-for-v5.19] BUILD SUCCESS
 76695c0ce0be5e4f690a85c48b9333fb7056eb30
Message-ID: <622fb369.CCVcWh5oWOY9lQ78%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,HEXHASH_WORD,
        RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git renesas-arm-dt-for-v5.19
branch HEAD: 76695c0ce0be5e4f690a85c48b9333fb7056eb30  arm64: dts: renesas: r8a779a0-falcon: enable CANFD 0 and 1

elapsed time: 726m

configs tested: 216
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                              allmodconfig
arm                              allyesconfig
arm                                 defconfig
arm64                               defconfig
arm64                            allyesconfig
i386                          randconfig-c001
i386                 randconfig-c001-20220314
mips                 randconfig-c004-20220314
powerpc              randconfig-c003-20220313
mips                           xway_defconfig
arm                            zeus_defconfig
m68k                          multi_defconfig
arm                          pxa910_defconfig
sh                                  defconfig
powerpc                      pasemi_defconfig
arm                       imx_v6_v7_defconfig
x86_64                              defconfig
xtensa                              defconfig
arm                         nhk8815_defconfig
h8300                            allyesconfig
arm                           u8500_defconfig
mips                        jmr3927_defconfig
arm                            xcep_defconfig
sh                           se7343_defconfig
sh                          rsk7264_defconfig
m68k                        mvme16x_defconfig
arm                       omap2plus_defconfig
powerpc                     ep8248e_defconfig
powerpc                     tqm8555_defconfig
powerpc                 linkstation_defconfig
powerpc                      bamboo_defconfig
arc                          axs101_defconfig
openrisc                  or1klitex_defconfig
riscv             nommu_k210_sdcard_defconfig
sh                            migor_defconfig
powerpc                         ps3_defconfig
arm                         lpc18xx_defconfig
i386                                defconfig
sh                             sh03_defconfig
m68k                           sun3_defconfig
m68k                        m5272c3_defconfig
powerpc                        cell_defconfig
sh                           se7705_defconfig
csky                             alldefconfig
parisc                generic-32bit_defconfig
powerpc                 mpc837x_mds_defconfig
powerpc                      makalu_defconfig
sh                   sh7770_generic_defconfig
mips                      fuloong2e_defconfig
sparc                            alldefconfig
sh                          kfr2r09_defconfig
s390                                defconfig
powerpc                  storcenter_defconfig
arm                         vf610m4_defconfig
xtensa                  nommu_kc705_defconfig
arm                             rpc_defconfig
arm                             ezx_defconfig
mips                           jazz_defconfig
sh                   secureedge5410_defconfig
h8300                     edosk2674_defconfig
m68k                         apollo_defconfig
powerpc                      arches_defconfig
powerpc                   motionpro_defconfig
arc                                 defconfig
sh                            titan_defconfig
xtensa                  audio_kc705_defconfig
arc                         haps_hs_defconfig
mips                 decstation_r4k_defconfig
sh                         microdev_defconfig
sh                     sh7710voipgw_defconfig
i386                             alldefconfig
sh                        sh7785lcr_defconfig
powerpc                     pq2fads_defconfig
openrisc                 simple_smp_defconfig
arc                     haps_hs_smp_defconfig
m68k                       m5475evb_defconfig
sh                           se7750_defconfig
arm                        mini2440_defconfig
mips                           ip32_defconfig
sh                   rts7751r2dplus_defconfig
m68k                        stmark2_defconfig
powerpc                       maple_defconfig
ia64                             allmodconfig
powerpc                 mpc8540_ads_defconfig
sh                          sdk7780_defconfig
m68k                       m5208evb_defconfig
nios2                            allyesconfig
mips                        bcm47xx_defconfig
arm                           h3600_defconfig
arm                            lart_defconfig
arm                         axm55xx_defconfig
powerpc                mpc7448_hpc2_defconfig
mips                  decstation_64_defconfig
arm                  randconfig-c002-20220313
arm                  randconfig-c002-20220314
ia64                                defconfig
ia64                             allyesconfig
m68k                                defconfig
m68k                             allmodconfig
m68k                             allyesconfig
nios2                               defconfig
arc                              allyesconfig
nds32                             allnoconfig
nds32                               defconfig
csky                                defconfig
alpha                               defconfig
alpha                            allyesconfig
sh                               allmodconfig
xtensa                           allyesconfig
parisc                              defconfig
parisc64                            defconfig
s390                             allmodconfig
parisc                           allyesconfig
s390                             allyesconfig
i386                             allyesconfig
sparc                            allyesconfig
sparc                               defconfig
i386                   debian-10.3-kselftests
i386                              debian-10.3
mips                             allyesconfig
mips                             allmodconfig
powerpc                          allyesconfig
powerpc                          allmodconfig
powerpc                           allnoconfig
x86_64                        randconfig-a006
x86_64                        randconfig-a004
x86_64                        randconfig-a002
x86_64               randconfig-a002-20220314
x86_64               randconfig-a001-20220314
x86_64               randconfig-a003-20220314
x86_64               randconfig-a004-20220314
x86_64               randconfig-a006-20220314
x86_64               randconfig-a005-20220314
i386                 randconfig-a003-20220314
i386                 randconfig-a004-20220314
i386                 randconfig-a001-20220314
i386                 randconfig-a006-20220314
i386                 randconfig-a002-20220314
i386                 randconfig-a005-20220314
i386                          randconfig-a014
i386                          randconfig-a012
i386                          randconfig-a016
s390                 randconfig-r044-20220313
arc                  randconfig-r043-20220313
riscv                randconfig-r042-20220313
arc                  randconfig-r043-20220314
riscv                    nommu_k210_defconfig
riscv                            allyesconfig
riscv                    nommu_virt_defconfig
riscv                             allnoconfig
riscv                               defconfig
riscv                          rv32_defconfig
riscv                            allmodconfig
x86_64                    rhel-8.3-kselftests
um                           x86_64_defconfig
um                             i386_defconfig
x86_64                           allyesconfig
x86_64                               rhel-8.3
x86_64                          rhel-8.3-func
x86_64                         rhel-8.3-kunit
x86_64                                  kexec

clang tested configs:
arm                  randconfig-c002-20220313
x86_64                        randconfig-c007
powerpc              randconfig-c003-20220313
riscv                randconfig-c006-20220313
mips                 randconfig-c004-20220313
i386                          randconfig-c001
hexagon                             defconfig
powerpc                       ebony_defconfig
mips                      bmips_stb_defconfig
arm                       cns3420vb_defconfig
arm                      pxa255-idp_defconfig
arm                        magician_defconfig
powerpc                     ksi8560_defconfig
mips                         tb0287_defconfig
arm                         lpc32xx_defconfig
powerpc                      obs600_defconfig
powerpc                      ppc64e_defconfig
powerpc                      pmac32_defconfig
powerpc                          allyesconfig
powerpc               mpc834x_itxgp_defconfig
mips                     cu1000-neo_defconfig
arm                           omap1_defconfig
mips                          ath25_defconfig
powerpc                 mpc8313_rdb_defconfig
powerpc                      ppc44x_defconfig
i386                             allyesconfig
mips                malta_qemu_32r6_defconfig
powerpc                 mpc832x_rdb_defconfig
arm                          collie_defconfig
powerpc                     kilauea_defconfig
powerpc                     mpc512x_defconfig
mips                      malta_kvm_defconfig
arm                          pxa168_defconfig
i386                          randconfig-a002
i386                          randconfig-a006
i386                          randconfig-a004
x86_64               randconfig-a014-20220314
x86_64               randconfig-a015-20220314
x86_64               randconfig-a016-20220314
x86_64               randconfig-a012-20220314
x86_64               randconfig-a013-20220314
x86_64               randconfig-a011-20220314
x86_64                        randconfig-a012
x86_64                        randconfig-a014
x86_64                        randconfig-a016
i386                          randconfig-a011
i386                          randconfig-a013
i386                          randconfig-a015
i386                 randconfig-a013-20220314
i386                 randconfig-a015-20220314
i386                 randconfig-a014-20220314
i386                 randconfig-a011-20220314
i386                 randconfig-a016-20220314
i386                 randconfig-a012-20220314
hexagon              randconfig-r045-20220313
hexagon              randconfig-r045-20220314
hexagon              randconfig-r041-20220313
s390                 randconfig-r044-20220314
hexagon              randconfig-r041-20220314
riscv                randconfig-r042-20220314

---
0-DAY CI Kernel Test Service
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
