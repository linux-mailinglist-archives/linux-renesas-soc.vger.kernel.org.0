Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E3CB164C2F8
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 14 Dec 2022 05:02:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237287AbiLNECj (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 13 Dec 2022 23:02:39 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46614 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237342AbiLNECU (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 13 Dec 2022 23:02:20 -0500
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1F96222BD4
        for <linux-renesas-soc@vger.kernel.org>; Tue, 13 Dec 2022 20:02:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1670990539; x=1702526539;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=Lp1MW/z8WfFXaMynlP9qflcFOcnVsbG53MwqN8+z/dU=;
  b=YSYsDJLxQXpJogyQ8f1wvY46XgtWBxX9Vbxjs33zuYD3TtrYw/C9GYEa
   XpmsjISyIzEy0qIdj4Vi2G6NSq84qrQ14EY6tEAtxyJTaIhaLwgeLb6vX
   hBEb4fI18dZQCu2m1YSOVdbFUAsHQDTPSeTz9bbkFHa7gSRqpFTrX7fIJ
   kHxFk067TZtsBG481FwYKZ+jA7B2wh76INVhqbZKw7P++wi/nC/fWphoH
   2aqG19RXYnxQrwc1/jSgwS/8dODMJxV54B0HAttX2qM/lmYH97GGt7hOS
   r9w2CErnutNnBiR6hG/9diGt35y5KNCZ/qbbVXhyb3nhOj1/6wX/JUgVS
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10560"; a="345375079"
X-IronPort-AV: E=Sophos;i="5.96,243,1665471600"; 
   d="scan'208";a="345375079"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Dec 2022 20:02:09 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10560"; a="648841453"
X-IronPort-AV: E=Sophos;i="5.96,243,1665471600"; 
   d="scan'208";a="648841453"
Received: from lkp-server01.sh.intel.com (HELO b5d47979f3ad) ([10.239.97.150])
  by orsmga002.jf.intel.com with ESMTP; 13 Dec 2022 20:02:07 -0800
Received: from kbuild by b5d47979f3ad with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1p5Iy7-00055o-0F;
        Wed, 14 Dec 2022 04:02:07 +0000
Date:   Wed, 14 Dec 2022 12:01:22 +0800
From:   kernel test robot <lkp@intel.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     linux-renesas-soc@vger.kernel.org
Subject: [geert-renesas-drivers:master] BUILD SUCCESS
 14a09342a35ad8a8e7dece3fb1fe60a70eefcd2b
Message-ID: <63994a92.E9aJ0LlQ3P6qwA8W%lkp@intel.com>
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
branch HEAD: 14a09342a35ad8a8e7dece3fb1fe60a70eefcd2b  [LOCAL] arm64: renesas: defconfig: Update renesas_defconfig

elapsed time: 721m

configs tested: 61
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
um                             i386_defconfig
um                           x86_64_defconfig
powerpc                           allnoconfig
x86_64                        randconfig-a013
x86_64                        randconfig-a011
arc                  randconfig-r043-20221213
arm                  randconfig-r046-20221213
x86_64                           rhel-8.3-bpf
x86_64                           rhel-8.3-syz
x86_64                         rhel-8.3-kunit
sh                               allmodconfig
x86_64                           rhel-8.3-kvm
arc                                 defconfig
s390                             allmodconfig
x86_64                        randconfig-a015
alpha                               defconfig
mips                             allyesconfig
s390                                defconfig
powerpc                          allmodconfig
s390                             allyesconfig
m68k                             allyesconfig
x86_64                              defconfig
m68k                             allmodconfig
x86_64                          rhel-8.3-rust
alpha                            allyesconfig
x86_64                          rhel-8.3-func
arc                              allyesconfig
x86_64                    rhel-8.3-kselftests
i386                          randconfig-a014
x86_64                               rhel-8.3
ia64                             allmodconfig
i386                          randconfig-a012
i386                          randconfig-a016
i386                                defconfig
i386                             allyesconfig
x86_64                           allyesconfig
arm                                 defconfig
arm                              allyesconfig
i386                          randconfig-a001
i386                          randconfig-a003
arm64                            allyesconfig
i386                          randconfig-a005

clang tested configs:
x86_64                        randconfig-a012
hexagon              randconfig-r045-20221213
hexagon              randconfig-r041-20221213
riscv                randconfig-r042-20221213
x86_64                        randconfig-a014
x86_64                        randconfig-a016
s390                 randconfig-r044-20221213
x86_64               randconfig-a002-20221212
i386                          randconfig-a013
x86_64               randconfig-a001-20221212
i386                          randconfig-a011
x86_64               randconfig-a004-20221212
x86_64               randconfig-a003-20221212
i386                          randconfig-a015
x86_64               randconfig-a006-20221212
x86_64               randconfig-a005-20221212
i386                          randconfig-a002
i386                          randconfig-a004
i386                          randconfig-a006

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
