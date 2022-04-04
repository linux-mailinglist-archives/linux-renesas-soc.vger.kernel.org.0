Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 46E504F20F8
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  5 Apr 2022 06:08:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230407AbiDEC5B (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 4 Apr 2022 22:57:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49854 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231700AbiDEC4y (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 4 Apr 2022 22:56:54 -0400
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A6025227C57
        for <linux-renesas-soc@vger.kernel.org>; Mon,  4 Apr 2022 19:06:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1649124405; x=1680660405;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=NRSJWeeSQlCocDJTng7vRMW3DoAkGQsM5syrNj7Sp38=;
  b=YYnBGAT6jV9YHiPFjIhB3sTYUU3rdnAbqnBM1n8iLZxKfCA1zCzlaIZF
   LUi379H7U+1I0h5h57dttiRcmJAQOAK35CIU0E9tfg0/2qFhuPESS12uW
   M5nJsYEsg2LajjiWghWrc0qxi0rGGv0UpvvlkihyopYo4VqtLls98AsfI
   5Ic437IXgnjEys0q0ElYUca6OpFV/1nMgJvHULBpG+ensghOGBaskK5xc
   +N406PkVqPZm5bNzFo+5zBBLfLvNTWxZqs6s/+nAjnt7vAIvOvZoyPKzs
   PdojqiWhK95DZLS3Att9izBzzmhKYbZdePbmj50aXqEjkQf2HCvtXC7Hc
   A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10307"; a="258218024"
X-IronPort-AV: E=Sophos;i="5.90,235,1643702400"; 
   d="scan'208";a="258218024"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Apr 2022 16:58:40 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,235,1643702400"; 
   d="scan'208";a="505085025"
Received: from lkp-server02.sh.intel.com (HELO a44fdfb70b94) ([10.239.97.151])
  by orsmga003.jf.intel.com with ESMTP; 04 Apr 2022 16:58:39 -0700
Received: from kbuild by a44fdfb70b94 with local (Exim 4.95)
        (envelope-from <lkp@intel.com>)
        id 1nbWak-0002Sl-Eu;
        Mon, 04 Apr 2022 23:58:38 +0000
Date:   Tue, 05 Apr 2022 07:58:01 +0800
From:   kernel test robot <lkp@intel.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     linux-renesas-soc@vger.kernel.org
Subject: [geert-renesas-devel:next] BUILD SUCCESS
 eee41de7440d0f559567f48dd5920f8155247174
Message-ID: <624b8609.3fubnvUdn4Kf0NTQ%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-6.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,HEXHASH_WORD,
        RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git next
branch HEAD: eee41de7440d0f559567f48dd5920f8155247174  Merge branches 'renesas-arm-defconfig-for-v5.19', 'renesas-arm-dt-for-v5.19', 'renesas-drivers-for-v5.19' and 'renesas-dt-bindings-for-v5.19' into renesas-next

elapsed time: 742m

configs tested: 106
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm64                               defconfig
arm64                            allyesconfig
arm                              allmodconfig
arm                                 defconfig
arm                              allyesconfig
i386                 randconfig-c001-20220404
powerpc                      ppc40x_defconfig
sh                           se7722_defconfig
xtensa                  nommu_kc705_defconfig
openrisc                 simple_smp_defconfig
parisc64                         alldefconfig
powerpc                        cell_defconfig
sh                          rsk7203_defconfig
sh                           se7206_defconfig
ia64                      gensparse_defconfig
sh                            hp6xx_defconfig
sh                        sh7785lcr_defconfig
x86_64               randconfig-c001-20220404
arm                  randconfig-c002-20220404
ia64                             allmodconfig
ia64                             allyesconfig
ia64                                defconfig
m68k                             allyesconfig
m68k                             allmodconfig
m68k                                defconfig
csky                                defconfig
nios2                            allyesconfig
alpha                               defconfig
alpha                            allyesconfig
h8300                            allyesconfig
xtensa                           allyesconfig
arc                                 defconfig
sh                               allmodconfig
s390                                defconfig
s390                             allmodconfig
parisc                              defconfig
parisc64                            defconfig
parisc                           allyesconfig
s390                             allyesconfig
nios2                               defconfig
arc                              allyesconfig
sparc                               defconfig
i386                             allyesconfig
sparc                            allyesconfig
i386                                defconfig
i386                   debian-10.3-kselftests
i386                              debian-10.3
mips                             allyesconfig
mips                             allmodconfig
powerpc                          allyesconfig
powerpc                           allnoconfig
powerpc                          allmodconfig
x86_64               randconfig-a015-20220404
x86_64               randconfig-a011-20220404
x86_64               randconfig-a014-20220404
x86_64               randconfig-a016-20220404
x86_64               randconfig-a012-20220404
x86_64               randconfig-a013-20220404
i386                 randconfig-a014-20220404
i386                 randconfig-a013-20220404
i386                 randconfig-a016-20220404
i386                 randconfig-a015-20220404
i386                 randconfig-a011-20220404
i386                 randconfig-a012-20220404
arc                  randconfig-r043-20220404
s390                 randconfig-r044-20220404
riscv                randconfig-r042-20220404
riscv                               defconfig
riscv                    nommu_virt_defconfig
riscv                          rv32_defconfig
riscv                    nommu_k210_defconfig
riscv                             allnoconfig
riscv                            allmodconfig
riscv                            allyesconfig
x86_64                    rhel-8.3-kselftests
um                           x86_64_defconfig
um                             i386_defconfig
x86_64                          rhel-8.3-func
x86_64                         rhel-8.3-kunit
x86_64                                  kexec
x86_64                              defconfig
x86_64                           allyesconfig
x86_64                               rhel-8.3

clang tested configs:
i386                 randconfig-c001-20220404
x86_64               randconfig-c007-20220404
powerpc              randconfig-c003-20220404
riscv                randconfig-c006-20220404
mips                 randconfig-c004-20220404
arm                  randconfig-c002-20220404
mips                      pic32mzda_defconfig
powerpc                      katmai_defconfig
mips                     loongson1c_defconfig
mips                  cavium_octeon_defconfig
arm                        multi_v5_defconfig
powerpc                        icon_defconfig
arm                             mxs_defconfig
x86_64               randconfig-a006-20220404
x86_64               randconfig-a002-20220404
x86_64               randconfig-a001-20220404
x86_64               randconfig-a005-20220404
x86_64               randconfig-a003-20220404
x86_64               randconfig-a004-20220404
i386                 randconfig-a006-20220404
i386                 randconfig-a002-20220404
i386                 randconfig-a001-20220404
i386                 randconfig-a004-20220404
i386                 randconfig-a003-20220404
i386                 randconfig-a005-20220404

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
