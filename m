Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 19BD0550110
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 18 Jun 2022 02:03:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232947AbiFRADD (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 17 Jun 2022 20:03:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56796 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230437AbiFRADC (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 17 Jun 2022 20:03:02 -0400
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1C29212A9B
        for <linux-renesas-soc@vger.kernel.org>; Fri, 17 Jun 2022 17:03:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1655510581; x=1687046581;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=KRxW77esP2DvaPaqZELx0kTfMQXmChfKdL6yQ8dro2U=;
  b=U8DjkpAD6Tyz5G/BCO5kRqrsgF9Dy94wUuvp3s8Sh/eqb//+GByhx3SJ
   zG9WVjJwi6OEjBswgDTdoHoLDjcN4lAMyaok/Z2sz4pr8XIaHF4JfucX2
   luQ7jJVCkTvviKV/eXXOc1sYEOBuBHnR15ztDJGVwBSRRiGP9JmOlWdE5
   LEuYZ1h+13q4ZjJOCa1sruIK7n756kJbVuIXkE5RBhvOp2qyaNLRCKzCx
   BbZVjeBsS6iuHfvXpafCi2Yp+kzwm7xYwAIgRrQtBcH50kJDsFpicKQ5R
   BqIXoftUwZ/mueookp6AsRyYmnvIBcTxM0fIyBFkku/50JxVEsH5HcXWK
   A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10380"; a="279644164"
X-IronPort-AV: E=Sophos;i="5.92,306,1650956400"; 
   d="scan'208";a="279644164"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jun 2022 17:03:00 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.92,306,1650956400"; 
   d="scan'208";a="653827466"
Received: from lkp-server01.sh.intel.com (HELO 60dabacc1df6) ([10.239.97.150])
  by fmsmga004.fm.intel.com with ESMTP; 17 Jun 2022 17:02:59 -0700
Received: from kbuild by 60dabacc1df6 with local (Exim 4.95)
        (envelope-from <lkp@intel.com>)
        id 1o2LvX-000Prn-4R;
        Sat, 18 Jun 2022 00:02:59 +0000
Date:   Sat, 18 Jun 2022 08:02:43 +0800
From:   kernel test robot <lkp@intel.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     linux-renesas-soc@vger.kernel.org
Subject: [geert-renesas-devel:renesas-dt-bindings-for-v5.20] BUILD SUCCESS 774fecc7ece1d5b7c604402ac2daede14825a467
Message-ID: <62ad1623.4xgsJwWapKT8jTb8%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-7.7 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git renesas-dt-bindings-for-v5.20
branch HEAD: 774fecc7ece1d5b7c604402ac2daede14825a467  dt-bindings: soc: renesas: Move renesas,prr from arm to soc

elapsed time: 923m

configs tested: 157
configs skipped: 4

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm64                               defconfig
arm64                            allyesconfig
arm                              allmodconfig
arm                                 defconfig
arm                              allyesconfig
i386                          randconfig-c001
s390                       zfcpdump_defconfig
sh                           se7751_defconfig
sh                            migor_defconfig
mips                            gpr_defconfig
microblaze                          defconfig
powerpc                 mpc834x_itx_defconfig
sh                   rts7751r2dplus_defconfig
m68k                       m5475evb_defconfig
parisc64                            defconfig
powerpc                     tqm8548_defconfig
mips                             allyesconfig
sh                             sh03_defconfig
arc                 nsimosci_hs_smp_defconfig
arm                          pxa910_defconfig
powerpc                 mpc8540_ads_defconfig
arm                        spear6xx_defconfig
m68k                          amiga_defconfig
arm                         at91_dt_defconfig
sh                      rts7751r2d1_defconfig
sh                         microdev_defconfig
parisc64                         alldefconfig
mips                           xway_defconfig
m68k                        mvme147_defconfig
powerpc                       maple_defconfig
sh                   secureedge5410_defconfig
xtensa                  audio_kc705_defconfig
powerpc                      ppc40x_defconfig
sh                            hp6xx_defconfig
xtensa                  nommu_kc705_defconfig
mips                             allmodconfig
arm                            zeus_defconfig
arc                    vdk_hs38_smp_defconfig
sparc64                          alldefconfig
powerpc                       holly_defconfig
xtensa                  cadence_csp_defconfig
mips                  decstation_64_defconfig
m68k                       m5249evb_defconfig
sparc64                             defconfig
ia64                         bigsur_defconfig
arm                       aspeed_g5_defconfig
powerpc                     rainier_defconfig
m68k                         amcore_defconfig
mips                      maltasmvp_defconfig
arm                           u8500_defconfig
powerpc                      arches_defconfig
arc                         haps_hs_defconfig
arc                        nsimosci_defconfig
sh                             shx3_defconfig
csky                             alldefconfig
mips                         tb0226_defconfig
m68k                        m5407c3_defconfig
arc                           tb10x_defconfig
sh                             espt_defconfig
sh                     sh7710voipgw_defconfig
arm                        realview_defconfig
m68k                       m5208evb_defconfig
sh                           se7724_defconfig
mips                           ip32_defconfig
sh                   sh7724_generic_defconfig
sh                              ul2_defconfig
riscv             nommu_k210_sdcard_defconfig
x86_64                        randconfig-c001
arm                  randconfig-c002-20220617
ia64                                defconfig
riscv                             allnoconfig
m68k                             allyesconfig
m68k                             allmodconfig
m68k                                defconfig
nios2                               defconfig
arc                              allyesconfig
csky                                defconfig
nios2                            allyesconfig
alpha                               defconfig
alpha                            allyesconfig
xtensa                           allyesconfig
arc                                 defconfig
sh                               allmodconfig
s390                                defconfig
s390                             allmodconfig
parisc                              defconfig
parisc                           allyesconfig
s390                             allyesconfig
sparc                               defconfig
i386                             allyesconfig
sparc                            allyesconfig
i386                                defconfig
i386                   debian-10.3-kselftests
i386                              debian-10.3
powerpc                          allyesconfig
powerpc                           allnoconfig
powerpc                          allmodconfig
x86_64                        randconfig-a006
x86_64                        randconfig-a004
x86_64                        randconfig-a002
i386                          randconfig-a001
i386                          randconfig-a003
i386                          randconfig-a005
x86_64                        randconfig-a015
x86_64                        randconfig-a011
i386                          randconfig-a012
i386                          randconfig-a014
i386                          randconfig-a016
riscv                randconfig-r042-20220617
arc                  randconfig-r043-20220617
s390                 randconfig-r044-20220617
riscv                               defconfig
riscv                    nommu_virt_defconfig
riscv                          rv32_defconfig
riscv                    nommu_k210_defconfig
riscv                            allmodconfig
riscv                            allyesconfig
x86_64                    rhel-8.3-kselftests
um                           x86_64_defconfig
um                             i386_defconfig
x86_64                                  kexec
x86_64                              defconfig
x86_64                           allyesconfig
x86_64                               rhel-8.3
x86_64                          rhel-8.3-func
x86_64                           rhel-8.3-syz
x86_64                         rhel-8.3-kunit

clang tested configs:
arm                           sama7_defconfig
mips                      malta_kvm_defconfig
arm                       spear13xx_defconfig
arm                      pxa255-idp_defconfig
riscv                             allnoconfig
arm                          collie_defconfig
powerpc                       ebony_defconfig
arm                             mxs_defconfig
arm                         s3c2410_defconfig
arm                            mmp2_defconfig
powerpc                     mpc512x_defconfig
powerpc                     tqm5200_defconfig
arm                          moxart_defconfig
mips                      bmips_stb_defconfig
powerpc                 mpc8313_rdb_defconfig
powerpc                          allmodconfig
powerpc                        icon_defconfig
x86_64                        randconfig-k001
x86_64                        randconfig-a005
x86_64                        randconfig-a003
x86_64                        randconfig-a001
i386                          randconfig-a002
i386                          randconfig-a006
i386                          randconfig-a004
x86_64                        randconfig-a012
x86_64                        randconfig-a014
x86_64                        randconfig-a016
i386                          randconfig-a011
i386                          randconfig-a013
i386                          randconfig-a015
hexagon              randconfig-r041-20220617
hexagon              randconfig-r045-20220617

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
