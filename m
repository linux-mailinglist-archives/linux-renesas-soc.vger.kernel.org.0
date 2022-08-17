Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4D2C35967ED
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 17 Aug 2022 06:10:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229955AbiHQEKO (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 17 Aug 2022 00:10:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40120 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229895AbiHQEKN (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 17 Aug 2022 00:10:13 -0400
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0782494103
        for <linux-renesas-soc@vger.kernel.org>; Tue, 16 Aug 2022 21:10:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1660709412; x=1692245412;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=K1tF6cO5BkqkaPwBO2Kur50vYYPyoC7S8QEzb0lpAtA=;
  b=f4ROfEOdyJSc2L8/FwNbQ+cDSIk2o4acSI0BDTonJqzrVYAd00t6k0He
   1sGQzmc4+Iir04u1LwH94/d76XPOhBUEWz25h+waEzFcAi/EQRn1XabG5
   ZhbBO3+8w0qs1PZnvAXWE4bzUj00Fd4/EVdGUQZXZbqor7zGaLE25S5XN
   xekDpmCTLpM7wPAePRd+6FxDmfcdC1XZ5FiOCjQG7tbGuzPgOYgRSAWjs
   Xn5O8LXTYilzKh3Vh0oqiwqcftkm3N5X3vUI1lTKek2tBiKpyWCZugYtf
   9gyo93Lmq4B7eNF0bu+5bu9FyrtTUY2jcfU4C8fS2/lwx7We0Ahx5I/iy
   Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10441"; a="291147324"
X-IronPort-AV: E=Sophos;i="5.93,242,1654585200"; 
   d="scan'208";a="291147324"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Aug 2022 21:10:11 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,242,1654585200"; 
   d="scan'208";a="696623483"
Received: from lkp-server02.sh.intel.com (HELO 81d7e1ade3ba) ([10.239.97.151])
  by FMSMGA003.fm.intel.com with ESMTP; 16 Aug 2022 21:10:10 -0700
Received: from kbuild by 81d7e1ade3ba with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1oOANd-0000Yk-38;
        Wed, 17 Aug 2022 04:10:09 +0000
Date:   Wed, 17 Aug 2022 12:09:56 +0800
From:   kernel test robot <lkp@intel.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     linux-renesas-soc@vger.kernel.org
Subject: [geert-renesas-drivers:topic/overlays-v6.0-rc1] BUILD SUCCESS
 6fed30f7962ef9045fc74b10c19c1de01f164fdc
Message-ID: <62fc6a14.dNCmwbU0ZjgM5pmb%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git topic/overlays-v6.0-rc1
branch HEAD: 6fed30f7962ef9045fc74b10c19c1de01f164fdc  kbuild: Allow .dtso format for overlay source files

elapsed time: 721m

configs tested: 104
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
um                             i386_defconfig
um                           x86_64_defconfig
arc                  randconfig-r043-20220815
i386                 randconfig-a003-20220815
i386                 randconfig-a001-20220815
i386                 randconfig-a004-20220815
i386                 randconfig-a005-20220815
i386                 randconfig-a002-20220815
i386                                defconfig
i386                 randconfig-a006-20220815
alpha                            allyesconfig
m68k                             allmodconfig
arc                              allyesconfig
powerpc                          allmodconfig
mips                             allyesconfig
powerpc                           allnoconfig
sh                               allmodconfig
m68k                             allyesconfig
i386                             allyesconfig
x86_64               randconfig-a002-20220815
arc                        nsimosci_defconfig
m68k                          atari_defconfig
sh                        dreamcast_defconfig
sh                            migor_defconfig
x86_64               randconfig-a001-20220815
x86_64               randconfig-a005-20220815
x86_64               randconfig-a003-20220815
x86_64               randconfig-a004-20220815
x86_64               randconfig-a006-20220815
x86_64                           rhel-8.3-kvm
x86_64                    rhel-8.3-kselftests
x86_64                           rhel-8.3-syz
x86_64                          rhel-8.3-func
x86_64                         rhel-8.3-kunit
x86_64                              defconfig
x86_64                           allyesconfig
x86_64                               rhel-8.3
csky                              allnoconfig
alpha                             allnoconfig
arc                               allnoconfig
riscv                             allnoconfig
arm                                 defconfig
arm64                            allyesconfig
arm                              allyesconfig
powerpc              randconfig-c003-20220815
i386                 randconfig-c001-20220815
sh                           se7343_defconfig
m68k                                defconfig
powerpc                 mpc837x_rdb_defconfig
loongarch                           defconfig
loongarch                         allnoconfig
arm                         lubbock_defconfig
csky                                defconfig
arm                         vf610m4_defconfig
i386                          debian-10.3-kvm
i386                        debian-10.3-kunit
i386                         debian-10.3-func
powerpc                      cm5200_defconfig
ia64                            zx1_defconfig
xtensa                  audio_kc705_defconfig
um                                  defconfig
xtensa                generic_kc705_defconfig
mips                  maltasmvp_eva_defconfig
sh                        sh7757lcr_defconfig
mips                            gpr_defconfig
m68k                        m5407c3_defconfig
sparc                       sparc32_defconfig
m68k                       m5275evb_defconfig
sh                   sh7770_generic_defconfig
parisc                           allyesconfig
powerpc                         wii_defconfig
sh                          landisk_defconfig
parisc64                         alldefconfig
riscv                    nommu_virt_defconfig
riscv                          rv32_defconfig
riscv                    nommu_k210_defconfig
i386                   debian-10.3-kselftests
i386                              debian-10.3

clang tested configs:
hexagon              randconfig-r041-20220815
hexagon              randconfig-r045-20220815
s390                 randconfig-r044-20220815
riscv                randconfig-r042-20220815
x86_64               randconfig-a015-20220815
x86_64               randconfig-a014-20220815
x86_64               randconfig-a016-20220815
x86_64               randconfig-a011-20220815
x86_64               randconfig-a012-20220815
x86_64               randconfig-a013-20220815
i386                 randconfig-a012-20220815
i386                 randconfig-a011-20220815
i386                 randconfig-a013-20220815
i386                 randconfig-a014-20220815
i386                 randconfig-a015-20220815
i386                 randconfig-a016-20220815
powerpc                      ppc64e_defconfig
powerpc                 mpc832x_mds_defconfig
arm                       imx_v4_v5_defconfig
mips                           mtx1_defconfig
powerpc                     kilauea_defconfig
s390                             alldefconfig
mips                          ath79_defconfig
arm                    vt8500_v6_v7_defconfig
arm64                            allyesconfig
powerpc                      pmac32_defconfig
x86_64               randconfig-k001-20220815

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
