Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DFD4A5BC117
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 19 Sep 2022 03:44:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229447AbiISBo6 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Sun, 18 Sep 2022 21:44:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45716 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229541AbiISBo5 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sun, 18 Sep 2022 21:44:57 -0400
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E406665F6
        for <linux-renesas-soc@vger.kernel.org>; Sun, 18 Sep 2022 18:44:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1663551896; x=1695087896;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=b3UWjm/lBJN0BNm6UIykOr70XWVMC2btRWhAvu3Ib4o=;
  b=b8Rt8NDS+sYcmbCM6NWeczLLMH5CMi9r5euXXVADbLlvdoxgnqBsZUzK
   8l/K9azZufCadCI+UQeFYbGw3vWeJ4ko9Aw746m858rGVqQGj1DyAaqxM
   RvGtkOyFxhMH6xI4qaPTiACEV4Sj3xVe1F17YOq/JRwxmZyjNfrJOxrua
   4bszhHlR0fLHz9Yfchu85ZHDmqT4w5C9GwCLwduFvjOLjuQnnH8h+POeh
   96jMpaMJXwSceEavfBcWw0NQm5rioMxaHEey28zbjPr9dIMurmtrLvOGX
   c/3O2jkhCsCEKhocJ/t1H293MfyjRRU7y6lsX0CMkLCWVZODkPialEPwI
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10474"; a="299276535"
X-IronPort-AV: E=Sophos;i="5.93,325,1654585200"; 
   d="scan'208";a="299276535"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Sep 2022 18:44:56 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,325,1654585200"; 
   d="scan'208";a="595898918"
Received: from lkp-server01.sh.intel.com (HELO c0a60f19fe7e) ([10.239.97.150])
  by orsmga006.jf.intel.com with ESMTP; 18 Sep 2022 18:44:55 -0700
Received: from kbuild by c0a60f19fe7e with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1oa5qA-0001cT-1K;
        Mon, 19 Sep 2022 01:44:54 +0000
Date:   Mon, 19 Sep 2022 09:44:39 +0800
From:   kernel test robot <lkp@intel.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     linux-renesas-soc@vger.kernel.org
Subject: [geert-renesas-devel:next] BUILD SUCCESS
 2918d1d088b5c12f5449318fd4a0230455fa5752
Message-ID: <6327c987.c0hSJivIrLB/y4j8%lkp@intel.com>
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
branch HEAD: 2918d1d088b5c12f5449318fd4a0230455fa5752  Merge branches 'renesas-arm-dt-for-v6.1' and 'renesas-arm-soc-for-v6.1' into renesas-next

elapsed time: 722m

configs tested: 82
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
um                             i386_defconfig
um                           x86_64_defconfig
arc                  randconfig-r043-20220918
powerpc                          allmodconfig
mips                             allyesconfig
powerpc                           allnoconfig
x86_64                              defconfig
i386                                defconfig
x86_64                               rhel-8.3
sh                               allmodconfig
x86_64                        randconfig-a013
arc                                 defconfig
x86_64                        randconfig-a011
i386                             allyesconfig
x86_64                           allyesconfig
x86_64                        randconfig-a004
i386                          randconfig-a001
s390                             allmodconfig
x86_64                        randconfig-a002
x86_64                        randconfig-a015
alpha                               defconfig
x86_64                        randconfig-a006
s390                                defconfig
i386                          randconfig-a005
arm                                 defconfig
i386                          randconfig-a003
i386                          randconfig-a014
i386                          randconfig-a012
i386                          randconfig-a016
x86_64                           rhel-8.3-kvm
s390                             allyesconfig
m68k                             allmodconfig
x86_64                    rhel-8.3-kselftests
arc                              allyesconfig
x86_64                           rhel-8.3-syz
alpha                            allyesconfig
arm                              allyesconfig
m68k                             allyesconfig
arm64                            allyesconfig
x86_64                          rhel-8.3-func
x86_64                         rhel-8.3-kunit
ia64                             allmodconfig
csky                              allnoconfig
alpha                             allnoconfig
arc                               allnoconfig
riscv                             allnoconfig
sh                           se7750_defconfig
arm                        cerfcube_defconfig
arm                      jornada720_defconfig
arm                           imxrt_defconfig
powerpc                       maple_defconfig
arc                         haps_hs_defconfig
arm                            mps2_defconfig
powerpc                          allyesconfig
riscv                               defconfig
riscv                            allmodconfig
riscv                            allyesconfig
nios2                            allyesconfig
nios2                               defconfig
parisc                              defconfig
parisc64                            defconfig
parisc                           allyesconfig

clang tested configs:
hexagon              randconfig-r041-20220918
hexagon              randconfig-r045-20220918
riscv                randconfig-r042-20220918
s390                 randconfig-r044-20220918
x86_64                        randconfig-a012
x86_64                        randconfig-a001
i386                          randconfig-a002
x86_64                        randconfig-a016
x86_64                        randconfig-a003
x86_64                        randconfig-a014
i386                          randconfig-a004
x86_64                        randconfig-a005
i386                          randconfig-a013
i386                          randconfig-a006
i386                          randconfig-a011
i386                          randconfig-a015
arm                      tct_hammer_defconfig
powerpc                     ksi8560_defconfig
x86_64                        randconfig-k001
mips                          malta_defconfig

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
