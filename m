Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9A6ED6392AF
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 26 Nov 2022 01:23:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229806AbiKZAXv (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 25 Nov 2022 19:23:51 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38818 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229570AbiKZAXu (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 25 Nov 2022 19:23:50 -0500
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EBD1B50D68
        for <linux-renesas-soc@vger.kernel.org>; Fri, 25 Nov 2022 16:23:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1669422229; x=1700958229;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=Qxx7f6NaJzQ72kTSO8vwtv/BfukNDFU8aKLrt7AfnfM=;
  b=ISz92G/v9l1ZnGOuHnqO7r/MSxnvh9I9/L6RfQwFR8skSaRUm7AAUino
   xY0Vtj9fOlYXizcQqnNmFbcKxp2op8pib0Q3ckLLonI7CUrBAGc3UEZHo
   uk9sIsa0QcnJFTGyD5zzsb3f/pwlITOVz4jOYvCinJl2wDLVqeG/jn+PP
   h2nLAdkc7bxZ1sAGHPdjkbie7TKqpm68UU9p0anuVFDL0PB8wKVNcqbi9
   p0jGwLQoXEWPUopIUWaMGHIfnY1QdWqqG2O6O8Dw2m586hkzFP07/veL5
   aCI7UPIRcPOAJq3XwF5Y+LF8Rry3sNXaBuWBQNGZSsgh1/i9L7A2nBDRq
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10542"; a="297909024"
X-IronPort-AV: E=Sophos;i="5.96,194,1665471600"; 
   d="scan'208";a="297909024"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Nov 2022 16:23:49 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10542"; a="887814970"
X-IronPort-AV: E=Sophos;i="5.96,194,1665471600"; 
   d="scan'208";a="887814970"
Received: from lkp-server01.sh.intel.com (HELO 64a2d449c951) ([10.239.97.150])
  by fmsmga006.fm.intel.com with ESMTP; 25 Nov 2022 16:23:48 -0800
Received: from kbuild by 64a2d449c951 with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1oyiyx-0005f7-2M;
        Sat, 26 Nov 2022 00:23:47 +0000
Date:   Sat, 26 Nov 2022 08:22:48 +0800
From:   kernel test robot <lkp@intel.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     linux-renesas-soc@vger.kernel.org
Subject: [geert-renesas-drivers:topic/renesas-bsp-rebase-v6.1] BUILD
 SUCCESS 9133dfc7c23f176844258cc79db221d789c4d009
Message-ID: <63815c58.KICkAxsIrIQgHHt5%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,
        SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git topic/renesas-bsp-rebase-v6.1
branch HEAD: 9133dfc7c23f176844258cc79db221d789c4d009  BSP rebase: Drop upstreamed r8a779g0 and White-Hawk DTS patches

elapsed time: 733m

configs tested: 40
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
um                             i386_defconfig
arc                  randconfig-r043-20221125
um                           x86_64_defconfig
riscv                randconfig-r042-20221125
s390                 randconfig-r044-20221125
arc                                 defconfig
s390                             allmodconfig
alpha                               defconfig
s390                                defconfig
x86_64                          rhel-8.3-func
s390                             allyesconfig
x86_64                    rhel-8.3-kselftests
ia64                             allmodconfig
powerpc                           allnoconfig
powerpc                          allmodconfig
mips                             allyesconfig
sh                               allmodconfig
x86_64                           rhel-8.3-syz
x86_64                         rhel-8.3-kunit
x86_64                           rhel-8.3-kvm
alpha                            allyesconfig
m68k                             allmodconfig
arc                              allyesconfig
m68k                             allyesconfig
x86_64                            allnoconfig
x86_64                              defconfig
x86_64                           allyesconfig
x86_64                               rhel-8.3
i386                             allyesconfig
i386                                defconfig
arm64                            allyesconfig
arm                                 defconfig
arm                              allyesconfig

clang tested configs:
hexagon              randconfig-r045-20221125
hexagon              randconfig-r041-20221125
s390                 randconfig-r044-20221124
hexagon              randconfig-r041-20221124
riscv                randconfig-r042-20221124
hexagon              randconfig-r045-20221124
x86_64                        randconfig-k001

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
