Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4B1095A5579
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 29 Aug 2022 22:20:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229975AbiH2UUJ (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 29 Aug 2022 16:20:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38214 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229836AbiH2UUH (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 29 Aug 2022 16:20:07 -0400
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EEF89DF91
        for <linux-renesas-soc@vger.kernel.org>; Mon, 29 Aug 2022 13:20:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1661804406; x=1693340406;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=lNMkQtk+Qjzcweqst1KL/2o4MMQJcdwZnLzXlI9vS0g=;
  b=FM4t1Rmq2BHhJ9e50Hjq1+TmfYPOC1RwtZDvm5aAa7SQJr3NCdymPu6o
   5mGIsjHrl2W3g2U+JrPHvnpGCVEFENwCncCkaw0ADJDa6FA+laU+H8YX7
   OujnX54BVMCd9oZpVH/P4s5xHcLbYF+vH1FPEXEaDAfjwUdPmBVXfx1AI
   +4/HNfmW21Emwiq2R1XUxB5Jcu0TNGg64fDyNGwZfE8suyYvm/PDs69fn
   y6tqO3DC3J0Yi/M27d4rJ3d9++JqgAMYnrEBSxWwb/1KM4U/dJXb/4AL8
   jLfdojJepmA52Vi95msCLImgmiKebvoE5NVPdKa+bgauCdmAaqxdX6h0M
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10454"; a="295769631"
X-IronPort-AV: E=Sophos;i="5.93,273,1654585200"; 
   d="scan'208";a="295769631"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Aug 2022 13:19:46 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,273,1654585200"; 
   d="scan'208";a="856836465"
Received: from lkp-server02.sh.intel.com (HELO e45bc14ccf4d) ([10.239.97.151])
  by fmsmga006.fm.intel.com with ESMTP; 29 Aug 2022 13:19:44 -0700
Received: from kbuild by e45bc14ccf4d with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1oSlEW-0000DY-0t;
        Mon, 29 Aug 2022 20:19:44 +0000
Date:   Tue, 30 Aug 2022 04:19:22 +0800
From:   kernel test robot <lkp@intel.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     linux-renesas-soc@vger.kernel.org
Subject: [geert-renesas-devel:renesas-arm-dt-for-v6.1] BUILD SUCCESS
 13079557ec9775ce4208d3066c415a0ab7ca170e
Message-ID: <630d1f4a.o/EKGF11GMVDm2Ae%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git renesas-arm-dt-for-v6.1
branch HEAD: 13079557ec9775ce4208d3066c415a0ab7ca170e  arm64: dts: renesas: r8a774a1: Put I2C aliases to board files

elapsed time: 722m

configs tested: 109
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
loongarch                         allnoconfig
parisc                           allyesconfig
parisc                              defconfig
nios2                               defconfig
nios2                            allyesconfig
parisc64                            defconfig
um                             i386_defconfig
um                           x86_64_defconfig
arc                                 defconfig
s390                             allmodconfig
alpha                               defconfig
x86_64                    rhel-8.3-kselftests
x86_64                              defconfig
x86_64                          rhel-8.3-func
i386                                defconfig
x86_64                           rhel-8.3-syz
x86_64                         rhel-8.3-kunit
x86_64                           rhel-8.3-kvm
x86_64                               rhel-8.3
arc                  randconfig-r043-20220829
i386                 randconfig-a004-20220829
x86_64                           allyesconfig
x86_64               randconfig-a003-20220829
i386                 randconfig-a001-20220829
x86_64               randconfig-a002-20220829
i386                 randconfig-a003-20220829
x86_64               randconfig-a001-20220829
i386                 randconfig-a002-20220829
x86_64               randconfig-a004-20220829
x86_64               randconfig-a005-20220829
i386                 randconfig-a005-20220829
x86_64               randconfig-a006-20220829
i386                 randconfig-a006-20220829
i386                             allyesconfig
m68k                             allyesconfig
powerpc                           allnoconfig
mips                             allyesconfig
powerpc                          allmodconfig
sh                               allmodconfig
arm                                 defconfig
m68k                             allmodconfig
arc                              allyesconfig
alpha                            allyesconfig
csky                                defconfig
powerpc                     taishan_defconfig
arm                         axm55xx_defconfig
ia64                             allmodconfig
sparc                               defconfig
microblaze                      mmu_defconfig
arm                         lpc18xx_defconfig
powerpc                  storcenter_defconfig
csky                              allnoconfig
alpha                             allnoconfig
arc                               allnoconfig
riscv                             allnoconfig
arm64                            allyesconfig
arm                              allyesconfig
riscv                               defconfig
powerpc                       eiger_defconfig
arc                 nsimosci_hs_smp_defconfig
ia64                                defconfig
x86_64                                  kexec
i386                        debian-10.3-kunit
i386                         debian-10.3-func
i386                          debian-10.3-kvm
i386                 randconfig-c001-20220829
loongarch                           defconfig
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
x86_64               randconfig-a011-20220829
hexagon              randconfig-r041-20220829
x86_64               randconfig-a014-20220829
hexagon              randconfig-r045-20220829
x86_64               randconfig-a012-20220829
x86_64               randconfig-a013-20220829
s390                 randconfig-r044-20220829
riscv                randconfig-r042-20220829
x86_64               randconfig-a016-20220829
x86_64               randconfig-a015-20220829
i386                 randconfig-a011-20220829
i386                 randconfig-a014-20220829
i386                 randconfig-a013-20220829
i386                 randconfig-a012-20220829
i386                 randconfig-a015-20220829
i386                 randconfig-a016-20220829
arm                        mvebu_v5_defconfig
x86_64               randconfig-k001-20220829

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
