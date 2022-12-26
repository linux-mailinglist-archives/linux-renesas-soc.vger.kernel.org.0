Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2EAF16565F9
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 27 Dec 2022 00:09:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232365AbiLZXJK (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 26 Dec 2022 18:09:10 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52866 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232371AbiLZXJG (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 26 Dec 2022 18:09:06 -0500
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B33DAEA4
        for <linux-renesas-soc@vger.kernel.org>; Mon, 26 Dec 2022 15:09:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1672096145; x=1703632145;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=ErbJV3fWHNcJ4C7/JIsCCfpeW2Gu77woiN3nRkIRfEI=;
  b=EBMyxENcIl4+k91HQuyYUKwc+1Hb5mENNNm+KteYtaEPuJJ6/8uBvd74
   GXP2qPnuxj7EYPVJpq8tjn96IfIOKtgESebl36x7NpC4A70qohB8dVbQ8
   EXSiiXfw//TxrlpUVDeVMh773gUVeEGyoIuv9cOW8sGFRWWqijXrorhuV
   SU9DUCJmIRrPTEqmXs26w5xAXwDciK5LlyuP55R5RrRxLxvh5p+cKLrh9
   2O3VI/6UqWB/vADW7mQjOxTi6G94h+eiRFQWaxAHj/IqFI1vvssQPP/2+
   w91Vz4FwUOgJHpRa0En89hBAUqNiLEdDQa5cDyG63ja9ZCC3cXSVWnQDj
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10572"; a="318287823"
X-IronPort-AV: E=Sophos;i="5.96,276,1665471600"; 
   d="scan'208";a="318287823"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Dec 2022 15:09:04 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10572"; a="652877060"
X-IronPort-AV: E=Sophos;i="5.96,276,1665471600"; 
   d="scan'208";a="652877060"
Received: from lkp-server01.sh.intel.com (HELO b5d47979f3ad) ([10.239.97.150])
  by orsmga002.jf.intel.com with ESMTP; 26 Dec 2022 15:09:03 -0800
Received: from kbuild by b5d47979f3ad with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1p9wac-000Ei2-0z;
        Mon, 26 Dec 2022 23:09:02 +0000
Date:   Tue, 27 Dec 2022 07:08:52 +0800
From:   kernel test robot <lkp@intel.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     linux-renesas-soc@vger.kernel.org
Subject: [geert-renesas-devel:next] BUILD SUCCESS
 7cf590dd42358e54ad3fa80910b9589add2b74a2
Message-ID: <63aa2984.7T7T7R0ksJ5b2Jrf%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git next
branch HEAD: 7cf590dd42358e54ad3fa80910b9589add2b74a2  Merge branches 'renesas-arm-defconfig-for-v6.3', 'renesas-arm-dt-for-v6.3', 'renesas-drivers-for-v6.3' and 'renesas-riscv-dt-for-v6.3' into renesas-next

elapsed time: 721m

configs tested: 91
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
powerpc                           allnoconfig
alpha                            allyesconfig
x86_64                              defconfig
m68k                             allyesconfig
m68k                             allmodconfig
arc                              allyesconfig
arc                                 defconfig
s390                             allmodconfig
x86_64                               rhel-8.3
alpha                               defconfig
um                             i386_defconfig
um                           x86_64_defconfig
x86_64                          rhel-8.3-func
i386                 randconfig-a011-20221226
i386                 randconfig-a013-20221226
i386                 randconfig-a014-20221226
i386                 randconfig-a012-20221226
x86_64                    rhel-8.3-kselftests
i386                 randconfig-a016-20221226
i386                 randconfig-a015-20221226
i386                                defconfig
x86_64                           rhel-8.3-bpf
x86_64                           rhel-8.3-kvm
s390                                defconfig
x86_64                           rhel-8.3-syz
sh                               allmodconfig
x86_64               randconfig-a014-20221226
x86_64               randconfig-a013-20221226
arm                                 defconfig
ia64                             allmodconfig
x86_64               randconfig-a011-20221226
x86_64                         rhel-8.3-kunit
x86_64               randconfig-a012-20221226
x86_64               randconfig-a015-20221226
arm64                            allyesconfig
x86_64                           allyesconfig
x86_64               randconfig-a016-20221226
mips                             allyesconfig
s390                             allyesconfig
powerpc                          allmodconfig
arm                              allyesconfig
arm                  randconfig-r046-20221225
i386                             allyesconfig
arc                  randconfig-r043-20221225
mips                         rt305x_defconfig
arm64                            alldefconfig
arc                  randconfig-r043-20221226
riscv                randconfig-r042-20221226
s390                 randconfig-r044-20221226
x86_64                            allnoconfig
i386                          randconfig-c001
x86_64                        randconfig-c001
arm                  randconfig-c002-20221225
riscv                    nommu_virt_defconfig
riscv                          rv32_defconfig
riscv                    nommu_k210_defconfig
riscv                             allnoconfig
i386                   debian-10.3-kselftests
i386                              debian-10.3
i386                          debian-10.3-kvm
i386                        debian-10.3-kunit
i386                         debian-10.3-func
powerpc                     tqm8541_defconfig
ia64                        generic_defconfig
powerpc                 mpc837x_mds_defconfig
loongarch                           defconfig
loongarch                         allnoconfig
loongarch                        allmodconfig

clang tested configs:
x86_64                          rhel-8.3-rust
i386                 randconfig-a004-20221226
i386                 randconfig-a001-20221226
i386                 randconfig-a003-20221226
i386                 randconfig-a002-20221226
x86_64               randconfig-a002-20221226
i386                 randconfig-a006-20221226
i386                 randconfig-a005-20221226
x86_64               randconfig-a003-20221226
x86_64               randconfig-a006-20221226
x86_64               randconfig-a001-20221226
x86_64               randconfig-a004-20221226
x86_64               randconfig-a005-20221226
hexagon              randconfig-r045-20221225
hexagon              randconfig-r041-20221225
hexagon              randconfig-r041-20221226
arm                  randconfig-r046-20221226
s390                 randconfig-r044-20221225
hexagon              randconfig-r045-20221226
arm                          pcm027_defconfig
powerpc                     ppa8548_defconfig
riscv                             allnoconfig
riscv                randconfig-r042-20221225
x86_64                        randconfig-k001

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
