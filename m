Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EA86D67A91B
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 25 Jan 2023 04:09:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230510AbjAYDJi (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 24 Jan 2023 22:09:38 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39826 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229528AbjAYDJh (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 24 Jan 2023 22:09:37 -0500
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3F8FE1A4A1
        for <linux-renesas-soc@vger.kernel.org>; Tue, 24 Jan 2023 19:09:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1674616177; x=1706152177;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=X4s4G2Q97jtpbMLzlSnU2xP+92BU/gORyRO2ISJlp7o=;
  b=Bg1tQQQa4Hm3vQnFsblJoLAWIp88DKZxdFYtHQS5P9Zbf0OVPTxsklIH
   8VeYiRT6n/hv5Tv5YVHbKO+JzdAYvIQHBf+59T3nh6R5iUYfuoCJDrrvX
   5gy67Io8NvSezayVw4BOAm0azunQSpDrDyu0W0u3gJTKsNepwImFuTEf7
   9vgdnG7wKLhzKv97DX0CwLxOKn/XsFircp/sTrO0M7IWppytNX9NzuJKX
   dZd2NhPBFVLa5XeoD2ftKNImI21tYeQeTHKa+bxZXmDpB4/O8sK9V2cIt
   4mG6RyOgzZGZNkOKkMju/Ij03tmDASumA4FlyDgvzwf9ACs08SBQiiBjK
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10600"; a="327726557"
X-IronPort-AV: E=Sophos;i="5.97,244,1669104000"; 
   d="scan'208";a="327726557"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Jan 2023 19:09:36 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10600"; a="655656868"
X-IronPort-AV: E=Sophos;i="5.97,244,1669104000"; 
   d="scan'208";a="655656868"
Received: from lkp-server01.sh.intel.com (HELO 5646d64e7320) ([10.239.97.150])
  by orsmga007.jf.intel.com with ESMTP; 24 Jan 2023 19:09:35 -0800
Received: from kbuild by 5646d64e7320 with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1pKWAI-000708-1F;
        Wed, 25 Jan 2023 03:09:34 +0000
Date:   Wed, 25 Jan 2023 11:08:47 +0800
From:   kernel test robot <lkp@intel.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     linux-renesas-soc@vger.kernel.org
Subject: [geert-renesas-drivers:topic/board-farm] BUILD SUCCESS
 df459815dd2c5ebe56c0a3826e02bd0feded5608
Message-ID: <63d09d3f.eZrjSBXl0xolq4Yv%lkp@intel.com>
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

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git topic/board-farm
branch HEAD: df459815dd2c5ebe56c0a3826e02bd0feded5608  arm64: dts: renesas: white-hawk: Enable GP8_12 for wake-up

elapsed time: 723m

configs tested: 55
configs skipped: 93

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                  randconfig-r046-20230123
i386                          randconfig-c001
ia64                             allmodconfig
x86_64                          rhel-8.3-func
x86_64                    rhel-8.3-kselftests
i386                             allyesconfig
i386                                defconfig
x86_64                              defconfig
x86_64                           allyesconfig
x86_64                               rhel-8.3
m68k                             allyesconfig
m68k                             allmodconfig
arc                              allyesconfig
alpha                            allyesconfig
riscv                    nommu_virt_defconfig
riscv                          rv32_defconfig
riscv                    nommu_k210_defconfig
riscv                             allnoconfig
i386                   debian-10.3-kselftests
i386                              debian-10.3
arm64                            allyesconfig
arm                                 defconfig
arm                              allyesconfig
i386                          debian-10.3-kvm
i386                        debian-10.3-kunit
i386                         debian-10.3-func
x86_64               randconfig-a002-20230123
x86_64               randconfig-a005-20230123
x86_64               randconfig-a001-20230123
x86_64               randconfig-a006-20230123
x86_64               randconfig-a003-20230123
x86_64               randconfig-a004-20230123
x86_64                           rhel-8.3-kvm
x86_64                           rhel-8.3-syz
x86_64                           rhel-8.3-bpf
x86_64                         rhel-8.3-kunit

clang tested configs:
x86_64               randconfig-a013-20230123
x86_64               randconfig-a011-20230123
x86_64               randconfig-a016-20230123
x86_64               randconfig-a012-20230123
x86_64               randconfig-a015-20230123
x86_64               randconfig-a014-20230123
i386                          randconfig-a002
i386                          randconfig-a006
i386                          randconfig-a004
riscv                randconfig-r042-20230123
hexagon              randconfig-r041-20230123
hexagon              randconfig-r045-20230123
s390                 randconfig-r044-20230123
i386                 randconfig-a013-20230123
i386                 randconfig-a016-20230123
i386                 randconfig-a012-20230123
i386                 randconfig-a015-20230123
i386                 randconfig-a011-20230123
i386                 randconfig-a014-20230123

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
