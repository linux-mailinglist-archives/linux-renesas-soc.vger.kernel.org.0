Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 44896526596
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 13 May 2022 17:04:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1345871AbiEMPDc (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 13 May 2022 11:03:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36808 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1381260AbiEMPDP (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 13 May 2022 11:03:15 -0400
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 11A324E3AF
        for <linux-renesas-soc@vger.kernel.org>; Fri, 13 May 2022 08:03:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1652454194; x=1683990194;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=gwYWt0h8JL42HUHIj443DtU+8WMe5nVd4gp4OtAvAgE=;
  b=V5wGts5jlC1OiPJ6RXobEDtPu4SDh0tfEvOvZZ5efJJDnELU/AuNbzA4
   AjQEwTOb1xl6BE8/m75+1ycEwmhjo6MnCVFpi1q2QGA0Bkq79RIVHR+4c
   /Loo0y+kpHExJ5NkhQ6XFaarwnwi2ajUv3u0mxIEUl0GfJrIUTduOhOQo
   xbXyH2sNEd/ki7ctBUlEEYEFdHChw87nkczYVCXRgrv0zY/9t12219Qo0
   d6Bdma9yhifrsv76Xd5BwqQmw0zU6U6TdhPsUzYWsdZrKLjDzLElpfZa0
   n3sv/KOm4b0aIwor92ryrqOjOajKW5pNk/N4bf3ojo9JO6Mk6RtUOQCBQ
   Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10346"; a="270257502"
X-IronPort-AV: E=Sophos;i="5.91,223,1647327600"; 
   d="scan'208";a="270257502"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 May 2022 08:02:50 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,223,1647327600"; 
   d="scan'208";a="521447476"
Received: from lkp-server01.sh.intel.com (HELO 5056e131ad90) ([10.239.97.150])
  by orsmga003.jf.intel.com with ESMTP; 13 May 2022 08:02:49 -0700
Received: from kbuild by 5056e131ad90 with local (Exim 4.95)
        (envelope-from <lkp@intel.com>)
        id 1npWoa-000Lqp-MX;
        Fri, 13 May 2022 15:02:48 +0000
Date:   Fri, 13 May 2022 23:02:26 +0800
From:   kernel test robot <lkp@intel.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     linux-renesas-soc@vger.kernel.org
Subject: [geert-renesas-drivers:topic/rcar-v3u-is-gen4-v1] BUILD SUCCESS
 0a24d3c9459ad3b098dcd62deef910ca5c515bf0
Message-ID: <627e7302.RXkDgu4qAPK6fVDF%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.0 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,HEXHASH_WORD,
        RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git topic/rcar-v3u-is-gen4-v1
branch HEAD: 0a24d3c9459ad3b098dcd62deef910ca5c515bf0  soc: renesas: R-Car V3U is R-Car Gen4

elapsed time: 14211m

configs tested: 187
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm64                               defconfig
arm64                            allyesconfig
arm                              allmodconfig
arm                                 defconfig
arm                              allyesconfig
i386                          randconfig-c001
m68k                       m5475evb_defconfig
arm                           corgi_defconfig
arc                           tb10x_defconfig
sh                          rsk7203_defconfig
powerpc                      pasemi_defconfig
arm                      footbridge_defconfig
powerpc                      ppc6xx_defconfig
powerpc                     pq2fads_defconfig
mips                         cobalt_defconfig
powerpc                 canyonlands_defconfig
m68k                        m5272c3_defconfig
mips                         bigsur_defconfig
arm                            pleb_defconfig
powerpc                   currituck_defconfig
openrisc                 simple_smp_defconfig
m68k                        mvme147_defconfig
arc                        nsimosci_defconfig
powerpc                     tqm8555_defconfig
sh                               allmodconfig
arm                      integrator_defconfig
microblaze                          defconfig
arm                         lpc18xx_defconfig
parisc64                            defconfig
powerpc                    klondike_defconfig
sparc64                             defconfig
arm                           sunxi_defconfig
powerpc                       maple_defconfig
m68k                       m5249evb_defconfig
mips                           ip32_defconfig
powerpc                     asp8347_defconfig
ia64                        generic_defconfig
mips                       bmips_be_defconfig
i386                             alldefconfig
mips                  maltasmvp_eva_defconfig
sh                         microdev_defconfig
arc                          axs101_defconfig
riscv             nommu_k210_sdcard_defconfig
openrisc                  or1klitex_defconfig
sh                          rsk7269_defconfig
xtensa                    xip_kc705_defconfig
sh                        apsh4ad0a_defconfig
powerpc                     sequoia_defconfig
powerpc                     mpc83xx_defconfig
mips                         rt305x_defconfig
xtensa                  audio_kc705_defconfig
m68k                            q40_defconfig
arc                 nsimosci_hs_smp_defconfig
powerpc                 mpc85xx_cds_defconfig
arm                            xcep_defconfig
arm                        oxnas_v6_defconfig
powerpc                      ppc40x_defconfig
arm                            lart_defconfig
powerpc                      arches_defconfig
sh                   secureedge5410_defconfig
um                                  defconfig
xtensa                    smp_lx200_defconfig
um                             i386_defconfig
arm                            qcom_defconfig
sh                          polaris_defconfig
mips                        bcm47xx_defconfig
m68k                        stmark2_defconfig
arm                            mps2_defconfig
x86_64                        randconfig-c001
arm                  randconfig-c002-20220501
arm                  randconfig-c002-20220505
ia64                                defconfig
ia64                             allmodconfig
ia64                             allyesconfig
m68k                             allyesconfig
m68k                             allmodconfig
m68k                                defconfig
nios2                               defconfig
arc                              allyesconfig
csky                                defconfig
nios2                            allyesconfig
alpha                               defconfig
alpha                            allyesconfig
h8300                            allyesconfig
arc                                 defconfig
xtensa                           allyesconfig
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
mips                             allyesconfig
mips                             allmodconfig
powerpc                          allyesconfig
powerpc                           allnoconfig
powerpc                          allmodconfig
x86_64                        randconfig-a002
i386                 randconfig-a004-20220502
i386                 randconfig-a006-20220502
i386                 randconfig-a002-20220502
i386                 randconfig-a003-20220502
i386                 randconfig-a001-20220502
i386                          randconfig-a001
i386                          randconfig-a003
i386                          randconfig-a005
x86_64                        randconfig-a015
x86_64                        randconfig-a013
x86_64                        randconfig-a011
i386                          randconfig-a012
i386                          randconfig-a014
i386                          randconfig-a016
x86_64                        randconfig-a006
x86_64                        randconfig-a004
arc                  randconfig-r043-20220505
s390                 randconfig-r044-20220505
riscv                randconfig-r042-20220505
arc                  randconfig-r043-20220501
s390                 randconfig-r044-20220501
riscv                randconfig-r042-20220501
riscv                               defconfig
riscv                    nommu_virt_defconfig
riscv                          rv32_defconfig
riscv                    nommu_k210_defconfig
riscv                             allnoconfig
riscv                            allmodconfig
riscv                            allyesconfig
x86_64                    rhel-8.3-kselftests
um                           x86_64_defconfig
x86_64                          rhel-8.3-func
x86_64                           rhel-8.3-syz
x86_64                                  kexec
x86_64                              defconfig
x86_64                           allyesconfig
x86_64                         rhel-8.3-kunit
x86_64                               rhel-8.3

clang tested configs:
x86_64                        randconfig-c007
i386                          randconfig-c001
powerpc              randconfig-c003-20220501
riscv                randconfig-c006-20220501
mips                 randconfig-c004-20220501
arm                  randconfig-c002-20220501
powerpc              randconfig-c003-20220505
riscv                randconfig-c006-20220505
arm                  randconfig-c002-20220505
powerpc                    socrates_defconfig
mips                     cu1830-neo_defconfig
mips                  cavium_octeon_defconfig
arm                          ep93xx_defconfig
arm                        neponset_defconfig
powerpc                          g5_defconfig
mips                      maltaaprp_defconfig
arm                           sama7_defconfig
hexagon                          alldefconfig
arm                         s3c2410_defconfig
mips                        workpad_defconfig
arm                       mainstone_defconfig
powerpc                 mpc832x_rdb_defconfig
powerpc                      pmac32_defconfig
i386                          randconfig-a002
i386                          randconfig-a006
i386                          randconfig-a004
x86_64                        randconfig-a014
x86_64                        randconfig-a012
x86_64                        randconfig-a016
x86_64               randconfig-a015-20220502
x86_64               randconfig-a012-20220502
x86_64               randconfig-a016-20220502
x86_64               randconfig-a014-20220502
x86_64               randconfig-a013-20220502
x86_64               randconfig-a011-20220502
i386                 randconfig-a011-20220502
i386                 randconfig-a013-20220502
i386                 randconfig-a016-20220502
i386                 randconfig-a015-20220502
i386                 randconfig-a014-20220502
i386                 randconfig-a012-20220502
x86_64                        randconfig-a005
x86_64                        randconfig-a003
x86_64                        randconfig-a001
hexagon              randconfig-r045-20220502
hexagon              randconfig-r045-20220501
riscv                randconfig-r042-20220502
hexagon              randconfig-r041-20220502
hexagon              randconfig-r041-20220501

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
