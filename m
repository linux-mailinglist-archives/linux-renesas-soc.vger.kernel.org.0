Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 892D3678E94
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 24 Jan 2023 03:52:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229930AbjAXCv7 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 23 Jan 2023 21:51:59 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37184 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232690AbjAXCvi (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 23 Jan 2023 21:51:38 -0500
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A941F360A8
        for <linux-renesas-soc@vger.kernel.org>; Mon, 23 Jan 2023 18:51:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1674528696; x=1706064696;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=IhhN8xDEDB19rWS304yR8wo8548WxoAhsied2Ec/0Ic=;
  b=YtRG1SWR/fokl/ZDSHOsD+t0ymwPH08li8kHUfWji3TFyEH1wYG+hTwB
   //qXIeovPLIewYQj8A5kDyRFrsYpli30Ke9624uRj4LRQtUhSVWtu3m7M
   tPwHTnvFYYanoe68xs21Ho9B78efXeasIGbqdXwkABXipjVswXwe7+vlc
   TjfYvlxXpBV5hNe8rK2HdiHKvqTEjIThLsApahB0RnQmRPSwMlxbYc/bG
   MLxaMsu74xGMPF5cnK53EiCxzuCn8N6XzazGHlkqr7Fwey6Wlne0YB+Kv
   M/Pywv8iyJ50GPPjFxI35o2aDkrwfhEFcw2WUqR0oGi9jTO2lkWUb7QBT
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10599"; a="327478056"
X-IronPort-AV: E=Sophos;i="5.97,241,1669104000"; 
   d="scan'208";a="327478056"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jan 2023 18:51:36 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10599"; a="639429107"
X-IronPort-AV: E=Sophos;i="5.97,241,1669104000"; 
   d="scan'208";a="639429107"
Received: from lkp-server01.sh.intel.com (HELO 5646d64e7320) ([10.239.97.150])
  by orsmga006.jf.intel.com with ESMTP; 23 Jan 2023 18:51:34 -0800
Received: from kbuild by 5646d64e7320 with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1pK9PJ-00064G-2I;
        Tue, 24 Jan 2023 02:51:33 +0000
Date:   Tue, 24 Jan 2023 10:50:39 +0800
From:   kernel test robot <lkp@intel.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     linux-renesas-soc@vger.kernel.org
Subject: [geert-renesas-drivers:renesas-pinctrl-for-v6.3] BUILD SUCCESS
 b066e6ea98c7e3026f11ef2c04e070bcf35efda5
Message-ID: <63cf477f.WCVRBXjyEtBLPJBn%lkp@intel.com>
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

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git renesas-pinctrl-for-v6.3
branch HEAD: b066e6ea98c7e3026f11ef2c04e070bcf35efda5  pinctrl: renesas: r8a77950: Add VIN[45] pins, groups, and functions

elapsed time: 803m

configs tested: 75
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arc                                 defconfig
s390                             allmodconfig
alpha                               defconfig
s390                                defconfig
s390                             allyesconfig
powerpc                           allnoconfig
um                           x86_64_defconfig
um                             i386_defconfig
x86_64                            allnoconfig
x86_64                              defconfig
ia64                             allmodconfig
x86_64                               rhel-8.3
sh                               allmodconfig
arc                  randconfig-r043-20230123
i386                                defconfig
x86_64                           allyesconfig
x86_64               randconfig-a002-20230123
x86_64                    rhel-8.3-kselftests
x86_64               randconfig-a001-20230123
x86_64                          rhel-8.3-func
x86_64               randconfig-a004-20230123
arm                  randconfig-r046-20230123
mips                             allyesconfig
powerpc                          allmodconfig
arm                                 defconfig
x86_64               randconfig-a003-20230123
x86_64               randconfig-a005-20230123
x86_64               randconfig-a006-20230123
i386                             allyesconfig
x86_64                           rhel-8.3-kvm
x86_64                           rhel-8.3-bpf
i386                 randconfig-a006-20230123
x86_64                         rhel-8.3-kunit
x86_64                           rhel-8.3-syz
arm64                            allyesconfig
arm                              allyesconfig
i386                 randconfig-a003-20230123
i386                 randconfig-a002-20230123
alpha                            allyesconfig
i386                 randconfig-a004-20230123
arc                              allyesconfig
i386                 randconfig-a001-20230123
i386                 randconfig-a005-20230123
m68k                             allyesconfig
m68k                             allmodconfig
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
i386                 randconfig-a012-20230123
x86_64               randconfig-a013-20230123
x86_64                          rhel-8.3-rust
x86_64               randconfig-a011-20230123
s390                 randconfig-r044-20230123
x86_64               randconfig-a012-20230123
i386                 randconfig-a013-20230123
x86_64               randconfig-a014-20230123
i386                 randconfig-a015-20230123
x86_64               randconfig-a016-20230123
i386                 randconfig-a011-20230123
i386                 randconfig-a014-20230123
x86_64               randconfig-a015-20230123
riscv                randconfig-r042-20230123
hexagon              randconfig-r041-20230123
i386                 randconfig-a016-20230123
hexagon              randconfig-r045-20230123
x86_64               randconfig-k001-20230123
i386                          randconfig-a002
i386                          randconfig-a006
i386                          randconfig-a004

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
