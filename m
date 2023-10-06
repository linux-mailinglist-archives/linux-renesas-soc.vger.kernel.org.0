Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 06FBD7BB05D
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  6 Oct 2023 04:54:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229615AbjJFCym (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 5 Oct 2023 22:54:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34050 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229838AbjJFCyl (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 5 Oct 2023 22:54:41 -0400
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A67F0E7
        for <linux-renesas-soc@vger.kernel.org>; Thu,  5 Oct 2023 19:54:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1696560879; x=1728096879;
  h=date:from:to:cc:subject:message-id;
  bh=Phjss3vJaE2xHbyOja5A4RvJHGzsciXavyZ9PFxqwUo=;
  b=FUH7v7W4xTvq8STpMHevq1GDCSCaVtUCA1Lrb7oeoP8KL53b/gzpnMec
   xMKj+t6F9Rwy0uYXK5W0P+j8ZJz8OrrqexGoNPIcbxbJb3m9pYu9GaufC
   D5bBnKyjwAO6jWsuOvqt0OKsHhTD4gQ/tBRuvFfUnzMVchROYBJCRrPnK
   Gq06T/UNNxqNI/p0kGK0HnaaINI4Q+w0na/PkLIkyuOM7X0Wr7qyp28xg
   NuTm5DqAkrNQwDUU2gI3Ic5VlYArdu/XwJ+ILftO0dRwUb78yulHgs8kG
   K1mXWla1Z++QFzad+PBKbdb3oLbNdBTkGWL4B2tzHnktoabbAWuzOGPhW
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10854"; a="382542564"
X-IronPort-AV: E=Sophos;i="6.03,203,1694761200"; 
   d="scan'208";a="382542564"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Oct 2023 19:54:39 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10854"; a="925815669"
X-IronPort-AV: E=Sophos;i="6.03,203,1694761200"; 
   d="scan'208";a="925815669"
Received: from lkp-server02.sh.intel.com (HELO c3b01524d57c) ([10.239.97.151])
  by orsmga005.jf.intel.com with ESMTP; 05 Oct 2023 19:54:38 -0700
Received: from kbuild by c3b01524d57c with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1qoaz5-000MAm-1w;
        Fri, 06 Oct 2023 02:54:35 +0000
Date:   Fri, 06 Oct 2023 10:54:07 +0800
From:   kernel test robot <lkp@intel.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     linux-renesas-soc@vger.kernel.org
Subject: [geert-renesas-devel:renesas-arm-defconfig-for-v6.7] BUILD
 SUCCESS 09cfdb5a97b53d117682211a4d32a39af2e819e4
Message-ID: <202310061005.Pd903BH4-lkp@intel.com>
User-Agent: s-nail v14.9.24
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_NONE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git renesas-arm-defconfig-for-v6.7
branch HEAD: 09cfdb5a97b53d117682211a4d32a39af2e819e4  arm64: defconfig: Enable RZ/G3S (R9A08G045) SoC

elapsed time: 804m

configs tested: 8
configs skipped: 108

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
arm                              allmodconfig   gcc  
arm                               allnoconfig   gcc  
arm                              allyesconfig   gcc  
arm                                 defconfig   gcc  
arm64                            allmodconfig   gcc  
arm64                             allnoconfig   gcc  
arm64                            allyesconfig   gcc  
arm64                               defconfig   gcc  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
