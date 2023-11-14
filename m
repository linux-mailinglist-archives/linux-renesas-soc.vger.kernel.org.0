Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CFC9B7EA919
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 14 Nov 2023 04:24:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229454AbjKNDYh (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 13 Nov 2023 22:24:37 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37140 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229645AbjKNDYg (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 13 Nov 2023 22:24:36 -0500
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9767FC6
        for <linux-renesas-soc@vger.kernel.org>; Mon, 13 Nov 2023 19:24:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1699932273; x=1731468273;
  h=date:from:to:cc:subject:message-id;
  bh=cOCmK+Ue4xOQrnF5MXg/oHTZ1JFun1rNNv8mS/PosVc=;
  b=NbC/lrta5jbn/UF20befdkQfWX+zz6gtkB6Yj1hvDTRl3kJUXhrnrmhO
   EeOp2LHQ4xR2phWDBwpDy7cNj2yXO/mIGV73FmxS7XXRfTNkwmcwdoFUH
   ZMiWxx2KdVCJOn/k4ZAW+lOZ6AoIbEk0ODShn74sTxJS9yrtIu59BIfno
   xwzdD1M6U2H1UGOBOac3h607eOpYYFgXk4RTcngD39PVEAT11bD2gK/cX
   0OJe5wQ4ch39gyDM6vOHBf9t+gfQN9VyNRJpxJPVFdNtkdFl0nvtgcm6k
   Vl8A2ZzJyDs5tCoPgBxjuWaWzRA/fFofpNNmuLKh/XWjWwYIetiRykNyc
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10893"; a="457060048"
X-IronPort-AV: E=Sophos;i="6.03,299,1694761200"; 
   d="scan'208";a="457060048"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Nov 2023 19:24:31 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10893"; a="740961840"
X-IronPort-AV: E=Sophos;i="6.03,299,1694761200"; 
   d="scan'208";a="740961840"
Received: from lkp-server01.sh.intel.com (HELO 17d9e85e5079) ([10.239.97.150])
  by orsmga006.jf.intel.com with ESMTP; 13 Nov 2023 19:24:31 -0800
Received: from kbuild by 17d9e85e5079 with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1r2k2O-000CoQ-2M;
        Tue, 14 Nov 2023 03:24:28 +0000
Date:   Tue, 14 Nov 2023 11:24:04 +0800
From:   kernel test robot <lkp@intel.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     linux-renesas-soc@vger.kernel.org
Subject: [geert-renesas-devel:next] BUILD SUCCESS
 40f6fd263475d5dc91827b8f44370e570020e13f
Message-ID: <202311141102.j8pI4Uzp-lkp@intel.com>
User-Agent: s-nail v14.9.24
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git next
branch HEAD: 40f6fd263475d5dc91827b8f44370e570020e13f  Merge branch 'renesas-dts-for-v6.8' into renesas-next

elapsed time: 732m

configs tested: 23
configs skipped: 171

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
arm                              allmodconfig   gcc  
arm                               allnoconfig   gcc  
arm                              allyesconfig   gcc  
arm                                 defconfig   gcc  
arm                   randconfig-001-20231114   gcc  
arm                   randconfig-002-20231114   gcc  
arm                   randconfig-003-20231114   gcc  
arm                   randconfig-004-20231114   gcc  
arm64                            allmodconfig   gcc  
arm64                             allnoconfig   gcc  
arm64                            allyesconfig   gcc  
arm64                               defconfig   gcc  
arm64                 randconfig-001-20231114   gcc  
arm64                 randconfig-002-20231114   gcc  
arm64                 randconfig-003-20231114   gcc  
arm64                 randconfig-004-20231114   gcc  
riscv                            allmodconfig   gcc  
riscv                             allnoconfig   gcc  
riscv                            allyesconfig   gcc  
riscv                               defconfig   gcc  
riscv                 randconfig-001-20231114   gcc  
riscv                 randconfig-002-20231114   gcc  
riscv                          rv32_defconfig   gcc  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
