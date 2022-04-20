Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 08112507F8E
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 20 Apr 2022 05:18:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1359248AbiDTDUx (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 19 Apr 2022 23:20:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49482 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238897AbiDTDUu (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 19 Apr 2022 23:20:50 -0400
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DABF213DD8
        for <linux-renesas-soc@vger.kernel.org>; Tue, 19 Apr 2022 20:18:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1650424685; x=1681960685;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=Tq0HXAV+7P7+dqPdc0MMam/kq3FSMCYFhZ8oJJIrX30=;
  b=KtPb9E3lhquyahCuhr8jUX8F4BHLLrA7FU3P1lDq9xXKeOZ45kxkETnE
   2lcOB7ISsoGWNzAfgaq1grP/TMEGYU5FhtJXKd0AvQHd6TxU5ACFKWtOt
   kwYcraqhHP+54QXOE7V+a+Cu/3a6Plbx3RThHZg7YErcejIMXBN8PEgjT
   lX6uqVLfSkSZbURNgh1RXH18Bic5DkvFcJMZWU1zW2jGaMdj2P0vxL+oG
   LOoq/AiBlKlXiBgu5eSnBz6C0C6IiIBJ0JVL62HdPeadTFhA71E5JTAMZ
   FAATLP3mAQKl7x0GD2ji1DrrRqngQF/u2BBAypa55hgp6Hsn9fIjmWzCQ
   Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10322"; a="261528098"
X-IronPort-AV: E=Sophos;i="5.90,274,1643702400"; 
   d="scan'208";a="261528098"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Apr 2022 20:18:01 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,274,1643702400"; 
   d="scan'208";a="576383164"
Received: from lkp-server01.sh.intel.com (HELO 3abc53900bec) ([10.239.97.150])
  by orsmga008.jf.intel.com with ESMTP; 19 Apr 2022 20:17:59 -0700
Received: from kbuild by 3abc53900bec with local (Exim 4.95)
        (envelope-from <lkp@intel.com>)
        id 1nh0qt-0006Vc-57;
        Wed, 20 Apr 2022 03:17:59 +0000
Date:   Wed, 20 Apr 2022 11:17:16 +0800
From:   kernel test robot <lkp@intel.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     linux-renesas-soc@vger.kernel.org
Subject: [geert-renesas-drivers:topic/renesas-overlays] BUILD SUCCESS
 81495afcf333a6ed09a9707e02cc357f5bf347a1
Message-ID: <625f7b3c.RX/oYM/HIe+P/6Z3%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-6.7 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,HEXHASH_WORD,
        RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git topic/renesas-overlays
branch HEAD: 81495afcf333a6ed09a9707e02cc357f5bf347a1  ARM: dts: koelsch: Add overlay for keyboard-controlled LED

elapsed time: 721m

configs tested: 103
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm64                               defconfig
arm64                            allyesconfig
arm                              allmodconfig
arm                                 defconfig
arm                              allyesconfig
i386                          randconfig-c001
ia64                         bigsur_defconfig
arm                             rpc_defconfig
powerpc                       eiger_defconfig
nios2                         10m50_defconfig
arm                          pxa910_defconfig
sh                           se7724_defconfig
ia64                        generic_defconfig
mips                       capcella_defconfig
mips                           jazz_defconfig
arc                           tb10x_defconfig
arm                          gemini_defconfig
mips                         cobalt_defconfig
um                           x86_64_defconfig
sh                            titan_defconfig
csky                                defconfig
sh                             shx3_defconfig
sh                        sh7757lcr_defconfig
x86_64                        randconfig-c001
arm                  randconfig-c002-20220419
ia64                             allmodconfig
ia64                             allyesconfig
ia64                                defconfig
m68k                             allyesconfig
m68k                             allmodconfig
m68k                                defconfig
nios2                            allyesconfig
alpha                               defconfig
alpha                            allyesconfig
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
nios2                               defconfig
arc                              allyesconfig
mips                             allyesconfig
mips                             allmodconfig
powerpc                          allyesconfig
powerpc                           allnoconfig
powerpc                          allmodconfig
x86_64                        randconfig-a011
x86_64                        randconfig-a013
x86_64                        randconfig-a015
i386                          randconfig-a012
i386                          randconfig-a014
i386                          randconfig-a016
x86_64                        randconfig-a006
x86_64                        randconfig-a004
x86_64                        randconfig-a002
riscv                randconfig-r042-20220419
arc                  randconfig-r043-20220419
s390                 randconfig-r044-20220419
riscv                               defconfig
riscv                    nommu_virt_defconfig
riscv                          rv32_defconfig
riscv                    nommu_k210_defconfig
riscv                             allnoconfig
riscv                            allmodconfig
riscv                            allyesconfig
x86_64                    rhel-8.3-kselftests
um                             i386_defconfig
x86_64                         rhel-8.3-kunit
x86_64                          rhel-8.3-func
x86_64                                  kexec
x86_64                              defconfig
x86_64                           allyesconfig
x86_64                               rhel-8.3

clang tested configs:
x86_64                        randconfig-c007
powerpc              randconfig-c003-20220419
arm                  randconfig-c002-20220419
i386                          randconfig-c001
riscv                randconfig-c006-20220419
mips                 randconfig-c004-20220419
s390                 randconfig-c005-20220419
mips                       lemote2f_defconfig
powerpc                     tqm5200_defconfig
powerpc                     kilauea_defconfig
arm                           spitz_defconfig
powerpc                      ppc64e_defconfig
i386                          randconfig-a002
i386                          randconfig-a006
i386                          randconfig-a004
x86_64                        randconfig-a012
x86_64                        randconfig-a014
x86_64                        randconfig-a016
x86_64                        randconfig-a005
x86_64                        randconfig-a003
x86_64                        randconfig-a001

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
