Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 63B6F678D75
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 24 Jan 2023 02:33:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232250AbjAXBde (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 23 Jan 2023 20:33:34 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56132 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231681AbjAXBdd (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 23 Jan 2023 20:33:33 -0500
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 051D81258F
        for <linux-renesas-soc@vger.kernel.org>; Mon, 23 Jan 2023 17:33:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1674524012; x=1706060012;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=YazuO2s0ntfnIQvbrk4z+gpSAkP1jwlhIBkfq3KFjTY=;
  b=V4Tk4FQupSkP9Pl56XYQAYvY58cukaWk/gyGK6sAhe5Sjs3LqjMFG/vG
   sOmudhVcAynkS/5QAzcaokizIpH8pES8DIGmMhLWos8pvRWF+pkB+N38k
   fQO5g7m5A7txJc657HXVqttxOSjSrgir+osoOdH+H9cjehY2Umi1G8Gv6
   rGLrSxl+xyI2Lilx3mwSSe0CN6FtkRF46V7sGa2MdT4Y4+a4lXWtibCtz
   AgrUO0xZlifQwFc5cgU2ZnTeB5HQ2QXm+71/TXYgHXVQTPeo6+Ov5oPsS
   lAURQrIocoQIc3j5ma2W/My96pkXQKGm4XH/9nFi/e6NURZYyChLOLQsA
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10599"; a="390716274"
X-IronPort-AV: E=Sophos;i="5.97,240,1669104000"; 
   d="scan'208";a="390716274"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jan 2023 17:33:32 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10599"; a="725295480"
X-IronPort-AV: E=Sophos;i="5.97,240,1669104000"; 
   d="scan'208";a="725295480"
Received: from lkp-server01.sh.intel.com (HELO 5646d64e7320) ([10.239.97.150])
  by fmsmga008.fm.intel.com with ESMTP; 23 Jan 2023 17:33:31 -0800
Received: from kbuild by 5646d64e7320 with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1pK8Bm-000615-0p;
        Tue, 24 Jan 2023 01:33:30 +0000
Date:   Tue, 24 Jan 2023 09:32:52 +0800
From:   kernel test robot <lkp@intel.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     linux-renesas-soc@vger.kernel.org
Subject: [geert-renesas-devel:next] BUILD SUCCESS
 d06e3b65fc366ccb7280d85b17df5a47b9b50efd
Message-ID: <63cf3544.qdJIeVOOsdDt7ApX%lkp@intel.com>
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

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git next
branch HEAD: d06e3b65fc366ccb7280d85b17df5a47b9b50efd  Merge branches 'renesas-drivers-for-v6.3', 'renesas-dt-bindings-for-v6.3' and 'renesas-dts-for-v6.3' into renesas-next

elapsed time: 726m

configs tested: 75
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
alpha                            allyesconfig
m68k                             allmodconfig
arc                              allyesconfig
m68k                             allyesconfig
powerpc                           allnoconfig
arc                                 defconfig
s390                             allmodconfig
um                             i386_defconfig
alpha                               defconfig
x86_64                            allnoconfig
um                           x86_64_defconfig
s390                                defconfig
ia64                             allmodconfig
s390                             allyesconfig
sh                               allmodconfig
x86_64                              defconfig
i386                                defconfig
x86_64                               rhel-8.3
mips                             allyesconfig
powerpc                          allmodconfig
x86_64                    rhel-8.3-kselftests
x86_64                          rhel-8.3-func
arc                  randconfig-r043-20230123
x86_64                           allyesconfig
arm                  randconfig-r046-20230123
i386                 randconfig-a003-20230123
i386                 randconfig-a002-20230123
x86_64               randconfig-a002-20230123
i386                 randconfig-a001-20230123
arm                                 defconfig
i386                 randconfig-a004-20230123
x86_64               randconfig-a001-20230123
i386                 randconfig-a005-20230123
x86_64                           rhel-8.3-syz
i386                 randconfig-a006-20230123
x86_64               randconfig-a004-20230123
x86_64                         rhel-8.3-kunit
x86_64                           rhel-8.3-kvm
x86_64               randconfig-a003-20230123
x86_64                           rhel-8.3-bpf
x86_64               randconfig-a005-20230123
x86_64               randconfig-a006-20230123
arm64                            allyesconfig
arm                              allyesconfig
i386                             allyesconfig
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
x86_64                          rhel-8.3-rust
hexagon              randconfig-r041-20230123
riscv                randconfig-r042-20230123
hexagon              randconfig-r045-20230123
s390                 randconfig-r044-20230123
i386                 randconfig-a014-20230123
i386                 randconfig-a012-20230123
i386                 randconfig-a013-20230123
i386                 randconfig-a011-20230123
i386                 randconfig-a016-20230123
i386                 randconfig-a015-20230123
x86_64               randconfig-k001-20230123
i386                          randconfig-a002
i386                          randconfig-a006
i386                          randconfig-a004

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
