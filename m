Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8045E67A91A
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 25 Jan 2023 04:09:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229528AbjAYDJi (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 24 Jan 2023 22:09:38 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39832 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229778AbjAYDJi (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 24 Jan 2023 22:09:38 -0500
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D0C9126591
        for <linux-renesas-soc@vger.kernel.org>; Tue, 24 Jan 2023 19:09:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1674616176; x=1706152176;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=Z+cUJekYtr7HF6dQE5KqQw0nAfGqpZv+o9E8C37+lxk=;
  b=TvwdaMRUxjs83sdhW6cjhtEKJuK+ZNRVoYP6zJjEGrrgQ7u0/szirAZk
   sWKTeU2mKWK2UgczuuZpBbkwecODzFudaYBy5khMZacyv1Db5QKeoTRLg
   GYc9SfY8Tc3wio5jbesHV0AY19H9ooshaIcLYd/MGd/nd0iDVqAy/vwGz
   0qnmex101co4e4kEOdg/TlaJXTxAwADjEMNaNLikMqgFsb0uHYP9ZKoTM
   8ErcUa1MxSH1gVowq9WH/Xkz745Sw0FlS3fkTLmQ1CzOt3nuleXcOgRu/
   1Am9WU3DNbhJKNRCJjwhfyxOy3yQdKNbKc2J/Rx1QMZ3HdgdRM6YF0nd2
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10600"; a="325146873"
X-IronPort-AV: E=Sophos;i="5.97,244,1669104000"; 
   d="scan'208";a="325146873"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Jan 2023 19:09:36 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10600"; a="770574093"
X-IronPort-AV: E=Sophos;i="5.97,244,1669104000"; 
   d="scan'208";a="770574093"
Received: from lkp-server01.sh.intel.com (HELO 5646d64e7320) ([10.239.97.150])
  by fmsmga002.fm.intel.com with ESMTP; 24 Jan 2023 19:09:35 -0800
Received: from kbuild by 5646d64e7320 with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1pKWAI-000700-11;
        Wed, 25 Jan 2023 03:09:34 +0000
Date:   Wed, 25 Jan 2023 11:08:50 +0800
From:   kernel test robot <lkp@intel.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     linux-renesas-soc@vger.kernel.org
Subject: [geert-renesas-drivers:master] BUILD SUCCESS
 ed8f607fda61ef565a8167587f84954e727ab1b5
Message-ID: <63d09d42.pZ5/e7SQiMpLPFv9%lkp@intel.com>
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

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git master
branch HEAD: ed8f607fda61ef565a8167587f84954e727ab1b5  [LOCAL] arm64: renesas: defconfig: Update renesas_defconfig

elapsed time: 724m

configs tested: 62
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
x86_64                            allnoconfig
arc                                 defconfig
s390                             allmodconfig
alpha                               defconfig
s390                                defconfig
s390                             allyesconfig
um                             i386_defconfig
um                           x86_64_defconfig
powerpc                           allnoconfig
m68k                             allmodconfig
arc                              allyesconfig
alpha                            allyesconfig
x86_64                              defconfig
arc                  randconfig-r043-20230124
x86_64                               rhel-8.3
i386                                defconfig
s390                 randconfig-r044-20230124
m68k                             allyesconfig
riscv                randconfig-r042-20230124
ia64                             allmodconfig
x86_64                           allyesconfig
sh                               allmodconfig
x86_64                           rhel-8.3-syz
x86_64               randconfig-a002-20230123
x86_64                           rhel-8.3-kvm
x86_64               randconfig-a001-20230123
x86_64                           rhel-8.3-bpf
mips                             allyesconfig
x86_64               randconfig-a004-20230123
arm                                 defconfig
x86_64               randconfig-a003-20230123
x86_64               randconfig-a005-20230123
powerpc                          allmodconfig
x86_64                          rhel-8.3-func
x86_64                         rhel-8.3-kunit
x86_64               randconfig-a006-20230123
arm64                            allyesconfig
x86_64                    rhel-8.3-kselftests
arm                              allyesconfig
i386                             allyesconfig
i386                 randconfig-a003-20230123
i386                 randconfig-a002-20230123
i386                 randconfig-a001-20230123
i386                 randconfig-a004-20230123
i386                 randconfig-a005-20230123
i386                 randconfig-a006-20230123

clang tested configs:
arm                  randconfig-r046-20230124
hexagon              randconfig-r041-20230124
hexagon              randconfig-r045-20230124
i386                 randconfig-a012-20230123
i386                 randconfig-a013-20230123
i386                 randconfig-a011-20230123
x86_64                          rhel-8.3-rust
i386                 randconfig-a014-20230123
i386                 randconfig-a015-20230123
i386                 randconfig-a016-20230123
x86_64               randconfig-a013-20230123
x86_64               randconfig-a011-20230123
x86_64               randconfig-a012-20230123
x86_64               randconfig-a015-20230123
x86_64               randconfig-a014-20230123
x86_64               randconfig-a016-20230123

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
