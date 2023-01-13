Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C94E1668C0D
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 13 Jan 2023 07:00:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240232AbjAMGAd (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 13 Jan 2023 01:00:33 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50376 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240759AbjAMF67 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 13 Jan 2023 00:58:59 -0500
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9684969511
        for <linux-renesas-soc@vger.kernel.org>; Thu, 12 Jan 2023 21:54:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1673589253; x=1705125253;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=l/UuG87H8rBmfFlnlzhkU5rJxcgg0gjNiw1td80ZHFo=;
  b=bmhTsWMI6XkwaQnV1XVOH9Ak7+josNrWjkEYM8xUxSHizACAVdt70TKU
   TliYDWz2jae5jwV4vn4dBCkSYRr0Ev1wxjD2uEa9TFQJZj15MCOezlQBu
   oz4hFiawc10jNJAuOFowqzOL7fREMTgdMBo/vdlPEJAikrhUBXUMMsUbd
   AeFJDa+D2dvtmJ0mGHcLB9VBnouN1tf1pbU0ezV+jRTeWd179AoFukOcJ
   CR0gZ7/rTjT8+BpwtFXHAfjk47U/fpdgzLD4llpJcchtaLG6EbLmo1Y7E
   dWip3viqaeKGDIAODKFTBsJgyBPwxz4mdyl/KeStj8zb7dLi+KdpUJufw
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10588"; a="323980773"
X-IronPort-AV: E=Sophos;i="5.97,213,1669104000"; 
   d="scan'208";a="323980773"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jan 2023 21:54:13 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10588"; a="688630270"
X-IronPort-AV: E=Sophos;i="5.97,213,1669104000"; 
   d="scan'208";a="688630270"
Received: from lkp-server02.sh.intel.com (HELO f1920e93ebb5) ([10.239.97.151])
  by orsmga008.jf.intel.com with ESMTP; 12 Jan 2023 21:54:11 -0800
Received: from kbuild by f1920e93ebb5 with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1pGD0w-000AnC-0U;
        Fri, 13 Jan 2023 05:54:06 +0000
Date:   Fri, 13 Jan 2023 13:53:18 +0800
From:   kernel test robot <lkp@intel.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     linux-renesas-soc@vger.kernel.org
Subject: [geert-renesas-drivers:renesas-clk-for-v6.3] BUILD SUCCESS
 fbfd614aeaa2853c2c575299dfe2458db8eff67e
Message-ID: <63c0f1ce.mRXc+9MvW3G6B97B%lkp@intel.com>
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

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git renesas-clk-for-v6.3
branch HEAD: fbfd614aeaa2853c2c575299dfe2458db8eff67e  clk: renesas: cpg-mssr: Fix use after free if cpg_mssr_common_init() failed

elapsed time: 729m

configs tested: 84
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
um                             i386_defconfig
um                           x86_64_defconfig
arc                                 defconfig
powerpc                           allnoconfig
sh                               allmodconfig
alpha                               defconfig
s390                                defconfig
mips                             allyesconfig
x86_64                            allnoconfig
s390                             allmodconfig
s390                             allyesconfig
alpha                            allyesconfig
arc                              allyesconfig
powerpc                          allmodconfig
m68k                             allmodconfig
m68k                             allyesconfig
x86_64                          rhel-8.3-func
x86_64                    rhel-8.3-kselftests
ia64                             allmodconfig
x86_64                              defconfig
x86_64                           allyesconfig
x86_64                               rhel-8.3
riscv                randconfig-r042-20230112
s390                 randconfig-r044-20230112
arc                  randconfig-r043-20230112
x86_64                           rhel-8.3-kvm
x86_64                           rhel-8.3-syz
x86_64                           rhel-8.3-bpf
x86_64                         rhel-8.3-kunit
i386                          randconfig-a012
i386                          randconfig-a014
i386                          randconfig-a016
nios2                            allyesconfig
nios2                               defconfig
parisc                              defconfig
parisc64                            defconfig
parisc                           allyesconfig
i386                             allyesconfig
i386                                defconfig
arm                                 defconfig
arm64                            allyesconfig
arm                      integrator_defconfig
sh                           se7721_defconfig
m68k                          atari_defconfig
arc                          axs103_defconfig
m68k                       bvme6000_defconfig
arm                              allyesconfig
x86_64                        randconfig-a011
x86_64                        randconfig-a013
x86_64                        randconfig-a015
arm                          pxa3xx_defconfig
sh                         ap325rxa_defconfig
sh                         microdev_defconfig
riscv                    nommu_virt_defconfig
riscv                          rv32_defconfig
riscv                    nommu_k210_defconfig
riscv                             allnoconfig
i386                   debian-10.3-kselftests
i386                              debian-10.3
arm                           h3600_defconfig
arm                               allnoconfig
alpha                            alldefconfig
sparc                               defconfig
xtensa                           allyesconfig
csky                                defconfig
sparc                            allyesconfig
x86_64                                  kexec
arc                              alldefconfig
sparc                       sparc64_defconfig
sh                        apsh4ad0a_defconfig

clang tested configs:
i386                          randconfig-a002
i386                          randconfig-a006
i386                          randconfig-a004
x86_64                        randconfig-a005
x86_64                        randconfig-a003
x86_64                        randconfig-a001
x86_64                        randconfig-k001
x86_64                        randconfig-a012
x86_64                        randconfig-a014
x86_64                        randconfig-a016
powerpc                      walnut_defconfig
s390                             alldefconfig
mips                       rbtx49xx_defconfig
x86_64                          rhel-8.3-rust

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
