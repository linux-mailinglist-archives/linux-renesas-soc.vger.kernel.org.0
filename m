Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 04F2569E9BD
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 21 Feb 2023 22:49:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229589AbjBUVts (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 21 Feb 2023 16:49:48 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52660 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230195AbjBUVtq (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 21 Feb 2023 16:49:46 -0500
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AB09C30B17
        for <linux-renesas-soc@vger.kernel.org>; Tue, 21 Feb 2023 13:49:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1677016184; x=1708552184;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=+i1xSsDzb760xwx45Pl0464af4cPdXOrd0At7aibJGc=;
  b=f5zLbmQsvHfj8MYxTNDu8uUTqlMbishyT6TX+d7/BPgEmA42QujdG6ui
   uXFsCDAVuJFmzh+ntfFzYSLJKzvlNx9QLkv8NWwIt/+8tPJAdeKOZBuxa
   zUi0YzINJHtTpkf99VbT5rA32nkyUbq1EejHWkblwQ1cRBacqOVBCYvcQ
   q6/QICDgHXunYPQfzJUicMkt4C5dM5YoB8tG5RScMvPYV3W7pfyKptyiD
   9OKtPuTmPrtKVzes7caJef+MdjFypJZWC0z2UYlnBKAVj8KZzuBwtalfY
   +OWrrE+E95jZSqdYcbNN0lM4iQPvFeJQTMldYFu85tmPTLvpdugxNIzIJ
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10628"; a="360240796"
X-IronPort-AV: E=Sophos;i="5.97,317,1669104000"; 
   d="scan'208";a="360240796"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Feb 2023 13:49:44 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10628"; a="740568164"
X-IronPort-AV: E=Sophos;i="5.97,317,1669104000"; 
   d="scan'208";a="740568164"
Received: from lkp-server01.sh.intel.com (HELO eac18b5d7d93) ([10.239.97.150])
  by fmsmga004.fm.intel.com with ESMTP; 21 Feb 2023 13:49:43 -0800
Received: from kbuild by eac18b5d7d93 with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1pUaW6-0000HB-2K;
        Tue, 21 Feb 2023 21:49:42 +0000
Date:   Wed, 22 Feb 2023 05:48:54 +0800
From:   kernel test robot <lkp@intel.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     linux-renesas-soc@vger.kernel.org
Subject: [geert-renesas-devel:renesas-dts-for-v6.4] BUILD SUCCESS
 da31195806d89e198e756d145de54a31eea17ef5
Message-ID: <63f53c46.XHYp5K2EIoIU2agm%lkp@intel.com>
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

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git renesas-dts-for-v6.4
branch HEAD: da31195806d89e198e756d145de54a31eea17ef5  arm64: dts: renesas: r8a779g0: Add thermal nodes

elapsed time: 727m

configs tested: 17
configs skipped: 107

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                              allmodconfig
arm                              allyesconfig
arm                                 defconfig
arm                  randconfig-r046-20230220
arm                           viper_defconfig
arm64                            allyesconfig
arm64                               defconfig
riscv                            allmodconfig
riscv                             allnoconfig
riscv                               defconfig
riscv                randconfig-r042-20230219
riscv                randconfig-r042-20230221
riscv                          rv32_defconfig

clang tested configs:
arm                            mmp2_defconfig
arm                  randconfig-r046-20230219
arm                  randconfig-r046-20230221
riscv                randconfig-r042-20230220

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
