Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 35A91628EB0
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 15 Nov 2022 01:49:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230199AbiKOAtx (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 14 Nov 2022 19:49:53 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47270 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237441AbiKOAtw (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 14 Nov 2022 19:49:52 -0500
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 182F7B57
        for <linux-renesas-soc@vger.kernel.org>; Mon, 14 Nov 2022 16:49:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1668473392; x=1700009392;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=zprEscaC6yEul+1kfcxtfpdYISn1MVpJrn/7WLvlFUs=;
  b=DLofX/GPAclUmz1/OVINWLZwfay4y/HWfsvOO1aMGsT0pNP/LNbTX3Lb
   HHjGmBzZyvoHkfgJ4Dnm4XhzcLdzHImP84HtT2UkTe5MJ1Y5PvEELN9b0
   wi+Lai20NEWraZlxXYyKo0zXLpK3p1FrfpUt/vQ1igGaJ7LE1fLzQeRDv
   jB4whsaEl7jnLiia4K9KReSK24/sai8tuGDVEiwgWvaWw66SMwLoWcMqN
   NZtEX+AIkRZQe6m6nUay8D5bBA10b6uM29fI3IeUZXmPOhh9V3uJtMwJx
   OLXJqt05S4S436l3Tx5vWKWgEnKmdnxlggYCm0XRZbu3S3a9sWKhl7K58
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10531"; a="291835690"
X-IronPort-AV: E=Sophos;i="5.96,164,1665471600"; 
   d="scan'208";a="291835690"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Nov 2022 16:49:51 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10531"; a="671790203"
X-IronPort-AV: E=Sophos;i="5.96,164,1665471600"; 
   d="scan'208";a="671790203"
Received: from lkp-server01.sh.intel.com (HELO ebd99836cbe0) ([10.239.97.150])
  by orsmga001.jf.intel.com with ESMTP; 14 Nov 2022 16:49:49 -0800
Received: from kbuild by ebd99836cbe0 with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1ouk96-0000sy-2t;
        Tue, 15 Nov 2022 00:49:48 +0000
Date:   Tue, 15 Nov 2022 08:49:20 +0800
From:   kernel test robot <lkp@intel.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     linux-renesas-soc@vger.kernel.org
Subject: [geert-renesas-devel:master] BUILD SUCCESS
 7a971ffb6095d21fa1de87d0adc13b8616efc6ba
Message-ID: <6372e210.Cce1k5hfyAhVlFdJ%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_PASS,SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git master
branch HEAD: 7a971ffb6095d21fa1de87d0adc13b8616efc6ba  Merge tag 'v6.1-rc5' into renesas-devel

elapsed time: 877m

configs tested: 59
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
um                             i386_defconfig
um                           x86_64_defconfig
arc                                 defconfig
s390                             allmodconfig
alpha                               defconfig
s390                                defconfig
i386                                defconfig
powerpc                           allnoconfig
x86_64               randconfig-a002-20221114
x86_64               randconfig-a001-20221114
s390                             allyesconfig
i386                 randconfig-a001-20221114
x86_64               randconfig-a003-20221114
mips                             allyesconfig
x86_64               randconfig-a006-20221114
arm                                 defconfig
x86_64                           rhel-8.3-kvm
ia64                             allmodconfig
powerpc                          allmodconfig
i386                 randconfig-a004-20221114
x86_64               randconfig-a004-20221114
x86_64                              defconfig
sh                               allmodconfig
i386                             allyesconfig
x86_64                           rhel-8.3-syz
x86_64               randconfig-a005-20221114
i386                 randconfig-a002-20221114
i386                 randconfig-a005-20221114
x86_64                         rhel-8.3-kunit
i386                 randconfig-a006-20221114
i386                 randconfig-a003-20221114
arc                  randconfig-r043-20221114
arc                              allyesconfig
alpha                            allyesconfig
x86_64                               rhel-8.3
x86_64                          rhel-8.3-func
x86_64                    rhel-8.3-kselftests
arm64                            allyesconfig
arm                              allyesconfig
x86_64                           allyesconfig
m68k                             allyesconfig
x86_64                            allnoconfig
m68k                             allmodconfig

clang tested configs:
x86_64               randconfig-a012-20221114
hexagon              randconfig-r045-20221114
x86_64               randconfig-a016-20221114
hexagon              randconfig-r041-20221114
x86_64               randconfig-a015-20221114
s390                 randconfig-r044-20221114
x86_64               randconfig-a013-20221114
riscv                randconfig-r042-20221114
x86_64               randconfig-a011-20221114
x86_64               randconfig-a014-20221114
i386                 randconfig-a011-20221114
i386                 randconfig-a013-20221114
i386                 randconfig-a012-20221114
i386                 randconfig-a014-20221114
i386                 randconfig-a016-20221114
i386                 randconfig-a015-20221114

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
