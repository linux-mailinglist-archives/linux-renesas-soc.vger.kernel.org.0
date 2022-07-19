Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 28C0A57A74D
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 19 Jul 2022 21:38:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229379AbiGSTic (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 19 Jul 2022 15:38:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56066 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236423AbiGSTib (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 19 Jul 2022 15:38:31 -0400
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 372A54504C
        for <linux-renesas-soc@vger.kernel.org>; Tue, 19 Jul 2022 12:38:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1658259510; x=1689795510;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=byZqs2XJz0gI+VKeCZxHO2C+WXDARxNAE98F7Fk8Fr4=;
  b=ahxnrPPUSc5qf1agvrU5Puv8tSLKB/RD5O7mMu3Tc03Gfop4g79V1sG/
   UwixfCY0Y8sdnTT1M+97dkGi5YshpFpOFN8P5u7O8DpGFy/nvmxvF9nHT
   ehr1N9d37TGcoPAs4kdsJqlNPEn6nawjsHClxwy714ETHx2GEzzszrszX
   iP9gD/JcdmPZMnNgbGhAo/KpA7VjrvsZmeUMpZUgOvzYDwwhGIBYJWYaD
   s3RbNNJ9Q7Vf7vCa3uC9xFYxylZQPdQsfla1RYgvu1Ybv3CzsTAT/okk8
   ibNr1nyeZpEf+zDn4nt/J/OnHD/MSbeGfDa09fRC63zmZ55OvhuknAmr1
   w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10413"; a="285335051"
X-IronPort-AV: E=Sophos;i="5.92,285,1650956400"; 
   d="scan'208";a="285335051"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jul 2022 12:38:30 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.92,285,1650956400"; 
   d="scan'208";a="665563867"
Received: from lkp-server02.sh.intel.com (HELO ff137eb26ff1) ([10.239.97.151])
  by fmsmga004.fm.intel.com with ESMTP; 19 Jul 2022 12:38:29 -0700
Received: from kbuild by ff137eb26ff1 with local (Exim 4.95)
        (envelope-from <lkp@intel.com>)
        id 1oDt36-0005xk-G5;
        Tue, 19 Jul 2022 19:38:28 +0000
Date:   Wed, 20 Jul 2022 03:37:49 +0800
From:   kernel test robot <lkp@intel.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     linux-renesas-soc@vger.kernel.org
Subject: [geert-renesas-devel:master] BUILD SUCCESS
 0ed956116e133fb9ad4e9ddbc9a88031a5bf6c8d
Message-ID: <62d7080d.ZQIVLMvgIY466zD+%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-5.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git master
branch HEAD: 0ed956116e133fb9ad4e9ddbc9a88031a5bf6c8d  Merge branch 'renesas-arm-dt-for-v5.21' into renesas-devel

elapsed time: 730m

configs tested: 52
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                                 defconfig
arm                              allyesconfig
arm64                            allyesconfig
ia64                             allmodconfig
powerpc                           allnoconfig
powerpc                          allmodconfig
mips                             allyesconfig
sh                               allmodconfig
i386                                defconfig
i386                             allyesconfig
arc                              allyesconfig
alpha                            allyesconfig
m68k                             allyesconfig
m68k                             allmodconfig
x86_64                        randconfig-a004
x86_64                        randconfig-a002
x86_64                        randconfig-a006
x86_64               randconfig-a013-20220718
x86_64               randconfig-a012-20220718
x86_64               randconfig-a011-20220718
x86_64               randconfig-a015-20220718
x86_64               randconfig-a014-20220718
x86_64               randconfig-a016-20220718
i386                 randconfig-a011-20220718
i386                 randconfig-a013-20220718
i386                 randconfig-a016-20220718
i386                 randconfig-a012-20220718
i386                 randconfig-a015-20220718
i386                 randconfig-a014-20220718
arc                  randconfig-r043-20220718
riscv                randconfig-r042-20220718
s390                 randconfig-r044-20220718
um                             i386_defconfig
um                           x86_64_defconfig
x86_64                              defconfig
x86_64                           allyesconfig
x86_64                               rhel-8.3
x86_64                    rhel-8.3-kselftests
x86_64                          rhel-8.3-func
x86_64                         rhel-8.3-kunit
x86_64                           rhel-8.3-syz

clang tested configs:
x86_64                        randconfig-a001
x86_64                        randconfig-a003
x86_64                        randconfig-a005
i386                 randconfig-a003-20220718
i386                 randconfig-a001-20220718
i386                 randconfig-a002-20220718
i386                 randconfig-a006-20220718
i386                 randconfig-a004-20220718
i386                 randconfig-a005-20220718
hexagon              randconfig-r041-20220718
hexagon              randconfig-r045-20220718

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
