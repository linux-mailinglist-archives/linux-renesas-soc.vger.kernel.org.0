Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 339E9664E20
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 10 Jan 2023 22:38:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231612AbjAJVi4 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 10 Jan 2023 16:38:56 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47356 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232274AbjAJViy (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 10 Jan 2023 16:38:54 -0500
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 42A745F75
        for <linux-renesas-soc@vger.kernel.org>; Tue, 10 Jan 2023 13:38:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1673386733; x=1704922733;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=SEV5y/bSqwIEUuMTBFopJ+piilSTRGdyiFITEQfJTFQ=;
  b=WuJ8Qw5ytAPWoDrodt6kjVnW+SAkSJNX9u3owVc2OiNRLMXJTQPliJzU
   UF3Pw2sULzEqGw5M0bzQm2m7LjL6fDeAN31JspY3QNpJk+LhS7su5eyEI
   +AkIqeX2NdAdLrjzdy3x4MmfoySoHDxG1I7od3m24iPgBtvRuFWnp8Cst
   QxUii6nS/CXxr53yN/IzWfyvPHFOXaU251kJ06Ue5gDQUGIuw4/zgzK6s
   bLmixFq0aXDZLokZwnn5lMyoFbX8S7UJBqRjBmMIw6iAQvNzIHWFL/JuN
   kXsyct8OCXxzlxGUUWmglB9xp3mv9xhjPULtEjk0nx083JDhs/yHxuu43
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10586"; a="320950862"
X-IronPort-AV: E=Sophos;i="5.96,315,1665471600"; 
   d="scan'208";a="320950862"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jan 2023 13:38:52 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10586"; a="687696522"
X-IronPort-AV: E=Sophos;i="5.96,315,1665471600"; 
   d="scan'208";a="687696522"
Received: from lkp-server02.sh.intel.com (HELO f1920e93ebb5) ([10.239.97.151])
  by orsmga008.jf.intel.com with ESMTP; 10 Jan 2023 13:38:51 -0800
Received: from kbuild by f1920e93ebb5 with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1pFMKY-0008O3-19;
        Tue, 10 Jan 2023 21:38:50 +0000
Date:   Wed, 11 Jan 2023 05:38:44 +0800
From:   kernel test robot <lkp@intel.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     linux-renesas-soc@vger.kernel.org
Subject: [geert-renesas-devel:renesas-arm-defconfig-for-v6.3] BUILD
 SUCCESS 3ad69c496d488cd1b6c3a20b2f7945b45a0f7f18
Message-ID: <63bddae4.egrRHq7YZo3iOtHF%lkp@intel.com>
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

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git renesas-arm-defconfig-for-v6.3
branch HEAD: 3ad69c496d488cd1b6c3a20b2f7945b45a0f7f18  arm64: defconfig: Enable RZ/G2L MIPI CSI-2 and CRU support

elapsed time: 721m

configs tested: 36
configs skipped: 93

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
x86_64                            allnoconfig
ia64                             allmodconfig
i386                             allyesconfig
i386                                defconfig
i386                 randconfig-a015-20230109
i386                 randconfig-a011-20230109
i386                 randconfig-a013-20230109
i386                 randconfig-a014-20230109
i386                 randconfig-a016-20230109
i386                 randconfig-a012-20230109
arm                                 defconfig
arm64                            allyesconfig
arm                              allyesconfig
x86_64                              defconfig
x86_64                           allyesconfig
x86_64                               rhel-8.3
x86_64                          rhel-8.3-func
x86_64                    rhel-8.3-kselftests
i386                          debian-10.3-kvm
i386                        debian-10.3-kunit
i386                         debian-10.3-func

clang tested configs:
x86_64               randconfig-a001-20230109
x86_64               randconfig-a002-20230109
x86_64               randconfig-a004-20230109
x86_64               randconfig-a003-20230109
x86_64               randconfig-a006-20230109
x86_64               randconfig-a005-20230109
x86_64                        randconfig-a005
x86_64                        randconfig-a003
x86_64                        randconfig-a001
riscv                          rv32_defconfig
powerpc                      ppc64e_defconfig
powerpc                      ppc44x_defconfig
i386                          randconfig-a002
i386                          randconfig-a006
i386                          randconfig-a004

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
