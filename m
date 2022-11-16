Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D2F5062B29E
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 16 Nov 2022 06:15:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229766AbiKPFPi (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 16 Nov 2022 00:15:38 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46688 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229937AbiKPFPh (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 16 Nov 2022 00:15:37 -0500
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 901C62F014
        for <linux-renesas-soc@vger.kernel.org>; Tue, 15 Nov 2022 21:15:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1668575736; x=1700111736;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=/YEonYEfo3brPHTMd4/EEOcO6BOMirYWnVgcDdKb89c=;
  b=b/L9LlW+w1+JSKlbmtwf+PwSzx0a/dBzlaui32WeiMdLu1GcmldysILY
   gPSiLAZhyXhmwzrH/S5/sCZOsXTew1gC/B9GSvEtFplTaVp76iMvJ1rOh
   HYJ7wXkH9dmZ+pua6enuq84uEwSemRWRBvaB4C+Kb8X8wgjim4Vyv+d/d
   eYSe6WF9KPdXGwYnHyKaeQUPB1MsK0kXiVhIrI/69ex2mQJ65ljxbpQ48
   FsF07qlqGfdCKaJp7nf4Be9tqufFU5CdgkSsPc/tFfCDM1dsv6wCFH1Wr
   ijp8VSRquL0U5UqHsSogV7Dz+WVbCMVCWykKGbNeebE58N+18psvxwQgx
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10532"; a="295819210"
X-IronPort-AV: E=Sophos;i="5.96,167,1665471600"; 
   d="scan'208";a="295819210"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Nov 2022 21:15:34 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10532"; a="728229168"
X-IronPort-AV: E=Sophos;i="5.96,167,1665471600"; 
   d="scan'208";a="728229168"
Received: from lkp-server01.sh.intel.com (HELO ebd99836cbe0) ([10.239.97.150])
  by FMSMGA003.fm.intel.com with ESMTP; 15 Nov 2022 21:15:33 -0800
Received: from kbuild by ebd99836cbe0 with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1ovAlo-00022G-00;
        Wed, 16 Nov 2022 05:15:32 +0000
Date:   Wed, 16 Nov 2022 13:14:38 +0800
From:   kernel test robot <lkp@intel.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     linux-renesas-soc@vger.kernel.org
Subject: [geert-renesas-drivers:topic/r8a779g0-cpu-topology-v1] BUILD
 SUCCESS 006cffcb4d1c09c8f415685f6e6406d634b5e11b
Message-ID: <637471be.gLz2gpBn1wFfhyei%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,
        SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git topic/r8a779g0-cpu-topology-v1
branch HEAD: 006cffcb4d1c09c8f415685f6e6406d634b5e11b  arm64: dts: renesas: r8a779g0: Add CA76 operating points

elapsed time: 724m

configs tested: 94
configs skipped: 115

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
um                           x86_64_defconfig
um                             i386_defconfig
ia64                             allmodconfig
x86_64                          rhel-8.3-func
x86_64                    rhel-8.3-kselftests
x86_64                           rhel-8.3-kvm
x86_64                           rhel-8.3-syz
x86_64                         rhel-8.3-kunit
i386                             allyesconfig
i386                                defconfig
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
x86_64                              defconfig
x86_64                           allyesconfig
x86_64                               rhel-8.3
i386                          randconfig-c001
powerpc                           allnoconfig
mips                             allyesconfig
powerpc                          allmodconfig
sh                               allmodconfig
s390                                defconfig
s390                             allmodconfig
arc                                 defconfig
alpha                               defconfig
s390                             allyesconfig
x86_64                        randconfig-a006
x86_64                        randconfig-a004
x86_64                        randconfig-a002
i386                          randconfig-a012
i386                          randconfig-a014
i386                          randconfig-a016
arm64                            allyesconfig
arm                                 defconfig
arm                              allyesconfig
m68k                             allyesconfig
m68k                             allmodconfig
arc                              allyesconfig
alpha                            allyesconfig
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
arm                            hisi_defconfig
powerpc                   motionpro_defconfig
mips                      maltasmvp_defconfig
sh                        apsh4ad0a_defconfig
arm                         axm55xx_defconfig
powerpc                     asp8347_defconfig
arm                      integrator_defconfig
mips                           ci20_defconfig
powerpc                      ppc6xx_defconfig
sh                 kfr2r09-romimage_defconfig

clang tested configs:
hexagon              randconfig-r041-20221115
hexagon              randconfig-r045-20221115
arm                           sama7_defconfig
powerpc                 mpc8315_rdb_defconfig
x86_64               randconfig-a012-20221114
x86_64               randconfig-a013-20221114
x86_64               randconfig-a016-20221114
x86_64               randconfig-a014-20221114
x86_64               randconfig-a015-20221114
x86_64               randconfig-a011-20221114
x86_64                        randconfig-k001
i386                          randconfig-a002
i386                          randconfig-a006
i386                          randconfig-a004
x86_64                        randconfig-a012
x86_64                        randconfig-a014
x86_64                        randconfig-a016

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
