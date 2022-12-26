Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E84C46565F6
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 27 Dec 2022 00:09:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229791AbiLZXJH (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 26 Dec 2022 18:09:07 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52852 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232314AbiLZXJF (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 26 Dec 2022 18:09:05 -0500
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0EC03EB3
        for <linux-renesas-soc@vger.kernel.org>; Mon, 26 Dec 2022 15:09:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1672096145; x=1703632145;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=PqtcFaIoqJ0qQ9X7RU7Xpfgis4cT8SVZTHjApZzQ/zg=;
  b=KRNFfsF4QZqywfnhjXnkF2QhUUTznYBPO3tSGI1K1FSPugDGyHBWEreP
   cn+G5JER4WiJ7yDiFtvzw3PpqviVuFe5tCc4PF2ZhM9uOLBJzVIHROf2i
   DR7MD+3qM7VSaJfJez7jl3MDZnUnAgFur4MmFo+UqcmiiTfiEUsR7wh+P
   QpKosbIkHm3ichKatupFrpUPGMgtT3A44ReDWvmyu6PYhKWdZsD1OxNqF
   jtlqAcgkufRmNlC4aR3P6JoWXErn1KX0AFOD51Z1k+dWqUT8jINsOeaGp
   eI5SSo1S9dw0Fb8ozVwnzrEE4T2kmE3S0cKGYnjxuBEV28gUMqLOSyufR
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10572"; a="347808774"
X-IronPort-AV: E=Sophos;i="5.96,276,1665471600"; 
   d="scan'208";a="347808774"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Dec 2022 15:09:03 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10572"; a="630519067"
X-IronPort-AV: E=Sophos;i="5.96,276,1665471600"; 
   d="scan'208";a="630519067"
Received: from lkp-server01.sh.intel.com (HELO b5d47979f3ad) ([10.239.97.150])
  by orsmga006.jf.intel.com with ESMTP; 26 Dec 2022 15:09:02 -0800
Received: from kbuild by b5d47979f3ad with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1p9wab-000Ehn-30;
        Mon, 26 Dec 2022 23:09:01 +0000
Date:   Tue, 27 Dec 2022 07:08:47 +0800
From:   kernel test robot <lkp@intel.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     linux-renesas-soc@vger.kernel.org
Subject: [geert-renesas-devel:renesas-r8a779g0-dt-binding-defs] BUILD
 SUCCESS 0985cd52087d55cc7a85db1cbc48bf4ad3c3b475
Message-ID: <63aa297f.hHYssT9PTA5mOg9W%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git renesas-r8a779g0-dt-binding-defs
branch HEAD: 0985cd52087d55cc7a85db1cbc48bf4ad3c3b475  dt-bindings: power: r8a779g0: Add missing A3DUL power domain

elapsed time: 720m

configs tested: 91
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
um                             i386_defconfig
ia64                             allmodconfig
um                           x86_64_defconfig
arc                                 defconfig
s390                             allmodconfig
alpha                               defconfig
s390                                defconfig
s390                             allyesconfig
i386                 randconfig-a012-20221226
i386                 randconfig-a011-20221226
i386                 randconfig-a013-20221226
i386                 randconfig-a014-20221226
i386                 randconfig-a016-20221226
i386                 randconfig-a015-20221226
x86_64                              defconfig
x86_64                               rhel-8.3
x86_64               randconfig-a014-20221226
x86_64                           allyesconfig
x86_64               randconfig-a013-20221226
x86_64               randconfig-a011-20221226
x86_64               randconfig-a012-20221226
x86_64                          rhel-8.3-func
i386                                defconfig
x86_64                    rhel-8.3-kselftests
arm                                 defconfig
arm                              allyesconfig
arm64                            allyesconfig
x86_64               randconfig-a016-20221226
x86_64               randconfig-a015-20221226
powerpc                           allnoconfig
powerpc                          allmodconfig
alpha                            allyesconfig
x86_64                           rhel-8.3-bpf
mips                             allyesconfig
arc                              allyesconfig
x86_64                           rhel-8.3-syz
m68k                             allyesconfig
x86_64                           rhel-8.3-kvm
x86_64                         rhel-8.3-kunit
m68k                             allmodconfig
sh                               allmodconfig
i386                             allyesconfig
arm                  randconfig-r046-20221225
arc                  randconfig-r043-20221225
arc                  randconfig-r043-20221226
riscv                randconfig-r042-20221226
s390                 randconfig-r044-20221226
x86_64                            allnoconfig
mips                         rt305x_defconfig
arm64                            alldefconfig
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
x86_64               randconfig-a002-20221226
i386                 randconfig-a005-20221226
x86_64               randconfig-a003-20221226
i386                 randconfig-a004-20221226
i386                 randconfig-a001-20221226
i386                 randconfig-a003-20221226
x86_64               randconfig-a006-20221226
x86_64               randconfig-a001-20221226
hexagon              randconfig-r045-20221225
hexagon              randconfig-r041-20221225
i386                 randconfig-a002-20221226
x86_64               randconfig-a004-20221226
i386                 randconfig-a006-20221226
x86_64               randconfig-a005-20221226
hexagon              randconfig-r041-20221226
arm                  randconfig-r046-20221226
s390                 randconfig-r044-20221225
hexagon              randconfig-r045-20221226
riscv                randconfig-r042-20221225
arm                          pcm027_defconfig
powerpc                     ppa8548_defconfig
riscv                             allnoconfig
x86_64                        randconfig-k001

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
