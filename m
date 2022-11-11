Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BF08B6252D7
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 11 Nov 2022 05:50:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231985AbiKKEu6 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 10 Nov 2022 23:50:58 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48214 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229758AbiKKEu4 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 10 Nov 2022 23:50:56 -0500
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 570A811A22
        for <linux-renesas-soc@vger.kernel.org>; Thu, 10 Nov 2022 20:50:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1668142255; x=1699678255;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=6V2NzkUQKpb3fkwuHCFJBtu6l8+7JSzuFTtnR7CDob4=;
  b=CoqJrKvB9x0AOg443m57TGvj98l7GD6vDf6jEc366Ruiv5t7gkCo1BNE
   IPV49B1RuPdR/00uxrxJOZoRm9QDhWEe9ilZl/pQHp0Exw068XmltKN4R
   BF9PT4Bl5G5CsvVDGm8S49LQdarCNgVeRYOp8iYIXwn+zgdVNDXBXT4Jc
   kt68/wy7yZrXLDsbua0FuZhuQWw2O8b2wnmD7hn8sHuPK9DgObUKc8HUn
   0sbKkICuv9j/yd7BTChR2EmjpsomvMKmpPLcDlHMo4gppFs/bYGcojMwm
   ueaaSoscdMNJ/v3g+/9Jptmm/eR1m8eT2MYXmM+OHYHQEODgcp4RtRyCB
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10527"; a="291927812"
X-IronPort-AV: E=Sophos;i="5.96,155,1665471600"; 
   d="scan'208";a="291927812"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Nov 2022 20:50:55 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10527"; a="726663055"
X-IronPort-AV: E=Sophos;i="5.96,155,1665471600"; 
   d="scan'208";a="726663055"
Received: from lkp-server01.sh.intel.com (HELO e783503266e8) ([10.239.97.150])
  by FMSMGA003.fm.intel.com with ESMTP; 10 Nov 2022 20:50:54 -0800
Received: from kbuild by e783503266e8 with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1otM0D-0003ah-1M;
        Fri, 11 Nov 2022 04:50:53 +0000
Date:   Fri, 11 Nov 2022 12:50:36 +0800
From:   kernel test robot <lkp@intel.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     linux-renesas-soc@vger.kernel.org
Subject: [geert-renesas-devel:renesas-riscv-soc-for-v6.2] BUILD SUCCESS
 8292493c22c8e28b6e67a01e0f5c6db1cf231eb1
Message-ID: <636dd49c.TavY2gtgdH00XZT3%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git renesas-riscv-soc-for-v6.2
branch HEAD: 8292493c22c8e28b6e67a01e0f5c6db1cf231eb1  riscv: Kconfig.socs: Add ARCH_RENESAS kconfig option

elapsed time: 724m

configs tested: 80
configs skipped: 91

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
um                           x86_64_defconfig
um                             i386_defconfig
x86_64                            allnoconfig
x86_64                           rhel-8.3-kvm
x86_64                           rhel-8.3-syz
x86_64                         rhel-8.3-kunit
x86_64                        randconfig-a011
x86_64                        randconfig-a013
x86_64                        randconfig-a015
x86_64                          rhel-8.3-func
x86_64                    rhel-8.3-kselftests
ia64                             allmodconfig
powerpc                    amigaone_defconfig
s390                                defconfig
s390                             allmodconfig
arc                                 defconfig
s390                             allyesconfig
powerpc                       ppc64_defconfig
powerpc                           allnoconfig
mips                             allyesconfig
powerpc                          allmodconfig
alpha                               defconfig
x86_64                              defconfig
x86_64                           allyesconfig
x86_64                               rhel-8.3
sh                           se7722_defconfig
arm                         cm_x300_defconfig
i386                             allyesconfig
i386                                defconfig
i386                          randconfig-a012
i386                          randconfig-a014
i386                          randconfig-a016
x86_64                        randconfig-a006
x86_64                        randconfig-a004
x86_64                        randconfig-a002
m68k                             allyesconfig
m68k                             allmodconfig
arc                              allyesconfig
alpha                            allyesconfig
sh                               allmodconfig
arm64                            allyesconfig
arm                                 defconfig
arm                              allyesconfig
i386                          randconfig-c001
powerpc              randconfig-c003-20221110
ia64                        generic_defconfig
openrisc                         alldefconfig
arm                             rpc_defconfig
m68k                          multi_defconfig
arc                         haps_hs_defconfig
powerpc                     taishan_defconfig
powerpc                 mpc85xx_cds_defconfig
arm                         vf610m4_defconfig
arm                          pxa910_defconfig
s390                 randconfig-r044-20221111
arm                           viper_defconfig

clang tested configs:
x86_64                        randconfig-a003
x86_64                        randconfig-a001
x86_64                        randconfig-a012
x86_64                        randconfig-a014
x86_64                        randconfig-a016
hexagon              randconfig-r041-20221110
hexagon              randconfig-r045-20221110
i386                          randconfig-a002
i386                          randconfig-a006
i386                          randconfig-a004
x86_64                        randconfig-a005
s390                 randconfig-r044-20221110
riscv                randconfig-r042-20221110
x86_64                        randconfig-k001
hexagon              randconfig-r041-20221111
hexagon              randconfig-r045-20221111
arm                        vexpress_defconfig
powerpc                    mvme5100_defconfig
arm                       versatile_defconfig
arm                       aspeed_g4_defconfig
mips                      pic32mzda_defconfig
arm                         lpc32xx_defconfig
powerpc                      obs600_defconfig
mips                malta_qemu_32r6_defconfig

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
