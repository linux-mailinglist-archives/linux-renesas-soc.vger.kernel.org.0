Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 69AE24D2459
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  8 Mar 2022 23:35:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1345856AbiCHWfl (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 8 Mar 2022 17:35:41 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49338 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241131AbiCHWfk (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 8 Mar 2022 17:35:40 -0500
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 927BE5A0B4
        for <linux-renesas-soc@vger.kernel.org>; Tue,  8 Mar 2022 14:34:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1646778883; x=1678314883;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=NdVlzvRRI6eGElCuQ6kSIKB4CjwU6k1o9QXkkaAK6IA=;
  b=PoimUAqx+gbGKPtgJ0p7u7qfp1d6XPwScewAHv8zjYLTLKOxUSVtF67I
   SMG3AuJDwvB2Ovo21LW/VZkexBKN1y0F9SQg1XEuosuz6joCei/TAh0nP
   ov5yNUUyNvE7WLR2zhHHE1kpJ86We2owTNNeeY1Uo75LeqQDHZb/YYOq7
   yzqOTWgS/0BEytsAnIqaTYzWRzxWSo3T/75quxpFITKFz8cWLJYz3YtH6
   AYGTx92/GB75EXaxuWZsBOPDKoAp/0eNgAZRFGMJibCopAS3rYHk9N8l3
   Pu9NzixQFkrxIuL19uaE5CFzyqCQOv4Yvdydm+Ec+BkN03i82WFjF/haq
   g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10280"; a="255021183"
X-IronPort-AV: E=Sophos;i="5.90,165,1643702400"; 
   d="scan'208";a="255021183"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Mar 2022 14:34:43 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,165,1643702400"; 
   d="scan'208";a="513288694"
Received: from lkp-server02.sh.intel.com (HELO 89b41b6ae01c) ([10.239.97.151])
  by orsmga006.jf.intel.com with ESMTP; 08 Mar 2022 14:34:41 -0800
Received: from kbuild by 89b41b6ae01c with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1nRiPg-000279-Fe; Tue, 08 Mar 2022 22:34:40 +0000
Date:   Wed, 09 Mar 2022 06:33:58 +0800
From:   kernel test robot <lkp@intel.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     linux-renesas-soc@vger.kernel.org
Subject: [geert-renesas-drivers:renesas-clk-for-v5.19] BUILD SUCCESS
 1d4cf0b02ee46ccdeae3aa0cfe044180bb0312bb
Message-ID: <6227d9d6.KdzXdv5Ii8I768Ca%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-6.6 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,HEXHASH_WORD,
        RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git renesas-clk-for-v5.19
branch HEAD: 1d4cf0b02ee46ccdeae3aa0cfe044180bb0312bb  dt-bindings: clock: renesas: Make example 'clocks' parsable

elapsed time: 721m

configs tested: 154
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                                 defconfig
arm64                            allyesconfig
arm64                               defconfig
arm                              allyesconfig
arm                              allmodconfig
i386                          randconfig-c001
powerpc                    klondike_defconfig
sh                   secureedge5410_defconfig
openrisc                 simple_smp_defconfig
m68k                          multi_defconfig
sh                          rsk7269_defconfig
mips                             allyesconfig
powerpc                       ppc64_defconfig
sh                              ul2_defconfig
powerpc                         ps3_defconfig
parisc                              defconfig
mips                     loongson1b_defconfig
m68k                        m5307c3_defconfig
powerpc64                           defconfig
xtensa                  cadence_csp_defconfig
powerpc                  storcenter_defconfig
arm                         vf610m4_defconfig
sh                        sh7757lcr_defconfig
nios2                         3c120_defconfig
sh                          r7785rp_defconfig
parisc                generic-64bit_defconfig
powerpc                     rainier_defconfig
sh                ecovec24-romimage_defconfig
alpha                               defconfig
mips                     decstation_defconfig
ia64                          tiger_defconfig
x86_64                              defconfig
sparc                       sparc32_defconfig
sh                           se7722_defconfig
m68k                             alldefconfig
arm                         s3c6400_defconfig
arm                         cm_x300_defconfig
sh                   sh7724_generic_defconfig
h8300                    h8300h-sim_defconfig
m68k                        stmark2_defconfig
sh                          rsk7201_defconfig
arm                            zeus_defconfig
sh                          landisk_defconfig
powerpc                   currituck_defconfig
powerpc                      ppc40x_defconfig
xtensa                           alldefconfig
microblaze                          defconfig
s390                          debug_defconfig
ia64                                defconfig
arm                        shmobile_defconfig
arm                            hisi_defconfig
m68k                        mvme147_defconfig
arm                          pxa3xx_defconfig
xtensa                    xip_kc705_defconfig
sh                           se7721_defconfig
powerpc                 mpc834x_itx_defconfig
um                           x86_64_defconfig
m68k                       m5249evb_defconfig
riscv                               defconfig
sh                           se7206_defconfig
xtensa                          iss_defconfig
powerpc                     sequoia_defconfig
arm                        mvebu_v7_defconfig
arm                             ezx_defconfig
parisc64                            defconfig
parisc                           allyesconfig
arm                  randconfig-c002-20220308
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
alpha                            allyesconfig
xtensa                           allyesconfig
h8300                            allyesconfig
arc                                 defconfig
sh                               allmodconfig
s390                             allyesconfig
s390                             allmodconfig
s390                                defconfig
i386                             allyesconfig
sparc                            allyesconfig
sparc                               defconfig
i386                                defconfig
i386                   debian-10.3-kselftests
i386                              debian-10.3
mips                             allmodconfig
powerpc                          allyesconfig
powerpc                          allmodconfig
powerpc                           allnoconfig
x86_64                        randconfig-a006
x86_64                        randconfig-a004
x86_64                        randconfig-a002
x86_64                        randconfig-a011
x86_64                        randconfig-a013
x86_64                        randconfig-a015
arc                  randconfig-r043-20220308
riscv                randconfig-r042-20220308
s390                 randconfig-r044-20220308
riscv                    nommu_k210_defconfig
riscv                            allyesconfig
riscv                    nommu_virt_defconfig
riscv                             allnoconfig
riscv                          rv32_defconfig
riscv                            allmodconfig
x86_64                    rhel-8.3-kselftests
um                             i386_defconfig
x86_64                           allyesconfig
x86_64                               rhel-8.3
x86_64                          rhel-8.3-func
x86_64                         rhel-8.3-kunit
x86_64                                  kexec

clang tested configs:
x86_64                        randconfig-c007
riscv                randconfig-c006-20220308
powerpc              randconfig-c003-20220308
i386                          randconfig-c001
arm                  randconfig-c002-20220308
mips                 randconfig-c004-20220308
mips                        workpad_defconfig
mips                       lemote2f_defconfig
powerpc                    ge_imp3a_defconfig
mips                         tb0219_defconfig
arm                           spitz_defconfig
x86_64                           allyesconfig
powerpc                 xes_mpc85xx_defconfig
arm                       cns3420vb_defconfig
arm                          imote2_defconfig
powerpc                 mpc8272_ads_defconfig
arm                       spear13xx_defconfig
arm                         hackkit_defconfig
mips                        omega2p_defconfig
arm                         orion5x_defconfig
arm                  colibri_pxa300_defconfig
mips                          ath25_defconfig
mips                            e55_defconfig
hexagon                             defconfig
powerpc                     skiroot_defconfig
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
hexagon              randconfig-r045-20220308
hexagon              randconfig-r041-20220308

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
