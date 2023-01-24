Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 34E0A67A577
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 24 Jan 2023 23:15:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235144AbjAXWP3 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 24 Jan 2023 17:15:29 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48424 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232601AbjAXWP2 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 24 Jan 2023 17:15:28 -0500
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 78D45442FC
        for <linux-renesas-soc@vger.kernel.org>; Tue, 24 Jan 2023 14:15:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1674598527; x=1706134527;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=TIfASwQigZ02b9ni/h0aUQ5jXviOy65OWTc9U190KWM=;
  b=QNNiw4iqT+GH+E+FkVdeuklFDH+dTHImmA3gT0oTjWjp82SSwzY1pfnv
   U+iRmLTCVlu/cWG+cXnhP/pOydRPcjGP2nQPhPiZ3fLdmtdMcYmy/NsL4
   M6ONKgFSa8FFqRJ4nF5L5yqiS2yoxLevGGV7pfHl+/4R8POvhIfAqnvgZ
   YmHGElu+KJpwrXyw0qzJm0kXF66+TVX5iHC3fqkXr7z7ZQZqHYtIZco3m
   ZAblqXUUKp0c8as/JoVagoOHv8SRpDZxsTBvLInMlFsN/8nsRTgWiEnNx
   ntz7pbis59PXzh723RDSZjzADJ/KMfC8ZguJh2mgqU+CLQukyr3nSNk1z
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10600"; a="328506712"
X-IronPort-AV: E=Sophos;i="5.97,243,1669104000"; 
   d="scan'208";a="328506712"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Jan 2023 14:15:26 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10600"; a="664260484"
X-IronPort-AV: E=Sophos;i="5.97,243,1669104000"; 
   d="scan'208";a="664260484"
Received: from lkp-server01.sh.intel.com (HELO 5646d64e7320) ([10.239.97.150])
  by fmsmga007.fm.intel.com with ESMTP; 24 Jan 2023 14:15:24 -0800
Received: from kbuild by 5646d64e7320 with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1pKRZb-0006pC-1C;
        Tue, 24 Jan 2023 22:15:23 +0000
Date:   Wed, 25 Jan 2023 06:15:00 +0800
From:   kernel test robot <lkp@intel.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     linux-renesas-soc@vger.kernel.org
Subject: [geert-renesas-devel:next] BUILD SUCCESS
 29fea68a8aaad7d0cab07f538d02aa03ad75fb48
Message-ID: <63d05864.rLwa02IfuZsGa1Hs%lkp@intel.com>
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

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git next
branch HEAD: 29fea68a8aaad7d0cab07f538d02aa03ad75fb48  Merge branch 'renesas-dts-for-v6.3' into renesas-next

elapsed time: 729m

configs tested: 69
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
x86_64                            allnoconfig
um                             i386_defconfig
um                           x86_64_defconfig
arc                                 defconfig
s390                             allmodconfig
alpha                               defconfig
powerpc                           allnoconfig
s390                                defconfig
x86_64                              defconfig
sh                               allmodconfig
x86_64                               rhel-8.3
s390                             allyesconfig
x86_64                           allyesconfig
arc                  randconfig-r043-20230123
arm                  randconfig-r046-20230123
mips                             allyesconfig
powerpc                          allmodconfig
m68k                             allmodconfig
x86_64                        randconfig-a004
arc                              allyesconfig
x86_64                        randconfig-a002
alpha                            allyesconfig
x86_64                        randconfig-a006
x86_64                           rhel-8.3-syz
x86_64                         rhel-8.3-kunit
x86_64                           rhel-8.3-kvm
m68k                             allyesconfig
i386                                defconfig
x86_64                           rhel-8.3-bpf
arm                                 defconfig
ia64                             allmodconfig
x86_64                    rhel-8.3-kselftests
x86_64                          rhel-8.3-func
arm64                            allyesconfig
arm                              allyesconfig
i386                 randconfig-a003-20230123
i386                 randconfig-a002-20230123
i386                 randconfig-a001-20230123
i386                 randconfig-a005-20230123
i386                 randconfig-a004-20230123
i386                 randconfig-a006-20230123
i386                             allyesconfig
riscv                    nommu_virt_defconfig
riscv                          rv32_defconfig
riscv                    nommu_k210_defconfig
riscv                             allnoconfig
i386                   debian-10.3-kselftests
i386                              debian-10.3

clang tested configs:
hexagon              randconfig-r041-20230123
hexagon              randconfig-r045-20230123
s390                 randconfig-r044-20230123
riscv                randconfig-r042-20230123
x86_64                        randconfig-a001
x86_64                        randconfig-a003
x86_64                        randconfig-a005
i386                 randconfig-a012-20230123
i386                 randconfig-a013-20230123
i386                 randconfig-a011-20230123
i386                 randconfig-a014-20230123
i386                 randconfig-a016-20230123
i386                 randconfig-a015-20230123
x86_64                          rhel-8.3-rust
x86_64               randconfig-a013-20230123
x86_64               randconfig-a011-20230123
x86_64               randconfig-a012-20230123
x86_64               randconfig-a014-20230123
x86_64               randconfig-a016-20230123
x86_64               randconfig-a015-20230123
x86_64               randconfig-k001-20230123

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
