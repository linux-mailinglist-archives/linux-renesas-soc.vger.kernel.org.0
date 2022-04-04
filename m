Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 721BF4F2159
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  5 Apr 2022 06:09:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230296AbiDEC46 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 4 Apr 2022 22:56:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38860 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231202AbiDEC4X (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 4 Apr 2022 22:56:23 -0400
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 12C0E9FD4
        for <linux-renesas-soc@vger.kernel.org>; Mon,  4 Apr 2022 19:05:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1649124355; x=1680660355;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=MTmTdVOIZ1OXRZyP43m/IKzOcKUl6hysDEnzvo97k3g=;
  b=DjO2OlCY5cdIA02rT5NEa2dbL4bSaJctD9avTzK2/3jMdpk7wFKxMttE
   VOaGZ35RXACJpLpOGv6CCRde70J2/439N5k/Jukx83cWXf5H/fT1Z0nTR
   fImrHjbX1mDDe7Bw2v7dIgqkC7f6WXrOdGc/ud0opmkUpDBQBvlq71ve2
   YugH1c6zN2ru2IGRPMV0IavOSg4RNgmt3MAug0tUljrSCijs0aN8DPkqQ
   Ct94cZEaScFbyldhsST4fr1BsXT3gITGIK1pMxMkyW8BwkmSCzvT/K0kj
   w2xlsKHiGR3BN/iBcLaRf1q8ZRKAhF629Rhvk+GCAxZ+jPoXgR6kkUiUM
   w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10307"; a="241219434"
X-IronPort-AV: E=Sophos;i="5.90,235,1643702400"; 
   d="scan'208";a="241219434"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Apr 2022 16:57:40 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,235,1643702400"; 
   d="scan'208";a="505084830"
Received: from lkp-server02.sh.intel.com (HELO a44fdfb70b94) ([10.239.97.151])
  by orsmga003.jf.intel.com with ESMTP; 04 Apr 2022 16:57:39 -0700
Received: from kbuild by a44fdfb70b94 with local (Exim 4.95)
        (envelope-from <lkp@intel.com>)
        id 1nbWZm-0002SG-9J;
        Mon, 04 Apr 2022 23:57:38 +0000
Date:   Tue, 05 Apr 2022 07:57:25 +0800
From:   kernel test robot <lkp@intel.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     linux-renesas-soc@vger.kernel.org
Subject: [geert-renesas-devel:renesas-arm-dt-for-v5.19] BUILD SUCCESS
 0182581a9f63764bcbdbc68e98881b50e03fc4c4
Message-ID: <624b85e5.WTuSUeLtEY0lf1/8%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,HEXHASH_WORD,
        RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git renesas-arm-dt-for-v5.19
branch HEAD: 0182581a9f63764bcbdbc68e98881b50e03fc4c4  arm64: dts: renesas: r8a77961: Add CAN-FD node

elapsed time: 740m

configs tested: 46
configs skipped: 114

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm64                               defconfig
arm64                            allyesconfig
arm                              allmodconfig
arm                                 defconfig
arm                              allyesconfig
i386                 randconfig-c001-20220404
x86_64               randconfig-c001-20220404
arm                  randconfig-c002-20220404
m68k                             allyesconfig
m68k                             allmodconfig
m68k                                defconfig
h8300                            allyesconfig
xtensa                           allyesconfig
arc                                 defconfig
sh                               allmodconfig
mips                             allyesconfig
mips                             allmodconfig
x86_64               randconfig-a015-20220404
x86_64               randconfig-a011-20220404
x86_64               randconfig-a014-20220404
x86_64               randconfig-a016-20220404
x86_64               randconfig-a012-20220404
x86_64               randconfig-a013-20220404
i386                 randconfig-a014-20220404
i386                 randconfig-a013-20220404
i386                 randconfig-a016-20220404
i386                 randconfig-a015-20220404
i386                 randconfig-a011-20220404
i386                 randconfig-a012-20220404
arc                  randconfig-r043-20220404
s390                 randconfig-r044-20220404
riscv                randconfig-r042-20220404

clang tested configs:
i386                 randconfig-c001-20220404
x86_64               randconfig-c007-20220404
powerpc              randconfig-c003-20220404
riscv                randconfig-c006-20220404
mips                 randconfig-c004-20220404
arm                  randconfig-c002-20220404
mips                     loongson1c_defconfig
mips                  cavium_octeon_defconfig
arm                        multi_v5_defconfig
powerpc                        icon_defconfig
x86_64               randconfig-a006-20220404
x86_64               randconfig-a002-20220404
x86_64               randconfig-a001-20220404
x86_64               randconfig-a005-20220404
x86_64               randconfig-a003-20220404
x86_64               randconfig-a004-20220404

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
