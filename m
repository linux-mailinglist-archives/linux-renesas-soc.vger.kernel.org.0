Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B5A1F678D77
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 24 Jan 2023 02:33:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231681AbjAXBdf (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 23 Jan 2023 20:33:35 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56138 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232083AbjAXBde (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 23 Jan 2023 20:33:34 -0500
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6539F196A5
        for <linux-renesas-soc@vger.kernel.org>; Mon, 23 Jan 2023 17:33:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1674524013; x=1706060013;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=A6vMvobcfMPCv/nj4hLMefZbERoMopsIia/Mdl1qxYs=;
  b=hVrSHBA5P7fpnB1RDZJ/TmNVZ1W4SaKRzf44XNSGiFfTfgGSAzLf8fFC
   BRVdSQP0lw5QpS+B8fR7dKKW0Fhzb8+VOUaqgWGrF7SzIhXYXJFB9TCx/
   zVZkUOSp/BQQyvDrl+HR6RtF66uwBLbR4l1Y0+75LkvnbHslfWVThhJou
   4ie9b/X+fnXf0ua0IVl6rm00KMlAavmVa8wmxH+HAr/qG26gXpRO6r3N/
   HsCQAugd7i793ZnlPAZ2NpzSE8yib9Kx7UrY+KzlyFmCVhsckqupCify8
   ulrExZq+SVe0BOonPKOkyr7tI8Xn0AQDtL0VAwWfpeRtP91HjoSkGCJi8
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10599"; a="412439771"
X-IronPort-AV: E=Sophos;i="5.97,240,1669104000"; 
   d="scan'208";a="412439771"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jan 2023 17:33:32 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10599"; a="655253096"
X-IronPort-AV: E=Sophos;i="5.97,240,1669104000"; 
   d="scan'208";a="655253096"
Received: from lkp-server01.sh.intel.com (HELO 5646d64e7320) ([10.239.97.150])
  by orsmga007.jf.intel.com with ESMTP; 23 Jan 2023 17:33:31 -0800
Received: from kbuild by 5646d64e7320 with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1pK8Bm-00061K-2D;
        Tue, 24 Jan 2023 01:33:30 +0000
Date:   Tue, 24 Jan 2023 09:32:31 +0800
From:   kernel test robot <lkp@intel.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     linux-renesas-soc@vger.kernel.org
Subject: [geert-renesas-drivers:renesas-clk-for-v6.3] BUILD SUCCESS
 1c052043c79af5f70e80e2acd4dd70904ae08666
Message-ID: <63cf352f.Gf8bV3LPbfjUoZXH%lkp@intel.com>
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
branch HEAD: 1c052043c79af5f70e80e2acd4dd70904ae08666  clk: renesas: cpg-mssr: Remove superfluous check in resume code

elapsed time: 726m

configs tested: 75
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
powerpc                           allnoconfig
um                             i386_defconfig
um                           x86_64_defconfig
x86_64                            allnoconfig
m68k                             allyesconfig
sh                               allmodconfig
m68k                             allmodconfig
arc                              allyesconfig
alpha                            allyesconfig
powerpc                          allmodconfig
mips                             allyesconfig
i386                                defconfig
i386                             allyesconfig
ia64                             allmodconfig
x86_64               randconfig-a002-20230123
x86_64                              defconfig
arc                  randconfig-r043-20230123
arc                                 defconfig
s390                             allmodconfig
x86_64               randconfig-a005-20230123
i386                 randconfig-a003-20230123
alpha                               defconfig
x86_64               randconfig-a001-20230123
x86_64                          rhel-8.3-func
i386                 randconfig-a002-20230123
arm                  randconfig-r046-20230123
x86_64                    rhel-8.3-kselftests
arm                                 defconfig
i386                 randconfig-a001-20230123
x86_64               randconfig-a006-20230123
x86_64                               rhel-8.3
i386                 randconfig-a005-20230123
x86_64               randconfig-a004-20230123
arm                              allyesconfig
i386                 randconfig-a006-20230123
x86_64               randconfig-a003-20230123
i386                 randconfig-a004-20230123
arm64                            allyesconfig
x86_64                           allyesconfig
s390                                defconfig
s390                             allyesconfig
x86_64                           rhel-8.3-syz
x86_64                           rhel-8.3-kvm
x86_64                         rhel-8.3-kunit
x86_64                           rhel-8.3-bpf
riscv                    nommu_virt_defconfig
riscv                          rv32_defconfig
riscv                    nommu_k210_defconfig
riscv                             allnoconfig
i386                   debian-10.3-kselftests
i386                              debian-10.3
i386                          debian-10.3-kvm
i386                        debian-10.3-kunit
i386                         debian-10.3-func

clang tested configs:
s390                 randconfig-r044-20230123
i386                 randconfig-a012-20230123
x86_64               randconfig-a011-20230123
i386                 randconfig-a013-20230123
x86_64                          rhel-8.3-rust
x86_64               randconfig-a012-20230123
x86_64               randconfig-a015-20230123
riscv                randconfig-r042-20230123
x86_64               randconfig-a016-20230123
hexagon              randconfig-r041-20230123
i386                 randconfig-a015-20230123
x86_64               randconfig-a013-20230123
i386                 randconfig-a011-20230123
i386                 randconfig-a014-20230123
x86_64               randconfig-a014-20230123
hexagon              randconfig-r045-20230123
i386                 randconfig-a016-20230123
x86_64               randconfig-k001-20230123
i386                          randconfig-a002
i386                          randconfig-a006
i386                          randconfig-a004

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
