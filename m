Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EB457679243
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 24 Jan 2023 08:47:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232782AbjAXHru (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 24 Jan 2023 02:47:50 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60904 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232226AbjAXHrt (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 24 Jan 2023 02:47:49 -0500
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0290086B5
        for <linux-renesas-soc@vger.kernel.org>; Mon, 23 Jan 2023 23:47:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1674546468; x=1706082468;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=4BfVG29ny6N+H2nBdGJiDCpBa5i0WM5XqY4OgbfqoMY=;
  b=nueDhL4P+c0geInjskWhsykn65LUjBF9LIb/7cJSsCT/gTQAlHAmIYt2
   vFlAD/5bZPIyzqd8A8stGf6N1T+ROXv/5Cb4mVp0uFh1AzTajCrvE7XED
   qLKYJ1UZMWvVsTl08R0QnmKnFzRnoeDMDk/7+SCq3l4+OOyDETfeWTvrz
   pkoZNFc/yeX3Y/VuwS0gYnhYse2bJ5oEpVBnlEXbjtU8aBMiNxFKd/ATj
   SYcjrjdhg0JTVozfLxi4kjskJNm1krWnpifpguuDzcl/h8m6XqIBXYXFU
   XpQutipg+pWLFgAaxSqKi4dXCIZnoX9udv89NfCiboqiwS1xNnxAUK9P3
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10599"; a="327501546"
X-IronPort-AV: E=Sophos;i="5.97,241,1669104000"; 
   d="scan'208";a="327501546"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jan 2023 23:47:47 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10599"; a="692507712"
X-IronPort-AV: E=Sophos;i="5.97,241,1669104000"; 
   d="scan'208";a="692507712"
Received: from lkp-server01.sh.intel.com (HELO 5646d64e7320) ([10.239.97.150])
  by orsmga008.jf.intel.com with ESMTP; 23 Jan 2023 23:47:46 -0800
Received: from kbuild by 5646d64e7320 with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1pKE1x-0006FU-0w;
        Tue, 24 Jan 2023 07:47:45 +0000
Date:   Tue, 24 Jan 2023 15:47:18 +0800
From:   kernel test robot <lkp@intel.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     linux-renesas-soc@vger.kernel.org
Subject: [geert-renesas-devel:renesas-dt-bindings-for-v6.3] BUILD SUCCESS
 6e1456f9251966d8fbfde2ae4750ba540b588533
Message-ID: <63cf8d06.RvDSi3mIwhM/irpc%lkp@intel.com>
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

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git renesas-dt-bindings-for-v6.3
branch HEAD: 6e1456f9251966d8fbfde2ae4750ba540b588533  dt-bindings: soc: renesas: Add RZ/V2M PWC

elapsed time: 1100m

configs tested: 97
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
powerpc                           allnoconfig
um                             i386_defconfig
um                           x86_64_defconfig
x86_64                            allnoconfig
arc                                 defconfig
s390                             allmodconfig
alpha                               defconfig
s390                                defconfig
s390                             allyesconfig
sh                               allmodconfig
arc                  randconfig-r043-20230123
x86_64                              defconfig
arm                  randconfig-r046-20230123
i386                                defconfig
x86_64                               rhel-8.3
mips                             allyesconfig
powerpc                          allmodconfig
i386                 randconfig-a004-20230123
ia64                             allmodconfig
x86_64               randconfig-a002-20230123
i386                 randconfig-a003-20230123
x86_64               randconfig-a001-20230123
i386                 randconfig-a002-20230123
x86_64                           allyesconfig
i386                 randconfig-a001-20230123
x86_64               randconfig-a004-20230123
x86_64               randconfig-a003-20230123
i386                 randconfig-a005-20230123
x86_64                    rhel-8.3-kselftests
x86_64               randconfig-a005-20230123
x86_64               randconfig-a006-20230123
i386                 randconfig-a006-20230123
i386                             allyesconfig
m68k                             allyesconfig
m68k                             allmodconfig
alpha                            allyesconfig
arc                              allyesconfig
x86_64                           rhel-8.3-syz
x86_64                         rhel-8.3-kunit
x86_64                           rhel-8.3-kvm
x86_64                           rhel-8.3-bpf
arm64                            allyesconfig
arm                                 defconfig
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
nios2                            allyesconfig
nios2                               defconfig
parisc                              defconfig
parisc64                            defconfig
parisc                           allyesconfig
powerpc                     ep8248e_defconfig
arm                           imxrt_defconfig
m68k                          atari_defconfig
m68k                             alldefconfig
arm                            mps2_defconfig
mips                        vocore2_defconfig
i386                          randconfig-c001
sparc                               defconfig
xtensa                           allyesconfig
csky                                defconfig
sparc                            allyesconfig
x86_64                                  kexec
loongarch                           defconfig
loongarch                         allnoconfig
loongarch                        allmodconfig
x86_64                          rhel-8.3-func

clang tested configs:
hexagon              randconfig-r041-20230123
hexagon              randconfig-r045-20230123
s390                 randconfig-r044-20230123
riscv                randconfig-r042-20230123
x86_64               randconfig-a013-20230123
x86_64               randconfig-a011-20230123
x86_64               randconfig-a012-20230123
x86_64               randconfig-a014-20230123
i386                 randconfig-a012-20230123
x86_64               randconfig-a016-20230123
i386                 randconfig-a013-20230123
x86_64               randconfig-a015-20230123
i386                 randconfig-a011-20230123
i386                 randconfig-a014-20230123
x86_64                          rhel-8.3-rust
i386                 randconfig-a016-20230123
i386                 randconfig-a015-20230123
x86_64               randconfig-k001-20230123
i386                          randconfig-a002
i386                          randconfig-a006
i386                          randconfig-a004
mips                      loongson3_defconfig
powerpc                    klondike_defconfig

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
