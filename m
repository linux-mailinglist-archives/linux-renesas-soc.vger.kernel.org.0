Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8A4B05963C5
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 16 Aug 2022 22:39:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236193AbiHPUjF (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 16 Aug 2022 16:39:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41734 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233510AbiHPUjE (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 16 Aug 2022 16:39:04 -0400
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6978F57891
        for <linux-renesas-soc@vger.kernel.org>; Tue, 16 Aug 2022 13:39:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1660682343; x=1692218343;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=PTZbgxgRoxailHiDLmgpyRKZ8apRJxKzQXWeB2qirVQ=;
  b=CM1Qjyk6rMdOBrccZbarmA/lqSmuZp1MuVFvHGXgX3n68lID8P7A+U7j
   4W98XtXsmkgU2Ut5SLibH+vFmtQvAR/ZsoE4Z2wkuDkP9BQVo5HWE96IK
   neygrB81WwxDE7CnqSjG7iQ4eDN3NgsCt2dq8IAWKJQ7zZ8N8Gc/laQyP
   Lglfn7gnW3NECue8Bb1bGnrMeRExhOQpitrsiBWURTYwmPZ5g/fhPO2BY
   fvrZ6H/2BLBUpfhZdK2wkyjBJhu8iDECsTNBEsUFXqoxAAArMB1wMcq01
   5RxpPNgzgkyfJaz6i0WLg4b+BpQe96UPjWTTsph+wR+x5IhkjPX+HWZ11
   g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10441"; a="272716990"
X-IronPort-AV: E=Sophos;i="5.93,242,1654585200"; 
   d="scan'208";a="272716990"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Aug 2022 13:39:03 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,242,1654585200"; 
   d="scan'208";a="640181158"
Received: from lkp-server02.sh.intel.com (HELO 81d7e1ade3ba) ([10.239.97.151])
  by orsmga001.jf.intel.com with ESMTP; 16 Aug 2022 13:39:01 -0700
Received: from kbuild by 81d7e1ade3ba with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1oO3L3-0000E4-0J;
        Tue, 16 Aug 2022 20:39:01 +0000
Date:   Wed, 17 Aug 2022 04:38:46 +0800
From:   kernel test robot <lkp@intel.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     linux-renesas-soc@vger.kernel.org
Subject: [geert-renesas-devel:renesas-drivers-for-v6.1] BUILD SUCCESS
 ebd0e06f3063cc2e3a689112904b29720579c6d2
Message-ID: <62fc0056.iXcG38mLHXJEfe4N%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git renesas-drivers-for-v6.1
branch HEAD: ebd0e06f3063cc2e3a689112904b29720579c6d2  soc: renesas: Identify RZ/Five SoC

elapsed time: 701m

configs tested: 105
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
um                             i386_defconfig
um                           x86_64_defconfig
powerpc                          allmodconfig
mips                             allyesconfig
powerpc                           allnoconfig
sh                               allmodconfig
arc                  randconfig-r043-20220815
m68k                             allmodconfig
arc                              allyesconfig
alpha                            allyesconfig
arm64                            allyesconfig
arm                                 defconfig
arm                              allyesconfig
i386                                defconfig
csky                              allnoconfig
alpha                             allnoconfig
arc                               allnoconfig
riscv                             allnoconfig
i386                             allyesconfig
x86_64               randconfig-a006-20220815
x86_64               randconfig-a003-20220815
x86_64               randconfig-a005-20220815
x86_64               randconfig-a004-20220815
x86_64               randconfig-a001-20220815
x86_64               randconfig-a002-20220815
i386                 randconfig-a001-20220815
i386                 randconfig-a005-20220815
i386                 randconfig-a004-20220815
i386                 randconfig-a006-20220815
i386                 randconfig-a003-20220815
i386                 randconfig-a002-20220815
xtensa                  nommu_kc705_defconfig
riscv                    nommu_k210_defconfig
m68k                             allyesconfig
x86_64                              defconfig
x86_64                           allyesconfig
x86_64                               rhel-8.3
x86_64                           rhel-8.3-kvm
x86_64                          rhel-8.3-func
x86_64                           rhel-8.3-syz
x86_64                    rhel-8.3-kselftests
x86_64                         rhel-8.3-kunit
s390                       zfcpdump_defconfig
powerpc                 mpc8540_ads_defconfig
i386                 randconfig-c001-20220815
powerpc              randconfig-c003-20220815
powerpc                     redwood_defconfig
powerpc                     sequoia_defconfig
ia64                      gensparse_defconfig
arm                           corgi_defconfig
sh                        sh7785lcr_defconfig
mips                         bigsur_defconfig
powerpc                      chrp32_defconfig
arm                           h3600_defconfig
arm                      integrator_defconfig
sh                            shmin_defconfig
xtensa                              defconfig
arm                         at91_dt_defconfig
m68k                        m5307c3_defconfig
loongarch                           defconfig
loongarch                         allnoconfig
powerpc                     stx_gp3_defconfig
m68k                       m5208evb_defconfig
m68k                         amcore_defconfig
arc                           tb10x_defconfig
arm                          simpad_defconfig
sh                          r7780mp_defconfig
arm                             ezx_defconfig
openrisc                 simple_smp_defconfig
openrisc                  or1klitex_defconfig
i386                          debian-10.3-kvm
i386                        debian-10.3-kunit
i386                         debian-10.3-func
riscv                    nommu_virt_defconfig
riscv                          rv32_defconfig
i386                   debian-10.3-kselftests
i386                              debian-10.3
arc                        nsimosci_defconfig
m68k                          atari_defconfig
sh                        dreamcast_defconfig
sh                            migor_defconfig

clang tested configs:
hexagon              randconfig-r045-20220815
hexagon              randconfig-r041-20220815
s390                 randconfig-r044-20220815
riscv                randconfig-r042-20220815
arm                       versatile_defconfig
i386                 randconfig-a011-20220815
i386                 randconfig-a012-20220815
i386                 randconfig-a014-20220815
i386                 randconfig-a016-20220815
i386                 randconfig-a015-20220815
i386                 randconfig-a013-20220815
x86_64               randconfig-a011-20220815
x86_64               randconfig-a016-20220815
x86_64               randconfig-a013-20220815
x86_64               randconfig-a015-20220815
x86_64               randconfig-a014-20220815
x86_64               randconfig-a012-20220815
arm                       mainstone_defconfig
arm                       aspeed_g4_defconfig
powerpc                 mpc832x_rdb_defconfig
x86_64               randconfig-k001-20220815
arm                        multi_v5_defconfig
powerpc                      ppc64e_defconfig
powerpc                 mpc832x_mds_defconfig

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
