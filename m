Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D942A756EDC
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 17 Jul 2023 23:16:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230232AbjGQVQq (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 17 Jul 2023 17:16:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52508 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230498AbjGQVQR (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 17 Jul 2023 17:16:17 -0400
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 09824F3
        for <linux-renesas-soc@vger.kernel.org>; Mon, 17 Jul 2023 14:16:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1689628577; x=1721164577;
  h=date:from:to:cc:subject:message-id;
  bh=3TCWBiYDxn9pzDDNK77xjKk47Jzck3DGEs1Tmgd85M4=;
  b=XFALpbeB8vYUb/6M0uFdulTV782x81jDrruIcQz5c/jpVSxBWc3Ox31T
   ePuosj1CUAIouUEw66w2pxJGfEZI7JJXfBSoboYJ8cyYnxcrxijl09YzI
   AzbJeB9o+darKdgQ9hbx+8VZSAoFUPd9l1hx+uWIa2zTR5wNZMCqcktRR
   QQZS3PryWO2XsunGV18gR1IE1+cYQlOXI3UEQe/vHD3Z+ReUSYYFsyctH
   hqT1IiqX3FYUKhvPFj2JroUnzgOObZxXEgH2aGsu6DiotgRHaSFVDQael
   jqtKM/AOA6xJPltA6UqUlfJxZiueM7IplY/RlrKen7Hr3sBCUvmfS5g+k
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10774"; a="346341803"
X-IronPort-AV: E=Sophos;i="6.01,211,1684825200"; 
   d="scan'208";a="346341803"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jul 2023 14:16:10 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10774"; a="813496641"
X-IronPort-AV: E=Sophos;i="6.01,211,1684825200"; 
   d="scan'208";a="813496641"
Received: from lkp-server01.sh.intel.com (HELO c544d7fc5005) ([10.239.97.150])
  by FMSMGA003.fm.intel.com with ESMTP; 17 Jul 2023 14:16:09 -0700
Received: from kbuild by c544d7fc5005 with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1qLVZg-0009ut-2X;
        Mon, 17 Jul 2023 21:16:08 +0000
Date:   Tue, 18 Jul 2023 05:15:22 +0800
From:   kernel test robot <lkp@intel.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     linux-renesas-soc@vger.kernel.org
Subject: [geert-renesas-devel:renesas-dts-for-v6.6] BUILD SUCCESS
 5617d91d0cf4b013ce4a305e8d88bc380fa50756
Message-ID: <202307180521.NsUURywk-lkp@intel.com>
User-Agent: s-nail v14.9.24
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git renesas-dts-for-v6.6
branch HEAD: 5617d91d0cf4b013ce4a305e8d88bc380fa50756  arm64: dts: renesas: rzg2lc-smarc-som: Enable PMIC and built-in RTC

elapsed time: 722m

configs tested: 32
configs skipped: 116

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
arm                              allmodconfig   gcc  
arm                              allyesconfig   gcc  
arm                                 defconfig   gcc  
arm                          pxa910_defconfig   gcc  
arm                  randconfig-r046-20230717   clang
arm                         s3c6400_defconfig   gcc  
arm64                            allyesconfig   gcc  
arm64                               defconfig   gcc  
m68k                        m5272c3_defconfig   gcc  
m68k                        stmark2_defconfig   gcc  
mips                          malta_defconfig   clang
mips                malta_qemu_32r6_defconfig   clang
mips                        qi_lb60_defconfig   clang
powerpc                     asp8347_defconfig   gcc  
powerpc                       eiger_defconfig   gcc  
powerpc                      katmai_defconfig   clang
powerpc                     ksi8560_defconfig   clang
powerpc                         ps3_defconfig   gcc  
riscv                            allmodconfig   gcc  
riscv                             allnoconfig   gcc  
riscv                            allyesconfig   gcc  
riscv                               defconfig   gcc  
riscv                randconfig-r032-20230717   clang
riscv                randconfig-r035-20230717   clang
riscv                randconfig-r042-20230717   gcc  
riscv                          rv32_defconfig   gcc  
sh                          lboxre2_defconfig   gcc  
sh                   rts7751r2dplus_defconfig   gcc  
sh                   sh7724_generic_defconfig   gcc  
um                               allmodconfig   clang
um                                allnoconfig   clang
um                               allyesconfig   clang

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
