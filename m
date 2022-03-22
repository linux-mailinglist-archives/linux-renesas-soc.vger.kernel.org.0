Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 731F24E3704
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 22 Mar 2022 03:57:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235785AbiCVC7M (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 21 Mar 2022 22:59:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41816 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235778AbiCVC7L (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 21 Mar 2022 22:59:11 -0400
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 03542331441
        for <linux-renesas-soc@vger.kernel.org>; Mon, 21 Mar 2022 19:57:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1647917865; x=1679453865;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=9lsXExNLVceAJB8D1/uMFSRgSbWLuFTwszsu3ttZ0Ko=;
  b=G0uV/LtXSHt3Hsp6cs7eSx/9pIwuheyMFf/yZzT6hZDfhyH6lF3nQE1/
   kkbM8LGALRlNa4dx4KRFqhPHgMWOZBOhNS5daaUKHTll+R2c/lJ8eiEvA
   M2uSWkzps14zfP5wYrJLDtcfunxt+x/dpGX+GVW3BQ/FI73fIEkZxp/Ab
   0xzVPd5GVFapblTvkyERHXhmCGP17NCdrJDICMESNje+3LTzfzvNJDRqO
   7Nl6jkLuMUjZjoYdh6N3GTaqLm4JzJf+DzPNEnBvqR16sOq2t0D022lU6
   BHgEmzjs+8tuM3xD4wPZsSFzGi7P3u3zE6a1VXsWZaJrDZ0QbcOamL6gJ
   g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10293"; a="237650174"
X-IronPort-AV: E=Sophos;i="5.90,200,1643702400"; 
   d="scan'208";a="237650174"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Mar 2022 19:57:44 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,200,1643702400"; 
   d="scan'208";a="716745901"
Received: from lkp-server02.sh.intel.com (HELO 89b41b6ae01c) ([10.239.97.151])
  by orsmga005.jf.intel.com with ESMTP; 21 Mar 2022 19:57:43 -0700
Received: from kbuild by 89b41b6ae01c with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1nWUiM-000IO2-G5; Tue, 22 Mar 2022 02:57:42 +0000
Date:   Tue, 22 Mar 2022 10:57:00 +0800
From:   kernel test robot <lkp@intel.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     linux-renesas-soc@vger.kernel.org
Subject: [geert-renesas-devel:renesas-arm-dt-for-v5.19] BUILD SUCCESS
 d4417743a2d3f501f6345b2768f6d9df30b923a9
Message-ID: <62393afc.O1dMq0G9QPeue60w%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.6 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,HEXHASH_WORD,
        RCVD_IN_DNSWL_MED,SPF_HELO_PASS,SPF_NONE,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git renesas-arm-dt-for-v5.19
branch HEAD: d4417743a2d3f501f6345b2768f6d9df30b923a9  arm64: dts: renesas: falcon-cpu: Use INTC_EX for SN65DSI86

elapsed time: 724m

configs tested: 138
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                                 defconfig
arm64                            allyesconfig
arm64                               defconfig
arm                              allyesconfig
arm                              allmodconfig
mips                 randconfig-c004-20220320
i386                 randconfig-c001-20220321
arm                        keystone_defconfig
sparc                       sparc32_defconfig
h8300                               defconfig
powerpc                 mpc85xx_cds_defconfig
arm                         nhk8815_defconfig
h8300                     edosk2674_defconfig
mips                       capcella_defconfig
sh                             shx3_defconfig
sh                        sh7757lcr_defconfig
arm                        multi_v7_defconfig
sh                           se7780_defconfig
riscv                    nommu_k210_defconfig
m68k                             alldefconfig
m68k                       m5475evb_defconfig
mips                         rt305x_defconfig
openrisc                  or1klitex_defconfig
powerpc                 mpc837x_mds_defconfig
sh                      rts7751r2d1_defconfig
sh                        edosk7760_defconfig
alpha                            allyesconfig
arc                        nsimosci_defconfig
sh                          rsk7201_defconfig
arc                 nsimosci_hs_smp_defconfig
sh                               j2_defconfig
powerpc64                           defconfig
ia64                                defconfig
powerpc                 mpc837x_rdb_defconfig
sh                         microdev_defconfig
sh                              ul2_defconfig
um                                  defconfig
powerpc                 mpc834x_itx_defconfig
sh                             sh03_defconfig
powerpc                     rainier_defconfig
arm                         vf610m4_defconfig
sh                        edosk7705_defconfig
powerpc                     ep8248e_defconfig
arm                        mini2440_defconfig
xtensa                          iss_defconfig
arm                            hisi_defconfig
m68k                        mvme147_defconfig
arm                  randconfig-c002-20220321
arm                  randconfig-c002-20220320
ia64                             allmodconfig
ia64                             allyesconfig
m68k                             allmodconfig
m68k                                defconfig
m68k                             allyesconfig
nios2                               defconfig
arc                              allyesconfig
nds32                             allnoconfig
nds32                               defconfig
nios2                            allyesconfig
csky                                defconfig
alpha                               defconfig
xtensa                           allyesconfig
h8300                            allyesconfig
arc                                 defconfig
sh                               allmodconfig
parisc                              defconfig
s390                             allyesconfig
s390                             allmodconfig
parisc64                            defconfig
parisc                           allyesconfig
s390                                defconfig
i386                             allyesconfig
sparc                            allyesconfig
sparc                               defconfig
i386                                defconfig
i386                   debian-10.3-kselftests
i386                              debian-10.3
mips                             allyesconfig
mips                             allmodconfig
powerpc                          allyesconfig
powerpc                          allmodconfig
powerpc                           allnoconfig
x86_64               randconfig-a016-20220321
x86_64               randconfig-a011-20220321
x86_64               randconfig-a012-20220321
x86_64               randconfig-a013-20220321
x86_64               randconfig-a014-20220321
x86_64               randconfig-a015-20220321
i386                 randconfig-a015-20220321
i386                 randconfig-a016-20220321
i386                 randconfig-a011-20220321
i386                 randconfig-a013-20220321
i386                 randconfig-a012-20220321
i386                 randconfig-a014-20220321
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
x86_64                              defconfig
x86_64                               rhel-8.3
x86_64                          rhel-8.3-func
x86_64                         rhel-8.3-kunit
x86_64                                  kexec

clang tested configs:
x86_64                        randconfig-c007
mips                 randconfig-c004-20220320
arm                  randconfig-c002-20220320
powerpc              randconfig-c003-20220320
riscv                randconfig-c006-20220320
i386                          randconfig-c001
arm                  randconfig-c002-20220322
powerpc              randconfig-c003-20220322
riscv                randconfig-c006-20220322
arm                          moxart_defconfig
mips                      bmips_stb_defconfig
powerpc                          allmodconfig
x86_64               randconfig-a001-20220321
x86_64               randconfig-a003-20220321
x86_64               randconfig-a005-20220321
x86_64               randconfig-a004-20220321
x86_64               randconfig-a002-20220321
x86_64               randconfig-a006-20220321
i386                 randconfig-a001-20220321
i386                 randconfig-a006-20220321
i386                 randconfig-a003-20220321
i386                 randconfig-a005-20220321
i386                 randconfig-a004-20220321
i386                 randconfig-a002-20220321
riscv                randconfig-r042-20220320
hexagon              randconfig-r045-20220321
hexagon              randconfig-r045-20220320
hexagon              randconfig-r041-20220321
hexagon              randconfig-r041-20220320
riscv                randconfig-r042-20220322
hexagon              randconfig-r045-20220322
hexagon              randconfig-r041-20220322

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
