Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 25BB45F4D95
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  5 Oct 2022 04:04:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229590AbiJECEw (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 4 Oct 2022 22:04:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45968 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229618AbiJECEv (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 4 Oct 2022 22:04:51 -0400
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BF565DF86
        for <linux-renesas-soc@vger.kernel.org>; Tue,  4 Oct 2022 19:04:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1664935489; x=1696471489;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=jko+mqQd+TLPnhj5o9rxzfS2lfYBgOtUFXIaN6E34EA=;
  b=Yy/zoM6LkgcFcsXFM0IXv5zJO+iDwJMphbPdUstW5jp9E4U3oxikpDfu
   jTxybwTokYqcjA3ljG7HSjHZiycWz9ZMQcWOXibNsZkCGW3ejvw0zkLmu
   OAFgWELk7zYzkTRwDYj3tSdyCGbawYANw0ohqqxYi9aJ6zpWkv8sFNt1D
   7nMwQSosy2AyGAiwcDVPN6QcG+pM5kZcN9VczcRDD3mlJ1RppuGYGREgb
   wlDLYIiqv/nKZ0u00mEWqG/S+VZmSBj1bpFz4H+yBGlnSAsNshQCQXT+x
   pKliVyV8mxuI/laW6/3vlTWNtaibTUoWLrV/omcDA7Ry8SjlOBELT9t39
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10490"; a="329481686"
X-IronPort-AV: E=Sophos;i="5.95,159,1661842800"; 
   d="scan'208";a="329481686"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Oct 2022 19:04:49 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10490"; a="713267207"
X-IronPort-AV: E=Sophos;i="5.95,159,1661842800"; 
   d="scan'208";a="713267207"
Received: from lkp-server01.sh.intel.com (HELO d4f44333118a) ([10.239.97.150])
  by FMSMGA003.fm.intel.com with ESMTP; 04 Oct 2022 19:04:48 -0700
Received: from kbuild by d4f44333118a with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1oftmB-0000li-2D;
        Wed, 05 Oct 2022 02:04:47 +0000
Date:   Wed, 05 Oct 2022 10:04:38 +0800
From:   kernel test robot <lkp@intel.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     linux-renesas-soc@vger.kernel.org
Subject: [geert-renesas-drivers:master] BUILD REGRESSION
 b5b00e6fe66b2369c1ed150e40ce8730a2728ad1
Message-ID: <633ce636.BB8gHesCntG7ueDo%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git master
branch HEAD: b5b00e6fe66b2369c1ed150e40ce8730a2728ad1  [LOCAL] arm64: renesas: defconfig: Update renesas_defconfig

Error/Warning reports:

https://lore.kernel.org/linux-renesas-soc/202210030625.M6ObcFdj-lkp@intel.com
https://lore.kernel.org/linux-renesas-soc/202210050022.JP7c6e8v-lkp@intel.com
https://lore.kernel.org/llvm/202210050144.srG0VtXC-lkp@intel.com
https://lore.kernel.org/llvm/202210050152.kLlOG8Zy-lkp@intel.com

Error/Warning: (recently discovered and may have been fixed)

sound/soc/codecs/cs42l42-i2c.c:98:19: error: initialization of 'void (*)(struct i2c_client *)' from incompatible pointer type 'int (*)(struct i2c_client *)' [-Werror=incompatible-pointer-types]
sound/soc/codecs/cs42l83-i2c.c:234:19: error: initialization of 'void (*)(struct i2c_client *)' from incompatible pointer type 'int (*)(struct i2c_client *)' [-Werror=incompatible-pointer-types]

Error/Warning ids grouped by kconfigs:

gcc_recent_errors
|-- alpha-allyesconfig
|   |-- sound-soc-codecs-cs42l42-i2c.c:error:initialization-of-void-(-)(struct-i2c_client-)-from-incompatible-pointer-type-int-(-)(struct-i2c_client-)
|   `-- sound-soc-codecs-cs42l83-i2c.c:error:initialization-of-void-(-)(struct-i2c_client-)-from-incompatible-pointer-type-int-(-)(struct-i2c_client-)
|-- alpha-randconfig-r005-20221002
|   `-- sound-soc-codecs-cs42l42-i2c.c:error:initialization-of-void-(-)(struct-i2c_client-)-from-incompatible-pointer-type-int-(-)(struct-i2c_client-)
|-- arc-allyesconfig
|   |-- sound-soc-codecs-cs42l42-i2c.c:error:initialization-of-void-(-)(struct-i2c_client-)-from-incompatible-pointer-type-int-(-)(struct-i2c_client-)
|   `-- sound-soc-codecs-cs42l83-i2c.c:error:initialization-of-void-(-)(struct-i2c_client-)-from-incompatible-pointer-type-int-(-)(struct-i2c_client-)
|-- arc-randconfig-r043-20221002
|   `-- sound-soc-codecs-cs42l42-i2c.c:error:initialization-of-void-(-)(struct-i2c_client-)-from-incompatible-pointer-type-int-(-)(struct-i2c_client-)
|-- arm-allyesconfig
|   |-- sound-soc-codecs-cs42l42-i2c.c:error:initialization-of-void-(-)(struct-i2c_client-)-from-incompatible-pointer-type-int-(-)(struct-i2c_client-)
|   `-- sound-soc-codecs-cs42l83-i2c.c:error:initialization-of-void-(-)(struct-i2c_client-)-from-incompatible-pointer-type-int-(-)(struct-i2c_client-)
|-- arm64-allyesconfig
|   |-- sound-soc-codecs-cs42l42-i2c.c:error:initialization-of-void-(-)(struct-i2c_client-)-from-incompatible-pointer-type-int-(-)(struct-i2c_client-)
|   `-- sound-soc-codecs-cs42l83-i2c.c:error:initialization-of-void-(-)(struct-i2c_client-)-from-incompatible-pointer-type-int-(-)(struct-i2c_client-)
|-- csky-randconfig-r035-20221003
|   `-- sound-soc-codecs-cs42l42-i2c.c:error:initialization-of-void-(-)(struct-i2c_client-)-from-incompatible-pointer-type-int-(-)(struct-i2c_client-)
|-- i386-allyesconfig
|   |-- sound-soc-codecs-cs42l42-i2c.c:error:initialization-of-void-(-)(struct-i2c_client-)-from-incompatible-pointer-type-int-(-)(struct-i2c_client-)
|   `-- sound-soc-codecs-cs42l83-i2c.c:error:initialization-of-void-(-)(struct-i2c_client-)-from-incompatible-pointer-type-int-(-)(struct-i2c_client-)
|-- i386-randconfig-a012-20221003
|   `-- sound-soc-codecs-cs42l42-i2c.c:error:initialization-of-void-(-)(struct-i2c_client-)-from-incompatible-pointer-type-int-(-)(struct-i2c_client-)
|-- loongarch-randconfig-r031-20221003
|   `-- sound-soc-codecs-cs42l42-i2c.c:error:initialization-of-void-(-)(struct-i2c_client-)-from-incompatible-pointer-type-int-(-)(struct-i2c_client-)
|-- m68k-allmodconfig
|   |-- sound-soc-codecs-cs42l42-i2c.c:error:initialization-of-void-(-)(struct-i2c_client-)-from-incompatible-pointer-type-int-(-)(struct-i2c_client-)
|   `-- sound-soc-codecs-cs42l83-i2c.c:error:initialization-of-void-(-)(struct-i2c_client-)-from-incompatible-pointer-type-int-(-)(struct-i2c_client-)
|-- m68k-allyesconfig
|   |-- sound-soc-codecs-cs42l42-i2c.c:error:initialization-of-void-(-)(struct-i2c_client-)-from-incompatible-pointer-type-int-(-)(struct-i2c_client-)
|   `-- sound-soc-codecs-cs42l83-i2c.c:error:initialization-of-void-(-)(struct-i2c_client-)-from-incompatible-pointer-type-int-(-)(struct-i2c_client-)
|-- mips-allyesconfig
|   `-- sound-soc-codecs-cs42l83-i2c.c:error:initialization-of-void-(-)(struct-i2c_client-)-from-incompatible-pointer-type-int-(-)(struct-i2c_client-)
|-- powerpc-allmodconfig
|   `-- sound-soc-codecs-cs42l83-i2c.c:error:initialization-of-void-(-)(struct-i2c_client-)-from-incompatible-pointer-type-int-(-)(struct-i2c_client-)
|-- s390-allyesconfig
|   `-- sound-soc-codecs-cs42l83-i2c.c:error:initialization-of-void-(-)(struct-i2c_client-)-from-incompatible-pointer-type-int-(-)(struct-i2c_client-)
|-- sh-allmodconfig
|   |-- sound-soc-codecs-cs42l42-i2c.c:error:initialization-of-void-(-)(struct-i2c_client-)-from-incompatible-pointer-type-int-(-)(struct-i2c_client-)
|   `-- sound-soc-codecs-cs42l83-i2c.c:error:initialization-of-void-(-)(struct-i2c_client-)-from-incompatible-pointer-type-int-(-)(struct-i2c_client-)
|-- sparc-allyesconfig
|   |-- sound-soc-codecs-cs42l42-i2c.c:error:initialization-of-void-(-)(struct-i2c_client-)-from-incompatible-pointer-type-int-(-)(struct-i2c_client-)
|   `-- sound-soc-codecs-cs42l83-i2c.c:error:initialization-of-void-(-)(struct-i2c_client-)-from-incompatible-pointer-type-int-(-)(struct-i2c_client-)
`-- x86_64-allyesconfig
    `-- sound-soc-codecs-cs42l83-i2c.c:error:initialization-of-void-(-)(struct-i2c_client-)-from-incompatible-pointer-type-int-(-)(struct-i2c_client-)
clang_recent_errors
|-- arm-randconfig-r013-20221003
|   `-- sound-soc-codecs-cs42l42-i2c.c:error:incompatible-function-pointer-types-initializing-void-(-)(struct-i2c_client-)-with-an-expression-of-type-int-(struct-i2c_client-)
`-- i386-randconfig-a003-20221003
    `-- sound-soc-codecs-cs42l42-i2c.c:error:incompatible-function-pointer-types-initializing-void-(-)(struct-i2c_client-)-with-an-expression-of-type-int-(struct-i2c_client-)-Werror-Wincompatible-function-poi

elapsed time: 726m

configs tested: 63
configs skipped: 2

gcc tested configs:
arc                                 defconfig
alpha                               defconfig
i386                 randconfig-a011-20221003
i386                 randconfig-a012-20221003
i386                 randconfig-a013-20221003
i386                 randconfig-a015-20221003
s390                             allmodconfig
i386                 randconfig-a014-20221003
s390                                defconfig
i386                 randconfig-a016-20221003
um                             i386_defconfig
um                           x86_64_defconfig
x86_64                              defconfig
powerpc                           allnoconfig
s390                             allyesconfig
x86_64                               rhel-8.3
i386                                defconfig
x86_64                          rhel-8.3-func
mips                             allyesconfig
x86_64                           allyesconfig
x86_64                           rhel-8.3-syz
powerpc                          allmodconfig
x86_64                         rhel-8.3-kunit
x86_64                           rhel-8.3-kvm
x86_64                    rhel-8.3-kselftests
i386                             allyesconfig
x86_64               randconfig-a011-20221003
sh                               allmodconfig
x86_64               randconfig-a012-20221003
x86_64               randconfig-a013-20221003
x86_64               randconfig-a015-20221003
arm                                 defconfig
x86_64               randconfig-a014-20221003
riscv                randconfig-r042-20221003
m68k                             allmodconfig
x86_64               randconfig-a016-20221003
arc                              allyesconfig
arc                  randconfig-r043-20221003
arm                              allyesconfig
arc                  randconfig-r043-20221002
arm64                            allyesconfig
s390                 randconfig-r044-20221003
alpha                            allyesconfig
m68k                             allyesconfig
ia64                             allmodconfig

clang tested configs:
i386                 randconfig-a004-20221003
i386                 randconfig-a003-20221003
i386                 randconfig-a002-20221003
i386                 randconfig-a001-20221003
i386                 randconfig-a005-20221003
i386                 randconfig-a006-20221003
x86_64               randconfig-a003-20221003
x86_64               randconfig-a002-20221003
x86_64               randconfig-a001-20221003
x86_64               randconfig-a004-20221003
x86_64               randconfig-a006-20221003
hexagon              randconfig-r041-20221003
x86_64               randconfig-a005-20221003
riscv                randconfig-r042-20221002
hexagon              randconfig-r041-20221002
hexagon              randconfig-r045-20221002
hexagon              randconfig-r045-20221003
s390                 randconfig-r044-20221002

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
