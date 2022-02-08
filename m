Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0EE0A4ACF30
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  8 Feb 2022 03:51:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1346150AbiBHCvJ (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 7 Feb 2022 21:51:09 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38956 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1346152AbiBHCvI (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 7 Feb 2022 21:51:08 -0500
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2B277C06109E
        for <linux-renesas-soc@vger.kernel.org>; Mon,  7 Feb 2022 18:51:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1644288668; x=1675824668;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=OJR8HX70ruhi0nf0CSUKDZ67udTuopaw/ii998UnfW8=;
  b=fJobQQenDeHmBt/D1dQ+dDGosjux0iELD5P1p7e+9gaLQggFGaanX638
   4CFzI90A40Azxa8sPhHFW5TbZhsEnv2k9oQ03mmmo57Q9ICcKmJ8DYLOx
   FCRa+294hE+sK+Qv24I+1f8KdYOsik3rd4IpJp8/wVYY1bifGaGHzNHzC
   OqpDMmO15Ehy0dsTZ898LV2WVfhi4r/VMIczmsxjRdZT/0EHh66K6Brsb
   85etk/usMWmslY6VlFYrxwOhlguqNWoSUQD35XA06qCKpSJ8st0GDrbnj
   0R5fJY724AEX53nDGzBM2Ma6dYi//U+JKJmM5elDO5yFi4omyuW0zJurT
   w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10251"; a="228827955"
X-IronPort-AV: E=Sophos;i="5.88,351,1635231600"; 
   d="scan'208";a="228827955"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Feb 2022 18:51:07 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,351,1635231600"; 
   d="scan'208";a="632690582"
Received: from lkp-server01.sh.intel.com (HELO 9dd77a123018) ([10.239.97.150])
  by orsmga004.jf.intel.com with ESMTP; 07 Feb 2022 18:51:06 -0800
Received: from kbuild by 9dd77a123018 with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1nHGav-0001Fl-U7; Tue, 08 Feb 2022 02:51:05 +0000
Date:   Tue, 08 Feb 2022 10:50:57 +0800
From:   kernel test robot <lkp@intel.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     linux-renesas-soc@vger.kernel.org
Subject: [geert-renesas-devel:master] BUILD SUCCESS
 1473d361292c53a189d07c296105887e45695417
Message-ID: <6201da91.4IfoJPsh1mK+4PPg%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_PASS,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git master
branch HEAD: 1473d361292c53a189d07c296105887e45695417  Merge tag 'v5.17-rc3' into renesas-devel

elapsed time: 831m

configs tested: 180
configs skipped: 4

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                                 defconfig
arm64                            allyesconfig
arm64                               defconfig
arm                              allyesconfig
arm                              allmodconfig
i386                 randconfig-c001-20220207
m68k                        m5272c3_defconfig
powerpc64                        alldefconfig
mips                 decstation_r4k_defconfig
powerpc                    sam440ep_defconfig
powerpc                     redwood_defconfig
arm                             pxa_defconfig
arm                          iop32x_defconfig
arm                          exynos_defconfig
sparc                       sparc32_defconfig
s390                          debug_defconfig
sh                          kfr2r09_defconfig
powerpc                      arches_defconfig
um                               alldefconfig
mips                      loongson3_defconfig
arc                        nsimosci_defconfig
mips                         rt305x_defconfig
arc                     haps_hs_smp_defconfig
arm                        trizeps4_defconfig
sh                     magicpanelr2_defconfig
sh                               alldefconfig
sh                           se7751_defconfig
mips                            ar7_defconfig
powerpc                mpc7448_hpc2_defconfig
powerpc                        cell_defconfig
sh                         ecovec24_defconfig
nios2                            alldefconfig
arm                           stm32_defconfig
powerpc                    amigaone_defconfig
sh                           se7343_defconfig
xtensa                    xip_kc705_defconfig
powerpc                  storcenter_defconfig
mips                         tb0226_defconfig
ia64                         bigsur_defconfig
arm                        multi_v7_defconfig
nios2                         10m50_defconfig
openrisc                    or1ksim_defconfig
nds32                            alldefconfig
sparc64                             defconfig
arm                        cerfcube_defconfig
sh                            migor_defconfig
m68k                         apollo_defconfig
arm                          lpd270_defconfig
sh                           se7724_defconfig
powerpc                     taishan_defconfig
mips                      maltasmvp_defconfig
powerpc                 linkstation_defconfig
csky                             alldefconfig
arm                         assabet_defconfig
h8300                       h8s-sim_defconfig
sh                   sh7724_generic_defconfig
m68k                        m5307c3_defconfig
m68k                       m5275evb_defconfig
sh                          rsk7201_defconfig
arm                         axm55xx_defconfig
powerpc                     rainier_defconfig
sh                           se7619_defconfig
arm                      integrator_defconfig
m68k                       m5475evb_defconfig
m68k                        m5407c3_defconfig
arm                            zeus_defconfig
mips                      fuloong2e_defconfig
powerpc                      ppc6xx_defconfig
i386                                defconfig
arm                             ezx_defconfig
powerpc                       maple_defconfig
powerpc                      ep88xc_defconfig
sh                          urquell_defconfig
m68k                        stmark2_defconfig
arm                            lart_defconfig
mips                           xway_defconfig
powerpc                     tqm8548_defconfig
mips                            gpr_defconfig
powerpc                      pcm030_defconfig
arm                           corgi_defconfig
arc                         haps_hs_defconfig
mips                        bcm47xx_defconfig
arm                  randconfig-c002-20220207
ia64                             allmodconfig
ia64                                defconfig
ia64                             allyesconfig
m68k                             allmodconfig
m68k                                defconfig
m68k                             allyesconfig
nds32                             allnoconfig
nios2                               defconfig
arc                              allyesconfig
nds32                               defconfig
nios2                            allyesconfig
csky                                defconfig
alpha                               defconfig
alpha                            allyesconfig
xtensa                           allyesconfig
h8300                            allyesconfig
arc                                 defconfig
sh                               allmodconfig
parisc                              defconfig
s390                             allyesconfig
s390                             allmodconfig
parisc                           allyesconfig
s390                                defconfig
i386                             allyesconfig
sparc                               defconfig
i386                   debian-10.3-kselftests
i386                              debian-10.3
sparc                            allyesconfig
mips                             allyesconfig
mips                             allmodconfig
powerpc                          allyesconfig
powerpc                          allmodconfig
powerpc                           allnoconfig
x86_64               randconfig-a013-20220207
x86_64               randconfig-a016-20220207
x86_64               randconfig-a015-20220207
x86_64               randconfig-a012-20220207
x86_64               randconfig-a014-20220207
x86_64               randconfig-a011-20220207
i386                 randconfig-a012-20220207
i386                 randconfig-a013-20220207
i386                 randconfig-a015-20220207
i386                 randconfig-a014-20220207
i386                 randconfig-a016-20220207
i386                 randconfig-a011-20220207
arc                  randconfig-r043-20220207
s390                 randconfig-r044-20220207
riscv                randconfig-r042-20220207
riscv                    nommu_k210_defconfig
riscv                            allyesconfig
riscv                    nommu_virt_defconfig
riscv                             allnoconfig
riscv                               defconfig
riscv                            allmodconfig
riscv                          rv32_defconfig
um                           x86_64_defconfig
um                             i386_defconfig
x86_64                           allyesconfig
x86_64                    rhel-8.3-kselftests
x86_64                              defconfig
x86_64                               rhel-8.3
x86_64                          rhel-8.3-func
x86_64                                  kexec

clang tested configs:
powerpc              randconfig-c003-20220207
x86_64               randconfig-c007-20220207
mips                 randconfig-c004-20220207
arm                  randconfig-c002-20220207
s390                 randconfig-c005-20220207
riscv                randconfig-c006-20220207
i386                 randconfig-c001-20220207
mips                          rm200_defconfig
mips                        maltaup_defconfig
powerpc                     mpc512x_defconfig
arm                        spear3xx_defconfig
powerpc                     ppa8548_defconfig
mips                           ip22_defconfig
mips                           rs90_defconfig
powerpc                 mpc8272_ads_defconfig
mips                           mtx1_defconfig
arm                            dove_defconfig
mips                         tb0287_defconfig
riscv                          rv32_defconfig
arm                    vt8500_v6_v7_defconfig
powerpc                      ppc44x_defconfig
arm                         mv78xx0_defconfig
mips                      maltaaprp_defconfig
x86_64               randconfig-a006-20220207
x86_64               randconfig-a004-20220207
x86_64               randconfig-a005-20220207
x86_64               randconfig-a003-20220207
x86_64               randconfig-a002-20220207
x86_64               randconfig-a001-20220207
i386                 randconfig-a004-20220207
i386                 randconfig-a003-20220207
i386                 randconfig-a006-20220207
i386                 randconfig-a001-20220207
i386                 randconfig-a002-20220207
i386                 randconfig-a005-20220207
hexagon              randconfig-r045-20220207
hexagon              randconfig-r041-20220207

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
