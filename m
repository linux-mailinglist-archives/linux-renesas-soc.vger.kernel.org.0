Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CDCB05A5576
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 29 Aug 2022 22:20:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229796AbiH2UTx (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 29 Aug 2022 16:19:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37268 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230020AbiH2UTu (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 29 Aug 2022 16:19:50 -0400
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9A9B3DF0
        for <linux-renesas-soc@vger.kernel.org>; Mon, 29 Aug 2022 13:19:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1661804386; x=1693340386;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=z3G4FgJz0d/VC+0eNx0FrnQfiqIxdlPgHGw1fym/XiI=;
  b=I5Qnlj7nEd8yAg2P7OmvCaXzy8hrmNgiVh8DDySI61j4ZVf+SuQdx2fC
   nzlYhIBJoYgBkTrWT6nFqu3gzXbxORmFmoBOi5eM/Dxr76tdoIFPL+neF
   fedUppbA2HsX1vFmH2wJjnxQdmJGRyUcaUp4JWP4if+pOnu8AxLUFEVEw
   XdO/0w6UyJPSwA8wIYCKO6gDk2bhHuXGzzJlvVmQkxHY8CGz4l3w90pvj
   ZYY/C0cp+3/UGKJhECP6dTKkNVvIb89eO8RMd4znQUZCfPSzHy7g1ohhs
   xXHAmughD86alCG7S4QyaKNqOcZE4S6o6KukLFj2h5O8s18p1SZ+7/ZPk
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10454"; a="321115078"
X-IronPort-AV: E=Sophos;i="5.93,273,1654585200"; 
   d="scan'208";a="321115078"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Aug 2022 13:19:46 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,273,1654585200"; 
   d="scan'208";a="562364473"
Received: from lkp-server02.sh.intel.com (HELO e45bc14ccf4d) ([10.239.97.151])
  by orsmga003.jf.intel.com with ESMTP; 29 Aug 2022 13:19:44 -0700
Received: from kbuild by e45bc14ccf4d with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1oSlEW-0000DJ-0Y;
        Mon, 29 Aug 2022 20:19:44 +0000
Date:   Tue, 30 Aug 2022 04:19:24 +0800
From:   kernel test robot <lkp@intel.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     linux-renesas-soc@vger.kernel.org
Subject: [geert-renesas-devel:fixes] BUILD SUCCESS
 ab2866f12ca18747413ba41409231d44e0c6149b
Message-ID: <630d1f4c.4JntdXLC3AHTqh6h%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git fixes
branch HEAD: ab2866f12ca18747413ba41409231d44e0c6149b  arm64: dts: renesas: r8a779g0: Fix HSCIF0 interrupt number

elapsed time: 725m

configs tested: 94
configs skipped: 118

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm64                            allyesconfig
um                           x86_64_defconfig
um                             i386_defconfig
powerpc                           allnoconfig
mips                             allyesconfig
powerpc                          allmodconfig
sh                               allmodconfig
i386                 randconfig-a002-20220829
i386                 randconfig-a005-20220829
i386                 randconfig-a001-20220829
i386                 randconfig-a006-20220829
i386                 randconfig-a003-20220829
i386                 randconfig-a004-20220829
powerpc                     taishan_defconfig
arm                         axm55xx_defconfig
nios2                               defconfig
x86_64               randconfig-a002-20220829
x86_64               randconfig-a005-20220829
x86_64               randconfig-a006-20220829
x86_64               randconfig-a003-20220829
x86_64               randconfig-a001-20220829
x86_64               randconfig-a004-20220829
x86_64                              defconfig
x86_64                           allyesconfig
x86_64                               rhel-8.3
microblaze                      mmu_defconfig
arm                         lpc18xx_defconfig
powerpc                  storcenter_defconfig
csky                              allnoconfig
alpha                             allnoconfig
arc                               allnoconfig
riscv                             allnoconfig
m68k                             allyesconfig
m68k                             allmodconfig
arc                              allyesconfig
alpha                            allyesconfig
i386                             allyesconfig
i386                                defconfig
arm                                 defconfig
arm                              allyesconfig
riscv                               defconfig
powerpc                       eiger_defconfig
arc                 nsimosci_hs_smp_defconfig
ia64                                defconfig
x86_64                           rhel-8.3-kvm
x86_64                          rhel-8.3-func
x86_64                           rhel-8.3-syz
x86_64                    rhel-8.3-kselftests
x86_64                         rhel-8.3-kunit
loongarch                           defconfig
loongarch                         allnoconfig
sh                           se7722_defconfig
xtensa                  nommu_kc705_defconfig
arm                             ezx_defconfig
arm                            mps2_defconfig
xtensa                           alldefconfig
sh                            migor_defconfig
sh                      rts7751r2d1_defconfig
m68k                        m5407c3_defconfig
sh                          r7780mp_defconfig
m68k                          multi_defconfig
sh                                  defconfig
arc                  randconfig-r043-20220829
sh                          r7785rp_defconfig
sh                             shx3_defconfig
mips                       bmips_be_defconfig
arm                           h5000_defconfig
arm                        keystone_defconfig
arm64                            alldefconfig
arc                          axs103_defconfig
sh                          lboxre2_defconfig
riscv                    nommu_virt_defconfig
riscv                          rv32_defconfig
riscv                    nommu_k210_defconfig
i386                   debian-10.3-kselftests
i386                              debian-10.3

clang tested configs:
x86_64               randconfig-a013-20220829
x86_64               randconfig-a014-20220829
x86_64               randconfig-a011-20220829
x86_64               randconfig-a016-20220829
x86_64               randconfig-a012-20220829
x86_64               randconfig-a015-20220829
hexagon              randconfig-r045-20220829
riscv                randconfig-r042-20220829
hexagon              randconfig-r041-20220829
s390                 randconfig-r044-20220829
arm                        mvebu_v5_defconfig
i386                 randconfig-a016-20220829
i386                 randconfig-a015-20220829
i386                 randconfig-a011-20220829
i386                 randconfig-a013-20220829
i386                 randconfig-a014-20220829
i386                 randconfig-a012-20220829
x86_64               randconfig-k001-20220829

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
