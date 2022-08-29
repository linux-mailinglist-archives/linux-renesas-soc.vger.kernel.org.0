Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0922F5A5574
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 29 Aug 2022 22:20:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229899AbiH2UTx (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 29 Aug 2022 16:19:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37276 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230023AbiH2UTu (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 29 Aug 2022 16:19:50 -0400
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 39B20C7D
        for <linux-renesas-soc@vger.kernel.org>; Mon, 29 Aug 2022 13:19:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1661804386; x=1693340386;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=D4yEfIrD3iE2Pb8Nvjcjl7iuz/soRB55wUBrOyTjE+I=;
  b=nnLeWWrPczZUAYiQUpIizR4KcOUSiWrTb3Zdv8Dqs7AqYPjj2RFiSa4p
   KEZpoCLx0ReyQzdFyzKxzXdxouKZU9JD3lNpa6Qj3qfm1bRquyeX0JG4u
   ylaF0FxjraTMW9ifJi5rdCIYwGcBNhBP+SChccmHKOOneBHVimAhbGBbD
   FI5yIeMxMqg1K0nYZ5L+6IE7frTzkC0QxitAc9ZpHRpYzQS6gM5Wwc4/g
   qPkxSpirvCBX2sTRxSBB+/UqDjggRxwDggPaGKqbDK0yQnvAztIkZvO55
   x9CN/RweQxIqBL8KtgNz940cbKKONyz21SAXnlJlk0YcX9C9wyKLkaxoO
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10454"; a="275392636"
X-IronPort-AV: E=Sophos;i="5.93,273,1654585200"; 
   d="scan'208";a="275392636"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Aug 2022 13:19:46 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,273,1654585200"; 
   d="scan'208";a="679755773"
Received: from lkp-server02.sh.intel.com (HELO e45bc14ccf4d) ([10.239.97.151])
  by fmsmga004.fm.intel.com with ESMTP; 29 Aug 2022 13:19:44 -0700
Received: from kbuild by e45bc14ccf4d with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1oSlEW-0000DS-0l;
        Mon, 29 Aug 2022 20:19:44 +0000
Date:   Tue, 30 Aug 2022 04:19:26 +0800
From:   kernel test robot <lkp@intel.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     linux-renesas-soc@vger.kernel.org
Subject: [geert-renesas-devel:next] BUILD SUCCESS
 43507165562bd8bcf2ce73ba7706033127363710
Message-ID: <630d1f4e.0j21vMnVc5Y3FgJg%lkp@intel.com>
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

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git next
branch HEAD: 43507165562bd8bcf2ce73ba7706033127363710  Merge branches 'renesas-arm-defconfig-for-v6.1' and 'renesas-arm-dt-for-v6.1' into renesas-next

elapsed time: 723m

configs tested: 97
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
i386                                defconfig
loongarch                         allnoconfig
um                             i386_defconfig
um                           x86_64_defconfig
loongarch                           defconfig
x86_64                              defconfig
arc                  randconfig-r043-20220829
arc                              allyesconfig
x86_64                               rhel-8.3
alpha                            allyesconfig
x86_64                           allyesconfig
x86_64                         rhel-8.3-kunit
m68k                             allyesconfig
riscv                               defconfig
arm                                 defconfig
m68k                             allmodconfig
i386                 randconfig-a001-20220829
x86_64                           rhel-8.3-kvm
ia64                             allmodconfig
x86_64                    rhel-8.3-kselftests
x86_64                           rhel-8.3-syz
i386                 randconfig-a003-20220829
x86_64                          rhel-8.3-func
x86_64               randconfig-a003-20220829
i386                 randconfig-a002-20220829
x86_64               randconfig-a002-20220829
i386                 randconfig-a004-20220829
x86_64               randconfig-a001-20220829
i386                 randconfig-a005-20220829
x86_64               randconfig-a004-20220829
i386                 randconfig-a006-20220829
x86_64               randconfig-a005-20220829
x86_64               randconfig-a006-20220829
arm                              allyesconfig
arm64                            allyesconfig
powerpc                           allnoconfig
mips                             allyesconfig
powerpc                          allmodconfig
sh                               allmodconfig
powerpc                     taishan_defconfig
arm                         axm55xx_defconfig
nios2                               defconfig
microblaze                      mmu_defconfig
arm                         lpc18xx_defconfig
powerpc                  storcenter_defconfig
csky                              allnoconfig
alpha                             allnoconfig
arc                               allnoconfig
riscv                             allnoconfig
i386                             allyesconfig
powerpc                       eiger_defconfig
arc                 nsimosci_hs_smp_defconfig
ia64                                defconfig
i386                 randconfig-c001-20220829
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
_64                                 defconfig

clang tested configs:
hexagon              randconfig-r041-20220829
hexagon              randconfig-r045-20220829
s390                 randconfig-r044-20220829
riscv                randconfig-r042-20220829
i386                 randconfig-a011-20220829
i386                 randconfig-a014-20220829
i386                 randconfig-a013-20220829
i386                 randconfig-a012-20220829
i386                 randconfig-a015-20220829
i386                 randconfig-a016-20220829
x86_64               randconfig-a013-20220829
x86_64               randconfig-a014-20220829
x86_64               randconfig-a011-20220829
x86_64               randconfig-a016-20220829
x86_64               randconfig-a012-20220829
x86_64               randconfig-a015-20220829
arm                        mvebu_v5_defconfig
x86_64               randconfig-k001-20220829

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
