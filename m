Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 568664F218C
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  5 Apr 2022 06:09:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230005AbiDECxR (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 4 Apr 2022 22:53:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44582 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230353AbiDECvA (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 4 Apr 2022 22:51:00 -0400
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 68DC83B00B2
        for <linux-renesas-soc@vger.kernel.org>; Mon,  4 Apr 2022 18:57:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1649123866; x=1680659866;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=iBQqBhxCLp+75abwCbs8hvPS4yYBIT8coD0NibvKR2A=;
  b=CQAu4lwglHQ51C33kjrMZQbeElzXx1G87dm1Ma6ud9Vub6w2i5Od2mI/
   PCyb2d8Wpo3gnpo5gXyruSSKMOWVxidiWcGeGCgUQzAbn/yPSJU4kOuY9
   Ockw22TmX5LAo/u8cXXRmUbRYrgEtS8+eJgIJN2vHXNXiE/iZ0S26yD4I
   XwuNTS/asOllo7au191Eu/uiemAv3xScWPJn3N4dQGEeyH+MmA2k/oiqn
   MlrEkQ8pLrwlOH8pxxXCoLzayJAvwG2VyFn+F0beRsUySfUZHf+7DOJT9
   tsae+NIo/9cJTdOpUXPvVugiL5F4H6oyzAPRvDiz9HyD1qgDTBI36RG86
   A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10307"; a="260621788"
X-IronPort-AV: E=Sophos;i="5.90,235,1643702400"; 
   d="scan'208";a="260621788"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Apr 2022 16:58:40 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,235,1643702400"; 
   d="scan'208";a="641412471"
Received: from lkp-server02.sh.intel.com (HELO a44fdfb70b94) ([10.239.97.151])
  by FMSMGA003.fm.intel.com with ESMTP; 04 Apr 2022 16:58:39 -0700
Received: from kbuild by a44fdfb70b94 with local (Exim 4.95)
        (envelope-from <lkp@intel.com>)
        id 1nbWak-0002Sx-Gx;
        Mon, 04 Apr 2022 23:58:38 +0000
Date:   Tue, 05 Apr 2022 07:57:56 +0800
From:   kernel test robot <lkp@intel.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     linux-renesas-soc@vger.kernel.org
Subject: [geert-renesas-devel:renesas-drivers-for-v5.19] BUILD SUCCESS
 2f89bef90de4740be33b2cb4ba95e0107df0d25e
Message-ID: <624b8604.0iJBc5ZlZowGCsvt%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-1.8 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,HEXHASH_WORD,
        RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git renesas-drivers-for-v5.19
branch HEAD: 2f89bef90de4740be33b2cb4ba95e0107df0d25e  soc: renesas: Identify RZ/G2UL SoC

elapsed time: 741m

configs tested: 116
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm64                               defconfig
arm64                            allyesconfig
arm                              allmodconfig
arm                                 defconfig
arm                              allyesconfig
i386                 randconfig-c001-20220404
powerpc                      ppc40x_defconfig
sh                           se7722_defconfig
xtensa                  nommu_kc705_defconfig
openrisc                 simple_smp_defconfig
parisc64                         alldefconfig
arc                        nsimosci_defconfig
m68k                          sun3x_defconfig
sh                                  defconfig
xtensa                              defconfig
alpha                            alldefconfig
sh                            shmin_defconfig
sh                          rsk7264_defconfig
m68k                          hp300_defconfig
powerpc                      ep88xc_defconfig
sh                               j2_defconfig
arc                      axs103_smp_defconfig
ia64                      gensparse_defconfig
sh                            hp6xx_defconfig
sh                        sh7785lcr_defconfig
x86_64               randconfig-c001-20220404
arm                  randconfig-c002-20220404
ia64                             allmodconfig
ia64                             allyesconfig
ia64                                defconfig
m68k                             allyesconfig
m68k                             allmodconfig
m68k                                defconfig
csky                                defconfig
nios2                            allyesconfig
alpha                               defconfig
alpha                            allyesconfig
nios2                               defconfig
arc                              allyesconfig
h8300                            allyesconfig
xtensa                           allyesconfig
arc                                 defconfig
sh                               allmodconfig
s390                                defconfig
s390                             allmodconfig
parisc                              defconfig
parisc64                            defconfig
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
x86_64               randconfig-a015-20220404
x86_64               randconfig-a011-20220404
x86_64               randconfig-a014-20220404
x86_64               randconfig-a016-20220404
x86_64               randconfig-a012-20220404
x86_64               randconfig-a013-20220404
i386                 randconfig-a014-20220404
i386                 randconfig-a013-20220404
i386                 randconfig-a016-20220404
i386                 randconfig-a015-20220404
i386                 randconfig-a011-20220404
i386                 randconfig-a012-20220404
arc                  randconfig-r043-20220404
s390                 randconfig-r044-20220404
riscv                randconfig-r042-20220404
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
x86_64                         rhel-8.3-kunit
x86_64                                  kexec
x86_64                              defconfig
x86_64                           allyesconfig
x86_64                               rhel-8.3

clang tested configs:
i386                 randconfig-c001-20220404
x86_64               randconfig-c007-20220404
powerpc              randconfig-c003-20220404
riscv                randconfig-c006-20220404
mips                 randconfig-c004-20220404
arm                  randconfig-c002-20220404
mips                     loongson1c_defconfig
mips                      pic32mzda_defconfig
mips                  cavium_octeon_defconfig
arm                        multi_v5_defconfig
powerpc                        icon_defconfig
arm                             mxs_defconfig
powerpc                   microwatt_defconfig
x86_64               randconfig-a006-20220404
x86_64               randconfig-a002-20220404
x86_64               randconfig-a001-20220404
x86_64               randconfig-a005-20220404
x86_64               randconfig-a003-20220404
x86_64               randconfig-a004-20220404
i386                 randconfig-a006-20220404
i386                 randconfig-a002-20220404
i386                 randconfig-a001-20220404
i386                 randconfig-a004-20220404
i386                 randconfig-a003-20220404
i386                 randconfig-a005-20220404
hexagon              randconfig-r041-20220404
hexagon              randconfig-r045-20220404

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
