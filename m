Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EECCB5B7F2E
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 14 Sep 2022 05:06:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229531AbiINDGR (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 13 Sep 2022 23:06:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43422 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229489AbiINDGP (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 13 Sep 2022 23:06:15 -0400
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D31226CF5E
        for <linux-renesas-soc@vger.kernel.org>; Tue, 13 Sep 2022 20:06:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1663124774; x=1694660774;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=rp/oC1G6USg4DMWfEHXjiKEd9uQpICPbC2znLFbBYBM=;
  b=ML977eSE2ktMrr2EkUGePDPKBTR/QcnpwQfJQ0LS5KVYYbBf4V/S9eIp
   1Fu2uYgaz+eQy2HB1oTpeqqMapdk4Qu7FfviS9l4QJ+ypbSaHJzvyREGB
   lwdSb5xeG7Fm/wTjGoV1kWeYnX3t5WZCjeAgDXUDzpC4mK05aB1FqY/3Y
   w6+il6GA+BjL094ltcUlPh4z5nhGbxAgZHzDGKjUM/77IlLzWQ1fZ1Rk9
   n/EUfVyx/Q8cjfwjTch1KyPRWvHlWeS9oPi6iICFqO6bpy2XzA31NMsjp
   NCJON9HJEYxWroa57U+ivEP94uEvdTfL9r3A5tttZw3pnA50UIlKT2OK9
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10469"; a="360061017"
X-IronPort-AV: E=Sophos;i="5.93,313,1654585200"; 
   d="scan'208";a="360061017"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Sep 2022 20:06:04 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,313,1654585200"; 
   d="scan'208";a="685133221"
Received: from lkp-server02.sh.intel.com (HELO 4011df4f4fd3) ([10.239.97.151])
  by fmsmga004.fm.intel.com with ESMTP; 13 Sep 2022 20:06:03 -0700
Received: from kbuild by 4011df4f4fd3 with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1oYIiw-0004IR-1r;
        Wed, 14 Sep 2022 03:06:02 +0000
Date:   Wed, 14 Sep 2022 11:05:42 +0800
From:   kernel test robot <lkp@intel.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     linux-renesas-soc@vger.kernel.org
Subject: [geert-renesas-drivers:master] BUILD SUCCESS
 9501f555f9faba549af255f5372f92f2bb068f42
Message-ID: <63214506.S+YW0Ur7KGXLIqAs%lkp@intel.com>
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

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git master
branch HEAD: 9501f555f9faba549af255f5372f92f2bb068f42  [LOCAL] arm64: renesas: defconfig: Update renesas_defconfig

elapsed time: 723m

configs tested: 58
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
um                             i386_defconfig
um                           x86_64_defconfig
i386                                defconfig
arm                                 defconfig
x86_64                    rhel-8.3-kselftests
x86_64                          rhel-8.3-func
x86_64                              defconfig
x86_64                         rhel-8.3-kunit
i386                 randconfig-a001-20220912
m68k                             allmodconfig
x86_64                           rhel-8.3-syz
i386                 randconfig-a002-20220912
x86_64                           rhel-8.3-kvm
powerpc                           allnoconfig
i386                 randconfig-a003-20220912
arc                              allyesconfig
powerpc                          allmodconfig
arm64                            allyesconfig
x86_64                               rhel-8.3
arm                              allyesconfig
mips                             allyesconfig
alpha                            allyesconfig
i386                 randconfig-a004-20220912
m68k                             allyesconfig
sh                               allmodconfig
i386                             allyesconfig
i386                 randconfig-a006-20220912
i386                 randconfig-a005-20220912
riscv                randconfig-r042-20220911
x86_64                           allyesconfig
arc                  randconfig-r043-20220912
arc                  randconfig-r043-20220911
s390                 randconfig-r044-20220911
x86_64               randconfig-a001-20220912
x86_64               randconfig-a002-20220912
x86_64               randconfig-a005-20220912
x86_64               randconfig-a003-20220912
x86_64               randconfig-a006-20220912
x86_64               randconfig-a004-20220912
ia64                             allmodconfig

clang tested configs:
i386                 randconfig-a014-20220912
i386                 randconfig-a013-20220912
i386                 randconfig-a011-20220912
i386                 randconfig-a012-20220912
i386                 randconfig-a015-20220912
i386                 randconfig-a016-20220912
hexagon              randconfig-r041-20220912
hexagon              randconfig-r045-20220911
hexagon              randconfig-r041-20220911
hexagon              randconfig-r045-20220912
s390                 randconfig-r044-20220912
riscv                randconfig-r042-20220912
x86_64               randconfig-a012-20220912
x86_64               randconfig-a013-20220912
x86_64               randconfig-a014-20220912
x86_64               randconfig-a011-20220912
x86_64               randconfig-a015-20220912
x86_64               randconfig-a016-20220912

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
