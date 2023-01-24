Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1840E678D74
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 24 Jan 2023 02:33:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232119AbjAXBde (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 23 Jan 2023 20:33:34 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56126 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231544AbjAXBdd (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 23 Jan 2023 20:33:33 -0500
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 91D6E11EBD
        for <linux-renesas-soc@vger.kernel.org>; Mon, 23 Jan 2023 17:33:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1674524012; x=1706060012;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=rbiPTTp3oHkKFZ1jQOMZ46EYb635tKhB3zj8Y/ykjCg=;
  b=dqJxyUY9o4PMkUViTuzZF0IbbwkejAF9oo/BOVFSlvjD9knC9WqYL0jy
   pdwzLkgbEwqoAQRuuf2eeiICq2f4iE0qvZ73a7QOGhASUb9jmo1ScmOqE
   Uzgxb/fp0ZHBJ5LR3OzgSpB2+aPnF8M77j6aH2jT2yUR9OJBlHmUVopIE
   jaerLjzKM2LyzRHGgXQYDYuj1kB4AEgQow3J3ejVVkbVKnpbQlaQz5lsC
   1Ycc4BA2bkUPNaQirNhAh+TWuhlDKTMTi0A/5C74Dum8273r3grE1XZCg
   UIO636I58+1q8aQQk2aqRfK3I3NJvxY+hhrVFpbOE02l4+xX9YhNOQnjk
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10599"; a="412439768"
X-IronPort-AV: E=Sophos;i="5.97,240,1669104000"; 
   d="scan'208";a="412439768"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jan 2023 17:33:32 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10599"; a="655253092"
X-IronPort-AV: E=Sophos;i="5.97,240,1669104000"; 
   d="scan'208";a="655253092"
Received: from lkp-server01.sh.intel.com (HELO 5646d64e7320) ([10.239.97.150])
  by orsmga007.jf.intel.com with ESMTP; 23 Jan 2023 17:33:30 -0800
Received: from kbuild by 5646d64e7320 with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1pK8Bm-00060z-0i;
        Tue, 24 Jan 2023 01:33:30 +0000
Date:   Tue, 24 Jan 2023 09:32:55 +0800
From:   kernel test robot <lkp@intel.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     linux-renesas-soc@vger.kernel.org
Subject: [geert-renesas-devel:renesas-drivers-for-v6.3] BUILD SUCCESS
 0c56f949f626e59ef7c5b18e2706fed2a6afc4a2
Message-ID: <63cf3547.Gas6X7ejCNIxmeVj%lkp@intel.com>
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

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git renesas-drivers-for-v6.3
branch HEAD: 0c56f949f626e59ef7c5b18e2706fed2a6afc4a2  soc: renesas: Add PWC support for RZ/V2M

elapsed time: 726m

configs tested: 75
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
powerpc                           allnoconfig
x86_64                            allnoconfig
um                           x86_64_defconfig
um                             i386_defconfig
arc                                 defconfig
s390                             allmodconfig
alpha                               defconfig
s390                                defconfig
m68k                             allyesconfig
m68k                             allmodconfig
arc                              allyesconfig
alpha                            allyesconfig
ia64                             allmodconfig
x86_64                              defconfig
i386                                defconfig
s390                             allyesconfig
sh                               allmodconfig
x86_64                               rhel-8.3
i386                 randconfig-a004-20230123
i386                 randconfig-a003-20230123
x86_64                          rhel-8.3-func
i386                 randconfig-a002-20230123
i386                 randconfig-a001-20230123
x86_64                    rhel-8.3-kselftests
i386                 randconfig-a005-20230123
i386                 randconfig-a006-20230123
arc                  randconfig-r043-20230123
i386                             allyesconfig
arm                  randconfig-r046-20230123
x86_64               randconfig-a002-20230123
x86_64               randconfig-a004-20230123
x86_64               randconfig-a003-20230123
x86_64                           allyesconfig
x86_64               randconfig-a001-20230123
x86_64               randconfig-a005-20230123
x86_64                           rhel-8.3-syz
x86_64               randconfig-a006-20230123
x86_64                         rhel-8.3-kunit
x86_64                           rhel-8.3-kvm
x86_64                           rhel-8.3-bpf
mips                             allyesconfig
arm                                 defconfig
powerpc                          allmodconfig
arm64                            allyesconfig
arm                              allyesconfig
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
x86_64               randconfig-a013-20230123
x86_64               randconfig-a011-20230123
x86_64               randconfig-a012-20230123
x86_64               randconfig-a014-20230123
x86_64               randconfig-a015-20230123
x86_64               randconfig-a016-20230123
i386                 randconfig-a012-20230123
i386                 randconfig-a013-20230123
x86_64                          rhel-8.3-rust
i386                 randconfig-a011-20230123
hexagon              randconfig-r041-20230123
i386                 randconfig-a014-20230123
hexagon              randconfig-r045-20230123
s390                 randconfig-r044-20230123
i386                 randconfig-a016-20230123
i386                 randconfig-a015-20230123
riscv                randconfig-r042-20230123
x86_64               randconfig-k001-20230123
i386                          randconfig-a002
i386                          randconfig-a006
i386                          randconfig-a004

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
