Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 96287698A98
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 16 Feb 2023 03:43:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229478AbjBPCnS (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 15 Feb 2023 21:43:18 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46646 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229460AbjBPCnR (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 15 Feb 2023 21:43:17 -0500
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9B0363A862
        for <linux-renesas-soc@vger.kernel.org>; Wed, 15 Feb 2023 18:43:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1676515395; x=1708051395;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=FBSDifnii0fW21XgAhBg11CUsuiU07TMIqtCyR3SxmQ=;
  b=Gc7ycEsZokAypeVwyJKe39f+LszXCSZD/0t8dBk0hrGHZ1ZdjsWb+TjP
   a5pj8EH+8J/hDGExV8uJIUDa6BRY62FMD0TvGp0t4lARYrH0iyjn0N2hH
   qJc+504zVEdLeqCNv43hqZfFn78P+d9MNBJIo+o826QRC2poKsop9Va2L
   3ro7jNnndNIBSK3AKQYJ4Okj4dTJyDqIUM6KzlJXtcVhIS157XkLNaPBr
   baghDVGlpBQ3Jov53FftqN1kdgWzNRBP2ckWl7jckiA/zzp6B1PPGucLu
   bnnstD7iuNTYlTpEzuf23d73mX81C0Xprefftvb+Nf5/jehCJGzH4/Uo9
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10622"; a="331605509"
X-IronPort-AV: E=Sophos;i="5.97,301,1669104000"; 
   d="scan'208";a="331605509"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Feb 2023 18:43:15 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10622"; a="738684151"
X-IronPort-AV: E=Sophos;i="5.97,301,1669104000"; 
   d="scan'208";a="738684151"
Received: from lkp-server01.sh.intel.com (HELO 4455601a8d94) ([10.239.97.150])
  by fmsmga004.fm.intel.com with ESMTP; 15 Feb 2023 18:43:14 -0800
Received: from kbuild by 4455601a8d94 with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1pSUEr-0009xF-0J;
        Thu, 16 Feb 2023 02:43:13 +0000
Date:   Thu, 16 Feb 2023 10:42:44 +0800
From:   kernel test robot <lkp@intel.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     linux-renesas-soc@vger.kernel.org
Subject: [geert-renesas-devel:renesas-dts-for-v6.4] BUILD SUCCESS
 2ef9a769490885c1a7f61eb7b33984375bce64e9
Message-ID: <63ed9824.XLwjqr8aic1ISCUL%lkp@intel.com>
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

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git renesas-dts-for-v6.4
branch HEAD: 2ef9a769490885c1a7f61eb7b33984375bce64e9  arm64: dts: renesas: white-hawk-csi-dsi: Add and connect MAX96712

elapsed time: 736m

configs tested: 15
configs skipped: 104

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                              allmodconfig
arm                              allyesconfig
arm                                 defconfig
arm                  randconfig-r046-20230212
arm                  randconfig-r046-20230214
arm64                            allyesconfig
arm64                               defconfig
riscv                            allmodconfig
riscv                             allnoconfig
riscv                               defconfig
riscv                randconfig-r042-20230213
riscv                          rv32_defconfig

clang tested configs:
arm                  randconfig-r046-20230213
riscv                randconfig-r042-20230212
riscv                randconfig-r042-20230214

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
