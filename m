Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3511D5F49C8
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  4 Oct 2022 21:36:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229446AbiJDTgN (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 4 Oct 2022 15:36:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58602 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229436AbiJDTgM (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 4 Oct 2022 15:36:12 -0400
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 753381EC46
        for <linux-renesas-soc@vger.kernel.org>; Tue,  4 Oct 2022 12:36:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1664912171; x=1696448171;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=OVvofnG4F2THKWtqK+mW3xxx/K7W+N5dxNTFO8z/ofg=;
  b=D8Z9utkGkLsoUwpMNbDYtPKPH0nehV9lljDNi1J2d7wcpJ6qwd7OCqBC
   pdaiUIeDe3jK66Ru5KpLLdM3IAaFetFMKkNAFTijcis+4a37Hq8f0yICi
   puZ5iiGh14svusPCHndJ12bMApAxDQgcefdp8D0pbtGtSVMQnkjRyfW0C
   DLEVb8/St5rVoZfJJWzUOQ/tca7JnhB5MlTlxR0xn0syBPpBLs+xBLcRs
   /tHMNjVL5eV44Kt/Lw5hTpD1BP9sL9wsknO5Atj+AC9LkP5QyeJ02Fkvy
   zwDhp09j2jNH9kjUeVypibmTs+F7KKJDr4dB6MbjiLydCZA6OFTSiSUWS
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10490"; a="389301005"
X-IronPort-AV: E=Sophos;i="5.95,158,1661842800"; 
   d="scan'208";a="389301005"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Oct 2022 12:35:33 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10490"; a="686678403"
X-IronPort-AV: E=Sophos;i="5.95,158,1661842800"; 
   d="scan'208";a="686678403"
Received: from lkp-server01.sh.intel.com (HELO d4f44333118a) ([10.239.97.150])
  by fmsmga008.fm.intel.com with ESMTP; 04 Oct 2022 12:35:32 -0700
Received: from kbuild by d4f44333118a with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1ofnhT-0000UL-1G;
        Tue, 04 Oct 2022 19:35:31 +0000
Date:   Wed, 05 Oct 2022 03:35:16 +0800
From:   kernel test robot <lkp@intel.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     linux-renesas-soc@vger.kernel.org
Subject: [geert-renesas-devel:renesas-arm-dt-for-v6.2] BUILD SUCCESS
 f621040b30c93b1a054c0d12b6e310eecbb1a58b
Message-ID: <633c8af4.tUCIBVAak7yQU5Ib%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git renesas-arm-dt-for-v6.2
branch HEAD: f621040b30c93b1a054c0d12b6e310eecbb1a58b  arm64: dts: renesas: condor-common: Add missing bootargs

elapsed time: 720m

configs tested: 119
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arc                                 defconfig
alpha                               defconfig
um                           x86_64_defconfig
um                             i386_defconfig
x86_64                          rhel-8.3-func
x86_64                    rhel-8.3-kselftests
x86_64                           rhel-8.3-kvm
x86_64                           rhel-8.3-syz
x86_64                         rhel-8.3-kunit
powerpc                           allnoconfig
x86_64                              defconfig
x86_64                           allyesconfig
x86_64                               rhel-8.3
powerpc                          allmodconfig
mips                             allyesconfig
i386                 randconfig-a011-20221003
i386                 randconfig-a016-20221003
i386                 randconfig-a012-20221003
i386                 randconfig-a014-20221003
i386                 randconfig-a015-20221003
i386                 randconfig-a013-20221003
arm64                            allyesconfig
arm                                 defconfig
arm                              allyesconfig
riscv                randconfig-r042-20221003
arc                  randconfig-r043-20221003
arc                  randconfig-r043-20221002
s390                 randconfig-r044-20221003
s390                                defconfig
sh                               allmodconfig
i386                             allyesconfig
i386                                defconfig
s390                             allmodconfig
x86_64               randconfig-a011-20221003
x86_64               randconfig-a016-20221003
x86_64               randconfig-a014-20221003
x86_64               randconfig-a013-20221003
x86_64               randconfig-a012-20221003
x86_64               randconfig-a015-20221003
s390                             allyesconfig
alpha                            allyesconfig
arc                              allyesconfig
m68k                             allyesconfig
m68k                             allmodconfig
csky                              allnoconfig
alpha                             allnoconfig
arc                               allnoconfig
riscv                             allnoconfig
powerpc                      mgcoge_defconfig
arc                 nsimosci_hs_smp_defconfig
powerpc                     mpc83xx_defconfig
sh                      rts7751r2d1_defconfig
arc                    vdk_hs38_smp_defconfig
arm                             ezx_defconfig
arm                        realview_defconfig
xtensa                           alldefconfig
sh                          kfr2r09_defconfig
arm                          exynos_defconfig
sh                           se7619_defconfig
m68k                         apollo_defconfig
m68k                          atari_defconfig
sh                   sh7770_generic_defconfig
i386                          randconfig-c001
sh                              ul2_defconfig
m68k                        stmark2_defconfig
nios2                               defconfig
m68k                          amiga_defconfig
arc                            hsdk_defconfig
loongarch                 loongson3_defconfig
powerpc                      cm5200_defconfig
xtensa                  cadence_csp_defconfig
powerpc                 mpc8540_ads_defconfig
arm                          simpad_defconfig
xtensa                          iss_defconfig
arm                            lart_defconfig
sh                     magicpanelr2_defconfig
arm                  randconfig-c002-20221002
x86_64                        randconfig-c001
sh                ecovec24-romimage_defconfig
arm64                            alldefconfig
powerpc                 mpc837x_mds_defconfig
mips                         cobalt_defconfig
mips                 randconfig-c004-20221002
m68k                          sun3x_defconfig
powerpc                     tqm8548_defconfig
i386                          debian-10.3-kvm
i386                        debian-10.3-kunit
i386                         debian-10.3-func
riscv                    nommu_virt_defconfig
riscv                          rv32_defconfig
riscv                    nommu_k210_defconfig
i386                   debian-10.3-kselftests
i386                              debian-10.3
sh                   rts7751r2dplus_defconfig
ia64                             allmodconfig
s390                       zfcpdump_defconfig
powerpc                      chrp32_defconfig
sh                             espt_defconfig
powerpc                       maple_defconfig
sparc64                             defconfig
arc                          axs101_defconfig
powerpc                 linkstation_defconfig
arm                            pleb_defconfig

clang tested configs:
i386                 randconfig-a001-20221003
i386                 randconfig-a006-20221003
i386                 randconfig-a002-20221003
i386                 randconfig-a003-20221003
i386                 randconfig-a005-20221003
i386                 randconfig-a004-20221003
x86_64               randconfig-a003-20221003
x86_64               randconfig-a005-20221003
x86_64               randconfig-a001-20221003
x86_64               randconfig-a004-20221003
x86_64               randconfig-a002-20221003
x86_64               randconfig-a006-20221003
x86_64                        randconfig-k001
powerpc                      walnut_defconfig
arm                  colibri_pxa300_defconfig
arm                       mainstone_defconfig
riscv                             allnoconfig

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
