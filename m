Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E424E4D269E
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  9 Mar 2022 05:06:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232054AbiCIBXs (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 8 Mar 2022 20:23:48 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50906 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230489AbiCIBWk (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 8 Mar 2022 20:22:40 -0500
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C9A26C4E24
        for <linux-renesas-soc@vger.kernel.org>; Tue,  8 Mar 2022 17:19:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1646788776; x=1678324776;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=3okbsen8Eb7tnNEXkWbxrN9SysLrEJSN3Fh3Ag9fxBg=;
  b=lXwktomBxWM/dVfvB4FD4j7TwvnPnC7KrJaXXjuBv5yIbmKbOdJHoaX8
   1scy/Gv7WT9jpJ+FO6KCsOQR/lP1ozyJx5j3EBXdN06xOAt0+qSIsJDKf
   GpdapvUBaHTrNcumcOwEyaq3/+4YGtuRJsnD4nNl6uIePhbBcFWiKINpg
   Lcise32jG/prZuUbtgwvtRDSZG+U5m/zt7w3DxC/IgHbSr8pxLUXVJO4C
   rzeAqXNzfHJeApwl8sHp+LsXl5F1vkC4DTug3oPoV3vgBCay8H5+9hwnF
   XrwueJXWZkmEq7iVd2qdIgY8nKiMenm3m2gR4Ylgf7qvyAtqWlEmgoeGr
   Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10280"; a="255047822"
X-IronPort-AV: E=Sophos;i="5.90,165,1643702400"; 
   d="scan'208";a="255047822"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Mar 2022 17:16:47 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,165,1643702400"; 
   d="scan'208";a="711755460"
Received: from lkp-server02.sh.intel.com (HELO 89b41b6ae01c) ([10.239.97.151])
  by orsmga005.jf.intel.com with ESMTP; 08 Mar 2022 17:16:45 -0800
Received: from kbuild by 89b41b6ae01c with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1nRkwX-0002JP-8a; Wed, 09 Mar 2022 01:16:45 +0000
Date:   Wed, 09 Mar 2022 09:16:02 +0800
From:   kernel test robot <lkp@intel.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     linux-renesas-soc@vger.kernel.org
Subject: [geert-renesas-devel:master] BUILD SUCCESS
 ac86fa2bcb4ab9ea979876e0abedf4a00bc6544f
Message-ID: <6227ffd2.gN1nm8+eOu82qHFb%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-7.6 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git master
branch HEAD: ac86fa2bcb4ab9ea979876e0abedf4a00bc6544f  Merge branch 'renesas-arm-dt-for-v5.19' into renesas-devel

elapsed time: 882m

configs tested: 131
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                                 defconfig
arm                              allmodconfig
arm                              allyesconfig
arm64                               defconfig
arm64                            allyesconfig
i386                          randconfig-c001
powerpc                    klondike_defconfig
sh                   secureedge5410_defconfig
openrisc                 simple_smp_defconfig
m68k                          multi_defconfig
arc                 nsimosci_hs_smp_defconfig
arm                           h5000_defconfig
alpha                               defconfig
powerpc                     asp8347_defconfig
nios2                         3c120_defconfig
sh                          r7785rp_defconfig
parisc                generic-64bit_defconfig
powerpc                     rainier_defconfig
sh                           se7722_defconfig
m68k                             alldefconfig
arm                         s3c6400_defconfig
arc                           tb10x_defconfig
arm                             rpc_defconfig
parisc64                         alldefconfig
powerpc                   currituck_defconfig
sh                          landisk_defconfig
arm                            zeus_defconfig
powerpc                      ppc40x_defconfig
xtensa                           alldefconfig
microblaze                          defconfig
sh                           se7206_defconfig
xtensa                          iss_defconfig
arm                        mvebu_v7_defconfig
parisc64                            defconfig
powerpc                     sequoia_defconfig
arm                             ezx_defconfig
parisc                           allyesconfig
arm                  randconfig-c002-20220308
ia64                             allmodconfig
ia64                                defconfig
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
parisc                              defconfig
s390                             allmodconfig
s390                                defconfig
s390                             allyesconfig
i386                             allyesconfig
sparc                            allyesconfig
sparc                               defconfig
i386                                defconfig
i386                   debian-10.3-kselftests
i386                              debian-10.3
mips                             allyesconfig
mips                             allmodconfig
powerpc                           allnoconfig
powerpc                          allmodconfig
powerpc                          allyesconfig
x86_64                        randconfig-a006
x86_64                        randconfig-a004
x86_64                        randconfig-a002
i386                          randconfig-a003
i386                          randconfig-a001
i386                          randconfig-a005
x86_64                        randconfig-a013
x86_64                        randconfig-a011
x86_64                        randconfig-a015
i386                          randconfig-a014
i386                          randconfig-a012
i386                          randconfig-a016
arc                  randconfig-r043-20220308
riscv                randconfig-r042-20220308
s390                 randconfig-r044-20220308
riscv                    nommu_k210_defconfig
riscv                            allyesconfig
riscv                             allnoconfig
riscv                               defconfig
riscv                          rv32_defconfig
riscv                            allmodconfig
riscv                    nommu_virt_defconfig
um                           x86_64_defconfig
um                             i386_defconfig
x86_64                              defconfig
x86_64                           allyesconfig
x86_64                               rhel-8.3
x86_64                          rhel-8.3-func
x86_64                                  kexec
x86_64                         rhel-8.3-kunit
x86_64                    rhel-8.3-kselftests

clang tested configs:
x86_64                        randconfig-c007
powerpc              randconfig-c003-20220308
arm                  randconfig-c002-20220308
mips                 randconfig-c004-20220308
i386                          randconfig-c001
riscv                randconfig-c006-20220308
s390                 randconfig-c005-20220308
arm                       imx_v4_v5_defconfig
x86_64                           allyesconfig
powerpc                 xes_mpc85xx_defconfig
arm                       cns3420vb_defconfig
arm                          imote2_defconfig
arm                  colibri_pxa300_defconfig
powerpc                 mpc8272_ads_defconfig
mips                          ath25_defconfig
mips                            e55_defconfig
hexagon                             defconfig
powerpc                     skiroot_defconfig
mips                          malta_defconfig
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
x86_64                        randconfig-a001
x86_64                        randconfig-a003
x86_64                        randconfig-a005

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
