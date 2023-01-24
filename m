Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 012EE679227
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 24 Jan 2023 08:40:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232226AbjAXHkF (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 24 Jan 2023 02:40:05 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58870 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232152AbjAXHkD (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 24 Jan 2023 02:40:03 -0500
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 10611EC5C
        for <linux-renesas-soc@vger.kernel.org>; Mon, 23 Jan 2023 23:40:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1674546003; x=1706082003;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=5zg99313FVvb4XwpViGJmZ1mLQIIE5Tj9i4QkkqdNJE=;
  b=kRP1G9QHyHDYEAu759HXbwNeDvmEnMw7pWfLXH3jQXb4egWha2u7k7RG
   U4cUTpv7NIBWdH5140HHfy3KK20OTu3es2l1HCeYKWJcnc5gzo1tkRJYa
   b49IKV559IwtsBNjkN7r7IHF5cOZCpahTeDIcFiE0sHTbbPUOWCRIlvpy
   xryPSRUXXJTqpHyKjaXQwfInGdiLIwniAxfc6gsBCUhnA456rmhb6N6/Z
   IO89PjFiqWes2eIPEPStbcDSxqkj0YJ/3UhSumXQd161cVR6dw0NAJ+hl
   iUwrqLHWd4Qr+iJwA+gJEjfhPO2KrWNly/DQvZeViZ2zEh8NWBv4SE75Y
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10599"; a="328331672"
X-IronPort-AV: E=Sophos;i="5.97,241,1669104000"; 
   d="scan'208";a="328331672"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jan 2023 23:39:51 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10599"; a="639486867"
X-IronPort-AV: E=Sophos;i="5.97,241,1669104000"; 
   d="scan'208";a="639486867"
Received: from lkp-server01.sh.intel.com (HELO 5646d64e7320) ([10.239.97.150])
  by orsmga006.jf.intel.com with ESMTP; 23 Jan 2023 23:39:50 -0800
Received: from kbuild by 5646d64e7320 with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1pKDuC-0006F4-2T;
        Tue, 24 Jan 2023 07:39:44 +0000
Date:   Tue, 24 Jan 2023 15:39:16 +0800
From:   kernel test robot <lkp@intel.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     linux-renesas-soc@vger.kernel.org
Subject: [geert-renesas-drivers:topic/r8a779g0-canfd-v1] BUILD SUCCESS
 43e978993737b54b88132763180bd750be91b968
Message-ID: <63cf8b24.lHUdl9VJxrear3wW%lkp@intel.com>
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

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git topic/r8a779g0-canfd-v1
branch HEAD: 43e978993737b54b88132763180bd750be91b968  [LOCAL] arm64: renesas: defconfig: Enable CAN transceiver PHY support

elapsed time: 722m

configs tested: 62
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
x86_64                            allnoconfig
powerpc                           allnoconfig
um                             i386_defconfig
um                           x86_64_defconfig
m68k                             allmodconfig
alpha                            allyesconfig
m68k                             allyesconfig
arc                              allyesconfig
arc                                 defconfig
s390                             allmodconfig
alpha                               defconfig
s390                                defconfig
s390                             allyesconfig
arc                  randconfig-r043-20230123
arm                  randconfig-r046-20230123
sh                               allmodconfig
i386                                defconfig
mips                             allyesconfig
x86_64                              defconfig
i386                 randconfig-a004-20230123
i386                 randconfig-a003-20230123
x86_64                               rhel-8.3
i386                 randconfig-a002-20230123
powerpc                          allmodconfig
ia64                             allmodconfig
x86_64                           rhel-8.3-kvm
i386                 randconfig-a001-20230123
arm                                 defconfig
i386                 randconfig-a005-20230123
x86_64                           rhel-8.3-bpf
i386                 randconfig-a006-20230123
x86_64                           rhel-8.3-syz
x86_64                         rhel-8.3-kunit
x86_64               randconfig-a002-20230123
arm64                            allyesconfig
x86_64               randconfig-a001-20230123
x86_64                    rhel-8.3-kselftests
x86_64                           allyesconfig
x86_64               randconfig-a004-20230123
x86_64                          rhel-8.3-func
x86_64               randconfig-a003-20230123
arm                              allyesconfig
x86_64               randconfig-a005-20230123
x86_64               randconfig-a006-20230123
i386                             allyesconfig

clang tested configs:
hexagon              randconfig-r041-20230123
hexagon              randconfig-r045-20230123
s390                 randconfig-r044-20230123
riscv                randconfig-r042-20230123
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

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
