Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 30D7D7EA91A
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 14 Nov 2023 04:24:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229626AbjKNDYi (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 13 Nov 2023 22:24:38 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37152 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229827AbjKNDYg (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 13 Nov 2023 22:24:36 -0500
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C780AD45
        for <linux-renesas-soc@vger.kernel.org>; Mon, 13 Nov 2023 19:24:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1699932273; x=1731468273;
  h=date:from:to:cc:subject:message-id;
  bh=QQpwRS4nxzdbkrIH/OfROVQ+jV+vPvAu0Heii63FMqU=;
  b=ibvEuouPdD2Xs4N5PTe1xKrOCyumAoCu1w/kZqH7Pmv0pLv9mKTFLPcc
   MZQUpi4xd2NcS3gV4Jf48ow7M83TOVM+85HGXIPB/nt7zEaWMqG9XulRR
   pb7sn3B11NYbqA4PqFv/aKdJzmBGxSFahZv4DKfG4y1UxGTcFJK8/tLey
   lLAhF+rjt61EtJ7D0ump4WYwToGcO46DG221LrUH+QKljBDr/1Jh5JY3L
   v+AMPo2XwoKPzSxhD/HMtXKWyEoeQ/uMrdA7+kE1cduet5Mn80QHufXUO
   g2PGkeGNgHXyHauooHr/ef3HM/JNntPQlUez0hQN+nz9xIDm4GVOzirF+
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10893"; a="457060050"
X-IronPort-AV: E=Sophos;i="6.03,299,1694761200"; 
   d="scan'208";a="457060050"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Nov 2023 19:24:31 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10893"; a="740961839"
X-IronPort-AV: E=Sophos;i="6.03,299,1694761200"; 
   d="scan'208";a="740961839"
Received: from lkp-server01.sh.intel.com (HELO 17d9e85e5079) ([10.239.97.150])
  by orsmga006.jf.intel.com with ESMTP; 13 Nov 2023 19:24:30 -0800
Received: from kbuild by 17d9e85e5079 with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1r2k2O-000CoN-28;
        Tue, 14 Nov 2023 03:24:28 +0000
Date:   Tue, 14 Nov 2023 11:23:41 +0800
From:   kernel test robot <lkp@intel.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     linux-renesas-soc@vger.kernel.org
Subject: [geert-renesas-devel:renesas-dts-for-v6.8] BUILD SUCCESS
 e443f05dfa8f8edfb8f1b684cc413ee8e774b9ac
Message-ID: <202311141139.zBdOTvrY-lkp@intel.com>
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

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git renesas-dts-for-v6.8
branch HEAD: e443f05dfa8f8edfb8f1b684cc413ee8e774b9ac  arm64: dts: renesas: rzg2lc-smarc-som: Enable 4-bit tx support

elapsed time: 731m

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
