Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D31B1513841
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 28 Apr 2022 17:25:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235021AbiD1P2K (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 28 Apr 2022 11:28:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38036 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1349114AbiD1P2J (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 28 Apr 2022 11:28:09 -0400
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A71C0B717D
        for <linux-renesas-soc@vger.kernel.org>; Thu, 28 Apr 2022 08:24:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1651159494; x=1682695494;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=QRygSSBWFiJNw853CgNaQ7I02wutsuLWZBVtkwXfsY0=;
  b=CBPzMiqtftX359xI4lVB208bgkrpES5uXibOD1kSmasRQFACPV3M/F6o
   gEZsaTt2tjnCDaA2q/nIPkGBQ8Q00Qe0kYH8oc20i96q+175bhX1jtJmH
   TShXTYzb2937N8OweEAUklFwYBhIw66GMx3l4CCWJ29hsaD5haZQ6kFi/
   +MxTQf6QPCI10tud1btdD1blH+pVFDgX1FNeJrYmYx0BKvifbyAMFrDFA
   XQqV8V0VXFoQqwu9m5DixfiWWKoAYiejmbekP64wlWNru4WTEUsniC+QS
   GSyaBvoCvELiZWMhqEBzFvO0WtuhB54b401BDSDu/Tvq7r7LQz+WKjztJ
   A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10330"; a="329267415"
X-IronPort-AV: E=Sophos;i="5.91,295,1647327600"; 
   d="scan'208";a="329267415"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Apr 2022 08:24:54 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,295,1647327600"; 
   d="scan'208";a="731522692"
Received: from lkp-server01.sh.intel.com (HELO 5056e131ad90) ([10.239.97.150])
  by orsmga005.jf.intel.com with ESMTP; 28 Apr 2022 08:24:52 -0700
Received: from kbuild by 5056e131ad90 with local (Exim 4.95)
        (envelope-from <lkp@intel.com>)
        id 1nk60i-0005Tf-0E;
        Thu, 28 Apr 2022 15:24:52 +0000
Date:   Thu, 28 Apr 2022 23:24:06 +0800
From:   kernel test robot <lkp@intel.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     linux-renesas-soc@vger.kernel.org
Subject: [geert-renesas-drivers:topic/pinctrl-reserved-field-optimizations-v1] BUILD SUCCESS 88fe32fe1635e0af389564aeee7fc29aa4d8f1fd
Message-ID: <626ab196.LRqHKqt6QMolHXCb%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.0 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,HEXHASH_WORD,
        RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_NONE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git topic/pinctrl-reserved-field-optimizations-v1
branch HEAD: 88fe32fe1635e0af389564aeee7fc29aa4d8f1fd  pinctrl: renesas: checker: Add reserved field checks

elapsed time: 4572m

configs tested: 259
configs skipped: 4

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm64                               defconfig
arm64                            allyesconfig
arm                              allmodconfig
arm                                 defconfig
arm                              allyesconfig
mips                 randconfig-c004-20220425
i386                 randconfig-c001-20220425
i386                          randconfig-c001
ia64                          tiger_defconfig
sh                            shmin_defconfig
mips                           ip32_defconfig
nios2                               defconfig
mips                     decstation_defconfig
m68k                            q40_defconfig
arm                           corgi_defconfig
sh                           se7724_defconfig
parisc                generic-32bit_defconfig
powerpc                    sam440ep_defconfig
powerpc                      pasemi_defconfig
sh                           se7619_defconfig
sh                  sh7785lcr_32bit_defconfig
powerpc                       ppc64_defconfig
sh                        sh7785lcr_defconfig
powerpc                    amigaone_defconfig
um                               alldefconfig
powerpc                      makalu_defconfig
sh                               j2_defconfig
arm                        cerfcube_defconfig
sh                           se7751_defconfig
arm                         assabet_defconfig
arm                      integrator_defconfig
arc                              alldefconfig
arm                           sunxi_defconfig
s390                             allmodconfig
sh                          rsk7264_defconfig
arm                            zeus_defconfig
mips                  maltasmvp_eva_defconfig
mips                      maltasmvp_defconfig
sh                        sh7763rdp_defconfig
openrisc                  or1klitex_defconfig
mips                       bmips_be_defconfig
arm                         lpc18xx_defconfig
arm                          pxa910_defconfig
powerpc                     ep8248e_defconfig
s390                                defconfig
mips                         tb0226_defconfig
sh                        edosk7760_defconfig
powerpc                 mpc834x_mds_defconfig
sh                           se7206_defconfig
powerpc                    adder875_defconfig
powerpc                     taishan_defconfig
sparc                       sparc64_defconfig
sparc                               defconfig
arm                            hisi_defconfig
alpha                            alldefconfig
i386                             alldefconfig
arm                        clps711x_defconfig
arm                             pxa_defconfig
arm                        keystone_defconfig
arm                         vf610m4_defconfig
arm                           viper_defconfig
sh                          sdk7786_defconfig
sh                              ul2_defconfig
powerpc                     mpc83xx_defconfig
sh                      rts7751r2d1_defconfig
m68k                       m5249evb_defconfig
arm                          iop32x_defconfig
xtensa                              defconfig
arm                        mini2440_defconfig
sh                ecovec24-romimage_defconfig
arm                      jornada720_defconfig
sh                         ap325rxa_defconfig
m68k                        m5272c3_defconfig
sh                             shx3_defconfig
sh                           se7780_defconfig
arc                     nsimosci_hs_defconfig
sh                          kfr2r09_defconfig
m68k                       bvme6000_defconfig
parisc64                            defconfig
mips                      loongson3_defconfig
arm                          simpad_defconfig
m68k                          sun3x_defconfig
nios2                            allyesconfig
m68k                                defconfig
arc                 nsimosci_hs_smp_defconfig
arm                            pleb_defconfig
arc                        nsim_700_defconfig
ia64                             alldefconfig
sh                           sh2007_defconfig
powerpc                     asp8347_defconfig
m68k                        mvme147_defconfig
h8300                       h8s-sim_defconfig
xtensa                          iss_defconfig
sparc64                             defconfig
powerpc                  storcenter_defconfig
arc                      axs103_smp_defconfig
sh                          r7780mp_defconfig
m68k                             alldefconfig
arm                           h3600_defconfig
arm                         nhk8815_defconfig
arc                     haps_hs_smp_defconfig
arm                       omap2plus_defconfig
arm                           tegra_defconfig
sh                            hp6xx_defconfig
openrisc                 simple_smp_defconfig
h8300                            alldefconfig
arm                        mvebu_v7_defconfig
sh                          sdk7780_defconfig
arm                      footbridge_defconfig
mips                       capcella_defconfig
powerpc                 mpc85xx_cds_defconfig
arm                         lubbock_defconfig
xtensa                  nommu_kc705_defconfig
arc                                 defconfig
powerpc                      arches_defconfig
mips                          rb532_defconfig
powerpc                      mgcoge_defconfig
x86_64                           alldefconfig
powerpc                      ppc40x_defconfig
arm                        spear6xx_defconfig
m68k                          amiga_defconfig
mips                      fuloong2e_defconfig
x86_64               randconfig-c001-20220425
arm                  randconfig-c002-20220425
x86_64                        randconfig-c001
arm                  randconfig-c002-20220428
arm                  randconfig-c002-20220427
arm                  randconfig-c002-20220426
ia64                                defconfig
ia64                             allyesconfig
ia64                             allmodconfig
m68k                             allyesconfig
m68k                             allmodconfig
arc                              allyesconfig
csky                                defconfig
alpha                               defconfig
alpha                            allyesconfig
h8300                            allyesconfig
xtensa                           allyesconfig
sh                               allmodconfig
parisc                              defconfig
parisc                           allyesconfig
s390                             allyesconfig
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
x86_64                        randconfig-a006
x86_64                        randconfig-a004
x86_64                        randconfig-a002
x86_64               randconfig-a015-20220425
x86_64               randconfig-a014-20220425
x86_64               randconfig-a011-20220425
x86_64               randconfig-a013-20220425
x86_64               randconfig-a012-20220425
x86_64               randconfig-a016-20220425
x86_64                        randconfig-a011
x86_64                        randconfig-a013
x86_64                        randconfig-a015
i386                 randconfig-a014-20220425
i386                 randconfig-a012-20220425
i386                 randconfig-a011-20220425
i386                 randconfig-a015-20220425
i386                 randconfig-a013-20220425
i386                 randconfig-a016-20220425
i386                          randconfig-a012
i386                          randconfig-a016
i386                          randconfig-a014
arc                  randconfig-r043-20220425
s390                 randconfig-r044-20220425
riscv                randconfig-r042-20220425
riscv                               defconfig
riscv                    nommu_virt_defconfig
riscv                          rv32_defconfig
riscv                    nommu_k210_defconfig
riscv                             allnoconfig
riscv                            allmodconfig
riscv                            allyesconfig
x86_64                    rhel-8.3-kselftests
um                           x86_64_defconfig
um                             i386_defconfig
x86_64                          rhel-8.3-func
x86_64                                  kexec
x86_64                              defconfig
x86_64                           allyesconfig
x86_64                         rhel-8.3-kunit
x86_64                               rhel-8.3

clang tested configs:
riscv                randconfig-c006-20220425
mips                 randconfig-c004-20220425
x86_64               randconfig-c007-20220425
arm                  randconfig-c002-20220425
i386                 randconfig-c001-20220425
powerpc              randconfig-c003-20220425
riscv                randconfig-c006-20220427
mips                 randconfig-c004-20220427
x86_64                        randconfig-c007
i386                          randconfig-c001
arm                  randconfig-c002-20220427
powerpc              randconfig-c003-20220427
riscv                randconfig-c006-20220428
mips                 randconfig-c004-20220428
arm                  randconfig-c002-20220428
powerpc              randconfig-c003-20220428
mips                          ath79_defconfig
mips                     loongson2k_defconfig
arm                          pxa168_defconfig
powerpc                    socrates_defconfig
arm                            dove_defconfig
arm                       aspeed_g4_defconfig
arm                     davinci_all_defconfig
arm                         orion5x_defconfig
powerpc                 mpc836x_mds_defconfig
powerpc                 mpc832x_rdb_defconfig
mips                malta_qemu_32r6_defconfig
mips                          rm200_defconfig
mips                           ip22_defconfig
powerpc                     tqm5200_defconfig
powerpc                  mpc885_ads_defconfig
powerpc                       ebony_defconfig
arm                       imx_v4_v5_defconfig
powerpc                          allyesconfig
powerpc                      katmai_defconfig
powerpc                     pseries_defconfig
mips                       lemote2f_defconfig
powerpc                     kmeter1_defconfig
x86_64                           allyesconfig
mips                           mtx1_defconfig
powerpc                        fsp2_defconfig
arm                      pxa255-idp_defconfig
mips                      malta_kvm_defconfig
mips                           ip27_defconfig
arm                        vexpress_defconfig
mips                       rbtx49xx_defconfig
powerpc                          allmodconfig
powerpc                 mpc8560_ads_defconfig
mips                         tb0287_defconfig
mips                        workpad_defconfig
arm                       versatile_defconfig
x86_64               randconfig-a002-20220425
x86_64               randconfig-a004-20220425
x86_64               randconfig-a003-20220425
x86_64               randconfig-a001-20220425
x86_64               randconfig-a005-20220425
x86_64               randconfig-a006-20220425
x86_64                        randconfig-a005
x86_64                        randconfig-a003
x86_64                        randconfig-a001
i386                          randconfig-a002
i386                          randconfig-a006
i386                          randconfig-a004
i386                 randconfig-a006-20220425
i386                 randconfig-a002-20220425
i386                 randconfig-a005-20220425
i386                 randconfig-a003-20220425
i386                 randconfig-a001-20220425
i386                 randconfig-a004-20220425
x86_64                        randconfig-a012
x86_64                        randconfig-a014
x86_64                        randconfig-a016
hexagon              randconfig-r041-20220428
riscv                randconfig-r042-20220428
hexagon              randconfig-r045-20220428

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
