Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7EFAF664E21
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 10 Jan 2023 22:38:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232851AbjAJVi5 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 10 Jan 2023 16:38:57 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47368 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229842AbjAJViz (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 10 Jan 2023 16:38:55 -0500
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 861D86244
        for <linux-renesas-soc@vger.kernel.org>; Tue, 10 Jan 2023 13:38:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1673386734; x=1704922734;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=usug7shaX2rsFIVibWRzxSTMiJ3ugTB7GKPU7JNQtx8=;
  b=eNNH6lw6LPHyftEDNgYj3UquI9rj4pWg1Kx796txp4Lmz7lJdLjEHN6r
   jBSDHTKHpT2oF1kOTFQOGevJnvOOM5lWG9eDC15j+o6h5gMrsYKnywWCj
   jEni3XzIPWKP8vVtTB0V9gL3NGv+cUsrqGmC3y9e2dBKrr/DjzEU+UVQZ
   PFhVJKdbhgzbiSzFNmq4LivE1v+xam1WB2V0enW5kLcGuEXPUG6WKhinD
   ijUWa1KYTerQUwu5HrmTxkwNYY+ZcceZowXmzp05soTIG35dV2ldx4UmM
   J8NPXR1B1M4eSKpWrkYeiu2YnJqL6D9DCLXoHU5yNor2huVLgj1bNjgFb
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10586"; a="320950865"
X-IronPort-AV: E=Sophos;i="5.96,315,1665471600"; 
   d="scan'208";a="320950865"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jan 2023 13:38:52 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10586"; a="687696523"
X-IronPort-AV: E=Sophos;i="5.96,315,1665471600"; 
   d="scan'208";a="687696523"
Received: from lkp-server02.sh.intel.com (HELO f1920e93ebb5) ([10.239.97.151])
  by orsmga008.jf.intel.com with ESMTP; 10 Jan 2023 13:38:51 -0800
Received: from kbuild by f1920e93ebb5 with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1pFMKY-0008O0-13;
        Tue, 10 Jan 2023 21:38:50 +0000
Date:   Wed, 11 Jan 2023 05:38:47 +0800
From:   kernel test robot <lkp@intel.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     linux-renesas-soc@vger.kernel.org
Subject: [geert-renesas-devel:renesas-dts-for-v6.3] BUILD SUCCESS
 36aa3eee39b2bce5596d3a1178d3c381c1cf3b57
Message-ID: <63bddae7.25Ng+hZ6TyJWHL9V%lkp@intel.com>
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

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git renesas-dts-for-v6.3
branch HEAD: 36aa3eee39b2bce5596d3a1178d3c381c1cf3b57  arm64: dts: renesas: r9a09g011: Add eMMC and SDHI support

elapsed time: 720m

configs tested: 43
configs skipped: 98

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
x86_64                            allnoconfig
arm64                            allyesconfig
ia64                             allmodconfig
i386                             allyesconfig
i386                                defconfig
i386                 randconfig-a015-20230109
i386                 randconfig-a011-20230109
i386                 randconfig-a013-20230109
i386                 randconfig-a014-20230109
i386                 randconfig-a016-20230109
i386                 randconfig-a012-20230109
x86_64                              defconfig
x86_64                           allyesconfig
x86_64                               rhel-8.3
x86_64                          rhel-8.3-func
x86_64                    rhel-8.3-kselftests
x86_64                           rhel-8.3-kvm
x86_64                           rhel-8.3-syz
x86_64                           rhel-8.3-bpf
x86_64                         rhel-8.3-kunit
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
