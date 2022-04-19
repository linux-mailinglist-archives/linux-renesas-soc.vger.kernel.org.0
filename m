Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1740A507C44
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 19 Apr 2022 23:58:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240938AbiDSWBY (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 19 Apr 2022 18:01:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49950 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243088AbiDSWBX (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 19 Apr 2022 18:01:23 -0400
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A986240E5A
        for <linux-renesas-soc@vger.kernel.org>; Tue, 19 Apr 2022 14:58:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1650405519; x=1681941519;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=cEHKZa0JMC2PdOogA4GfHFU77dYIBqgtcbPTVOXMyoE=;
  b=krQKmXkwC6hfcQ9dutLi8ewd8EPzh5lzqx9xdK63kFRcK4er5d4pjBHb
   t2wkNHoZofjp9LT6KQCOqadWdmbRnAED8oGZwqB+d9iVwYSSu/YKLvZ1J
   8YXXCye6SMsvp1XkZmER9vkdXjiHzAM3pY3lmClQ4SwAOUlvIcwk+6PzW
   71CUxUviZmBBu4nocUlWXMgdC+6s2PUqGVFREwwZSh0cOhu3Cchi6r3x/
   FspQR+FnB2HUFlYVkDjjiQRe+PWJ2luul1bcbHqjYoGCY9AZ8+GFI9Gwo
   f8Hf0KKqwamY+ubQYWWo+prjPXw/fxMJPZFXqOsME+CTYBu0X6mTU2FV7
   A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10322"; a="350331319"
X-IronPort-AV: E=Sophos;i="5.90,273,1643702400"; 
   d="scan'208";a="350331319"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Apr 2022 14:58:39 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,273,1643702400"; 
   d="scan'208";a="647422263"
Received: from lkp-server01.sh.intel.com (HELO 3abc53900bec) ([10.239.97.150])
  by FMSMGA003.fm.intel.com with ESMTP; 19 Apr 2022 14:58:38 -0700
Received: from kbuild by 3abc53900bec with local (Exim 4.95)
        (envelope-from <lkp@intel.com>)
        id 1ngvrp-0006E2-F3;
        Tue, 19 Apr 2022 21:58:37 +0000
Date:   Wed, 20 Apr 2022 05:57:55 +0800
From:   kernel test robot <lkp@intel.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     linux-renesas-soc@vger.kernel.org
Subject: [geert-renesas-devel:next] BUILD SUCCESS
 fc84df8749fa09bc9407dfbf3c9a67a204a31eb5
Message-ID: <625f3063.QO2/kIyTGxN63GZq%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.0 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,HEXHASH_WORD,
        RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git next
branch HEAD: fc84df8749fa09bc9407dfbf3c9a67a204a31eb5  Merge branches 'renesas-arm-defconfig-for-v5.19' and 'renesas-arm-dt-for-v5.19' into renesas-next

elapsed time: 723m

configs tested: 119
configs skipped: 4

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
sh                               alldefconfig
xtensa                generic_kc705_defconfig
sh                        sh7785lcr_defconfig
sh                        edosk7705_defconfig
sh                           se7724_defconfig
ia64                        generic_defconfig
mips                       capcella_defconfig
powerpc                      pcm030_defconfig
ia64                             alldefconfig
powerpc                     redwood_defconfig
sh                           se7343_defconfig
mips                     decstation_defconfig
powerpc64                        alldefconfig
sh                           se7721_defconfig
m68k                        m5307c3_defconfig
h8300                               defconfig
powerpc                 mpc8540_ads_defconfig
m68k                        stmark2_defconfig
arm                          badge4_defconfig
um                           x86_64_defconfig
sh                            titan_defconfig
csky                                defconfig
sh                             shx3_defconfig
sh                        sh7757lcr_defconfig
arm                        mvebu_v7_defconfig
arm                         axm55xx_defconfig
s390                          debug_defconfig
powerpc                       holly_defconfig
x86_64                        randconfig-c001
arm                  randconfig-c002-20220419
ia64                             allmodconfig
ia64                             allyesconfig
ia64                                defconfig
m68k                             allyesconfig
m68k                             allmodconfig
m68k                                defconfig
nios2                               defconfig
arc                              allyesconfig
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
mips                             allyesconfig
mips                             allmodconfig
powerpc                          allyesconfig
powerpc                           allnoconfig
powerpc                          allmodconfig
x86_64                        randconfig-a006
x86_64                        randconfig-a004
x86_64                        randconfig-a002
x86_64                        randconfig-a011
x86_64                        randconfig-a013
x86_64                        randconfig-a015
i386                          randconfig-a012
i386                          randconfig-a014
i386                          randconfig-a016
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
x86_64                          rhel-8.3-func
x86_64                                  kexec
x86_64                              defconfig
x86_64                           allyesconfig
x86_64                         rhel-8.3-kunit
x86_64                               rhel-8.3

clang tested configs:
x86_64                        randconfig-c007
powerpc              randconfig-c003-20220419
arm                  randconfig-c002-20220419
i386                          randconfig-c001
riscv                randconfig-c006-20220419
mips                 randconfig-c004-20220419
s390                 randconfig-c005-20220419
powerpc                     tqm5200_defconfig
powerpc                     kilauea_defconfig
arm                           spitz_defconfig
powerpc                     taishan_defconfig
powerpc                         ps3_defconfig
mips                         tb0226_defconfig
powerpc                    klondike_defconfig
powerpc                      ppc64e_defconfig
i386                          randconfig-a002
i386                          randconfig-a006
i386                          randconfig-a004
x86_64                        randconfig-a012
x86_64                        randconfig-a014
x86_64                        randconfig-a016

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
