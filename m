Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B75EB656600
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 27 Dec 2022 00:16:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229787AbiLZXQH (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 26 Dec 2022 18:16:07 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54110 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229491AbiLZXQG (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 26 Dec 2022 18:16:06 -0500
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1DDFAF6E
        for <linux-renesas-soc@vger.kernel.org>; Mon, 26 Dec 2022 15:16:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1672096565; x=1703632565;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=gIU18lg8x23ZvxjA7HMq8XlzNSySdrFbuvHUXmtcQsU=;
  b=DuTQTgMk4/mRgGUYvVAHviDqpMSPnWJZFFRoSgw4ZjCuPx9mVIsLh0NI
   z6a+mEXkv1u4moMNfbRr0AM/PvxQvGwnc7ARoGuKobck4zu5oQvc9ZgcS
   1fxlSKgyL27Ut+OraleA8aPXBschgB9lId8ErP7IDJV3UvnAt4EX4iFWg
   ykrrY/7lNSeoSrZNgEyNfQ1lIQwb5KVPGGPpzWKn0DBDPXqqz7ew5gaHi
   LlzAI5xPQRIDRle9/GkVMDwZvfOu/8o83ceQekQAnte41dmN/JC9I4JKl
   YKAnY5l1YM85Q+WrVgxmSxul3x23T8gxN/8w7UNRwXPGidHIIt6N+nyOw
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10572"; a="308367033"
X-IronPort-AV: E=Sophos;i="5.96,276,1665471600"; 
   d="scan'208";a="308367033"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Dec 2022 15:16:04 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10572"; a="760157909"
X-IronPort-AV: E=Sophos;i="5.96,276,1665471600"; 
   d="scan'208";a="760157909"
Received: from lkp-server01.sh.intel.com (HELO b5d47979f3ad) ([10.239.97.150])
  by fmsmga002.fm.intel.com with ESMTP; 26 Dec 2022 15:16:03 -0800
Received: from kbuild by b5d47979f3ad with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1p9whO-000EiH-1T;
        Mon, 26 Dec 2022 23:16:02 +0000
Date:   Tue, 27 Dec 2022 07:15:14 +0800
From:   kernel test robot <lkp@intel.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     linux-renesas-soc@vger.kernel.org
Subject: [geert-renesas-devel:renesas-riscv-dt-for-v6.3] BUILD SUCCESS
 3e9e6fc9c64f7b9b777c5b2c2e2c9a1326065137
Message-ID: <63aa2b02.4iJc09Kd0MqdR2mj%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git renesas-riscv-dt-for-v6.3
branch HEAD: 3e9e6fc9c64f7b9b777c5b2c2e2c9a1326065137  riscv: dts: renesas: rzfive-smarc-som: Enable WDT

elapsed time: 726m

configs tested: 18
configs skipped: 112

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
riscv                randconfig-r042-20221226
x86_64                            allnoconfig
i386                          randconfig-c001
riscv                    nommu_virt_defconfig
riscv                          rv32_defconfig
riscv                    nommu_k210_defconfig
riscv                             allnoconfig
i386                   debian-10.3-kselftests
i386                              debian-10.3
i386                             allyesconfig
i386                                defconfig
i386                          debian-10.3-kvm
i386                        debian-10.3-kunit
i386                         debian-10.3-func
powerpc                     tqm8541_defconfig
ia64                        generic_defconfig
powerpc                 mpc837x_mds_defconfig

clang tested configs:
riscv                randconfig-r042-20221225
riscv                             allnoconfig

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
